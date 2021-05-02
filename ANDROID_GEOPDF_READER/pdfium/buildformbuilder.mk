#libformfiller 
CC=aarch64-linux-android-gcc
CPP=aarch64-linux-android-clang++
AR=aarch64-linux-android-ar
CFLAGS=-c
INCLUDE=-I./fpdfsdk/include/formfiller

libformfiller.a: ./fpdfsdk/src/formfiller/FFL_CBA_Fontmap.cpp ./fpdfsdk/src/formfiller/FFL_CheckBox.cpp ./fpdfsdk/src/formfiller/FFL_ComboBox.cpp ./fpdfsdk/src/formfiller/FFL_FormFiller.cpp ./fpdfsdk/src/formfiller/FFL_IFormFiller.cpp ./fpdfsdk/src/formfiller/FFL_ListBox.cpp ./fpdfsdk/src/formfiller/FFL_Notify.cpp ./fpdfsdk/src/formfiller/FFL_PushButton.cpp ./fpdfsdk/src/formfiller/FFL_RadioButton.cpp ./fpdfsdk/src/formfiller/FFL_TextField.cpp ./fpdfsdk/src/formfiller/FFL_Utils.cpp
	$(CPP) $(INCLUDE) $(CFLAGS)		./fpdfsdk/src/formfiller/FFL_CBA_Fontmap.cpp	-o	FFL_CBA_Fontmap.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./fpdfsdk/src/formfiller/FFL_CheckBox.cpp	-o	FFL_CheckBox.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./fpdfsdk/src/formfiller/FFL_ComboBox.cpp	-o	FFL_ComboBox.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./fpdfsdk/src/formfiller/FFL_FormFiller.cpp	-o	FFL_FormFiller.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./fpdfsdk/src/formfiller/FFL_IFormFiller.cpp	-o	FFL_IFormFiller.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./fpdfsdk/src/formfiller/FFL_ListBox.cpp	-o	FFL_ListBox.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./fpdfsdk/src/formfiller/FFL_Notify.cpp	-o	FFL_Notify.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./fpdfsdk/src/formfiller/FFL_PushButton.cpp	-o	FFL_PushButton.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./fpdfsdk/src/formfiller/FFL_RadioButton.cpp	-o	FFL_RadioButton.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./fpdfsdk/src/formfiller/FFL_TextField.cpp	-o	FFL_TextField.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./fpdfsdk/src/formfiller/FFL_Utils.cpp	-o	FFL_Utils.o
	$(AR) rcs libformfiller.a FFL_CBA_Fontmap.o FFL_CheckBox.o FFL_ComboBox.o FFL_FormFiller.o FFL_IFormFiller.o FFL_ListBox.o FFL_Notify.o FFL_PushButton.o FFL_RadioButton.o FFL_TextField.o FFL_Utils.o

clean:
	rm -f libformfiller.a	
