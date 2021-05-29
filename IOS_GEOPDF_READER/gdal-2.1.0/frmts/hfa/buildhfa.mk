INCLUDE = -I. -I../vrt -I../mem -I../../ogr/ogrsf_frmts/mem -I. -I../../port -I../../app -I../../gcore -I../../alg -I../../ogr  -I../../ogr/ogrsf_frmts 
OBJ = hfaopen.o hfaentry.o hfadictionary.o hfafield.o hfatype.o \
		hfaband.o hfacompress.o hfadataset.o hfa_overviews.o

EXTRAFLAGS = 

%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libhfa.a: $(OBJ)
	ar rcs libhfa.a *.o

clean:
	rm -f libhfa.a
	rm -f *.o
	