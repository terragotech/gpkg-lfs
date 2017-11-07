#include "config.h"
#include "stdafx.h"
#include "GeoPackageRasterReader.h"
#include "ogrsf_frmts.h"
#include "ogr_p.h"
//#include "gdal_utils_priv.h"
#include "logger.h"
bool cancelProcess = false;
double progress = 0.0;
string progressFileObj;										//progress file 
string termFileObj;

static int 
GDALInfoReportCorner( GDALDatasetH hDataset, 
                      OGRCoordinateTransformationH hTransform,
                      const char * corner_name,
                      double x, double y,double *pLat,double *pLong );
int CPL_STDCALL getBaseTileProgress ( double, const char *, void *);

int convert_mbtiles(char *file_name,
				   char *mbtile_file_name,
				   char *zoom_levels,
				   char *image_type,
				   char *zlevel,
				   char *quality,
				   char *process_id, char *tmpPath, char *progfile);
				   
int CPL_STDCALL getBaseTileProgress ( double prog, const char *msg, void *msg2)
{
	progress = prog * 0.80;
	int res = check_term((char*)termFileObj.c_str());
	if(res == 1)
	{
		cancelProcess = true;
	}
	if(cancelProcess)
	{
		return FALSE;
	}
	char chprogress[255];
	sprintf(chprogress,"%f",progress);
	write_progress((char*)progressFileObj.c_str(),chprogress);
	return TRUE;
}
int CPL_STDCALL getOverlayTileProgress ( double, const char *, void *);
int CPL_STDCALL getOverlayTileProgress ( double prog, const char *msg, void *msg2)
{
	progress = 0.80 + prog * 0.20;
	int res = check_term((char*)termFileObj.c_str());
	if(res == 1)
	{
		cancelProcess = true;
	}
	if(cancelProcess)
	{
		return FALSE;
	}
	char chprogress[255];
	sprintf(chprogress,"%f",progress);
	write_progress((char*)progressFileObj.c_str(),chprogress);
	return TRUE;
}
GeoPackageRasterReader::GeoPackageRasterReader()
{
	nGeoPackageReaderState = GPKG_RASTER_READ_STATE_DEFAULT;
	ptrJSONResult = NULL;
}
int GeoPackageRasterReader::getGeoPackageRasterReaderState()
{
	return nGeoPackageReaderState;
}

//Open GeoPackage file
int GeoPackageRasterReader::openGeoPackage(char *ptrFileName, char *ptrGDALSetting)
{
	int nResult = 0;
	CPLSetConfigOption("GDAL_DATA",ptrGDALSetting);
	OGRRegisterAll();
	hDS = GDALOpenEx( ptrFileName,
					  GDAL_OF_READONLY | GDAL_OF_VECTOR | GDAL_OF_RASTER, NULL, NULL, NULL );
	if(hDS == NULL)
	{
		nResult = -1;
	}
	return nResult;
}
int GeoPackageRasterReader::convertToMBtiles(char *ptrFileName,
											 char *ptrMBTileName,
											 char *ptrTableName, char *ptrTMP)
{
	int nResult = 0;
	char **argv = (char **)malloc(sizeof(char *) * 10);
	for(int i=0;i<8;i++) {
		argv[i] = (char *) malloc(sizeof(char) * 1024);
	}
	//-t_srs EPSG:3857 "texas1.gpkg" "texas_12.gpkg"

	int inputFileNameLength = strlen(ptrFileName);
	char *pFileNameWithoutExt = (char*)malloc(inputFileNameLength+1);
	//char *pFileNameGPKG = (char*)malloc(inputFileNameLength+1);
	char *pFileNameGPKG = (char*)malloc(2048);
	if(NULL != pFileNameWithoutExt)
	{
		int nResult = remove_extension(pFileNameWithoutExt, ptrFileName, inputFileNameLength + 1);
	}
	strcpy(argv[0],"gwarp");
	strcpy(argv[1],"-of");
	strcpy(argv[2],"GTiff");
	strcpy(argv[3],"-t_srs");
	strcpy(argv[4],"EPSG:3857");
	strcpy(argv[5],ptrFileName);
	strcpy(pFileNameGPKG,pFileNameWithoutExt);
	strcat(pFileNameGPKG,"_");
	strcat(pFileNameGPKG,ptrTableName);
	strcat(pFileNameGPKG,"_1.tif");
	strcpy(argv[6],pFileNameGPKG);

	remove(pFileNameGPKG);
	//write_log("before the call");
	string progressFile;
	progressFile.clear();
	progressFile.append(pFileNameWithoutExt);
	progressFile.append("_");
	progressFile.append(ptrTableName);
	progressFile.append(".txt");

	gwarp(7,argv,ptrTableName,(char*)progressFile.c_str(),NULL);
	//write_log("after the call");
	GDALAllRegister();
	char **papszOpenOptions = NULL;
	string mbtilesName;
	//Use the specified MBTiles Name
	mbtilesName.append(ptrMBTileName);


	remove((char*)mbtilesName.c_str());
	convert_mbtiles(pFileNameGPKG,
					(char*)mbtilesName.c_str(),
					"4",
					"png",
					"2",
					"80",
					"1",ptrTMP,(char*)progressFile.c_str());
	return nResult;
}

