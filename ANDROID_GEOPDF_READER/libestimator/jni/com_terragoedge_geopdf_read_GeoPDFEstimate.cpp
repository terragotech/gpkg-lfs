#include "RasterSizeEstimator.h"
#include "com_terragoedge_geopdf_read_GeoPDFEstimate.h"
#ifndef GEOPDF_IOS_BUILD

JNIEXPORT jlong JNICALL Java_com_terragoedge_geopdf_read_GeoPDFEstimate_createGeoPDFEstimate(JNIEnv *env, jobject jobj)
{
	return reinterpret_cast<jlong>(new RasterSizeEstimator());
}
JNIEXPORT jstring JNICALL Java_com_terragoedge_geopdf_read_GeoPDFEstimate_getSupportInfo(JNIEnv *env, jobject jobj, jlong ptr, jstring strInputFile, jstring strGDALPath,jstring strTableName,jstring strFormatType)
{
	RasterSizeEstimator *pRasterSizeEstimator = reinterpret_cast<RasterSizeEstimator*>(ptr);
	char *ptrInputFile = NULL;
	char *ptrGDALPath = NULL;
	char *ptrtableName = NULL;
	char *ptrformatType = NULL;

	ptrInputFile = (char*)env->GetStringUTFChars(strInputFile,0);
	ptrGDALPath = (char*)env->GetStringUTFChars(strGDALPath,0);	
	ptrtableName = (char*)env->GetStringUTFChars(strTableName,0);
	ptrformatType = (char*)env->GetStringUTFChars(strFormatType,0);
	jstring jresult = 0 ;
	char *jsonResult = pRasterSizeEstimator->getSupportInfo(ptrInputFile,ptrGDALPath,ptrtableName,ptrformatType);
	if(jsonResult != NULL)
	{
		 JNIEnv *p = env;
		jresult = p->NewStringUTF((const char *)jsonResult);
		free(jsonResult);
	}
	//Clean up of Resources
	if(ptrInputFile)
		{
			env->ReleaseStringUTFChars(strInputFile,(const char*)ptrInputFile);
		}
	if(ptrGDALPath)
		{
			env->ReleaseStringUTFChars(strGDALPath,(const char*)ptrGDALPath);
		}
	if(ptrtableName)
		{
			env->ReleaseStringUTFChars(strTableName,(const char*)ptrtableName);
		}
	if(ptrformatType)
		{
			env->ReleaseStringUTFChars(strFormatType,(const char*)ptrformatType);
		}
	return jresult;
}
JNIEXPORT jlong JNICALL Java_com_terragoedge_geopdf_read_GeoPDFEstimate_destroyGeoPDFEstimate(JNIEnv *env, jobject jobj, jlong ptr)
{
	RasterSizeEstimator *pRasterSizeEstimator = reinterpret_cast<RasterSizeEstimator*>(ptr);
	if(pRasterSizeEstimator != NULL)
	{
		delete pRasterSizeEstimator;
	}
}
#endif
