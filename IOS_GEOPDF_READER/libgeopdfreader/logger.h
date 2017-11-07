#ifndef _LOGGER_H_
#define _LOGGER_H_
#include <time.h>
#include <string.h>
#include <string>
using namespace std;
#define GEOMAP_LOGS_ERROR_FILE_OPEN_FAILED			-5001
#define GEOMAP_LOGS_ERROR_BAD_INPUT_PARAMETER		-5002
#define GEOMAP_LOGS_ERROR_BAD_TIME_STRING			-5003
#define GEOMAP_LOGS_ERROR_FILE_IO					-5004
#define GEOMAP_LOGS_ERROR_NO_FILE_EXT				-5005
#define GEOMAP_LOGS_ERROR_INSUFFICIENT_BUFFER_SIZE	-5006
#define GEOMAP_LOGS_ERROR_BAD_FILE_NAME				-5007

#define GEOMAP_LOG_SUCCESS							0

int geopdf_write_log(char *filename, char *message);
int geopdf_remove_extension(char *filename_noext,char *filename,int buffer_size);
#endif