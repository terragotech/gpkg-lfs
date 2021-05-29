INCLUDE=-I./fpdfsdk/include/fxedit/

libfxedit.a: ./fpdfsdk/src/fxedit/fxet_ap.cpp ./fpdfsdk/src/fxedit/fxet_edit.cpp ./fpdfsdk/src/fxedit/fxet_list.cpp ./fpdfsdk/src/fxedit/fxet_module.cpp  ./fpdfsdk/src/fxedit/fxet_pageobjs.cpp
		$(CPP) $(INCLUDE) $(CXXFLAGS)	./fpdfsdk/src/fxedit/fxet_ap.cpp -o fxet_ap.o
		$(CPP) $(INCLUDE) $(CXXFLAGS)	./fpdfsdk/src/fxedit/fxet_edit.cpp -o fxet_edit.o
		$(CPP) $(INCLUDE) $(CXXFLAGS)	./fpdfsdk/src/fxedit/fxet_list.cpp -o fxet_list.o
		$(CPP) $(INCLUDE) $(CXXFLAGS)	./fpdfsdk/src/fxedit/fxet_module.cpp -o fxet_module.o
		$(CPP) $(INCLUDE) $(CXXFLAGS)	./fpdfsdk/src/fxedit/fxet_pageobjs.cpp -o fxet_pageobjs.o
		$(AR) rcs libfxedit.a fxet_ap.o fxet_edit.o fxet_list.o fxet_module.o fxet_pageobjs.o

clean:
	rm -f libfxedit.a

		
