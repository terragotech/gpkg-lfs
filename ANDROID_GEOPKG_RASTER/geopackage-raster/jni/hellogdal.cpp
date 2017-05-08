//
// Created by Ganesan on 29/06/16.
//

#include <jni.h>
#include <ogr_api.h>
#include "ogrsf_frmts.h"
#include "ogr_p.h"


#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT jstring
JNICALL Java_org_gdal_HelloGdal_stringFromGDAL(JNIEnv*env, jobject thiz);

JNIEXPORT jstring
JNICALL Java_org_gdal_HelloGdal_openGeoPackageFile(JNIEnv* env, jobject thiz, jstring fileName);
#ifdef __cplusplus
}
#endif

JNIEXPORT jstring
JNICALL Java_org_gdal_HelloGdal_openGeoPackageFile(JNIEnv* env, jobject thiz, jstring fileName)
{
    char *ptrValue = (char*)env->GetStringUTFChars(fileName,0);
    OGRRegisterAll();
    GDALDatasetH hDS = GDALOpenEx( ptrValue,
                      GDAL_OF_READONLY | GDAL_OF_VECTOR | GDAL_OF_RASTER, NULL, NULL, NULL );
    char result[5000];
    if(hDS != NULL)
    {
        strcpy(result,"File open was SUCCESS");
        GDALClose(hDS);
    }
    else
    {
        strcpy(result,"Failed to Open file");
    }


    if(ptrValue)
    {
        env->ReleaseStringUTFChars(fileName,(const char*)ptrValue);
    }
    return env->NewStringUTF(result);
}
JNIEXPORT jstring
JNICALL Java_org_gdal_HelloGdal_stringFromGDAL(JNIEnv* env, jobject thiz)
{
    OGRRegisterAll();
   // string drvName;
    char driverName[10000];
    driverName[0] = 0;
    int driverCount = OGRGetDriverCount();
    if(driverCount > 0)
    {
        for(int i=0;i<driverCount;i++) {
            strcat(driverName, OGR_Dr_GetName(OGRGetDriver(i)));
            strcat(driverName, ",");
        }
    }
    else
    {
        strcpy(driverName,"from GDAL");
    }
    return env->NewStringUTF(driverName);
    //return env->NewStringUTF(drvName.c_str());
}