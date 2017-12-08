#include "GeoPDFReader.h"

//Generate MBTiles
/* Generate MBTiles
* This function converts the supplied GeoPDF file to MBTiles
* Step 1: Convert the GeoPDF to GeoTIFF with GDAL (integrated with PDFium)
* Step 2: Convert the Created GeoTIFF to MBTiles 
*/
int geopdf_gwarp2( int argc, char ** argv);
char* GeoPDFReader::hasSubSets(char *pInputFile, int *result)
{
	printf("GeoPDFReader::hasSubSets Called\n");
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
				printf("GeoPDFReader::hasSubSets Dataset not NULL\n");

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
	if(pSelectedDataSet != NULL)
	{
		printf("GeoPDFReader::hasSubSets Dataset  [%s] selected \n",pSelectedDataSet );

	}
	else
	{
		printf("GeoPDFReader::hasSubSets Dataset  [NULL] selected \n");
	}
	return pSelectedDataSet;
}
int GeoPDFReader::generateMBTiles(char *ptrScratchFolder,char *ptrFileName,char *ptrMBTileName,char *ptrGdalPath,char *ptrProgressID,char *ptrTMP, char *ptrutid)
{
	int bReductionRequired = 1;
	int nResult = GEOPDF_READER_SUCCESS;
	/****** PDFs of large Resolution has to converted into small */
	GDALAllRegister();
	CPLSetConfigOption("GDAL_DATA",ptrGdalPath);
	printf("GDAL Config path set \n");

	char *pSubDS = NULL;
	int nPResult = 0;
	pSubDS = hasSubSets(ptrFileName,&nPResult);
	printf("End of checking subsets \n");
	GDALDatasetH hDataset = NULL;
	if(pSubDS != NULL)
	{
		hDataset = GDALOpenEx( pSubDS, 
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
		GDALClose(hDataset);
	}

	string inputRasterFile;
	string progressFile;
	progressFile.clear();
	progressFile.append(ptrScratchFolder);
	progressFile.append("/progress");
	progressFile.append("_");
	progressFile.append(ptrProgressID);
	progressFile.append(".txt");
	printf("progressFile file name: [%s]\n", progressFile.c_str());

	string termFile;
	termFile.clear();
	termFile.append(ptrScratchFolder);
	termFile.append("/log");
	termFile.append("_");
	termFile.append(ptrProgressID);
	termFile.append(".ter");

	string strDumpFile;
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

	string logFile;
	logFile.clear();
	logFile.append(ptrScratchFolder);
	logFile.append("/log");
	logFile.append("_");
	logFile.append(ptrProgressID);
	logFile.append(".log");


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
		


		
		strcpy(argv1[0],"gwarp");
		if(pSubDS != NULL)
		{
			printf("Using subsets ... \n");

			strcpy(argv1[1],pSubDS );
		}
		else
		{
			printf("NOT using subsets ... \n");
	
			strcpy(argv1[1],ptrFileName);
		}
		strcpy(argv1[2],tifFile.c_str());
		setenv("GPDF_DUMPFILE",(char*)strDumpFile.c_str(),1);
		setenv("GPDF_PROGFILE",(char*)progressFile.c_str(),1);
		setenv("GPDF_TERMFILE",(char*)termFile.c_str(),1);
        setenv("GPDF_RESULT","0",1);
        setenv("GPDF_LOGFILE",(char*)logFile.c_str(),1);
		printf("command line %s %s %s \n",argv1[0],argv1[1],argv1[2]);

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
	
	 int bRastetrization = 0;
	 char *ptrHWarpResult = getenv("GPDF_RESULT"); 
	 if(ptrHWarpResult != NULL)
	 {
		 if(strcmp(ptrHWarpResult,"0") == 0)
		 {
			 //Success
			 bRastetrization = 1;
		 }
		 else if(strcmp(ptrHWarpResult,"-1000") == 0)
		 {
			geopdf_create_status_file_failed((char*)progressFile.c_str(),"Memory allocation Failed"); 
			nResult = GEOPDF_READER_WARP_MEM_ALLOC_FAILED;
		 }
		 else if(strcmp(ptrHWarpResult,"-1001") == 0)
		 {
			geopdf_create_status_file_term((char*)progressFile.c_str(),"termination requested");
			 nResult = GEOMAP_UTILS_TERM_REQUESTED;
		 }
		 else if(strcmp(ptrHWarpResult,"-1002") == 0)
		 {
			geopdf_create_status_file_failed((char*)progressFile.c_str(),"R/W Access failed");
			nResult = GEOPDF_READER_RW_ERROR;
		 }
		 else if(strcmp(ptrHWarpResult,"-1003") == 0)
		 {
			 geopdf_create_status_file_failed((char*)progressFile.c_str(),"R/W Access failed");
			 nResult = GEOPDF_READER_RW_ERROR;
		 }
		 else if(strcmp(ptrHWarpResult,"-1004") == 0)
		 {
			 geopdf_create_status_file_failed((char*)progressFile.c_str(),"R/W Access failed");
			 nResult = GEOPDF_READER_RW_ERROR;
		 }
	 }
	 
	if(bRastetrization == 1)
	{
        /******** Step 1: GeoPDF to GeoTIFF conversion starts here ********/
	 
	
	
        //Now config GDAL for gdal-data files used for reprojection
	

        char **argv = (char **)malloc(sizeof(char *) * 11);
        if(argv != NULL)
        {
            for(int i=0;i<11;i++)
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
            strcpy(argv[1],"-wm");
            strcpy(argv[2],"2");
            strcpy(argv[3],"-of");
            strcpy(argv[4],"GTiff");
            strcpy(argv[5],"-t_srs");
            strcpy(argv[6],"EPSG:3857");
            if(bReductionRequired  == 1)
            {
                printf("Resize required path \n");
                strcpy(argv[7],(char*)inputRasterFile.c_str());

            }
            else
            {
						printf("NO Resize required path \n");
                if(pSubDS != NULL)
                {
                    printf("use subset \n");

                    strcpy(argv[7],pSubDS );

                }
                else
                {
                    printf("not use subset \n");

                    strcpy(argv[7],ptrFileName);
                }
            }
		
            strcpy(argv[8],tifFile.c_str());
            printf("tifFile file name: [%s]\n", tifFile.c_str());


            //Remove the GeoTIFF file If already exists
            remove(tifFile.c_str());

		

	
            printf("logFile file name: [%s]\n", logFile.c_str());


		

            printf("termFile file name: [%s]\n", termFile.c_str());

	
            int wresult = 0;
            int mresult = 0;
            geopdf_create_status_file_progress((char*)progressFile.c_str(),0.40f);
            geopdf_write_log((char*)logFile.c_str(),"INFO:Entering Warp module");
            /******** Converting GeoPDF to GeoTIFF ********/
            wresult = geopdf_gwarp(9,argv,(char*)progressFile.c_str(),(char*)termFile.c_str(),(char*)logFile.c_str());
            /******** End of Converting GeoPDF to GeoTIFF call ********/
            
            geopdf_write_log((char*)logFile.c_str(),"INFO:Exiting Warp code");

            if(wresult == 0)
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
                    if(mresult == 0)
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
				remove(tifFile.c_str());
                geopdf_write_log((char*)logFile.c_str(),"warp: failed for reason");
                geopdf_create_status_file_failed((char*)progressFile.c_str(),"warp Failed");
                nResult = GEOMAP_UTILS_WARP_FAILED;
            }
            for(int i=0;i<11;i++) {
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
    }
    else
    {
        remove(tifFile.c_str());
    }
	
    if(pSubDS != NULL)
    {
		free(pSubDS);
	}
	if(inputRasterFile.length() > 0)
	{
			remove(inputRasterFile.c_str());		
	}
	return nResult;
}