char* GeoPackageRasterReader::getGeoPackageRasterNameListAsJSON()
{
	/*
		Inside a geopackage gpkg_contents table has a field table_name and data_type
		for all rows with data_type as tile those point to a tile raster
		So we will run a query that will return a result set as in form of an layer
		After the query execute, iterate on the layer to get the list of tile names
	*/
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"getGeoPackageRasterNameListAsJSON - entered");
	}
	char *ptrResult = NULL;
	if(NULL == hDS)
	{
		return NULL;
	}
	GDALDataset *poDS = (GDALDataset *)hDS;
	OGRLayer *poResultSet = NULL;
	poResultSet = poDS->ExecuteSQL("select table_name, data_type from gpkg_contents where data_type='tiles'",NULL,NULL);


	/*
		Create JSON which has a list of tile source names 
	*/
	string tileJson;	
	tileJson.clear();
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"getGeoPackageRasterNameListAsJSON - Generating JSON");
	}
	tileJson.append("{\"tile_sources\":[");
	if(poResultSet != NULL)
	{
		OGRFeature *poFeature = NULL;
		GIntBig fc = poResultSet->GetFeatureCount();
		GIntBig fcidx = 0;

		//Now iterate to get all tile sources
		do
		{
			if(poFeature != NULL)
			{
				OGRFeature::DestroyFeature( poFeature );
				poFeature = NULL;
			}
			poFeature = poResultSet->GetNextFeature();
			if(poFeature != NULL)
			{
				int nFieldCount = poFeature->GetFieldCount();
				tileJson.append("{");
				for(int idx = 0; idx < nFieldCount; idx++)
				{

					OGRFieldDefn *fieldDef = poFeature->GetFieldDefnRef(idx);
					if(fieldDef != NULL)
					{
						const char *fieldName = fieldDef->GetNameRef();
						OGRFieldType ogrFieldType = fieldDef->GetType();
						const char *fieldValue = NULL;
						if(ogrFieldType != OFTBinary )
						{
							fieldValue = poFeature->GetFieldAsString(idx);
							if(strcmp(fieldName,"table_name") == 0)
							{
								printf("Field Values : %s\n", fieldValue);
							
								tileJson.append("\"");
								tileJson.append("tilename");
								tileJson.append("\"");

								tileJson.append(":");
							
								tileJson.append("\"");
								tileJson.append(fieldValue);
								tileJson.append("\"");

								hDSBounds = NULL;
								OpenTileSetForBounds((char*)fieldValue);
								double latval=0.0;
								double longval=0.0;
								int rc = getBounds(&latval,&longval);
								if(rc == 0)
								{
									tileJson.append(",");
									tileJson.append("\"");
									tileJson.append("bounds");
									tileJson.append("\"");

									tileJson.append(":");
							
									tileJson.append("\"");
									tileJson.append(strLatLongBounds.c_str());
									tileJson.append("\"");
								}
								if(hDSBounds != NULL)
								{
									GDALClose(hDSBounds);
								}
							}
						}
					}
				}
				tileJson.append("}");
				if(fcidx != fc-1)
				{
					tileJson.append(",");
				}
				fcidx++;
			}
		}while(NULL != poFeature);
		//End of iteration 
	}
	tileJson.append("]}");
	
	if(poResultSet != NULL)
	{
		poDS->ReleaseResultSet( poResultSet );
		poResultSet = NULL;
	}
	if(ptrJSONResult != NULL)
	{
		free(ptrJSONResult);
		ptrJSONResult = NULL;
	}
	int bufferLength = tileJson.size();
	ptrJSONResult = (char*)malloc(bufferLength+1);
	if(ptrJSONResult != NULL)
	{
		strcpy(ptrJSONResult,tileJson.c_str());
		if(bLogEnabled)
		{
			write_log((char*)logFileObj.c_str(),"getGeoPackageRasterNameListAsJSON - JSON");
			write_log((char*)logFileObj.c_str(),ptrJSONResult);
		}

		ptrResult = ptrJSONResult;
	}
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"getGeoPackageRasterNameListAsJSON - exit");
	}
	return ptrResult;
}
void GeoPackageRasterReader::OpenTileSetForBounds(char *tileName)
{
				string tableOpenOptions;
				tableOpenOptions.clear();
				tableOpenOptions.append("TABLE=");
				tableOpenOptions.append(tileName);
				char **papszOpenOptions = NULL;
				papszOpenOptions =  CSLAddString(papszOpenOptions,tableOpenOptions.c_str());

				hDSBounds = GDALOpenEx( inputGPKGFileName.c_str(),GDAL_OF_READONLY | GDAL_OF_VECTOR | GDAL_OF_RASTER, NULL,papszOpenOptions, NULL );

				//getBounds();
}
bool GeoPackageRasterReader::isValidTileSourceName(char *ptrSDSName)
{
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"isValidTileSourceName - entered");
		write_log((char*)logFileObj.c_str(),ptrJSONResult);
	}
	bool blnSDS = false;
	if(NULL == ptrSDSName)
	{
		return blnSDS;
	}
	char *ptrResult = NULL;
	if(NULL == hDS)
	{
		return NULL;
	}
	GDALDataset *poDS = (GDALDataset *)hDS;
	OGRLayer *poResultSet = poDS->ExecuteSQL("select table_name, data_type from gpkg_contents where data_type='tiles'",NULL,NULL);
	OGRFeature *poFeature = NULL;
	if(poResultSet != NULL)
	{
		do
		{
			if(poFeature != NULL)
			{
				OGRFeature::DestroyFeature( poFeature );
				poFeature = NULL;
			}
			poFeature = poResultSet->GetNextFeature();
			if(poFeature != NULL)
			{
				int nFieldCount = poFeature->GetFieldCount();
				for(int idx = 0; idx < nFieldCount; idx++)
				{

					OGRFieldDefn *fieldDef = poFeature->GetFieldDefnRef(idx);
					if(fieldDef != NULL)
					{
						const char *fieldName = fieldDef->GetNameRef();
						OGRFieldType ogrFieldType = fieldDef->GetType();
						const char *fieldValue = NULL;
						if(ogrFieldType != OFTBinary )
						{
							fieldValue = poFeature->GetFieldAsString(idx);
							if(strcmp(fieldName,"table_name") == 0)
							{
								if(fieldValue != NULL)
								{
									if(strcmp(fieldValue,ptrSDSName) == 0)
									{
										blnSDS = true;
										break;
									}
								}
							}
						}
					}
				}//End for
			}//Check feature for Empty
			if(blnSDS)
			{
				break;
			}
		}while(NULL != poFeature); //While to continue on the next 
	}
	//If we have stopped in middle of the loop
	//Destroy the feature
	if(poFeature != NULL)
	{
		OGRFeature::DestroyFeature( poFeature );
		poFeature = NULL;
	}
	//Make sure the Result Set in not NULL
	if(poResultSet != NULL)
	{
		poDS->ReleaseResultSet( poResultSet );
		poResultSet = NULL;
	}
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"isValidTileSourceName - exit");
		write_log((char*)logFileObj.c_str(),ptrJSONResult);
	}
	return blnSDS;
}
int GeoPackageRasterReader::initiateGeoPackageToMBTilesConversion(char *ptrTileName, 
	int zoomLevels,
	int zlevel,
	int quality,
	char *ptrImgFormat,
	char *ptrMBTilesName)
{
	
	/* This function invokes the conversion of the GeoPackage to MBTiles with tile format as png or jpeg 
	   with the zoom levels and compression settings can be set */

	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"initiateGeoPackageToMBTilesConversion - entered");
		
	}
	write_log((char*)logFileObj.c_str(),"term file name!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	write_log((char*)logFileObj.c_str(),(char*)termFileObj.c_str());
	termFileObj.append("_");
	termFileObj.append(ptrTileName);
	termFileObj.append(".end");
	write_log((char*)logFileObj.c_str(),"term file name########################################");
	write_log((char*)logFileObj.c_str(),(char*)termFileObj.c_str());


	write_log((char*)logFileObj.c_str(),"Progress file name!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	write_log((char*)logFileObj.c_str(),(char*)progressFileObj.c_str());
	progressFileObj.append("_");
	progressFileObj.append(ptrTileName);
	progressFileObj.append(".sta");
	write_log((char*)logFileObj.c_str(),"Progress file name####################################");
	write_log((char*)logFileObj.c_str(),(char*)progressFileObj.c_str());
	int nResult = GPKG_RASTER_READ_SUCCESS;
	if(nGeoPackageReaderState == GPKG_RASTER_READ_STATE_OPEN_SUCCESS)
	{
		nGeoPackageReaderState = GPKG_RASTER_READ_STATE_CONVERSTION_INIT;
		OGRFeature *poFeature = NULL;
		char **papszOpenOptions = NULL;
		GDALDatasetH hODS = NULL;
		bool bSubdataset = false;

		GDALDatasetH hMDS = NULL;
		int nLevelCount = 4;
		int anLevels[1024];
		int panBandList[10];
		char **papszOptionsMBTILES = NULL;

		int nZlevel = 6;
		int nQuality = 75;
		char image_type[20];
		image_type[0] = '\0';
		char tempZoom[25];
		tempZoom[0] = '\0';

		if(ptrTileName == NULL)
		{
			return GPKG_RASTER_READ_BAD_INPUT_PARAM;
		}
		if(hDS == NULL)
		{
			return GPKG_RASTER_READ_NOT_OPENED;
		}
		//Check for validity and set default values 
		if(zoomLevels <= 0)
		{
			zoomLevels = 4;
		}
		if(zoomLevels > 1)
		{
			zoomLevels = zoomLevels - 1;
		}
		if(ptrImgFormat == NULL)
		{
			strcpy(image_type,"png");
		}
		else
		{
			int sl = strlen(ptrImgFormat);
			if(sl > 4)
			{
				//Safely set the default values
				strcpy(image_type,"png");
			}
			else
			{
				//If valid copy 
				if((strcmp(ptrImgFormat,"png") == 0) || (strcmp(ptrImgFormat,"jpeg") == 0))
				{
					strcpy(image_type,ptrImgFormat);
				}
				else
				{
					strcpy(image_type,"png");
				}
			}
		}
	
		GDALDriverH hMBTilesDriver = GDALGetDriverByName("MBTiles");
	

		//Validate if it exisit in the tile source list
		if(isValidTileSourceName(ptrTileName))
		{
			GDALAllRegister();
			if(hasSubDataSets())
			{
				string tableOpenOptions;
				tableOpenOptions.clear();
				tableOpenOptions.append("TABLE=");
				tableOpenOptions.append(ptrTileName);

				papszOpenOptions =  CSLAddString(papszOpenOptions,tableOpenOptions.c_str());

				hODS = GDALOpenEx( inputGPKGFileName.c_str(),GDAL_OF_READONLY | GDAL_OF_VECTOR | GDAL_OF_RASTER, NULL,papszOpenOptions, NULL );
				bSubdataset = true;
			}
			else
			{
				hODS = hDS;
			}
			if(hODS != NULL)
			{
				//Code to invoke the mbtile generation
				if(hMBTilesDriver != NULL)
				{
					int nRasterCount = GDALGetRasterCount(hODS);
					if(nRasterCount > 0)
					{
						for(int idx=1;idx<=nRasterCount;idx++)
						{
							panBandList[idx-1] = idx;
						}
						nLevelCount = zoomLevels;
						for(int anLidx=0;anLidx<nLevelCount;anLidx++){
							if(anLidx < 1024){
								anLevels[anLidx] = pow(2.0,anLidx+1);
							}
						}
					
					
						string mbtilesOption;

						mbtilesOption.clear();
						mbtilesOption.append("TYPE=baselayer");
						papszOptionsMBTILES =  CSLAddString(papszOptionsMBTILES,mbtilesOption.c_str());
									
						if(strcmp(ptrImgFormat,"png") == 0)
						{
							mbtilesOption.clear();
							mbtilesOption.append("TILE_FORMAT=PNG");
							papszOptionsMBTILES =  CSLAddString(papszOptionsMBTILES,mbtilesOption.c_str());

							if((zlevel >= 1) || (zlevel <=9))
							{
								mbtilesOption.clear();
								mbtilesOption.append("ZLEVEL=");
								nZlevel = zlevel;
								sprintf(tempZoom,"%d",nZlevel);
								mbtilesOption.append(tempZoom);
								papszOptionsMBTILES =  CSLAddString(papszOptionsMBTILES,mbtilesOption.c_str());
							}
						}
						if(strcmp(ptrImgFormat,"jpeg") == 0)
						{
							mbtilesOption.clear();
							mbtilesOption.append("TILE_FORMAT=JPEG");
						
							papszOptionsMBTILES =  CSLAddString(papszOptionsMBTILES,mbtilesOption.c_str());

							if((quality >= 1) || (quality <=100))
							{
								mbtilesOption.clear();
								mbtilesOption.append("QUALITY=");
								nQuality = quality;
								sprintf(tempZoom,"%d",nQuality);
								mbtilesOption.append(tempZoom);
								papszOptionsMBTILES =  CSLAddString(papszOptionsMBTILES,mbtilesOption.c_str());
							}
						}
						nGeoPackageReaderState = GPKG_RASTER_READ_STATE_BASE_TILE_GEN;
						char result[1000];
						sprintf(result,"Source Size is %d x %d \n", GDALGetRasterXSize(hODS),GDALGetRasterYSize(hODS));
						write_log((char*)logFileObj.c_str(),result);
						hMDS = GDALCreateCopy(hMBTilesDriver,ptrMBTilesName,hODS,0,papszOptionsMBTILES,getBaseTileProgress,NULL);
						if(hMDS != NULL) {
							sprintf(result,"Dest Size is %d x %d \n", GDALGetRasterXSize(hMDS),
									GDALGetRasterYSize(hMDS));
							write_log((char*)logFileObj.c_str(),result);
						}
						if(nGeoPackageReaderState != GPKG_RASTER_READ_STATE_CANCELLED)
						{
							nGeoPackageReaderState = GPKG_RASTER_READ_STATE_OVERLAY_TILE_GEN;
						}
						//progress = 1.0;
						
						if(hMDS != NULL)
						{
							if(zoomLevels > 1)
							{
								write_log((char*)logFileObj.c_str(),"Overview tile processing [STARTED] ");
								CPLErr e = GDALBuildOverviews(hMDS,"cubic",nLevelCount,anLevels,nRasterCount,panBandList,getOverlayTileProgress,NULL);
								GDALClose(hMDS);
								hMDS = NULL;
								if(nGeoPackageReaderState != GPKG_RASTER_READ_STATE_CANCELLED)
								{
									nGeoPackageReaderState = GPKG_RASTER_READ_STATE_MBTILES_GEN_COMPLETE;
								}
								write_log((char*)logFileObj.c_str(),"Overview tile processing [COMPLETE] ");
							}
							else
							{

								nGeoPackageReaderState = GPKG_RASTER_READ_STATE_MBTILES_GEN_COMPLETE;
								progress = 1.0;
								/*
								write_log((char*)logFileObj.c_str(),"Overview tile processing [SKIPPED] ");
								nGeoPackageReaderState = GPKG_RASTER_READ_STATE_MBTILES_GEN_COMPLETE;
								progress = 1.0;
								
								
								if(hMDS != NULL){
									GDALClose(hMDS);
									hMDS = NULL;
								}*/
							}
						}
					}
				}
			}
			else
			{
				//Case of the Dataset was NULL, something went wrong here
				if(bSubdataset)
				{
					nResult = GPKG_RASTER_READ_SUBDATASET_OPEN_FAILED;
				}
				else
				{
					nResult = GPKG_RASTER_READ_OPEN_FAILED;
				}
			}
			//Clean up code
			if(papszOpenOptions != NULL)
			{
				CSLDestroy(papszOpenOptions);
			}
			if(papszOptionsMBTILES != NULL)
			{
				CSLDestroy(papszOptionsMBTILES);
			}
			//Closing all the dataset
			if(bSubdataset)
			{
				//
				if(hODS != NULL)
				{
					GDALClose(hODS);
					hODS = NULL;
				}
			
			}
			//End of clean up code
		}
		else
		{
			//Not a valid tile source
			nResult = GPKG_RASTER_READ_TILE_NOT_FOUND;
		}
	}
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"initiateGeoPackageToMBTilesConversion - exit");
		
	}
	return nResult;
}

