/****************************************/
/*										*/
/*		Prototype for all functions		*/
/*										*/
/****************************************/

#define SUCCESS 1
#define FAILURE 0

/*	Check version of the file	*/
int id3v2_head(FILE *fptr_src);

/*	Check the TAG name and calculate the size of string	*/
int tag(FILE *fptr_src, char **tag_name);

/*	Get the string after the TAG size	*/
void str_info(FILE *fptr_src, int size);

/*	Make the changes as per user in New.mp3 file	*/
void change_info(FILE *fptr_src, FILE *fptr_dst, char *title, int size);

/*	Make the changes as per user in New.mp3 file for comment section only	*/
void change_info_comm(FILE *fptr_src, FILE *fptr_dst, char *title, int size);

