INCLUDE = -I. -I../vrt -I../mem -I../../ogr/ogrsf_frmts/mem -I. -I../../port -I../../app -I../../gcore -I../../alg -I../../ogr  -I../../ogr/ogrsf_frmts -I./libjpeg
OBJ = jcapimin.o jcapistd.o jccoefct.o jccolor.o jcdctmgr.o jchuff.o \
        jcinit.o jcmainct.o jcmarker.o jcmaster.o jcomapi.o jcparam.o \
        jcphuff.o jcprepct.o jcsample.o jctrans.o jdapimin.o jdapistd.o \
        jdatadst.o jdatasrc.o jdcoefct.o jdcolor.o jddctmgr.o jdhuff.o \
        jdinput.o jdmainct.o jdmarker.o jdmaster.o jdmerge.o jdphuff.o \
        jdpostct.o jdsample.o jdtrans.o jerror.o jfdctflt.o jfdctfst.o \
        jfdctint.o jidctflt.o jidctfst.o jidctint.o jidctred.o jquant1.o \
        jquant2.o jutils.o jmemmgr.o jmemansi.o

EXTRAFLAGS =  -Ilibjpeg -DDEFAULT_MAX_MEM=500000000L

%.o: ./libjpeg/%.c
	$(CC) $(INCLUDE) $(EXTRAFLAGS) $(CFLAGS) -o $@ $<
	

libjpeg.a: $(OBJ)
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) jpgdataset.cpp -o jpgdataset.o
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) vsidataio.cpp -o vsidataio.o
	ar rcs libjpeg.a *.o

clean:
	rm -f libjpeg.a
	rm -f *.o
	