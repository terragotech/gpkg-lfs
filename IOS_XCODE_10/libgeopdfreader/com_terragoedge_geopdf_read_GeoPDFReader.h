#include "config.h"
#ifndef _Included_com_terragoedge_geopdf_read_GeoPDFReader
#define _Included_com_terragoedge_geopdf_read_GeoPDFReader
#ifdef GEOPDF_IOS_BUILD
	/* For IOS geopdf_generateMBTilesFromGeoPDF is called */
	int geopdf_generateMBTilesFromGeoPDF(char *ptrScratchFolder, char *ptrFileName,char *ptrMBTileName,char *ptrGdalPath,char *ptrProgressID,char *ptrTMP, char *utid);
#else
/* For Android Calls are via JNI */
#include <jni.h>
#ifdef __cplusplus
	extern "C" {
#endif
	JNIEXPORT jlong JNICALL Java_com_terragoedge_geopdf_read_GeoPDFReader_createGeoPDFReader(JNIEnv *, jobject);
	JNIEXPORT jlong JNICALL Java_com_terragoedge_geopdf_read_GeoPDFReader_generateMBTiles(JNIEnv *, jobject, jlong, jstring, jstring,jstring,jstring,jstring,jstring);
	JNIEXPORT jlong JNICALL Java_com_terragoedge_geopdf_read_GeoPDFReader_destroyGeoPDF(JNIEnv *, jobject , jlong );
#ifdef __cplusplus
	}
#endif
#endif
/* End of header file definition */	
#endif

