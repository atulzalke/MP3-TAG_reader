#include <stdio.h>
#include <string.h>

/*	Check the vrsion of the mp3 file	*/
int id3v2_head(FILE *fptr_src)
{
	int ch;
	int count = 0;
	int i = 0;
	int flag = 0;
	int current_fptr;

	/*  Check virsion of the mp3 file */
	char buff_ID3[4];
	char title[3];

	while ((fread(&buff_ID3, 1, 3, fptr_src) > 0))
	{
		buff_ID3[3] = '\0';
		break;
	}
	int ver = 0;
	while ((ch = fgetc(fptr_src)) != EOF)
	{
		ver = ch;
		break;
	}
	int sub_ver = 0;
	while ((ch = fgetc(fptr_src)) != EOF)
	{
		sub_ver = ch;
		break;
	}
	printf("\nVersion : %sv2.%d.%d\n", buff_ID3, ver, sub_ver);
	int ver_flag;
	while ((ch = fgetc(fptr_src)) != EOF)
	{
		ver_flag = ch;
		break;
	}
	int size;
	size = 0;
	while ((ch = fgetc(fptr_src)) != EOF)
	{
		size += ch;
		i++;
		count++;
		if (count == 4)
			break;
	}
//	printf("\nSize: %d\n\n", size);
}

/* Check TAG and get size of perticular TAG title  */
int tag(FILE *fptr_src, char **tag_name)
{
	int i = 0;
	int count = 0;
	int flag = 0;
	int ch;
	char buffer_tag[4] = {0};
	int size = 0;

	/*************** Print all char *****************/
	/*
	printf("first char %c\n", *(*tag_name + 0));
	printf("Second char %c\n", *(*tag_name + 1));
	printf("Third char %c\n", *(*tag_name + 2));
	printf("Forth char %c\n", *(*tag_name + 3));
	*/
	/***********************************************/

	/***************** TAG Verification *****************/
		while ((ch = fgetc(fptr_src)) != EOF)
		{
			if (flag == 0)
			{
				if (ch != *(*tag_name + 0))
					continue;
				flag = 1;
			}
			if (flag == 1 )
			{
				if (ch == *(*tag_name + 0))
				{
					buffer_tag[i] = ch;
					i++;
					count++;
				}
				else if (ch == *(*tag_name + 1))
				{
					buffer_tag[i] = ch;
					i++;
					count++;
				}
				else if (ch == *(*tag_name + 2))
				{
					buffer_tag[i] = ch;
					i++;
					count++;
				}
				else if (ch == *(*tag_name + 3))
				{
					buffer_tag[i] = ch;
					i++;
					count++;
				}
				else 
				{
					flag = 0;
					for (i = 0; i < count; i++)
					{
						buffer_tag[i] = '\0';
					}
					i = 0;
					count = 0;
					continue;
				}
			}
	/******************  TAG Verification done **************/

	/************** Calculate size after TAG ****************/
			if (count == 4)
			{
				buffer_tag[i] = '\0';
				if (strcmp(buffer_tag, *tag_name) == 0)
				{
					count = 0;
					while ((ch = fgetc(fptr_src)) != EOF)
					{
						size += ch;
						count++;
						if (count == 4)
							break;
					}
//					printf("\nSize: %d\n\n", size);
					return size;
				}
				else
					return 0;
			}
		}
}

/*  Get the string after the TAG size */
void str_info(FILE *fptr_src, int size)
{
	char buffer[size];
	int i = 0;
	int count = 0;
	int flag = 0;
	int ch;

	while ((ch = fgetc(fptr_src)) != EOF)
	{
		if (flag == 0)
		{
			if ((ch >= 0 && ch < 32) || ch == '\0' || ch == '/')
				continue;
			flag = 1;
		}
		if (flag == 1)
		{
			buffer[i] = ch;
			i++;
			count++;
		}
		if (count + 1 == size)
		{
			buffer[i] = '\0';
			break;
		}
	}

	for (i = 0; i < size; i++)
	{
		if(buffer[i] >= 32 && buffer[i] < 127)
			printf("%c", buffer[i]);
	}
	putchar('\n');	
}

/*	Make the changes as per user in New.mp3 file	*/
void change_info(FILE *fptr_src, FILE *fptr_dst, char *title, int size)
{
	int i, null_size = 0;
	int buffer;
	int titl_size = strlen(title);
	int curr_fptr_src;
	int count = 0;

	curr_fptr_src = ftell(fptr_src);
	curr_fptr_src -= 4;
	rewind(fptr_src);
	while ((buffer = fgetc(fptr_src)) != EOF)
	{
		fputc(buffer, fptr_dst);
		count++;
		if (count == curr_fptr_src)
			break;
	}
				 
	/******** Add size after four byte *****/
	for (i = 0; i < 3; i++)
	{
		fputc(null_size, fptr_dst);
	}
	fputc(titl_size + 1, fptr_dst);
	for (i = 0; i < 3; i++)
	{
		fputc(null_size, fptr_dst);
	}
		
	/*********** Title after TAG *********/
	fputs(title, fptr_dst);
	fseek(fptr_src, +(size + 6), SEEK_CUR);
	while (fread(&buffer, 1, 1, fptr_src))
	{
		fwrite(&buffer, 1, 1, fptr_dst);
	}

}

/*	Make the changes as per user in New.mp3 file for comment section only	*/
void change_info_comm(FILE *fptr_src, FILE *fptr_dst, char *title, int size)
{
	int i, null_size = 0;
	int buffer;
	int titl_size = strlen(title);
	int curr_fptr_src;
	int count = 0;

	curr_fptr_src = ftell(fptr_src);
	curr_fptr_src -= 4;
	rewind(fptr_src);
	while ((buffer = fgetc(fptr_src)) != EOF)
	{
		fputc(buffer, fptr_dst);
		count++;
		if (count == curr_fptr_src)
			break;
	}
				 
	/******** Add size after four byte *****/
	for (i = 0; i < 3; i++)
	{
		fputc(null_size, fptr_dst);
	}
	fputc(titl_size + 5, fptr_dst);
	fseek(fptr_src, +4, SEEK_CUR);
	count = 0;
	while ((buffer = fgetc(fptr_src)) != EOF)
	{
		fputc(buffer, fptr_dst);
		count++;
		if (count == 7)
			break;
	}
		
	/*********** Title after TAG *********/
	fputs(title, fptr_dst);
	fseek(fptr_src, +(size-5), SEEK_CUR);
	while (fread(&buffer, 1, 1, fptr_src))
	{
		fwrite(&buffer, 1, 1, fptr_dst);
	}

}
