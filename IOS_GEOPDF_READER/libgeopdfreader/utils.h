#ifndef _UTILS_H_
#define _UTILS_H_

#define GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER		-6000
#define GEOMAP_UTILS_ERROR_BAD_BUFFER_SIZE		-6001
#define GEOMAP_UTILS_ERROR_UNMATCHED_QUOTES		-6002
#define GEOMAP_UTILS_WARP_FAILED			-6003
#define GEOMAP_UTILS_TERM_REQUESTED			 1000
#define GEOMAP_UTILS_TERM_NOT_REQUESTED			 1001
#define GEOMAP_UTILS_SUCCESS				 0
#define ANDROID_BUILD
int geopdf_hex_to_decimal(char character);
int geopdf_remove_quotes_from_string(char *ptrDst, char *ptrSrc,int buffer_size);
int geopdf_URLDecoder( char *ptrDst, char *ptrSrc);
int geopdf_create_status_file_failed(char *ptrId, char *ptrReason);
int geopdf_create_status_file_progress(char *ptrID,double percentage);
int geopdf_create_status_file_success(char *id);
int geopdf_check_process_termination(char *ptrId);
int geopdf_create_status_file_term(char *ptrId, char *ptrReason);
#endif