jcapimin.o:
	$(CC)  $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcapimin.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcapistd.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jccoefct.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jccolor.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcdctmgr.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jchuff.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcinit.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcmainct.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcmarker.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcmaster.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcomapi.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcparam.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcphuff.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcprepct.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jcsample.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jctrans.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdapimin.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdapistd.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdatadst.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdatasrc.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdcoefct.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdcolor.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jddctmgr.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdhuff.c 
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdinput.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdmainct.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdmarker.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdmaster.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdmerge.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdphuff.c 
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdpostct.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdsample.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jdtrans.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jerror.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jfdctflt.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jfdctfst.c 
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jfdctint.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jidctflt.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jidctfst.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jidctint.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jidctred.c 
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jquant1.c 
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jquant2.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jutils.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jmemmgr.c
	$(CC) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CFLAGS) -c libjpeg/jmemansi.c 
	$(CXX) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CORE_INCLUDE) $(OGR_INCLUDE) $(JPEG_LIBJPEG) $(MEM_INCLUDE) $(CXXFLAGS) -c jpgdataset.cpp
	$(CXX) $(JPEG_CFLAGS) $(PORT_INCLUDE) $(CORE_INCLUDE) $(OGR_INCLUDE) $(JPEG_LIBJPEG)  $(MEM_INCLUDE) $(CXXFLAGS) -c vsidataio.cpp

clean:
	rm -f *.o