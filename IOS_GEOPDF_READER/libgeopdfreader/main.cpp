#include "config.h"
#include "logger.h"
#include "utils.h"
#include "global_mercator.h"
#include "gdal_to_tiles.h"
#include "main.h"
#define ANDROID_BUILD
int geopdf_convert_mbtiles(char *file_name,
				   char *mbtile_file_name,
				   char *zoom_levels,
				   char *image_type,
				   char *zlevel,
				   char *quality,
				   char *process_id,
					char *tmpPath, char *progfile,char *pLogFile,char *pTermFile,char *pUtid)
{
	 
	struct gdal_tiles gt;
	struct global_mercator gm;
	
	
	if((file_name != NULL) || (mbtile_file_name != NULL) || (image_type != NULL) || (zlevel != NULL) || (quality != NULL) ){
		int func_result = 0;
		geopdf_init_global_mercator(&gm);
		geopdf_init_gdal_tiles_gtt(&gt,tmpPath,pUtid);

		gt.process_id = (char*)malloc(strlen(progfile)+1);
		if(gt.process_id == NULL)
		{
			geopdf_create_status_file_failed(progfile,"Memory allocation failed:progress file");
			return MBGEN_ERROR_MEMMORY_ALLOCATION_FAILED;
		}
		gt.termFile = (char*)malloc(strlen(pTermFile)+1);
		if(gt.termFile == NULL)
		{
			geopdf_create_status_file_failed(progfile,"Memory allocation failed:term file");
			return MBGEN_ERROR_MEMMORY_ALLOCATION_FAILED;
		}
		strcpy(gt.process_id,progfile);
		strcpy(gt.termFile,pTermFile);
		string objLogFileName;
		objLogFileName.clear();
		objLogFileName.append(pLogFile);

//Set the tile format
if(!( ( strcmp(image_type,"jpeg") == 0 ) || ( strcmp(image_type,"png") == 0 )))
{
    printf("\nBad image type parameter");
    geopdf_create_status_file_failed(gt.process_id,"Bad image type parameter");
	return (MBGEN_BAD_INPUT_PARAMETERS);

}
if(!((strlen(zlevel) == 1) && ((atoi(zlevel) >= 1 ) && (atoi(zlevel) <= 9))))
{
    printf("\nBad ZLEVEL parameter");
    geopdf_create_status_file_failed(gt.process_id,"Bad zlevel parameter");
    return (MBGEN_BAD_INPUT_PARAMETERS);

}
if(!( ( (strlen(quality) > 1) || (strlen(quality) < 4) ) && ( (atoi(quality) >= 10 ) && ( atoi(quality) <= 100 ) ) ) )
{
    printf("\nBad Quality parameter");
    geopdf_create_status_file_failed(gt.process_id,"Bad quality parameter");
    return (MBGEN_BAD_INPUT_PARAMETERS);
}
strcpy(gt.image_type,image_type);
strcpy(gt.ZLEVEL,zlevel);
strcpy(gt.QUALITY,quality);

geopdf_write_log((char*)objLogFileName.c_str(),"INFO:Assiging input file name");
func_result = geopdf_set_input_filename_gtt(&gt,file_name);
switch(func_result)
{
    case MBGEN_BAD_INPUT_PARAMETERS:
    {
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:conver_mbtiles,Bad Input parameters");
        geopdf_create_status_file_failed(gt.process_id,"Bad Input parameters");
        return (MBGEN_BAD_INPUT_PARAMETERS);
    }
    break;
    case MBGEN_ERROR_MEMMORY_ALLOCATION_FAILED:
    {
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:conver_mbtiles,Memory allocation [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"Insufficient Memory");
        return (MBGEN_ERROR_MEMMORY_ALLOCATION_FAILED);
    }
    break;
}
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:Assiging input file name complete");
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:Assiging MBTiles file name");
func_result = geopdf_set_mbtiles_name_gtt(&gt,mbtile_file_name);
switch(func_result)
{
    case MBGEN_BAD_INPUT_PARAMETERS:
    {
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:conver_mbtiles,set_mbtiles_name_gtt, Bad Input parameters");
        geopdf_create_status_file_failed(gt.process_id,"Bad Input parameters");
         return (MBGEN_BAD_INPUT_PARAMETERS);
    }
    break;
    case MBGEN_ERROR_MEMMORY_ALLOCATION_FAILED:
    {
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:conver_mbtiles,set_mbtiles_name_gtt,Memory allocation [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"Insufficient Memory");
        return (MBGEN_ERROR_MEMMORY_ALLOCATION_FAILED);
    }
    break;
}
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:Assiging MBTiles file name complete");
if(strlen(zoom_levels) != 0 ){
    gt.zoom_levels = atoi(zoom_levels);
}
else
{
    gt.zoom_levels = -1;
}

geopdf_write_log((char*)objLogFileName.c_str(),"Start Processing");
func_result = geopdf_open_input_gtt(&gt,&gm);
switch(func_result)
{
case MBGEN_ERROR_MEM_DRV_LOAD_FAILED:
    {
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, open_input_gtt, GDAL Memory driver [FAILED] to load");
        geopdf_create_status_file_failed(gt.process_id,"Memory Driver failed");
        geopdf_remove_resources_gtt(&gt);
        return (MBGEN_ERROR_MEM_DRV_LOAD_FAILED);
    }
    break;
case MBGEN_ERROR_PNG_DRV_LOAD_FAILED:
    {
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, open_input_gtt, GDAL PNG driver [FAILED] to load");
        geopdf_create_status_file_failed(gt.process_id,"PNG Driver failed");
        geopdf_remove_resources_gtt(&gt);
        return (MBGEN_ERROR_PNG_DRV_LOAD_FAILED);
    }
    break;
case MBGEN_ERROR_JPG_DRV_LOAD_FAILED:
{
    geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, open_input_gtt, GDAL JPEG driver [FAILED] to load");
    geopdf_create_status_file_failed(gt.process_id,"JPEG Driver failed");
    geopdf_remove_resources_gtt(&gt);
    return (MBGEN_ERROR_JPG_DRV_LOAD_FAILED);
}
break;
case MBGEN_ERROR_NO_RASTERS:
    {
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, open_input_gtt, No Image Raster found");
        geopdf_create_status_file_failed(gt.process_id,"No Rasters found");
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_ERROR_NO_RASTERS);
    }
    break;
case MBGEN_ERROR_CANNOT_PROCESS_FILE:
    {
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, open_input_gtt, GDAL failed to Open the File");
        geopdf_create_status_file_failed(gt.process_id,gt.input_filename);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_ERROR_CANNOT_PROCESS_FILE);
    }
    break;
}
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:Opening input file complete");
geopdf_generate_metadata_gtt(&gt,&gm);
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:generating metadata complete");
geopdf_create_status_file_progress(gt.process_id,0.0);

