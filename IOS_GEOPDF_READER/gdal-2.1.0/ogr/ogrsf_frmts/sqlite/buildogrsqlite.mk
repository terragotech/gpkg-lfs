INCLUDE=-I. -I.. -I../../../port -I../../ -I../../../gcore  -I../../../apps
OBJ = ogrsqlitedatasource.o ogrsqlitelayer.o ogrsqlitedriver.o \
		ogrsqlitetablelayer.o ogrsqliteviewlayer.o ogrsqliteselectlayer.o ogrsqlitesinglefeaturelayer.o \
		ogrsqlitevfs.o ogrsqlitevirtualogr.o ogrsqliteexecutesql.o 
EXTRAFLAGS = -DSQLITE_HAS_COLUMN_METADATA
	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libogrsqlite.a: $(OBJ)
	$(CC) $(INCLUDE) $(EXTRAFLAGS) $(CFLAGS) ogrsqliteapiroutines.c -o ogrsqliteapiroutines.o
	ar rcs libogrsqlite.a *.o

clean:
	rm -f libogrsqlite.a
	rm -f *.o
	