INCLUDE=-I. -I.. -I../../../port -I../../ -I../../../gcore  -I../../../apps
OBJ = ogr2kmlgeometry.o ogrkmldriver.o ogrkmldatasource.o ogrkmllayer.o
EXTRAFLAGS = 
	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libkml.a: $(OBJ)
	ar rcs libkml.a *.o

clean:
	rm -f libkml.a
	rm -f *.o
	