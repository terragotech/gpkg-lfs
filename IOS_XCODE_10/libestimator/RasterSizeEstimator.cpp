#include "RasterSizeEstimator.h"

char* RasterSizeEstimator::hasSubSets(char *pInputFile, int *result)
{
	printf("Entering hasSubSets\n");
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

char* RasterSizeEstimator::getSupportInfo(char *ptrInputFile,char *ptrGDALPath,char *ptrtableName, char *formatType){
	/* Variables for Storing result */
	char *result = NULL;
	string jsonString;
	int geoPDFStatus = 0;
	long rasterXSize = 0;
	long rasterYSize = 0;
	int bpp;
	int channels;
	long estimateSize = 0;
	/* Check Input data */
	char *phasSUB = NULL;
	if((ptrInputFile != NULL) && (ptrGDALPath != NULL) && (ptrtableName != NULL) && (formatType != NULL))
	{
		CPLSetConfigOption("GDAL_DATA",ptrGDALPath);
		GDALAllRegister();
		GDALDatasetH hDataset = NULL;
		double adfGeoTransform[6];
		const char *pszProjection = NULL;
		OGRCoordinateTransformationH hTransform = NULL;
		char **OpenOptions = NULL;
		
		if(strcmp(formatType,"PDF")==0)
		{
			int nPDFResult = 0;
			phasSUB = hasSubSets(ptrInputFile,&nPDFResult);
			if(phasSUB != NULL)
			{
				printf("Found subsets \n");
				hDataset = GDALOpenEx( phasSUB , 
			GDAL_OF_READONLY | GDAL_OF_RASTER | GDAL_OF_VERBOSE_ERROR, 
			NULL,NULL,NULL );
			
			}
			else
			{
				printf("No Found subsets \n");
				hDataset = GDALOpenEx( ptrInputFile, 
			GDAL_OF_READONLY | GDAL_OF_RASTER | GDAL_OF_VERBOSE_ERROR, 
			NULL,NULL,NULL );
			}
			
		}
		else
		{
			string tableOpenOptions;
			tableOpenOptions.clear();
			tableOpenOptions.append("TABLE=");
			tableOpenOptions.append(ptrtableName);
			OpenOptions = CSLAddString(OpenOptions,tableOpenOptions.c_str());
			hDataset = GDALOpenEx( ptrInputFile, 
			GDAL_OF_READONLY | GDAL_OF_RASTER | GDAL_OF_VERBOSE_ERROR, 
			NULL,OpenOptions,NULL );
		}
		if(hDataset != NULL)
		{
			 CSLDestroy(OpenOptions);
			 //Dataset being valid continue check for Geo registration
			 if( GDALGetGeoTransform( hDataset, adfGeoTransform ) == CE_None )
			 {
				 //Has Geo Registration, must check if this can reprojected to Web Mercator EPSG:3857 
				pszProjection = GDALGetProjectionRef(hDataset);
				long *pxsize = &rasterXSize;
				long *pysize = &rasterYSize;
				int *pbpp = &bpp;
				int *pchannels = &channels;
				long *pestimateSize = &estimateSize;
				int nProjResult = 0;
				nProjResult = generate_projection(hDataset,pxsize,pysize,pbpp,pchannels,pestimateSize);
				if(EST_ERROR_NO_ERROR == nProjResult)
				{
					geoPDFStatus = EST_ERROR_NO_ERROR;
				}
				else if((nProjResult == EST_ERROR_WARP_EST_FAILED) || (nProjResult == EST_ERROR_INVWARP_EST_FAILED))
				{
					geoPDFStatus = EST_ERROR_WARP_EST_FAILED;
				}
				else if(nProjResult == EST_ERROR_NO_RASTER)
				{
					geoPDFStatus = EST_ERROR_NO_RASTER;
				}
				else if(nProjResult == EST_ERROR_REPROJ_FAILED)
				{
					geoPDFStatus = EST_ERROR_REPROJ_FAILED;
				}
				else if(nProjResult == EST_ERROR_GDAL_DATA_UNAVAILABLE)
				{
					geoPDFStatus = EST_ERROR_GDAL_DATA_UNAVAILABLE;
				}
 				GDALClose(hDataset);

			 }
			 else
			 {
				 geoPDFStatus = EST_ERROR_NO_GEOREGISTRATION;
				 GDALClose(hDataset);
			 }
		}
		else
		{
			//Failed to Open data set
			//Possible Damaged or not a PDF or not complaince to Adobe PDF/GeoPDF Specification
			geoPDFStatus = EST_ERROR_UNSABLE;
		}
	}
	else
	{
		geoPDFStatus = EST_ERROR_BAD_INPUT;
	}
	//Generate JSON Based on the geoPDFStatus
	char jsonESTString[2024];
	char chEstimateSize[100];
	switch(geoPDFStatus)
	{
	case EST_ERROR_NO_ERROR:
		sprintf(chEstimateSize,"%ld",estimateSize);
		sprintf(jsonESTString,"{\"estimate\":\"%ld\",\"status\":\"%s\"}",estimateSize,"good");
		jsonString.clear();
		jsonString.append(jsonESTString);
		break;
	case EST_ERROR_WARP_EST_FAILED:
		estimateSize = 0;
		sprintf(chEstimateSize,"%ld",estimateSize);
		sprintf(jsonESTString,"{\"estimate\":\"%ld\",\"status\":\"%s\"}",estimateSize,"warpfailed");
		jsonString.clear();
		jsonString.append(jsonESTString);

		break;
	case EST_ERROR_NO_RASTER:
		estimateSize = 0;
		sprintf(chEstimateSize,"%ld",estimateSize);
		sprintf(jsonESTString,"{\"estimate\":\"%ld\",\"status\":\"%s\"}",estimateSize,"noraster");
		jsonString.clear();
		jsonString.append(jsonESTString);
		break;
	case EST_ERROR_REPROJ_FAILED:
		estimateSize = 0;
		sprintf(chEstimateSize,"%ld",estimateSize);
		sprintf(jsonESTString,"{\"estimate\":\"%ld\",\"status\":\"%s\"}",estimateSize,"cannotreproj");
		jsonString.clear();
		jsonString.append(jsonESTString);
		break;
	case EST_ERROR_GDAL_DATA_UNAVAILABLE:
		estimateSize = 0;
		sprintf(chEstimateSize,"%ld",estimateSize);
		sprintf(jsonESTString,"{\"estimate\":\"%ld\",\"status\":\"%s\"}",estimateSize,"nogdaldata");
		jsonString.clear();
		jsonString.append(jsonESTString);
		break;
	case EST_ERROR_NO_GEOREGISTRATION:
		estimateSize = 0;
		sprintf(chEstimateSize,"%ld",estimateSize);
		sprintf(jsonESTString,"{\"estimate\":\"%ld\",\"status\":\"%s\"}",estimateSize,"nogeoregistration");
		jsonString.clear();
		jsonString.append(jsonESTString);
		break;
	case EST_ERROR_UNSABLE:
		estimateSize = 0;
		sprintf(chEstimateSize,"%ld",estimateSize);
		sprintf(jsonESTString,"{\"estimate\":\"%ld\",\"status\":\"%s\"}",estimateSize,"badfile");
		jsonString.clear();
		jsonString.append(jsonESTString);
		break;
	case EST_ERROR_BAD_INPUT:
		estimateSize = 0;
		sprintf(chEstimateSize,"%ld",estimateSize);
		sprintf(jsonESTString,"{\"estimate\":\"%ld\",\"status\":\"%s\"}",estimateSize,"badparam");
		jsonString.clear();
		jsonString.append(jsonESTString);
		break;
	}
	if(jsonString.length() > 0)
	{
		result = (char*)malloc((sizeof(char) * jsonString.length()+1));
		if(result != NULL)
		{
			strcpy(result,jsonString.c_str());
			printf("Status: [%s]\n",result);
		}
		else
		{
			result = NULL;
		}
	}
	 if(phasSUB != NULL)
    	{
		free(phasSUB);
   	}	
	return result;
}
static char *SanitizeSRS( const char *pszUserInput)

{
    OGRSpatialReferenceH hSRS;
    char *pszResult = NULL;

    CPLErrorReset();
    
    hSRS = OSRNewSpatialReference( NULL );
    if( OSRSetFromUserInput( hSRS, pszUserInput ) == OGRERR_NONE )
        OSRExportToWkt( hSRS, &pszResult );
    else
    {
        CPLError( CE_Failure, CPLE_AppDefined,
                  "Translating source or target SRS failed:\n%s",
                  pszUserInput );
        return NULL;
    }
    
    OSRDestroySpatialReference( hSRS );
   
    return pszResult;
}

static int  GDALWarpCreateOutput( const char *pszFormat,
							char **papszTO,
							char ***ppapszCreateOptions,
							GDALDataType eDT,
							void ** phTransformArg,
							GDALDatasetH* phSrcDS,
							int bSetColorInterpretation,
							GDALDatasetH hSrcDS,long *xsize, long *ysize, int *bpp, int *channels, long *estimateSize)
{
    /*
	This function is to compute the geotrans values 
	after creating the transform objects
	and not a full gdalwarp to be performed
	*/
	int             bTargetAlignedPixels = FALSE;
	int result = EST_ERROR_NO_ERROR;
	double	       dfXRes=0.0, dfYRes=0.0;
	void *hTransformArg;
    double	       dfMinX=0.0, dfMinY=0.0, dfMaxX=0.0, dfMaxY=0.0;

    double dfWrkMinX=0, dfWrkMaxX=0, dfWrkMinY=0, dfWrkMaxY=0;
    double dfWrkResX=0, dfWrkResY=0;
	int             nForcePixels=0, nForceLines=0;
    const char *pszThisSourceSRS = NULL;

    int    bNeedsSuggestedWarpOutput = 1;
    //int bVRT = 0;

    *phTransformArg = NULL;
    *phSrcDS = NULL;

    //int     iSrc = 0;
    char    *pszThisTargetSRS = (char*)CSLFetchNameValue( papszTO, "DST_SRS" );

    if( pszThisTargetSRS != NULL )
        pszThisTargetSRS = CPLStrdup( pszThisTargetSRS );

	//Opening the GDAL Dataset

	///////////////////////////////

/* -------------------------------------------------------------------- */
/*      Check that there's at least one raster band                     */
/* -------------------------------------------------------------------- */
	if (GDALGetRasterCount(hSrcDS) == 0 )
	{
		return EST_ERROR_NO_RASTER;
	}
	//Computing Raster Count
	*channels = GDALGetRasterCount(hSrcDS);
	if( eDT == GDT_Unknown )
		eDT = GDALGetRasterDataType(GDALGetRasterBand(hSrcDS,1));
	//Computing Bits per Pixel
	*bpp = eDT;
	//In our case we don't pass any SRS, but Targer SRS is only set 

	if( pszThisSourceSRS == NULL )
	{
		const char *pszMethod = CSLFetchNameValue( papszTO, "METHOD" );

        if( GDALGetProjectionRef( hSrcDS ) != NULL 
			&& strlen(GDALGetProjectionRef( hSrcDS )) > 0
            && (pszMethod == NULL || EQUAL(pszMethod,"GEOTRANSFORM")) )
            pszThisSourceSRS = GDALGetProjectionRef( hSrcDS );
            
        else if( GDALGetGCPProjection( hSrcDS ) != NULL
                     && strlen(GDALGetGCPProjection(hSrcDS)) > 0 
                     && GDALGetGCPCount( hSrcDS ) > 1 
                     && (pszMethod == NULL || EQUALN(pszMethod,"GCP_",4)) )
                pszThisSourceSRS = GDALGetGCPProjection( hSrcDS );
		else if( pszMethod != NULL && EQUAL(pszMethod,"RPC") )
                pszThisSourceSRS = SRS_WKT_WGS84;
		else
                pszThisSourceSRS = "";
	}

	if( pszThisTargetSRS == NULL )
		pszThisTargetSRS = CPLStrdup( pszThisSourceSRS );
        
/* -------------------------------------------------------------------- */
/*      Create a transformation object from the source to               */
/*      destination coordinate system.                                  */
/* -------------------------------------------------------------------- */
	hTransformArg = GDALCreateGenImgProjTransformer2( hSrcDS, NULL, papszTO );
        
	if(hTransformArg == NULL )
	{
		CPLFree( pszThisTargetSRS );
		return EST_ERROR_REPROJ_FAILED;
	}
	GDALTransformerInfo* psInfo = (GDALTransformerInfo*)hTransformArg;

/* -------------------------------------------------------------------- */
/*      Get approximate output definition.                              */
/* -------------------------------------------------------------------- */
	if( bNeedsSuggestedWarpOutput )
	{//////////////////////////////////////////////////////////////
		double adfThisGeoTransform[6];
		double adfExtent[4];
		int    nThisPixels, nThisLines;

		if (GDALSuggestedWarpOutput2( hSrcDS, 
                                        psInfo->pfnTransform, hTransformArg, 
                                        adfThisGeoTransform, 
                                        &nThisPixels, &nThisLines, 
                                        adfExtent, 0 ) != CE_None )
		{
			CPLFree( pszThisTargetSRS );
			return EST_ERROR_WARP_EST_FAILED;
		}
            
		if ( CPLGetConfigOption( "CHECK_WITH_INVERT_PROJ", NULL ) == NULL )
		{
			double MinX = adfExtent[0];
			double MaxX = adfExtent[2];
			double MaxY = adfExtent[3];
			double MinY = adfExtent[1];
			int bSuccess = TRUE;
                
            /* Check that the the edges of the target image are in the validity area */
            /* of the target projection */
    #define N_STEPS 20
                int i,j;
                for(i=0;i<=N_STEPS && bSuccess;i++)
                {
                    for(j=0;j<=N_STEPS && bSuccess;j++)
                    {
                        double dfRatioI = i * 1.0 / N_STEPS;
                        double dfRatioJ = j * 1.0 / N_STEPS;
                        double expected_x = (1 - dfRatioI) * MinX + dfRatioI * MaxX;
                        double expected_y = (1 - dfRatioJ) * MinY + dfRatioJ * MaxY;
                        double x = expected_x;
                        double y = expected_y;
                        double z = 0;
                        /* Target SRS coordinates to source image pixel coordinates */
                        if (!psInfo->pfnTransform(hTransformArg, TRUE, 1, &x, &y, &z, &bSuccess) || !bSuccess)
                            bSuccess = FALSE;
                        /* Source image pixel coordinates to target SRS coordinates */
                        if (!psInfo->pfnTransform(hTransformArg, FALSE, 1, &x, &y, &z, &bSuccess) || !bSuccess)
                            bSuccess = FALSE;
                        if (fabs(x - expected_x) > (MaxX - MinX) / nThisPixels ||
                            fabs(y - expected_y) > (MaxY - MinY) / nThisLines)
                            bSuccess = FALSE;
                    }
                }
                
                /* If not, retry with CHECK_WITH_INVERT_PROJ=TRUE that forces ogrct.cpp */
                /* to check the consistency of each requested projection result with the */
                /* invert projection */
                if (!bSuccess)
                {
                    CPLSetConfigOption( "CHECK_WITH_INVERT_PROJ", "TRUE" );
                    CPLDebug("WARP", "Recompute out extent with CHECK_WITH_INVERT_PROJ=TRUE");

                    if(GDALSuggestedWarpOutput2( hSrcDS, 
                                        psInfo->pfnTransform, hTransformArg, 
                                        adfThisGeoTransform, 
                                        &nThisPixels, &nThisLines, 
                                        adfExtent, 0 ) != CE_None )
                    {
                        CPLFree( pszThisTargetSRS );
                        return EST_ERROR_INVWARP_EST_FAILED;
                    }
                }
		}

    /* -------------------------------------------------------------------- */
    /*      Expand the working bounds to include this region, ensure the    */
    /*      working resolution is no more than this resolution.             */
    /* -------------------------------------------------------------------- */
            if( dfWrkMaxX == 0.0 && dfWrkMinX == 0.0 )
            {
                dfWrkMinX = adfExtent[0];
                dfWrkMaxX = adfExtent[2];
                dfWrkMaxY = adfExtent[3];
                dfWrkMinY = adfExtent[1];
                dfWrkResX = adfThisGeoTransform[1];
                dfWrkResY = ABS(adfThisGeoTransform[5]);
            }
            else
            {
                dfWrkMinX = MIN(dfWrkMinX,adfExtent[0]);
                dfWrkMaxX = MAX(dfWrkMaxX,adfExtent[2]);
                dfWrkMaxY = MAX(dfWrkMaxY,adfExtent[3]);
                dfWrkMinY = MIN(dfWrkMinY,adfExtent[1]);
                dfWrkResX = MIN(dfWrkResX,adfThisGeoTransform[1]);
                dfWrkResY = MIN(dfWrkResY,ABS(adfThisGeoTransform[5]));
            }
	}
/* -------------------------------------------------------------------- */
/*      Did we have any usable sources?                                 */
/* -------------------------------------------------------------------- */
	/*nDstBandCount = GDALGetRasterCount(hSrcDS);
    if( nDstBandCount == 0 )
    {
        CPLError( CE_Failure, CPLE_AppDefined,
                  "No usable source images." );
        CPLFree( pszThisTargetSRS );
        return GEOMAP_ERROR_GDAL_NO_RASTERS;
    }*/

/* -------------------------------------------------------------------- */
/*      Turn the suggested region into a geotransform and suggested     */
/*      number of pixels and lines.                                     */
/* -------------------------------------------------------------------- */
    double adfDstGeoTransform[6] = { 0, 0, 0, 0, 0, 0 };
    int nPixels = 0, nLines = 0;
    
    if( bNeedsSuggestedWarpOutput )
    {
        adfDstGeoTransform[0] = dfWrkMinX;
        adfDstGeoTransform[1] = dfWrkResX;
        adfDstGeoTransform[2] = 0.0;
        adfDstGeoTransform[3] = dfWrkMaxY;
        adfDstGeoTransform[4] = 0.0;
        adfDstGeoTransform[5] = -1 * dfWrkResY;

        nPixels = (int) ((dfWrkMaxX - dfWrkMinX) / dfWrkResX + 0.5);
        nLines = (int) ((dfWrkMaxY - dfWrkMinY) / dfWrkResY + 0.5);
    }

/* -------------------------------------------------------------------- */
/*      Did the user override some parameters?                          */
/* -------------------------------------------------------------------- */
    if( dfXRes != 0.0 && dfYRes != 0.0 )
    {
        if( dfMinX == 0.0 && dfMinY == 0.0 && dfMaxX == 0.0 && dfMaxY == 0.0 )
        {
            dfMinX = adfDstGeoTransform[0];
            dfMaxX = adfDstGeoTransform[0] + adfDstGeoTransform[1] * nPixels;
            dfMaxY = adfDstGeoTransform[3];
            dfMinY = adfDstGeoTransform[3] + adfDstGeoTransform[5] * nLines;
        }
        
        if ( bTargetAlignedPixels )
        {
            dfMinX = floor(dfMinX / dfXRes) * dfXRes;
            dfMaxX = ceil(dfMaxX / dfXRes) * dfXRes;
            dfMinY = floor(dfMinY / dfYRes) * dfYRes;
            dfMaxY = ceil(dfMaxY / dfYRes) * dfYRes;
        }

        nPixels = (int) ((dfMaxX - dfMinX + (dfXRes/2.0)) / dfXRes);
        nLines = (int) ((dfMaxY - dfMinY + (dfYRes/2.0)) / dfYRes);
        adfDstGeoTransform[0] = dfMinX;
        adfDstGeoTransform[3] = dfMaxY;
        adfDstGeoTransform[1] = dfXRes;
        adfDstGeoTransform[5] = -dfYRes;
    }

    else if( nForcePixels != 0 && nForceLines != 0 )
    {
        if( dfMinX == 0.0 && dfMinY == 0.0 && dfMaxX == 0.0 && dfMaxY == 0.0 )
        {
            dfMinX = dfWrkMinX;
            dfMaxX = dfWrkMaxX;
            dfMaxY = dfWrkMaxY;
            dfMinY = dfWrkMinY;
        }

        dfXRes = (dfMaxX - dfMinX) / nForcePixels;
        dfYRes = (dfMaxY - dfMinY) / nForceLines;

        adfDstGeoTransform[0] = dfMinX;
        adfDstGeoTransform[3] = dfMaxY;
        adfDstGeoTransform[1] = dfXRes;
        adfDstGeoTransform[5] = -dfYRes;

        nPixels = nForcePixels;
        nLines = nForceLines;
    }

    else if( nForcePixels != 0 )
    {
        if( dfMinX == 0.0 && dfMinY == 0.0 && dfMaxX == 0.0 && dfMaxY == 0.0 )
        {
            dfMinX = dfWrkMinX;
            dfMaxX = dfWrkMaxX;
            dfMaxY = dfWrkMaxY;
            dfMinY = dfWrkMinY;
        }

        dfXRes = (dfMaxX - dfMinX) / nForcePixels;
        dfYRes = dfXRes;

        adfDstGeoTransform[0] = dfMinX;
        adfDstGeoTransform[3] = dfMaxY;
        adfDstGeoTransform[1] = dfXRes;
        adfDstGeoTransform[5] = -dfYRes;

        nPixels = nForcePixels;
        nLines = (int) ((dfMaxY - dfMinY + (dfYRes/2.0)) / dfYRes);
    }

    else if( nForceLines != 0 )
    {
        if( dfMinX == 0.0 && dfMinY == 0.0 && dfMaxX == 0.0 && dfMaxY == 0.0 )
        {
            dfMinX = dfWrkMinX;
            dfMaxX = dfWrkMaxX;
            dfMaxY = dfWrkMaxY;
            dfMinY = dfWrkMinY;
        }

        dfYRes = (dfMaxY - dfMinY) / nForceLines;
        dfXRes = dfYRes;

        adfDstGeoTransform[0] = dfMinX;
        adfDstGeoTransform[3] = dfMaxY;
        adfDstGeoTransform[1] = dfXRes;
        adfDstGeoTransform[5] = -dfYRes;

        nPixels = (int) ((dfMaxX - dfMinX + (dfXRes/2.0)) / dfXRes);
        nLines = nForceLines;
    }

    else if( dfMinX != 0.0 || dfMinY != 0.0 || dfMaxX != 0.0 || dfMaxY != 0.0 )
    {
        dfXRes = adfDstGeoTransform[1];
        dfYRes = fabs(adfDstGeoTransform[5]);

        nPixels = (int) ((dfMaxX - dfMinX + (dfXRes/2.0)) / dfXRes);
        nLines = (int) ((dfMaxY - dfMinY + (dfYRes/2.0)) / dfYRes);

        dfXRes = (dfMaxX - dfMinX) / nPixels;
        dfYRes = (dfMaxY - dfMinY) / nLines;

        adfDstGeoTransform[0] = dfMinX;
        adfDstGeoTransform[3] = dfMaxY;
        adfDstGeoTransform[1] = dfXRes;
        adfDstGeoTransform[5] = -dfYRes;
    }
	*xsize = nPixels;
	*ysize = nLines;
	*estimateSize = (*xsize) * (*ysize) * (*bpp) * (*channels);
	float xtiles = 1;
	float ytiles = 1;
	long tilesSize = 0;
	if(*xsize > 256)
	{
		xtiles = *xsize / 256.0;
	}
	if(*ysize > 256)
	{
		ytiles = *ysize / 256.0;
	}
	tilesSize = xtiles * ytiles * 1000;
	tilesSize = tilesSize + (tilesSize * 0.20);
	*estimateSize = (*estimateSize + tilesSize) /(1024*1024);
	printf("Size in %ld MB\n",(*estimateSize));
	return result;
}
static int generate_projection(GDALDatasetH hSrc, long *xsize, long *ysize, int *bpp, int *channels,long *estimateSize)
{
	
	//This function called the GDALWarpCreateOuput to generate
	//The geotranform and the raster size

	char *pszSRS = SanitizeSRS("EPSG:3857");
	if(NULL == pszSRS)
	{
		return EST_ERROR_GDAL_DATA_UNAVAILABLE;
	}
	char **papszTO = NULL;
	const char *pszFormat = "GTiff";
	char **papszCreateOptions = NULL;
	void* hUniqueTransformArg = NULL;
	GDALDataType eOutputType = GDT_Unknown;
	//eWorkingType = GDT_Unknown;
	GDALDatasetH hUniqueSrcDS = NULL;
	int bSetColorInterpretation = FALSE;

	papszTO = CSLSetNameValue( papszTO, "DST_SRS", pszSRS );
    CPLFree( pszSRS );

	
	return GDALWarpCreateOutput(pszFormat,
                                       papszTO, &papszCreateOptions, 
                                       eOutputType, &hUniqueTransformArg,
                                       &hUniqueSrcDS, bSetColorInterpretation,hSrc,xsize, ysize,bpp,channels,estimateSize);
}
char* getSupportInfo(char *ptrInputFile, char *ptrGDALPath, char *ptrtableName, char *formatType){
	RasterSizeEstimator ras;
	return ras.getSupportInfo(ptrInputFile,ptrGDALPath,ptrtableName,formatType);
}