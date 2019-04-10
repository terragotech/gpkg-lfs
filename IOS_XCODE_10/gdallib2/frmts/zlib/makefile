adler32.o:
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c adler32.c
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c compress.c
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c crc32.c
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c deflate.c
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c gzio.c
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c infback.c
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c inffast.c
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c inflate.c
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c inftrees.c
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c trees.c
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c uncompr.c
	$(CC) $(ZLIB_CFLAGS) $(CFLAGS) -c zutil.c

clean:
	rm -f *.o