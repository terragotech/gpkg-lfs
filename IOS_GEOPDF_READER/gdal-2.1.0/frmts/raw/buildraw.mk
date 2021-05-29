INCLUDE=-I. -I../../port -I../../app -I../../gcore -I../../alg -I../../ogr
OBJ = rawdataset.o ehdrdataset.o pauxdataset.o doq1dataset.o \
		doq2dataset.o mffdataset.o hkvdataset.o pnmdataset.o \
		fujibasdataset.o envidataset.o gscdataset.o fastdataset.o \
		atlsci_spheroid.o btdataset.o landataset.o cpgdataset.o \
		idadataset.o ndfdataset.o dipxdataset.o genbindataset.o \
		lcpdataset.o eirdataset.o gtxdataset.o loslasdataset.o \
		ntv2dataset.o ace2dataset.o snodasdataset.o ctable2dataset.o \
		krodataset.o roipacdataset.o iscedataset.o

EXTRAFLAGS =
	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libraw.a: $(OBJ)
	ar rcs libraw.a *.o

clean:
	rm -f libraw.a
	rm -f *.o
	