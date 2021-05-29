INCLUDE=-I. -I.. -I../../../port -I../../ -I../../../gcore -I../../../apps -I.. -I../sqlite -I../../../frmts/mem -I../../../alg 
OBJ = ogrgeopackagedriver.o ogrgeopackagedatasource.o ogrgeopackagelayer.o \
	ogrgeopackagetablelayer.o ogrgeopackageselectlayer.o ogrgeopackageutility.o \
	gdalgeopackagerasterband.o

EXTRAFLAGS = -DSQLITE_HAS_COLUMN_METADATA

%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libgpkg.a: $(OBJ)
	ar rcs libgpkg.a *.o

clean:
	rm -f libgpkg.a
	rm -f *.o
	