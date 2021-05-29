INCLUDE=-I. -I../raw -I../../port -I../../app -I../../gcore -I../../alg -I../../ogr
OBJ = vrtdataset.o vrtrasterband.o vrtdriver.o vrtsources.o \
		vrtfilters.o vrtsourcedrasterband.o vrtrawrasterband.o \
		vrtwarped.o vrtderivedrasterband.o vrtpansharpened.o

EXTRAFLAGS =
	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libvrt.a: $(OBJ)
	ar rcs libvrt.a *.o

clean:
	rm -f libvrt.a
	rm -f *.o
	