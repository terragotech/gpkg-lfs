#ifndef _GEOPDFREADER_H_
#include "config.h"
#define _GEOPDFREADER_H_
#define GEOPDF_READER_SUCCESS				0
#define GEOPDF_READER_WARP_BD_PARAM			-1010
#define GEOPDF_READER_WARP_MEM_ALLOC_FAILED		-1011
#define GEOPDF_READER_WARP_BD_DS			-1012
#define GEOPDF_READER_WARP_ODS_EXISTS			-1013
#define GEOPDF_READER_WARP_WRP_OPERROR			-1014
#define GEOPDF_READER_TILE_GEN_ERROR			-1015
#define GEOPDF_READER_RW_ERROR				-1016
#include <stdio.h>
#include "gdal.h"
#include "ogrsf_frmts.h"
#include "ogr_p.h"
#include "gdalwarp_bin.h"
#include "logger.h"
#include "utils.h"
#include "main.h"

/* Class to Access GeoPDF/GeoSpatial file via PDFium intergrated into GDAL */
class GeoPDFReader
{
	private:
	char *hasSubSets(char *pInputFile, int *result);
	public:
	/* Method to generate MBTiles from GeoPDF */
	/*
	* ptrScratchFolder - Folder to have the GeoTIFF and logs
	* ptrInputFile - GeoPDF file with absolute path
	* ptrMbtilesFile - MBTiles file with absolute path
	* ptrGdalPath - GDAL CSV files with absolute path
	* ptrProgressID - unique ID for progress
	* ptrtmpFolder - Temp folder with mbtiles created at native device code
	  inside for storing tiles and later removing them in native Device code
	* ptrutid	- Unique ID for tiles 
	*/
	int generateMBTiles(char *ptrScratchFolder,
	char *ptrInputFile,
	char *ptrMbtilesFile,
	char *ptrGdalPath,
	char *ptrProgressID,
	char *ptrtmpFolder,
	char *ptrutid);
	int checkOtherMercator(GDALDatasetH hSrcDS);
	
};
#endif
