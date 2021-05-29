INCLUDE=-I. -I.. -I../../../port -I../../ -I../../../gcore
OBJ = ogrsfdriverregistrar.o ogrlayer.o ogrdatasource.o \
		ogrsfdriver.o ogrregisterall.o ogr_gensql.o \
		ogr_attrind.o ogr_miattrind.o ogrlayerdecorator.o \
		ogrwarpedlayer.o ogrunionlayer.o ogrlayerpool.o \
		ogrmutexedlayer.o ogrmutexeddatasource.o \
		ogremulatedtransaction.o ogreditablelayer.o
EXTRAFLAGS = -DMEM_ENABLED \
	-DXPLANE_ENABLED \
	-DTAB_ENABLED \
	-DSQLITE_ENABLED \
	-DGEOJSON_ENABLED \
	-DKML_ENABLED
	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libgeneric.a: $(OBJ)
	ar rcs libgeneric.a *.o

clean:
	rm -f libgeneric.a
	rm -f *.o
	