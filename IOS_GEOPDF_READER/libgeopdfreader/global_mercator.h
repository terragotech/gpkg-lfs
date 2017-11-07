#ifndef _GLOBAL_MERCATOR_H_
#define _GLOBAL_MERCATOR_H_
struct global_mercator
{
	double PI;
	double tileSize;
	double initialResolution;
	double originShift;
	int MAXZOOMLEVEL;
};
int geopdf_init_global_mercator(struct global_mercator *gm);
void geopdf_LatLonToMeters(struct global_mercator *gm, double lat, double lon, double *mx, double *my);
void geopdf_MetersToLatLon(struct global_mercator *gm,double mx, double my,double *lat, double *lon);
void geopdf_getResoultion(struct global_mercator *gm, double zoom, double *resolution_value);
void geopdf_PixelToMeters(struct global_mercator *gm, double px, double py, double zoom,double *mx,double *my);
void geopdf_MetersToPixel(struct global_mercator *gm, double mx, double my, double zoom, double *px, double *py);
void geopdf_pixelsToTiles(struct global_mercator *gm, double px, double py, int *tx, int *ty);
void geopdf_PixelToRaster(struct global_mercator *gm,double px, double py,double zoom, double *rpx, double *rpy);
void geopdf_MetersToTile(struct global_mercator *gm,double mx, double my, double zoom, int *rpx, int *rpy);
void geopdf_TileBounds(struct global_mercator *gm, int tx,int ty, double zoom, double *minx, double *miny, double *maxx, double *maxy);
void geopdf_TileLatLonBounds(struct global_mercator *gm, int tx, int ty, double zoom, double *minLat, double *minLon, double *maxLat, double *maxLon);
int geopdf_ZoomForPixelSize(struct global_mercator *gm,double pixelSize );
#endif