INCLUDE=-I./core/include/fpdfdoc


libfpdfdoc.a: ./core/src/fpdfapi/fpdf_edit/fpdf_edit_doc.cpp ./core/src/fpdfapi/fpdf_parser/fpdf_parser_fdf.cpp ./core/src/fpdfdoc/doc_action.cpp ./core/src/fpdfdoc/doc_annot.cpp ./core/src/fpdfdoc/doc_ap.cpp ./core/src/fpdfdoc/doc_basic.cpp ./core/src/fpdfdoc/doc_bookmark.cpp  ./core/src/fpdfdoc/doc_form.cpp ./core/src/fpdfdoc/doc_formcontrol.cpp ./core/src/fpdfdoc/doc_formfield.cpp ./core/src/fpdfdoc/doc_link.cpp ./core/src/fpdfdoc/doc_metadata.cpp ./core/src/fpdfdoc/doc_ocg.cpp ./core/src/fpdfdoc/doc_tagged.cpp ./core/src/fpdfdoc/doc_utils.cpp ./core/src/fpdfdoc/doc_viewerPreferences.cpp ./core/src/fpdfdoc/doc_vt.cpp ./core/src/fpdfdoc/doc_vtmodule.cpp
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfapi/fpdf_edit/fpdf_edit_doc.cpp 	-o	fpdf_edit_doc.o 
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfapi/fpdf_parser/fpdf_parser_fdf.cpp	-o	fpdf_parser_fdf.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_action.cpp	-o	doc_action.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_annot.cpp	-o	doc_annot.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_ap.cpp	-o	doc_ap.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_basic.cpp	-o	doc_basic.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_bookmark.cpp	-o	doc_bookmark.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_form.cpp	-o	doc_form.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_formcontrol.cpp	-o	doc_formcontrol.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_formfield.cpp	-o	doc_formfield.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_link.cpp	-o	doc_link.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_metadata.cpp	-o	doc_metadata.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_ocg.cpp	-o	doc_ocg.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_tagged.cpp	-o	doc_tagged.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_utils.cpp	-o	doc_utils.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_viewerPreferences.cpp	-o	doc_viewerPreferences.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_vt.cpp	-o	doc_vt.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fpdfdoc/doc_vtmodule.cpp	-o	doc_vtmodule.o

	$(AR) rcs libfpdfdoc.a fpdf_edit_doc.o fpdf_parser_fdf.o doc_action.o doc_annot.o doc_ap.o doc_basic.o doc_bookmark.o doc_form.o doc_formcontrol.o doc_formfield.o doc_link.o doc_metadata.o doc_ocg.o doc_tagged.o doc_utils.o doc_viewerPreferences.o doc_vt.o doc_vtmodule.o

clean:
	rm -f libfpdfdoc.a


