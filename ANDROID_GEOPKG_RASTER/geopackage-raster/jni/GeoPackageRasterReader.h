#include "config.h"
#include <iostream>
#include <vector>
#include "ogrsf_frmts.h"
#include "ogr_p.h"
//#include "gdal_utils_priv.h"
#include "gdalwarp_bin.h"

using namespace std;
#ifndef GEOPACKAGE_RASTER_READER_H_
#define GEOPACKAGE_RASTER_READER_H_

//GeoPackageRasterReader Constants

enum GeoPackageRasterReaderConst
{
	GPKG_RASTER_READ_BAD_INPUT_PARAM = -5000,
	GPKG_RASTER_READ_OPEN_FAILED = -5001,
	GPKG_RASTER_READ_NOT_OPENED = -5002,
	GPKG_RASTER_READ_TILE_NOT_FOUND = -5003,
	GPKG_RASTER_READ_SUBDATASET_OPEN_FAILED = -5004,
	GPKG_RASTER_READ_NOT_IN_PROGRESS = -5005,
	GPKG_RASTER_READ_SUCCESS = 0,
	GPKG_RASTER_READ_STATE_DEFAULT = 1,
	GPKG_RASTER_READ_STATE_OPEN_SUCCESS = 2,
	GPKG_RASTER_READ_STATE_BASE_TILE_GEN = 3,
	GPKG_RASTER_READ_STATE_OVERLAY_TILE_GEN = 4,
	GPKG_RASTER_READ_STATE_MBTILES_GEN_COMPLETE = 5,
	GPKG_RASTER_READ_STATE_CONVERSTION_INIT = 6,
	GPKG_RASTER_READ_STATE_CANCELLED = 7
};

/* Class GeoPackageRasterReader
 * GeoPackageRasterReader facilitates the conversion of the specified tile source
 * to the MBTiles with the requested MBTiles in PNG/JPEG format and zoom levels
 */

class GeoPackageRasterReader
{
private:
	int nGeoPackageReaderState;									//Holds the state of the GeoPackage
	string logFileObj;										//log file
	
	GDALDatasetH hDS;											//Holds the pointer to DataSet
	char *ptrJSONResult;										//Holds a tiles source in a JSON format

	bool isValidTileSourceName(char *ptrSDSName);				//Check if the specified tile source is valid or not	
	bool hasSubDataSets();										//Check if they have datasets
	bool bLogEnabled;											//Holds the state of the log file generated

	string inputGPKGFileName;									//Holds the name of the input GeoPackage file
	int getBounds(double *pLat, double *pLong);
	GDALDatasetH hDSBounds;
	void OpenTileSetForBounds(char *tileName);
	string strLatLongBounds;
public:
	GeoPackageRasterReader();									//Default constructor, set the default values
	int openGeoPackage(char *ptrFileName, char *ptrgdal);						//Opens the GeoPackage file for processing
	int convertToMBtiles(char *ptrFileName, char *ptrMBTileName, char *ptrTableName, char *ptrTMP);
	char *getGeoPackageRasterNameListAsJSON();					//Return a JSON containing a list of tile sources

	int initiateGeoPackageToMBTilesConversion
		(char *ptrTileName, 
		int zoomLevels,
		int zlevel,
		int quality,
		char *ptrImgFormat,
		char *ptrMBTilesName);									//Called for creating a tile source to mbtiles

	int cancelGeoPackageToMBTilesConversion();					//Cancells a current conversion process
	double getGeoPackageToMBTileConversionStatus
		();									//Gets hte MBTiles conversion process
	int getGeoPackageRasterReaderState();
	int closeGeoPackage();										//Closes the GeoPackag file and associate handles
	void setGDALDATASettings(char *ptrGDALPATH);
	~GeoPackageRasterReader();									//Destructor to close all the resources
};
#endif