bool GeoPackageRasterReader::hasSubDataSets()
{
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"hasSubDataSets - enter");
		
	}

	bool blnsubDataSet = false;
	if(hDS == NULL)
	{
		return false;
	}
	char **papszSubdatasets = GDALGetMetadata( hDS, "SUBDATASETS" );
	int nSubdatasets = CSLCount( papszSubdatasets );
	if(nSubdatasets > 0)
	{
		blnsubDataSet = true;
	}
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"hasSubDataSets - exit");
		
	}
	return blnsubDataSet;
}
int GeoPackageRasterReader::closeGeoPackage()
{
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"closeGeoPackage - enter");
		
	}
	int nResult = GPKG_RASTER_READ_SUCCESS;
	if(hDS != NULL)
	{
		GDALClose(hDS);
		hDS = NULL;
	}
	if(ptrJSONResult != NULL)
	{
		free(ptrJSONResult);
		ptrJSONResult = NULL;
	}
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"closeGeoPackage - exit");
		
	}
	return nResult;
}
int GeoPackageRasterReader::cancelGeoPackageToMBTilesConversion()
{
	int nResult = GPKG_RASTER_READ_SUCCESS;
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"cancelGeoPackageToMBTilesConversion - enter");
		
	}
	if( (nGeoPackageReaderState == GPKG_RASTER_READ_STATE_BASE_TILE_GEN) || 
		(nGeoPackageReaderState == GPKG_RASTER_READ_STATE_OVERLAY_TILE_GEN)
		)
	{
		cancelProcess = true;
		nGeoPackageReaderState = GPKG_RASTER_READ_STATE_CANCELLED;
	}
	else
	{
		nResult = GPKG_RASTER_READ_NOT_IN_PROGRESS;
	}
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"cancelGeoPackageToMBTilesConversion - exit");
		
	}
	return nResult;
}
double GeoPackageRasterReader::getGeoPackageToMBTileConversionStatus()
{
	double lprogress = 0.0;
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"getGeoPackageToMBTileConversionStatus - enter");
		
	}
	lprogress = progress;
	if(bLogEnabled)
	{
		write_log((char*)logFileObj.c_str(),"getGeoPackageToMBTileConversionStatus - exit");
		
	}
	return lprogress;
}
int GeoPackageRasterReader::getBounds(double *pLat, double *pLong)
{
	int nResult = 0;
	double adfGeoTransform[6];
	const char *pszProjection = NULL;
	OGRCoordinateTransformationH hTransform = NULL;

	if(hDSBounds != NULL)
	{
		if( GDALGetGeoTransform( hDSBounds, adfGeoTransform ) == CE_None )
			pszProjection = GDALGetProjectionRef(hDSBounds);

		if( pszProjection != NULL && strlen(pszProjection) > 0 )
		{
			OGRSpatialReferenceH hProj, hLatLong = NULL;

			hProj = OSRNewSpatialReference( pszProjection );
			if( hProj != NULL )
				hLatLong = OSRCloneGeogCS( hProj );

			if( hLatLong != NULL )
			{
				hTransform = OCTNewCoordinateTransformation( hProj, hLatLong );
				OSRDestroySpatialReference( hLatLong );
			}
			char latvalue[255];
			char longvalue[255];

			GDALInfoReportCorner(hDSBounds,hTransform,"Lower Left",0.0, GDALGetRasterYSize(hDSBounds),pLat,pLong);
			sprintf(latvalue,"%f",*pLat);
			sprintf(longvalue,"%f",*pLong);

			strLatLongBounds.clear();
			strLatLongBounds.append(latvalue);
			strLatLongBounds.append(",");
			strLatLongBounds.append(longvalue);
			GDALInfoReportCorner(hDSBounds,hTransform,"Upper Right",GDALGetRasterXSize(hDSBounds), 0.0,pLat,pLong);
			sprintf(latvalue,"%f",*pLat);
			sprintf(longvalue,"%f",*pLong);

			strLatLongBounds.append(",");
			strLatLongBounds.append(latvalue);
			strLatLongBounds.append(",");
			strLatLongBounds.append(longvalue);
			

			
			if( hProj != NULL )
				OSRDestroySpatialReference( hProj );
		}
	}
	else
	{
		nResult = -1;
	}
	return nResult;
}
static int 
GDALInfoReportCorner( GDALDatasetH hDataset, 
                      OGRCoordinateTransformationH hTransform,
                      const char * corner_name,
                      double x, double y,double *pLat,double *pLong )

