INCLUDE = -I. -I../vrt -I../mem -I../../ogr/ogrsf_frmts/mem -I. -I../../port -I../../app -I../../gcore -I../../alg -I../../ogr -I../../../pdfiumBuild/device/pdfium/install -I../../../pdfiumBuild/device/pdfium/install/include -I../../../pdfiumBuild/device/pdfium/install/include/pdfium -I../../ogr/ogrsf_frmts
OBJ = pdfdataset.o pdfio.o pdfobject.o pdfcreatecopy.o ogrpdflayer.o pdfwritabledataset.o pdfreadvectors.o
EXTRAFLAGS = -DHAVE_PDFIUM 

%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libpdf.a: $(OBJ)
	ar rcs libpdf.a *.o

clean:
	rm -f libpdf.a
	rm -f *.o
	