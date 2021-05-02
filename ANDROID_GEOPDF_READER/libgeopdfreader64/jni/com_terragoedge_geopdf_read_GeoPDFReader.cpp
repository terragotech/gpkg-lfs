#include "GeoPDFReader.h"
#include "com_terragoedge_geopdf_read_GeoPDFReader.h"
#ifdef GEOPDF_IOS_BUILD
int geopdf_generateMBTilesFromGeoPDF(char *ptrScratchFolder ,char *ptrFileName,char *ptrMBTileName,char *ptrGdalPath,char *ptrProgressID,char *ptrTMP,char *ptrutid)
{
	int nResult = GEOMAP_UTILS_SUCCESS;
	GeoPDFReader *pGeoPDFReader = new GeoPDFReader();
	if((ptrScratchFolder != NULL ) && 
	(ptrFileName != NULL) && (ptrMBTileName != NULL) && 
	(ptrGdalPath != NULL) && (ptrProgressID != NULL) && 
	(ptrTMP != NULL) && (ptrutid != NULL) )
	{
		nResult = pGeoPDFReader->generateMBTiles(ptrScratchFolder,ptrFileName,ptrMBTileName,ptrGdalPath,ptrProgressID,ptrTMP,ptrutid);
	}
	else
	{
		nResult = GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
	}
	delete pGeoPDFReader;
	return nResult;
}
#else
/*JNIEXPORT jlong JNICALL Java_com_terragoedge_geopdf_read_GeoPDFReader_createGeoPDFReader(JNIEnv *env, jobject jobj)
{
	return (long)(new GeoPDFReader());
}*/

JNIEXPORT jlong JNICALL Java_com_terragoedge_geopdf_read_GeoPDFReader64_generateMBTiles(JNIEnv *env, jobject jobj,
jstring scratchPath,
jstring inputFile, 
jstring mbtilesFile,
jstring gdalPath,
jstring progressFile, 
jstring tmpFolder, jstring utid)
{
		long nResult = GEOMAP_UTILS_SUCCESS;
		GeoPDFReader *pGeoPDFReader = new GeoPDFReader();
		char *ptrScratchPath = NULL;
		char *ptrInputFile = NULL;
		char *ptrMbtilesFile = NULL;
		char *ptrGdalPath = NULL;
		char *ptrProgressFile = NULL;
		char *ptrtmpFolder = NULL;
        	char *ptrutid = NULL;
		
		ptrScratchPath = (char*)env->GetStringUTFChars(scratchPath,0);
		ptrInputFile = (char*)env->GetStringUTFChars(inputFile,0);
		ptrMbtilesFile = (char*)env->GetStringUTFChars(mbtilesFile,0);
		ptrGdalPath = (char*)env->GetStringUTFChars(gdalPath,0);
		ptrProgressFile = (char*)env->GetStringUTFChars(progressFile,0);
		ptrtmpFolder = (char*)env->GetStringUTFChars(tmpFolder,0);
        	ptrutid = (char*)env->GetStringUTFChars(utid,0);
    
    
    
		
		if((ptrScratchPath != NULL) &&
			(ptrInputFile != NULL) && 
			(ptrMbtilesFile != NULL) && 
			(ptrGdalPath != NULL) && 
			(ptrProgressFile != NULL) && 
			(ptrtmpFolder != NULL) && 
			(ptrutid != NULL))
		{
			/* Call the function to convert GeoPDF to MBTiles */
			nResult = pGeoPDFReader->generateMBTiles(ptrScratchPath,
								ptrInputFile,
								ptrMbtilesFile,
								ptrGdalPath,
								ptrProgressFile,
								ptrtmpFolder,
								ptrutid);
		}
		else
		{
			nResult = GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
		}
		//Releasing Resources
		if(ptrScratchPath)
		{
			env->ReleaseStringUTFChars(scratchPath,(const char*)ptrScratchPath);
		}
		if(ptrInputFile)
		{
			env->ReleaseStringUTFChars(inputFile,(const char*)ptrInputFile);
		}
		if(ptrMbtilesFile)
		{
			env->ReleaseStringUTFChars(mbtilesFile,(const char*)ptrMbtilesFile);
		}
		if(ptrGdalPath)
		{
			env->ReleaseStringUTFChars(gdalPath,(const char*)ptrGdalPath);
		}
		if(ptrProgressFile)
		{
			env->ReleaseStringUTFChars(progressFile,(const char*)ptrProgressFile);
		}
		if(ptrtmpFolder)
		{
			env->ReleaseStringUTFChars(tmpFolder,(const char*)ptrtmpFolder);
		}
        	if(ptrutid)
        	{
            		env->ReleaseStringUTFChars(utid,(const char*)ptrutid);
        	}
		delete pGeoPDFReader;
		return nResult;
}
/*JNIEXPORT jlong JNICALL Java_com_terragoedge_geopdf_read_GeoPDFReader_destroyGeoPDF(JNIEnv *env, jobject jobj, jlong ptr)
{
	int nResult = GEOMAP_UTILS_SUCCESS;
	GeoPDFReader *pGeoPDFReader = (GeoPDFReader*)(ptr);
	if(pGeoPDFReader != NULL)
	{
		delete pGeoPDFReader;
	}
	else
	{
		nResult = GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
	}
	return nResult;
}*/
#endif