{
    double	dfGeoX, dfGeoY;
    double	adfGeoTransform[6];
        
    printf( "%-11s ", corner_name );
    
/* -------------------------------------------------------------------- */
/*      Transform the point into georeferenced coordinates.             */
/* -------------------------------------------------------------------- */
    if( GDALGetGeoTransform( hDataset, adfGeoTransform ) == CE_None )
    {
        dfGeoX = adfGeoTransform[0] + adfGeoTransform[1] * x
            + adfGeoTransform[2] * y;
        dfGeoY = adfGeoTransform[3] + adfGeoTransform[4] * x
            + adfGeoTransform[5] * y;
    }

    else
    {
        printf( "(%7.1f,%7.1f)\n", x, y );
        return FALSE;
    }

/* -------------------------------------------------------------------- */
/*      Report the georeferenced coordinates.                           */
/* -------------------------------------------------------------------- */
    if( ABS(dfGeoX) < 181 && ABS(dfGeoY) < 91 )
    {
        printf( "(%12.7f,%12.7f) ", dfGeoX, dfGeoY );
    }
    else
    {
        printf( "(%12.3f,%12.3f) ", dfGeoX, dfGeoY );
    }

/* -------------------------------------------------------------------- */
/*      Transform to latlong and report.                                */
/* -------------------------------------------------------------------- */
    if( hTransform != NULL 
        && OCTTransform(hTransform,1,&dfGeoX,&dfGeoY,NULL) )
    {
        
		
		if((strcmp(corner_name,"Lower Left") == 0) || (strcmp(corner_name,"Upper Right") == 0)) 
		{
			printf("\n [%f,%f]",dfGeoY,dfGeoX);	
			*pLat = dfGeoY;
			*pLong = dfGeoX;
		}
    }
    //printf( "\n" );

    return TRUE;
}
void GeoPackageRasterReader::setGDALDATASettings(char *ptrGDALPATH){
	if(ptrGDALPATH != NULL)
	{
		CPLSetConfigOption("GDAL_DATA",ptrGDALPATH);
	}
}
GeoPackageRasterReader::~GeoPackageRasterReader()
{
	/*if(hDS != NULL)
	{
		GDALClose(hDS);
		hDS = NULL;
	}
	if(ptrJSONResult != NULL)
	{
		free(ptrJSONResult);
		ptrJSONResult = NULL;
	}*/
}