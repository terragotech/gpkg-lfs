//#include "stdafx.h"
#include "GeoPackageRasterReader.h"
#include "com_terragoedge_geopkg_read_GeoPackageRasterReader.h"

JNIEXPORT jlong JNICALL Java_com_terragoedge_geopkg_read_GeoPackageRasterReader_createGeoPackageRasterReader
  (JNIEnv *env, jobject jobj)
{
	return reinterpret_cast<jlong>(new GeoPackageRasterReader());
}


JNIEXPORT jint JNICALL Java_com_terragoedge_geopkg_read_GeoPackageRasterReader_openGeoPackage
  (JNIEnv *env, jobject jobj, jlong ptr, jstring fileName, jstring gdalPath)
 {
	 int nResult = 0;

	 char *ptrValue = (char*)env->GetStringUTFChars(fileName,0);
	 char *ptrGDALValue = (char*)env->GetStringUTFChars(gdalPath,0);

	 GeoPackageRasterReader *pGeoPackageRasterReader 
		 = reinterpret_cast<GeoPackageRasterReader*>(ptr);

	 if((ptrValue != NULL) && (ptrGDALValue != NULL))
	 {
		nResult = pGeoPackageRasterReader->openGeoPackage(ptrValue,ptrGDALValue);
	 }

	 if(ptrValue)
	 {
		 env->ReleaseStringUTFChars(fileName,(const char*)ptrValue);
	 }

	 if(ptrGDALValue)
	 {
		 env->ReleaseStringUTFChars(gdalPath,(const char*)ptrGDALValue);
	 }
	 return 0;
 }
JNIEXPORT jint JNICALL Java_com_terragoedge_geopkg_read_GeoPackageRasterReader_convertGeoPackage
		(JNIEnv *env, jobject jobj, jlong ptr, jstring fileName,
		 jstring mbtilesName,
		 jstring tablePath, jstring tmpPath)
{
	int nResult = 0;

	char *ptrValue = (char*)env->GetStringUTFChars(fileName,0);

	char *ptrMBValue = (char*)env->GetStringUTFChars(mbtilesName,0);

	char *ptrTableValue = (char*)env->GetStringUTFChars(tablePath,0);
	char *ptrTMPValue = (char*)env->GetStringUTFChars(tmpPath,0);


	GeoPackageRasterReader *pGeoPackageRasterReader
			= reinterpret_cast<GeoPackageRasterReader*>(ptr);

	if((ptrValue != NULL) && (ptrTableValue != NULL))
	{
		nResult = pGeoPackageRasterReader->convertToMBtiles(ptrValue,ptrMBValue, ptrTableValue, ptrTMPValue );
	}

	if(ptrValue)
	{
		env->ReleaseStringUTFChars(fileName,(const char*)ptrValue);
	}

	if(ptrTableValue)
	{
		env->ReleaseStringUTFChars(tablePath,(const char*)ptrTableValue);
	}
	if(ptrTMPValue)
	{
		env->ReleaseStringUTFChars(tmpPath,(const char*)ptrTMPValue);
	}
	if(ptrMBValue)
	{
		env->ReleaseStringUTFChars(mbtilesName,(const char*)ptrMBValue);
	}
	return nResult;
}
JNIEXPORT jstring JNICALL Java_com_terragoedge_geopkg_read_GeoPackageRasterReader_getGeoPackageRasterNameListAsJSON
  (JNIEnv *env, jobject jobj, jlong ptr)
{
	jstring jresult = 0;
	GeoPackageRasterReader *pGeoPackageRasterReader 
		 = reinterpret_cast<GeoPackageRasterReader*>(ptr);
	char *pLayerJSON = pGeoPackageRasterReader->getGeoPackageRasterNameListAsJSON();
	if(pLayerJSON)
	{
		jresult = env->NewStringUTF((const char*)pLayerJSON);
	}
	return jresult;
}

