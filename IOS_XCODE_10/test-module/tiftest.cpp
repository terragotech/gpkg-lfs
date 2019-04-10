#include <stdio.h>
#include "gdal.h"
int main(int argc, char *argv[]){
    GDALDatasetH  hDataset;
    char *pszFilename = (char*)"123.tif";
    GDALAllRegister();
    hDataset = GDALOpen( pszFilename, GA_ReadOnly ); 
    if( hDataset == NULL )
    {


    }
    else
    {
	 printf(" tree of life");
    }
    return 0;
}