// Opening the MBTiles

func_result = geopdf_open_mbtiles_gtt(&gt);
if(func_result == MBGEN_ERROR_SQLITE_OPEN_FAILED)
{
    //TODO:
	geopdf_write_log((char*)objLogFileName.c_str(),"@@@");
	geopdf_write_log((char*)objLogFileName.c_str(),gt.mbtiles_file_name);
    geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, open_mbtiles_gtt, Opening MBTiles [FAILED]");
    geopdf_create_status_file_failed(gt.process_id,"Opening MBTiles failed");
    geopdf_remove_resources_gtt(&gt);
    return(MBGEN_ERROR_SQLITE_OPEN_FAILED);
}
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:open_mbtiles complete");
// Creating MBTiles

func_result = geopdf_create_table_mbtiles_gtt(&gt);
if(func_result == MBGEN_ERROR_CREATE_TABLE_FAILED)
{
    geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, create_table_mbtiles_gtt, create table [FAILED]");
    geopdf_create_status_file_failed(gt.process_id,"Creating Tables in MBTiles failed");
    geopdf_remove_resources_gtt(&gt);
    geopdf_close_mbtiles_gtt(&gt);
    return(MBGEN_ERROR_CREATE_TABLE_FAILED);
}
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:create tables in mbtiles complete");
// Insert Metadata into MBTiles
func_result = geopdf_insert_metadata_mbtiles_gtt(&gt);
if(func_result ==  MBGEN_ERROR_INSERT_ROW_FAILED)
{
    geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, insert_metadata_mbtiles_gtt, insert metadata rows [FAILED]");
    geopdf_create_status_file_failed(gt.process_id,"Inserting Metadata in MBTiles failed");
    geopdf_close_mbtiles_gtt(&gt);
    geopdf_remove_resources_gtt(&gt);
    return(MBGEN_ERROR_INSERT_ROW_FAILED);

}
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:insert metadata into mbtiles complete");
printf("\n");
printf("0...");
// Generate Base tiles
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:Generating base Tiles started");
func_result = geopdf_generate_base_tiles_gtt(&gt,&gm);
switch(func_result)
{
    case GEOMAP_UTILS_TERM_REQUESTED:
    {
        printf("ERROR:convert_mbtiles, generate_base_tiles_gtt, termination requested\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, generate_base_tiles_gtt, termination requested\n");
        geopdf_create_status_file_term(gt.process_id,"generate_base_tiles_gtt:termination requested");
        remove(pTermFile);
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return (GEOMAP_UTILS_TERM_REQUESTED);
    }
    break;
    case MBGEN_FILE_TILE_NOT_FOUND:
    {
        printf("ERROR:convert_mbtiles, generate_base_tiles_gtt, tile not found in file system\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, generate_base_tiles_gtt, tile not found in file system");
        geopdf_create_status_file_failed(gt.process_id,"generate_base_tiles_gtt:tile not found in file system");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return (MBGEN_FILE_TILE_NOT_FOUND);

    }
    break;
    case MBGEN_FILE_IO_FAILED:
    {
        printf("ERROR:convert_mbtiles, generate_base_tiles_gtt, File I/O [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, generate_base_tiles_gtt, File I/O [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_base_tiles_gtt:File I/O Error");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return (MBGEN_FILE_IO_FAILED);
    }
    break;
    case MBGEN_ERROR_MEMMORY_ALLOCATION_FAILED:
    {
        printf("ERROR:convert_mbtiles, generate_base_tiles_gtt, Memory allocation [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, generate_base_tiles_gtt, Memory allocation [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_base_tiles_gtt:Insufficient Memory");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return (MBGEN_ERROR_MEMMORY_ALLOCATION_FAILED);
    }
    break;
    case MBGEN_FILE_OPEN_FAILED:
    {
        printf("ERROR:convert_mbtiles, generate_base_tiles_gtt, File open failed [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, generate_base_tiles_gtt, File open failed [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_base_tiles_gtt:File Open failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return (MBGEN_FILE_OPEN_FAILED);
    }
    break;
    case MBGEN_ERROR_INSERT_ROW_FAILED:
    {
        printf("ERROR:convert_mbtiles, generate_base_tiles_gtt, Insert base tile [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, generate_base_tiles_gtt, Insert base tile [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_base_tiles_gtt:write tile failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return (MBGEN_ERROR_INSERT_ROW_FAILED);
    }
    break;
    case MBGEN_ERROR_PNG_CREATE_FAILED:
    {
        printf("ERROR:convert_mbtiles, generate_base_tiles_gtt, create PNG file [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, generate_base_tiles_gtt, create PNG file [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_base_tiles_gtt:PNG creation failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return (MBGEN_ERROR_PNG_CREATE_FAILED);
    }
    break;
    case MBGEN_ERROR_JPEG_CREATE_FAILED:
    {
        printf("ERROR:convert_mbtiles, generate_base_tiles_gtt, create JPEG file [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, generate_base_tiles_gtt, create JPEG file [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_base_tiles_gtt:JPEG creation failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return (MBGEN_ERROR_JPEG_CREATE_FAILED);
    }
    break;
    case MBGEN_ERROR_MEM_CREATE_FAILED:
    {
        printf("ERROR:convert_mbtiles, generate_base_tiles_gtt, Memory Dataset creation [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, generate_base_tiles_gtt, Memory Dataset creation [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_base_tiles_gtt:MEM buffer creation failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return (MBGEN_ERROR_MEM_CREATE_FAILED);
    }
    break;
    case MBGEN_ERROR_WDS_CREATE_FAILED:
    {
        printf("ERROR:convert_mbtiles, generate_base_tiles_gtt, Memory Dataset creation [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles, generate_base_tiles_gtt, write buffer creation [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_base_tiles_gtt:write data buffer creation failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_ERROR_WDS_CREATE_FAILED);
    }
    break;
}//End of switch
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:Generating base Tiles complete");
//Now Removing the Resourse of the Base tile
GDALClose(gt.in_ds);
gt.in_ds = NULL;

// Generate Overview tiles
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:Start generating overview tiles");
func_result = geopdf_generate_overview_tiles_gtt(&gt,&gm);
switch(func_result)
{
    case GEOMAP_UTILS_TERM_REQUESTED:
    {
        printf("ERROR:convert_mbtiles,generate_overview_tiles_gtt,Termination requested\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles,generate_overview_tiles_gtt,Termination requested");
        geopdf_create_status_file_term(gt.process_id,"generate_overview_tiles_gtt:Termination requested");
        remove(pTermFile);
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(GEOMAP_UTILS_TERM_REQUESTED);
    }
    break;
    case MBGEN_ERROR_WDS_CREATE_FAILED:
    {
        printf("ERROR:convert_mbtiles,generate_overview_tiles_gtt,Write Buffer creation [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles,generate_overview_tiles_gtt,Write Buffer creation [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_overview_tiles_gtt:Write Buffer creation failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_ERROR_WDS_CREATE_FAILED);
    }
    break;
    case MBGEN_ERROR_MEMMORY_ALLOCATION_FAILED:
    {
        printf("ERROR:convert_mbtiles,generate_overview_tiles_gtt,Memory allocation [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles,generate_overview_tiles_gtt,Memory allocation [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_overview_tiles_gtt:Insufficient Memory");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_ERROR_MEMMORY_ALLOCATION_FAILED);
    }
    break;
    case MBGEN_ERROR_QRY_CREATE_FAILED:
    {
        printf("ERROR:convert_mbtiles,generate_overview_tiles_gtt, Opening dataset for generating overview [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles,generate_overview_tiles_gtt, Opening dataset for generating overview [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_overview_tiles_gtt:Memory buffer creation failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_ERROR_QRY_CREATE_FAILED);
    }
    break;
    case MBGEN_ERROR_MEM_CREATE_FAILED:
    {
        printf("ERROR:convert_mbtiles,generate_overview_tiles_gtt, Memory buffer creation [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles,generate_overview_tiles_gtt, Memory buffer creation [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_overview_tiles_gtt:Memory buffer failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_ERROR_MEM_CREATE_FAILED);
    }
    break;
    case MBGEN_ERROR_PNG_CREATE_FAILED:
    {

        printf("ERROR:convert_mbtiles,generate_overview_tiles_gtt, generate_overview_tiles:PNG creation [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles,generate_overview_tiles_gtt, PNG creation [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_overview_tiles_gtt:PNG creation failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_ERROR_PNG_CREATE_FAILED);
    }
    break;
    case MBGEN_ERROR_JPEG_CREATE_FAILED:
    {
        printf("ERROR:convert_mbtiles,generate_overview_tiles_gtt, generate_overview_tiles:JPEG creation [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles,generate_overview_tiles_gtt, JPEG creation [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_overview_tiles_gtt:JPEG creation failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_ERROR_JPEG_CREATE_FAILED);
    }
    break;
    case MBGEN_FILE_IO_FAILED:
    {
        printf("ERROR:convert_mbtiles,generate_overview_tiles_gtt, generate_overview_tiles,File I/O creation [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles,generate_overview_tiles_gtt,File I/O creation [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_overview_tiles_gtt:File I/O Error");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_FILE_IO_FAILED);
    }
    break;
    case MBGEN_FILE_OPEN_FAILED:
    {
        printf("ERROR:convert_mbtiles,generate_overview_tiles_gtt,File Open [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles,generate_overview_tiles_gtt, File Open [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_overview_tiles_gtt:File Open failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_FILE_OPEN_FAILED);
    }
    break;
    case MBGEN_ERROR_INSERT_ROW_FAILED:
    {
        printf("ERROR:convert_mbtiles,generate_overview_tiles_gtt, Insert tiles [FAILED]\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles,generate_overview_tiles_gtt, Insert tiles [FAILED]");
        geopdf_create_status_file_failed(gt.process_id,"generate_overview_tiles_gtt:write tile failed");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_ERROR_INSERT_ROW_FAILED);
    }
    break;
    case MBGEN_FILE_BASE_TILES_NOT_FOUND:
    {
        printf("ERROR:convert_mbtiles,generate_overview_tiles_gtt, Base tile not found\n");
        geopdf_write_log((char*)objLogFileName.c_str(),"ERROR:convert_mbtiles,generate_overview_tiles_gtt, Base tile not found");
        geopdf_create_status_file_failed(gt.process_id,"Base tiles not found");
        geopdf_close_mbtiles_gtt(&gt);
        geopdf_clean_tmp_files_gtt(&gt);
        geopdf_remove_resources_gtt(&gt);
        return(MBGEN_FILE_BASE_TILES_NOT_FOUND);
    }
    break;
}//End of switch
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:generating overview tiles complete");
func_result = geopdf_close_mbtiles_gtt(&gt);
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:Closing MBTiles");
geopdf_clean_tmp_files_gtt(&gt);
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:Removing Temporary files");
geopdf_remove_resources_gtt(&gt);
geopdf_write_log((char*)objLogFileName.c_str(),"INFO:Removing Resources");
if(0 == func_result)
{
    remove((char*)objLogFileName.c_str());
	return MBGEN_SUCCESS;
}
else
{
	return func_result;
}
#ifdef MBTILES_GEN
GDALDestroyDriverManager();
#endif
}
else
{
geopdf_create_status_file_failed(process_id,"Bad input file names in parameters");
#ifdef MBTILES_GEN
GDALDestroyDriverManager();
#endif
return MBGEN_BAD_INPUT_PARAMETERS;
}
return MBGEN_SUCCESS;
}
