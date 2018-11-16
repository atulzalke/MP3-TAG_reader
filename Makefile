mp3_TagReader: main.o all_func.o
	gcc -o mp3_TagReader main.c all_func.c
clean:
	rm *.o
