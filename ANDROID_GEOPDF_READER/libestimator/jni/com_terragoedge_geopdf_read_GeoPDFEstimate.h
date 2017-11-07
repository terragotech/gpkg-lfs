#ifndef _Included_com_terragoedge_geopdf_read_GeoPDFEstimate
#define _Included_com_terragoedge_geopdf_read_GeoPDFEstimate
#ifdef GEOPDF_IOS_BUILD
	
#else
/* For Android Calls are via JNI */
#include <jni.h>
#ifdef __cplusplus
	extern "C" {
#endif
	//char *ptrInputFile, char *ptrGDALPath, char *ptrtableName, char *formatType
	JNIEXPORT jlong JNICALL Java_com_terragoedge_geopdf_read_GeoPDFEstimate_createGeoPDFEstimate(JNIEnv *, jobject);
	JNIEXPORT jstring JNICALL Java_com_terragoedge_geopdf_read_GeoPDFEstimate_getSupportInfo(JNIEnv *, jobject, jlong, jstring, jstring,jstring,jstring);
	JNIEXPORT jlong JNICALL Java_com_terragoedge_geopdf_read_GeoPDFEstimate_destroyGeoPDFEstimate(JNIEnv *, jobject , jlong );
#ifdef __cplusplus
	}
#endif
#endif
/* End of header file definition */	
#endif

