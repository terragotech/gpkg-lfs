INCLUDE=-I. -I../raw -I../../port -I../../app -I../../gcore -I../../alg -I../../ogr
OBJ = memdataset.o

EXTRAFLAGS =
	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libmem.a: $(OBJ)
	ar rcs libmem.a *.o

clean:
	rm -f libmem.a
	rm -f *.o
	