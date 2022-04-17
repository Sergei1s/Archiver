CC       = gcc
# CFLAGS   = -Wall -fsanitize=address
SOURCES  = main.c arch.c
INCLUDES = arch.h
TARGET   = ./archiver
VALGRIND = valgrind --tool=memcheck --leak-check=full
ARCHIVE_NAME = archive.arch
UNPACK_DIR = unpacked
PACK_DIR = /home/sergei/Desktop/Lab1/toPackFolder

all: build

build: $(SOURCES) 
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCES) 

pack: build 
	pack $(PACK_DIR) $(ARCHIVE_NAME)

unpack: build
	unpack $(ARCHIVE_NAME) $(UNPACK_DIR)



clean:
	rm -f $(TARGET)
	rm -f $(ARCHIVE_NAME)
	rm -rf $(UNPACK_DIR)
