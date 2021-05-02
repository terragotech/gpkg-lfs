#libpdfium
CC=aarch64-linux-android-gcc
CPP=aarch64-linux-android-clang++
AR=aarch64-linux-android-ar
CFLAGS=-c
INCLUDE=-I./fpdfsdk/include/ -I./public

libpdfium.a: ./fpdfsdk/src/fpdfdoc.cpp         ./fpdfsdk/src/fpdfeditimg.cpp         ./fpdfsdk/src/fpdfeditpage.cpp         ./fpdfsdk/src/fpdfformfill.cpp         ./fpdfsdk/src/fpdfppo.cpp         ./fpdfsdk/src/fpdfsave.cpp         ./fpdfsdk/src/fpdftext.cpp         ./fpdfsdk/src/fpdfview.cpp         ./fpdfsdk/src/fpdf_dataavail.cpp         ./fpdfsdk/src/fpdf_ext.cpp         ./fpdfsdk/src/fpdf_flatten.cpp         ./fpdfsdk/src/fpdf_progressive.cpp         ./fpdfsdk/src/fpdf_searchex.cpp         ./fpdfsdk/src/fpdf_sysfontinfo.cpp         ./fpdfsdk/src/fpdf_transformpage.cpp         ./fpdfsdk/src/fsdk_actionhandler.cpp         ./fpdfsdk/src/fsdk_annothandler.cpp         ./fpdfsdk/src/fsdk_baseannot.cpp         ./fpdfsdk/src/fsdk_baseform.cpp         ./fpdfsdk/src/fsdk_mgr.cpp         ./fpdfsdk/src/fsdk_rendercontext.cpp
	$(CPP) $(INCLUDE) $(CFLAGS)		    ./fpdfsdk/src/fpdfdoc.cpp	-o	fpdfdoc.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdfeditimg.cpp	-o	    fpdfeditimg.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdfeditpage.cpp	-o	    fpdfeditpage.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdfformfill.cpp	-o	    fpdfformfill.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdfppo.cpp	-o	    fpdfppo.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdfsave.cpp	-o	    fpdfsave.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdftext.cpp	-o	    fpdftext.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdfview.cpp	-o	    fpdfview.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdf_dataavail.cpp	-o	    fpdf_dataavail.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdf_ext.cpp	-o	    fpdf_ext.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdf_flatten.cpp	-o	    fpdf_flatten.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdf_progressive.cpp	-o	    fpdf_progressive.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdf_searchex.cpp	-o	    fpdf_searchex.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdf_sysfontinfo.cpp	-o	    fpdf_sysfontinfo.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fpdf_transformpage.cpp	-o	    fpdf_transformpage.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fsdk_actionhandler.cpp	-o	    fsdk_actionhandler.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fsdk_annothandler.cpp	-o	    fsdk_annothandler.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fsdk_baseannot.cpp	-o	    fsdk_baseannot.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fsdk_baseform.cpp	-o	    fsdk_baseform.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fsdk_mgr.cpp	-o	    fsdk_mgr.o
	$(CPP) $(INCLUDE) $(CFLAGS)		        ./fpdfsdk/src/fsdk_rendercontext.cpp	-o	    fsdk_rendercontext.o
	$(AR) rcs libpdfium.a fpdfdoc.o fpdfeditimg.o fpdfeditpage.o fpdfformfill.o fpdfppo.o fpdfsave.o fpdftext.o fpdfview.o fpdf_dataavail.o fpdf_ext.o fpdf_flatten.o  fpdf_progressive.o  fpdf_searchex.o fpdf_sysfontinfo.o fpdf_transformpage.o fsdk_actionhandler.o fsdk_annothandler.o fsdk_baseannot.o fsdk_baseform.o fsdk_mgr.o fsdk_rendercontext.o

clean:
	rm -f libpdfium.a
