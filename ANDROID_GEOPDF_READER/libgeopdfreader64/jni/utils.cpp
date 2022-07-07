#include <stdio.h>
#include <string.h>
#include <iostream>
#include "utils.h"
using namespace std;
/*
* File utils.cpp
*/
int geopdf_remove_quotes_from_string(char *ptrDst, char *ptrSrc,int buffer_size)
{
	if((NULL == ptrDst) || (NULL == ptrSrc) || (buffer_size <= 0))
	{
		printf("Error: %d Bad input parameters to string\n",GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER);
		return GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
	}
	if(strlen(ptrSrc) == 0)
	{
		printf("Error: %d Bad input string length\n",GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER);
		return GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
	}
	/*
	if(strlen(ptrSrc) < 3)
	{
		printf("Error: %d input string length less than 3 \n",GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER);
		return GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
	}
	*/
	std::string str_with_quotes(ptrSrc);
	
	if(! ( ('\"' == str_with_quotes[0]) && ('\"' == str_with_quotes[str_with_quotes.length()-1])))
	{
		printf("Error: %d input string with unmatched quotes \n",GEOMAP_UTILS_ERROR_UNMATCHED_QUOTES);
		return GEOMAP_UTILS_ERROR_UNMATCHED_QUOTES;
	}
	string str_no_quotes = str_with_quotes.substr(1,str_with_quotes.length()-2);
	if(str_no_quotes.length() > buffer_size)
	{
		printf("Error: %d buffer size specified is less \n",GEOMAP_UTILS_ERROR_BAD_BUFFER_SIZE);
		return GEOMAP_UTILS_ERROR_BAD_BUFFER_SIZE;
	}
	strncpy(ptrDst,str_no_quotes.c_str(),buffer_size);
	return GEOMAP_UTILS_SUCCESS;
}//int remove_quotes_from_string(char *ptrDst, char *ptrSrc,int buffer_size)

int geopdf_URLDecoder( char *ptrDst, char *ptrSrc)
{
	int result = GEOMAP_UTILS_SUCCESS;
	if((NULL == ptrDst) || (NULL == ptrSrc))
	{
		printf("Error: %d Bad input parameter \n",GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER);
		return GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
	}
	//Scan for the encoding characters
		
	int src_string_length = 0;
	src_string_length = strlen(ptrSrc);
	if(0 == src_string_length)
	{
		printf("Error: %d Bad input string length \n",GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER);
		return GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
	}
	char *ptrSrcTemp = ptrSrc;
	char *ptrDstTemp = ptrDst;
	char currentChar;
	char nextMSB;
	char nextLSB;
	do
	{
		currentChar = *ptrSrcTemp++;
		src_string_length--;
		if(currentChar == '+') 
		{
			*ptrDstTemp++ = ' ';
		}
		else if(currentChar == '%')
		{
			if(src_string_length != 0)
			{
				nextMSB = *ptrSrcTemp++;
				src_string_length--;
				if(nextMSB == '%')
				{
					*ptrDstTemp++ = '%';
				}
				else
				{
					if(src_string_length != 0)
					{
						nextLSB = *ptrSrcTemp++;
						src_string_length--;
						int lsb_value = geopdf_hex_to_decimal(nextLSB);
						int msb_value = geopdf_hex_to_decimal(nextMSB);
						char final_value = msb_value * 16 + lsb_value;
						*ptrDstTemp++ = (unsigned char)final_value;
					}
				}
			}
		}
		else
		{
			*ptrDstTemp++ = currentChar;
		}
	}while(src_string_length != 0); //End of do..while
	*ptrDstTemp = '\0';
	return result;
}//int URLDecoder( char *ptrDst, char *ptrSrc)

int geopdf_hex_to_decimal(char character)
{
	char ch = character;
	int result_value = 0;
	switch(ch){
    case '0':
		result_value = 0;		       
       break;
	case '1':
		result_value = 1;		       
       break;
	case '2':
		result_value = 2;		       
       break;
	case '3':
		result_value = 3;		       
       break;
	case '4':
		result_value = 4;		       
       break;
	case '5':
		result_value = 5;		       
       break;
	case '6':
		result_value = 6;		       
       break;
	case '7':
		result_value = 7;		       
       break;
	case '8':
		result_value = 8;		       
       break;
	case '9':
		result_value = 9;		       
       break;
	case 'A':
		result_value = 10;		       
       break;
	case 'B':
		result_value = 11;		       
       break;
	case 'C':
		result_value = 12;		       
       break;
	case 'D':
		result_value = 13;		       
       break;
	case 'E':
		result_value = 14;		       
       break;
	case 'F':
		result_value = 15;		       
       break;
	}
	return result_value;
}//int hex_to_decimal(char character)


int geopdf_create_status_file_success(char *id)
{
	int result = GEOMAP_UTILS_SUCCESS;

	if(NULL == id)
	{
		return GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
	}

	FILE *fp = fopen(id,"w");
	if(fp != NULL)
	{
		fprintf(fp,"SUCCESS\r\n");
		fclose(fp);
	}
	return result;
}
/*
creates the status file progress to notify the java web service,
to show the progress on the screen web client
*/
int geopdf_create_status_file_progress(char *ptrID,double percentage){
	int result = GEOMAP_UTILS_SUCCESS;

	FILE *fp = fopen(ptrID,"w");
	if(fp != NULL)
	{
		fprintf(fp,"PROGRESS-%f#\r\n",percentage);
		fclose(fp);
	}
	return result;
}
/*
* Creates the status file failed to notify the java web service,
* if MBTiles generation failed 
*/
int geopdf_create_status_file_failed(char *ptrId, char *ptrReason)
{
	int result = GEOMAP_UTILS_SUCCESS;
	if((NULL == ptrId) || (NULL == ptrReason))
	{
		return GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
	}
	FILE *fp = fopen(ptrId,"w");
	if(fp != NULL)
	{
		fprintf(fp,"FAILED-%s-\r\n",ptrReason);
		fclose(fp);
	}
	return GEOMAP_UTILS_SUCCESS;
}//int create_status_file_failed(char *id, char *reason)
int geopdf_create_status_file_term(char *ptrId, char *ptrReason)
{
	int result = GEOMAP_UTILS_SUCCESS;
	
	if((NULL == ptrId) || (NULL == ptrReason))
	{
		return GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
	}
	FILE *fp = fopen(ptrId,"w");
	if(fp != NULL)
	{
		fprintf(fp,"TERM-%s-\r\n",ptrReason);
		fclose(fp);
	}
	return GEOMAP_UTILS_SUCCESS;
}//int create_status_file_failed(char *id, char *reason)
/*
* Check for terminate flag
*/
int geopdf_check_process_termination(char *ptrId)
{
	int result = 0;
	if(NULL == ptrId)
	{
		return GEOMAP_UTILS_ERROR_BAD_INPUT_PARAMETER;
	}
	FILE *fp = fopen(ptrId,"r");
	if(fp == NULL)
	{
		result = GEOMAP_UTILS_TERM_NOT_REQUESTED;
	}
	else
	{
		fclose(fp);
		result = GEOMAP_UTILS_TERM_REQUESTED;
	}
	return result;
}//int check_process_termination(char *ptrId)
