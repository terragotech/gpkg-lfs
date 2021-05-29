INCLUDE=-I. -I.. -I../../../port -I../../ -I../../../gcore -I./libjson -I../../../apps
OBJ = ogrmemdriver.o ogrmemdatasource.o ogrmemlayer.o

EXTRAFLAGS = 
	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libogrmem.a: $(OBJ)
	ar rcs libogrmem.a *.o

clean:
	rm -f libogrmem.a
	rm -f *.o
	