JNIEXPORT jint JNICALL Java_com_terragoedge_geopkg_read_GeoPackageRasterReader_initiateGeoPackageToMBTilesConversion
  (JNIEnv *env, jobject jobj, jlong ptr, jstring tileSourceName , jint zoomLevel,
  jint zlevel, jint quality, jint img_format, jstring MBTilesName)
{

	int nResult = 0;
	char *pTileSourceName = (char*)env->GetStringUTFChars(tileSourceName,0);
	char *pMBTileName = (char*)env->GetStringUTFChars(MBTilesName,0);
	GeoPackageRasterReader *pGeoPackageRasterReader 
		 = reinterpret_cast<GeoPackageRasterReader*>(ptr);
	
	if(img_format == 1)
	{
		nResult = pGeoPackageRasterReader->initiateGeoPackageToMBTilesConversion
			(pTileSourceName,zoomLevel,zlevel,quality,"png",pMBTileName);
	}
	else
	{
		nResult = pGeoPackageRasterReader->initiateGeoPackageToMBTilesConversion
			(pTileSourceName,zoomLevel,zlevel,quality,"jpeg",pMBTileName);
	}
	 if(pTileSourceName)
	 {
		 env->ReleaseStringUTFChars(tileSourceName,(const char*)pTileSourceName);
	 }
	 if(pMBTileName)
	 {
		 env->ReleaseStringUTFChars(MBTilesName,(const char*)pMBTileName);
	 }
	return nResult;
}

JNIEXPORT jint JNICALL Java_com_terragoedge_geopkg_read_GeoPackageRasterReader_cancelGeoPackageToMBTilesConversion
  (JNIEnv *env, jobject jobj, jlong ptr)
{
	int nResult = 0;
	GeoPackageRasterReader *pGeoPackageRasterReader 
		 = reinterpret_cast<GeoPackageRasterReader*>(ptr);
	nResult = pGeoPackageRasterReader->cancelGeoPackageToMBTilesConversion();
	return nResult;
}

JNIEXPORT jdouble JNICALL Java_com_terragoedge_geopkg_read_GeoPackageRasterReader_getGeoPackageToMBTileConversionStatus
  (JNIEnv *, jobject jobj, jlong ptr)
{
	double dResult = 0;
	GeoPackageRasterReader *pGeoPackageRasterReader 
		 = reinterpret_cast<GeoPackageRasterReader*>(ptr);
	dResult = pGeoPackageRasterReader->getGeoPackageToMBTileConversionStatus();
	return dResult;
}
JNIEXPORT jint JNICALL Java_com_terragoedge_geopkg_read_GeoPackageRasterReader_getGeoPackageRasterReaderState
  (JNIEnv *env, jobject jobj, jlong ptr)
{
	int nResult = 0;
	GeoPackageRasterReader *pGeoPackageRasterReader 
		 = reinterpret_cast<GeoPackageRasterReader*>(ptr);
	nResult = pGeoPackageRasterReader->getGeoPackageRasterReaderState();
	return nResult;
}

JNIEXPORT jint JNICALL Java_com_terragoedge_geopkg_read_GeoPackageRasterReader_closeGeoPackage
  (JNIEnv *env, jobject jobj, jlong ptr)
{
	int nResult = 0;
	GeoPackageRasterReader *pGeoPackageRasterReader 
		 = reinterpret_cast<GeoPackageRasterReader*>(ptr);
	printf("1GeoP %x",pGeoPackageRasterReader);
	nResult = pGeoPackageRasterReader->closeGeoPackage();

	return nResult;
}
JNIEXPORT jint JNICALL Java_com_terragoedge_geopkg_read_GeoPackageRasterReader_destroyGeoPackageRasterReader
  (JNIEnv *env, jobject jobj, jlong ptr)
{
	int nResult = 0;
	GeoPackageRasterReader *pGeoPackageRasterReader 
		 = reinterpret_cast<GeoPackageRasterReader*>(ptr);
	printf("GeoP %x",pGeoPackageRasterReader);
	delete pGeoPackageRasterReader;
	return nResult;
}