#ifndef _RasterSizeEstimator_H_
#define _RasterSizeEstimator_H_
#include "gdal.h"
#include "gdal_alg.h"
#include "ogr_srs_api.h"
#include "cpl_string.h"
#include "cpl_conv.h"
#include "cpl_string.h"
#include "cpl_multiproc.h"
#include <string.h>
using namespace std;
#define EST_FORMAT_GEOPDF				1000
#define EST_FORMAT_GPKG					1001
#define EST_ERROR_NO_ERROR				0
#define EST_ERROR_UNSABLE				1
#define EST_ERROR_NO_GEOREGISTRATION	2
#define EST_ERROR_UNABLE_TO_PROJECT		4
#define EST_ERROR_NO_RASTER				8
#define EST_ERROR_BAD_INPUT				16
#define EST_ERROR_MEM_ALLOC_FAILED		32
#define EST_ERROR_GDAL_DATA_UNAVAILABLE	64
#define EST_ERROR_REPROJ_FAILED			128
#define EST_ERROR_WARP_EST_FAILED		256
#define EST_ERROR_INVWARP_EST_FAILED	512
char* getSupportInfo(char *ptrInputFile, char *ptrGDALPath, char *tableName, char *formatType);
static int generate_projection(GDALDatasetH hSrc, long *xsize, long *ysize, int *bpp, int *channels,long *estimateSize);
static char *SanitizeSRS( const char *pszUserInput);
static int  GDALWarpCreateOutput(const char *pszFormat,
							char **papszTO,
							char ***ppapszCreateOptions,
							GDALDataType eDT,
							void ** phTransformArg,
							GDALDatasetH* phSrcDS,
							int bSetColorInterpretation,
							GDALDatasetH hSrcDS,long *xsize, long *ysize, 
							int *bpp, int *channels,long *estimateSize);
class RasterSizeEstimator
{
private:
	char* hasSubSets(char *pInputFile, int *result);
public:
	RasterSizeEstimator(){
	}
	char* getSupportInfo(char *ptrInputFile,char *ptrGDALPath,char *ptrtableName, char *formatType);
};

#endif
