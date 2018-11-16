#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "main.h"

int main(int argc, char *argv[])
{
	/*	Variables and FILE declaration	*/
	FILE *fptr_src;
	FILE *fptr_dst;
	int size;
	char *tag_name[4];
	char title[100];

	system("clear");

	switch (argc)
	{
		case 2:
		/*****************	Read the information ****************/
	
		/******************* Open Source file ********************/
			fptr_src = fopen(argv[1], "rb");
			if (fptr_src == NULL)
			{
				perror("fopen");
				exit(1);
			}
		
		/******************* Check ID3 version ******************/
			if (id3v2_head(fptr_src) == FAILURE)
				printf("ID TAG is not read\n");
			else
				printf("--------------------\n");

		/*******************  Title tag  ************************/
			*tag_name = "TIT2";
			fseek(fptr_src, +10, SEEK_SET);
			size = tag(fptr_src, tag_name);
			printf("SongName: ");
			str_info(fptr_src, size);

		/******************  Artist tag  ************************/
			*tag_name = "TPE1";
			fseek(fptr_src, +10, SEEK_SET);
			size = tag(fptr_src, tag_name);
			printf("Artist	: ");
			str_info(fptr_src, size);

		/*******************  Album tag  ************************/
			*tag_name = "TALB";
			fseek(fptr_src, +10, SEEK_SET);
			size = tag(fptr_src, tag_name);
			printf("Album	: ");
			str_info(fptr_src, size);

		/*******************  Year tag  ************************/
			*tag_name = "TYER";
			fseek(fptr_src, +10, SEEK_SET);
			size = tag(fptr_src, tag_name);
			printf("Year	: ");
			str_info(fptr_src, size);

		/*****************  Comment file ************************/
			*tag_name = "COMM";
			fseek(fptr_src, +10, SEEK_SET);
			size = tag(fptr_src, tag_name);
			printf("Comment	: ");
			str_info(fptr_src, size);
		
			putchar('\n');

		break;

		case 3:
		/*****************  Write the information ****************/

			
		/******************* Open Source file *****************/
			fptr_src = fopen(argv[2], "rb");
			if (fptr_src == NULL)
			{
				perror("fopen");
				exit(1);
			}

		/**************** Open Destination file ***************/
			fptr_dst = fopen("New.mp3", "w");
			if (fptr_dst == NULL)
			{
				perror("fopen");
				exit(1);
			}

		/************************* TITLE **************************/
			if(!strcmp(argv[1],"-T"))
			{	
				printf("\n\n\t\tEnter Title name: ");
				scanf("%[^\n]s", title);
				rewind(fptr_src);
				*tag_name = "TIT2";
				size = tag(fptr_src, tag_name); 
				change_info(fptr_src, fptr_dst, title, size);
				printf("\n\t\t!!!!  Succesfully Done  !!!!\n");
				printf("\n\t\tTitle changed as %s\n\n", title);
			}

		/************************* ARTIST *************************/
			else if(!strcmp(argv[1],"-AR"))
			{	
				printf("\n\n\t\tEnter Artist name: ");
				scanf("%[^\n]s", title);
				rewind(fptr_src);
				*tag_name = "TPE1";
				size = tag(fptr_src, tag_name); 
				change_info(fptr_src, fptr_dst, title, size);
				printf("\n\t\t!!!!  Succesfully Done  !!!!\n");
				printf("\n\t\tArtist changed as %s\n\n", title);
			}
			
		/************************* ALBUM **************************/
			else if(!strcmp(argv[1],"-AL"))
			{	
				printf("\n\n\t\tEnter Album name: ");
				scanf("%[^\n]s", title);
				rewind(fptr_src);
				*tag_name = "TALB";
				size = tag(fptr_src, tag_name); 
				change_info(fptr_src, fptr_dst, title, size);
				printf("\n\t\t!!!!  Succesfully Done  !!!!\n");
				printf("\n\t\tAblum changed as %s\n\n", title);
			}
			
		/************************* YEAR ***************************/
			else if(!strcmp(argv[1],"-Y"))
			{	
				printf("\n\n\t\tEnter The year: ");
				scanf("%[^\n]s", title);
				rewind(fptr_src);
				*tag_name = "TYER";
				size = tag(fptr_src, tag_name); 
				change_info(fptr_src, fptr_dst, title, size);
				printf("\n\t\t!!!!  Succesfully Done  !!!!\n");
				printf("\n\t\tYear changed as %s\n\n", title);
			}
			
		/************************ COMM ***************************/
			else if(!strcmp(argv[1],"-C"))
			{	
				printf("\n\n\t\tEnter the Comment: ");
				scanf("%[^\n]s", title);
				rewind(fptr_src);
				*tag_name = "COMM";
				size = tag(fptr_src, tag_name); 
				change_info_comm(fptr_src, fptr_dst, title, size);
				printf("\n\t\t!!!!  Succesfully Done  !!!!\n");
				printf("\n\t\tComment changed as %s\n\n", title);
			}
			
		/********************** If Not Match ********************/
			else
			{
				printf("\n\n\t!!!!!!!!   ERROR !! ERROR !! ERROR   !!!!!!!!\n\n");
				printf("Check the TAG\nIt should be like:\n");
				printf("./mp3_TagReader -T file_name.mp3\n");
				printf("\ne.g. For\nTitle: -T, Album: -AL, Artist: -AR, Year: -Y, Comment: -C\n\n");
			}

			break;
		
		default:
			
			printf("\n\n\t!!!!!!!!  ERROR !! ERROR !! ERROR  !!!!!!!!\n\n");
			printf("Please write the tag\nLike:\n");
			printf("./mp3_TagReader -T file_name.mp3\n");
			printf("\ne.g. For\nTitle: -T, Album: -AL, Artist: -AR, Year: -Y, Comment: -C\n\n");
			exit(1);
	}
/* Close all the files	*/
fcloseall();

}
