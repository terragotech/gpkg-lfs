INCLUDE=-I. -I.. -I../.. -I../../../port -I../../ -I../../../gcore -I./libjson -I../../../apps
OBJ = ogrgeojsondriver.o \
	ogrgeojsondatasource.o \
	ogrgeojsonlayer.o \
	ogrgeojsonwritelayer.o \
	ogrgeojsonutils.o \
	ogrgeojsonreader.o \
	ogrgeojsonwriter.o \
	ogresrijsonreader.o \
	ogrtopojsonreader.o

EXTRAFLAGS = 
	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libgeneric.a: $(OBJ)
	ar rcs libgeojson.a *.o

clean:
	rm -f libgeojson.a
	rm -f *.o
	