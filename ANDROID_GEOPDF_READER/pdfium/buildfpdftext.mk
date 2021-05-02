#libfpdftext
CC=aarch64-linux-android-gcc
CPP=aarch64-linux-android-clang++
AR=aarch64-linux-android-ar
CFLAGS=-c
INCLUDE=-I./core/include/fpdftext


libfpdftext.a: ./core/src/fpdftext/fpdf_text.cpp ./core/src/fpdftext/fpdf_text_int.cpp ./core/src/fpdftext/fpdf_text_search.cpp ./core/src/fpdftext/unicodenormalization.cpp ./core/src/fpdftext/unicodenormalizationdata.cpp
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdftext/fpdf_text.cpp	-o	fpdf_text.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdftext/fpdf_text_int.cpp	-o	fpdf_text_int.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdftext/fpdf_text_search.cpp	-o	fpdf_text_search.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdftext/unicodenormalization.cpp	-o	unicodenormalization.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdftext/unicodenormalizationdata.cpp	-o	unicodenormalizationdata.o

	$(AR) rcs libfpdftext.a fpdf_text.o fpdf_text_int.o fpdf_text_search.o unicodenormalization.o unicodenormalizationdata.o

clean:
	rm -f libfpdftext.a


