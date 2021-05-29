INCLUDE=-I. -I.. -I../../.. -I../../../../port -I../../../ -I../../../../gcore -I../libjson -I../../../../apps
OBJ = arraylist.o \
	debug.o \
	json_object.o \
	json_tokener.o \
	json_util.o \
	linkhash.o \
	printbuf.o \
	json_object_iterator.o \
	json_c_version.o

EXTRAFLAGS = 
	
%.o: %.c
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libgeneric.a: $(OBJ)
	ar rcs libjson.a *.o

clean:
	rm -f libjson.a
	rm -f *.o
	