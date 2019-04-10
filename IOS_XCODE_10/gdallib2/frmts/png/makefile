png.o:
	$(CC)  $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/png.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngerror.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pnggccrd.c 
	$(CC) $(PNG_CFLAGS)  $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngget.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngmem.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngpread.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngread.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngrio.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngrtran.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngrutil.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngset.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngtrans.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngvcrd.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngwio.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngwrite.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngwtran.c 
	$(CC) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CFLAGS) -c libpng/pngwutil.c 
	$(CXX) $(PNG_CFLAGS) $(LIBPNG_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE) $(PNGFRM_INCLUDE) $(OGR_INCLUDE) $(CXXFLAGS) -c pngdataset.cpp

clean:
	rm -f *.o