#include "GeoPDFReader.h"

//Generate MBTiles
/* Generate MBTiles
* This function converts the supplied GeoPDF file to MBTiles
* Step 1: Convert the GeoPDF to GeoTIFF with GDAL (integrated with PDFium)
* Step 2: Convert the Created GeoTIFF to MBTiles 
*/
int geopdf_gwarp( int argc, char ** argv);
int geopdf_gwarp2( int argc, char ** argv );

char *GeoPDFReader::hasSubSets(char *pInputFile, int *result)
{
	char *pSelectedDataSet = NULL;
	GDALDatasetH hDataset = NULL;
	int nTerminateLoop = 0;
	if(pInputFile != NULL)
	{
		hDataset
        = GDALOpenEx( pInputFile, GDAL_OF_READONLY | GDAL_OF_RASTER | GDAL_OF_VERBOSE_ERROR, 
		NULL,NULL, NULL );
		if(NULL != hDataset)
		{
			char **papszMetadata = GDALGetMetadata( hDataset, "SUBDATASETS" );
			int nSubdatasets = CSLCount( papszMetadata );
			if(nSubdatasets == 0)
			{
				*result = -10001;
			}
			else
			{
				*result = 0;
				for( int i = 0; papszMetadata[i] != NULL; i++ )
				{
					if(nTerminateLoop == 1)
					{
						break;
					}
					char *pszKey = NULL;
                    const char *pszValue =
                        CPLParseNameValue( papszMetadata[i], &pszKey );
					if( pszKey )
					{
						CPLFree( pszKey );
					}
					const char *subds = strstr((const char*)pszValue,(const char*)"PDF:");
					if(subds == pszValue)
					{
						//check if we can open the Dataset
						GDALDatasetH hDataset1
        = GDALOpenEx( pszValue, GDAL_OF_READONLY | GDAL_OF_RASTER | GDAL_OF_VERBOSE_ERROR, 
		NULL,NULL, NULL );
						if(hDataset1 != NULL)
						{
							const char *pszProjection = NULL;
							pszProjection = GDALGetProjectionRef(hDataset1);
							if(pszProjection != NULL)
							{
								if(strlen(pszProjection) > 0)
								{
									nTerminateLoop = 1;
									pSelectedDataSet = (char*)malloc(strlen(pszValue)+1);
									strcpy(pSelectedDataSet,pszValue);
								}
							}
							GDALClose(hDataset1);
						}
					}
				}
			}
			GDALClose(hDataset);
		}//End of NULL check
	}
	else
	{
		*result = -10000;
	}
	return pSelectedDataSet;
}
int GeoPDFReader::generateMBTiles(char *ptrScratchFolder,char *ptrFileName,char *ptrMBTileName,char *ptrGdalPath,char *ptrProgressID,char *ptrTMP, char *ptrutid)
{
	int nResult = GEOPDF_READER_SUCCESS;
	CPLSetConfigOption("GDAL_DATA",ptrGdalPath);
	//////////////////////////////////////////////////////////////////////////
	int bReductionRequired = 0;
	string inputRasterFile;
	string strDumpFile;
	/****** PDFs of large Resolution has to converted into small */
	GDALAllRegister();
	GDALDatasetH hDataset = NULL;
	int nSDSResult = 0;
	char *ptrSubDS = hasSubSets(ptrFileName, &nSDSResult);
	if(ptrSubDS != NULL)
	{
		hDataset = GDALOpenEx( ptrSubDS, 
			GDAL_OF_READONLY | GDAL_OF_RASTER | GDAL_OF_VERBOSE_ERROR, 
			NULL,NULL,NULL );

	}
	else
	{
		hDataset = GDALOpenEx( ptrFileName, 
			GDAL_OF_READONLY | GDAL_OF_RASTER | GDAL_OF_VERBOSE_ERROR, 
			NULL,NULL,NULL );
	}
	
	if(hDataset != NULL)
	{
		int nXSize = GDALGetRasterXSize(hDataset);
		int nYSize = GDALGetRasterYSize(hDataset);
		if((nXSize > 2500) || (nYSize > 2500))
		{
			bReductionRequired = 1;
		}
		GDALClose(hDataset);
	}
	
	if(bReductionRequired  == 1)
	{	
		char **argv1 = (char **)malloc(sizeof(char *) * 11);

		if(argv1 != NULL)
		{
			for(int i=0;i<11;i++) 
			{
				argv1[i] = (char *) malloc(sizeof(char) * 1024);
				if(argv1[i] == NULL)
				{
					nResult = GEOPDF_READER_WARP_MEM_ALLOC_FAILED;
					return nResult;
				}
			}
		}
		
		strDumpFile.clear();
		strDumpFile.append(ptrScratchFolder);
		strDumpFile.append("/");
		strDumpFile.append("good.tif");

		string tifFile;
		tifFile.clear();
		tifFile.append(ptrScratchFolder);
		tifFile.append("/wtif");
		tifFile.append("_");
		tifFile.append(ptrProgressID);
		tifFile.append(".tif");



		strcpy(argv1[0],"gwarp");
		if(ptrSubDS != NULL)
		{
			strcpy(argv1[1],ptrSubDS);
		}
		else
		{
			strcpy(argv1[1],ptrFileName);
		}
		strcpy(argv1[2],tifFile.c_str());
		setenv("GPDF_DUMPFILE",(char*)strDumpFile.c_str(),1);

		int nResult = geopdf_gwarp2( 3, argv1 );
		remove(tifFile.c_str());
		printf("Dump file = %s\n",strDumpFile.c_str());
		inputRasterFile.clear();
		inputRasterFile.append(strDumpFile.c_str());
		for(int i=0;i<11;i++) {
			if(argv1[i] != NULL)
			{
				free(argv1[i]);
			}
		}
		if(argv1 != NULL)
		{
			free(argv1);
		}

	}


	//////////////////////////////////////////////////////////////////////////
	char **argv = (char **)malloc(sizeof(char *) * 8);
	if(argv != NULL)
	{
		for(int i=0;i<8;i++) 
		{
			argv[i] = (char *) malloc(sizeof(char) * 1024);
			if(argv[i] == NULL)
			{
				nResult = GEOPDF_READER_WARP_MEM_ALLOC_FAILED;
				return nResult;
			}
		}
		//Generate string to create a call to warp	
		strcpy(argv[0],"gwarp");
		strcpy(argv[1],"-of");
		strcpy(argv[2],"GTiff");
		strcpy(argv[3],"-t_srs");
		strcpy(argv[4],"EPSG:3857");
		if(bReductionRequired == 0)
		{
			if(ptrSubDS != NULL) 
			{
				strcpy(argv[5],ptrSubDS);
			}
			else
			{	
				strcpy(argv[5],ptrFileName);
			}
		}
		else
		{
			strcpy(argv[5],inputRasterFile.c_str());
		}
	
		string tifFile;
		tifFile.clear();
		tifFile.append(ptrScratchFolder);
		tifFile.append("/wtif");
		tifFile.append("_");
		tifFile.append(ptrProgressID);
		tifFile.append(".tif");
		strcpy(argv[6],tifFile.c_str());
		printf("tifFile file name: [%s]\n", tifFile.c_str());


		//Remove the GeoTIFF file If already exists
		remove(tifFile.c_str());

		string progressFile;
		progressFile.clear();
		progressFile.append(ptrScratchFolder);
		progressFile.append("/progress");
		progressFile.append("_");
		progressFile.append(ptrProgressID);
		progressFile.append(".txt");
		printf("progressFile file name: [%s]\n", progressFile.c_str());

		string logFile;
		logFile.clear();
		logFile.append(ptrScratchFolder);
		logFile.append("/log");
		logFile.append("_");
		logFile.append(ptrProgressID);
		logFile.append(".log");
		printf("logFile file name: [%s]\n", logFile.c_str());


		string termFile;
		termFile.clear();
		termFile.append(ptrScratchFolder);
		termFile.append("/log");
		termFile.append("_");
		termFile.append(ptrProgressID);
		termFile.append(".ter");

		printf("termFile file name: [%s]\n", termFile.c_str());

	
		int wresult = GEOMAP_UTILS_WARP_SUCCESS;
		int mresult = MBTILES_GEN_SUCCESS;

		geopdf_create_status_file_progress((char*)progressFile.c_str(),0.15f);
		geopdf_write_log((char*)logFile.c_str(),"INFO:Entering Warp module");
#if 1
		/******** Converting GeoPDF to GeoTIFF ********/
		wresult = geopdf_gwarp(7,argv);
		if(wresult == 0)
		{
			if(bReductionRequired == 1)
			{
				remove(strDumpFile.c_str());
			}
			geopdf_write_log((char*)logFile.c_str(),"INFO:Warp module success");
			/* Case: User HAS ALLOWED Map Creation */
				string mbtilesName;
				mbtilesName.append(ptrMBTileName);
				remove((char*)mbtilesName.c_str());
				geopdf_write_log((char*)logFile.c_str(),"INFO:Starting MBTiles generation ...");
				/* png - mbtiles format, 2 - Compression level, 80 - jpeg quality */
				mresult = geopdf_convert_mbtiles((char*)tifFile.c_str(),
							(char*)mbtilesName.c_str(),
							"",
							"png",
							"2",
							"80",
							"1",ptrTMP,(char*)progressFile.c_str(),(char*)logFile.c_str(),(char*)termFile.c_str(),ptrutid);
				geopdf_write_log((char*)logFile.c_str(),"INFO:Ending MBTiles generation ...");
				remove(tifFile.c_str());
				if(mresult == MBTILES_GEN_SUCCESS)
				{
					nResult = GEOPDF_READER_SUCCESS;
					geopdf_write_log((char*)logFile.c_str(),"INFO:MBTiles : tile generation [SUCCESS]");
				}
				else if(mresult == GEOMAP_UTILS_TERM_REQUESTED)
				{
					nResult = GEOMAP_UTILS_TERM_REQUESTED;
					geopdf_write_log((char*)logFile.c_str(),"INFO:MBTiles : tile generation [TERM REQUESTED]");
					geopdf_create_status_file_term((char*)progressFile.c_str(),"termination requested");
				}
				else
				{
					nResult = GEOPDF_READER_TILE_GEN_ERROR;
					geopdf_write_log((char*)logFile.c_str(),"INFO:MBTiles : tile generation [FAILED]");
				}
		}
		else
		{
			char msgresult[100];
			msgresult[0]='\0';
			sprintf(msgresult,"result=%d",wresult);
			geopdf_write_log((char*)logFile.c_str(),"INFO:Entering Warp failed");
			geopdf_create_status_file_failed((char*)progressFile.c_str(),"warp Failed");
		}

#endif
		for(int i=0;i<8;i++) {
			if(argv[i] != NULL)
			{
				free(argv[i]);
			}
		}
		if(argv != NULL)
		{
			free(argv);
		}
		return wresult;
	}
}
#if 0
int GeoPDFReader::generateMBTiles2(char *ptrScratchFolder,char *ptrFileName,char *ptrMBTileName,char *ptrGdalPath,char *ptrProgressID,char *ptrTMP, char *ptrutid)
{
	/******** Step 1: GeoPDF to GeoTIFF conversion starts here ********/
	 
	int nResult = GEOPDF_READER_SUCCESS;

	//Now config GDAL for gdal-data files used for reprojection
	CPLSetConfigOption("GDAL_DATA",ptrGdalPath);

	char **argv = (char **)malloc(sizeof(char *) * 8);
	if(argv != NULL)
	{
		for(int i=0;i<8;i++) 
		{
			argv[i] = (char *) malloc(sizeof(char) * 1024);
			if(argv[i] == NULL)
			{
				nResult = GEOPDF_READER_WARP_MEM_ALLOC_FAILED;
				return nResult;
			}
		}
		//Generate string to create a call to warp	
		strcpy(argv[0],"gwarp");
		strcpy(argv[1],"-of");
		strcpy(argv[2],"GTiff");
		strcpy(argv[3],"-t_srs");
		strcpy(argv[4],"EPSG:3857");
		strcpy(argv[5],ptrFileName);
	
		string tifFile;
		tifFile.clear();
		tifFile.append(ptrScratchFolder);
		tifFile.append("/wtif");
		tifFile.append("_");
		tifFile.append(ptrProgressID);
		tifFile.append(".tif");
		strcpy(argv[6],tifFile.c_str());
		printf("tifFile file name: [%s]\n", tifFile.c_str());


		//Remove the GeoTIFF file If already exists
		remove(tifFile.c_str());

		string progressFile;
		progressFile.clear();
		progressFile.append(ptrScratchFolder);
		progressFile.append("/progress");
		progressFile.append("_");
		progressFile.append(ptrProgressID);
		progressFile.append(".txt");
		printf("progressFile file name: [%s]\n", progressFile.c_str());

		string logFile;
		logFile.clear();
		logFile.append(ptrScratchFolder);
		logFile.append("/log");
		logFile.append("_");
		logFile.append(ptrProgressID);
		logFile.append(".log");
		printf("logFile file name: [%s]\n", logFile.c_str());


		string termFile;
		termFile.clear();
		termFile.append(ptrScratchFolder);
		termFile.append("/log");
		termFile.append("_");
		termFile.append(ptrProgressID);
		termFile.append(".ter");

		printf("termFile file name: [%s]\n", termFile.c_str());

	
		int wresult = GEOMAP_UTILS_WARP_SUCCESS;
		int mresult = MBTILES_GEN_SUCCESS;

		geopdf_create_status_file_progress((char*)progressFile.c_str(),0.0f);
		geopdf_write_log((char*)logFile.c_str(),"INFO:Entering Warp module");

		/******** Converting GeoPDF to GeoTIFF ********/
		wresult = geopdf_gwarp(7,argv,(char*)progressFile.c_str(),(char*)termFile.c_str(),(char*)logFile.c_str());
		/******** End of Converting GeoPDF to GeoTIFF call ********/

		geopdf_write_log((char*)logFile.c_str(),"INFO:Exiting Warp code");

		if(wresult == GEOMAP_UTILS_WARP_SUCCESS)
		{
			/******** Step 2: Begins here ********/
			/* Now check if user has requested for Map Creation CANCEL */
			if (GEOMAP_UTILS_TERM_REQUESTED != geopdf_check_process_termination((char*)termFile.c_str()))
			{
				/* Case: User HAS ALLOWED Map Creation */
				string mbtilesName;
				mbtilesName.append(ptrMBTileName);
				remove((char*)mbtilesName.c_str());
				geopdf_write_log((char*)logFile.c_str(),"INFO:Starting MBTiles generation ...");
				/* png - mbtiles format, 2 - Compression level, 80 - jpeg quality */
				mresult = geopdf_convert_mbtiles((char*)tifFile.c_str(),
							(char*)mbtilesName.c_str(),
							"",
							"png",
							"2",
							"80",
							"1",ptrTMP,(char*)progressFile.c_str(),(char*)logFile.c_str(),(char*)termFile.c_str(),ptrutid);
				geopdf_write_log((char*)logFile.c_str(),"INFO:Ending MBTiles generation ...");
				remove(tifFile.c_str());
				if(mresult == MBTILES_GEN_SUCCESS)
				{
					nResult = GEOPDF_READER_SUCCESS;
					geopdf_write_log((char*)logFile.c_str(),"INFO:MBTiles : tile generation [SUCCESS]");
				}
				else if(mresult == GEOMAP_UTILS_TERM_REQUESTED)
				{
					nResult = GEOMAP_UTILS_TERM_REQUESTED;
					geopdf_write_log((char*)logFile.c_str(),"INFO:MBTiles : tile generation [TERM REQUESTED]");
				}
				else
				{
					nResult = GEOPDF_READER_TILE_GEN_ERROR;
					geopdf_write_log((char*)logFile.c_str(),"INFO:MBTiles : tile generation [FAILED]");
				}
			}
			else
			{
				/* Case: User has request Map Creation Process to CANCEL */
				geopdf_write_log((char*)logFile.c_str(),"INFO:Warp : termination requested");
				geopdf_create_status_file_term((char*)progressFile.c_str(),"termination requested at warp");
				remove(tifFile.c_str());
				remove(termFile.c_str());
				nResult = GEOMAP_UTILS_TERM_REQUESTED;
			}
		}
		else if(GEOMAP_UTILS_TERM_REQUESTED == wresult)
		{
			/* Case: User has request Map Creation Process to CANCEL at Warp process */
			geopdf_write_log((char*)logFile.c_str(),"INFO:Warp : termination requested");
			remove(tifFile.c_str());
			remove(termFile.c_str());
			geopdf_create_status_file_term((char*)progressFile.c_str(),"termination requested at warp");
			nResult = GEOMAP_UTILS_TERM_REQUESTED;
		}
		else
		{
			geopdf_write_log((char*)logFile.c_str(),"warp: failed for reason");
			geopdf_create_status_file_failed((char*)progressFile.c_str(),"warp Failed");
			nResult = GEOMAP_UTILS_WARP_FAILED;
		}
		for(int i=0;i<8;i++) {
			if(argv[i] != NULL)
			{
				free(argv[i]);
			}
		}
		if(argv != NULL)
		{
			free(argv);
		}
	}
	else
	{
		nResult = GEOPDF_READER_WARP_MEM_ALLOC_FAILED;
	}
	return nResult;
}
#endif

