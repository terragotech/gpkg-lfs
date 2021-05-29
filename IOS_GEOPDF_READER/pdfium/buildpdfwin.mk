INCLUDE=-I./fpdfsdk/include/formfiller

libpdfwindow.a: ./fpdfsdk/src/pdfwindow/PWL_Button.cpp ./fpdfsdk/src/pdfwindow/PWL_Caret.cpp ./fpdfsdk/src/pdfwindow/PWL_ComboBox.cpp ./fpdfsdk/src/pdfwindow/PWL_Edit.cpp ./fpdfsdk/src/pdfwindow/PWL_EditCtrl.cpp ./fpdfsdk/src/pdfwindow/PWL_FontMap.cpp ./fpdfsdk/src/pdfwindow/PWL_Icon.cpp ./fpdfsdk/src/pdfwindow/PWL_IconList.cpp ./fpdfsdk/src/pdfwindow/PWL_Label.cpp ./fpdfsdk/src/pdfwindow/PWL_ListBox.cpp ./fpdfsdk/src/pdfwindow/PWL_ListCtrl.cpp ./fpdfsdk/src/pdfwindow/PWL_Note.cpp ./fpdfsdk/src/pdfwindow/PWL_ScrollBar.cpp ./fpdfsdk/src/pdfwindow/PWL_Signature.cpp ./fpdfsdk/src/pdfwindow/PWL_SpecialButton.cpp ./fpdfsdk/src/pdfwindow/PWL_Utils.cpp ./fpdfsdk/src/pdfwindow/PWL_Wnd.cpp 

	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_Button.cpp	-o	PWL_Button.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_Caret.cpp	-o	PWL_Caret.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_ComboBox.cpp	-o	PWL_ComboBox.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_Edit.cpp	-o	PWL_Edit.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_EditCtrl.cpp	-o	PWL_EditCtrl.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_FontMap.cpp	-o	PWL_FontMap.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_Icon.cpp	-o	PWL_Icon.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_IconList.cpp	-o	PWL_IconList.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_Label.cpp	-o	PWL_Label.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_ListBox.cpp	-o	PWL_ListBox.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_ListCtrl.cpp	-o	PWL_ListCtrl.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_Note.cpp	-o	PWL_Note.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_ScrollBar.cpp	-o	PWL_ScrollBar.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_Signature.cpp	-o	PWL_Signature.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_SpecialButton.cpp	-o	PWL_SpecialButton.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_Utils.cpp	-o	PWL_Utils.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./fpdfsdk/src/pdfwindow/PWL_Wnd.cpp	-o	PWL_Wnd.o
	$(AR) rcs libpdfwindow.a PWL_Button.o PWL_Caret.o PWL_ComboBox.o PWL_Edit.o PWL_EditCtrl.o PWL_FontMap.o PWL_Icon.o PWL_IconList.o PWL_Label.o PWL_ListBox.o PWL_ListCtrl.o PWL_Note.o PWL_ScrollBar.o PWL_Signature.o PWL_SpecialButton.o PWL_Utils.o PWL_Wnd.o 	
	
clean:
	rm -f libpdfwindow.a 
