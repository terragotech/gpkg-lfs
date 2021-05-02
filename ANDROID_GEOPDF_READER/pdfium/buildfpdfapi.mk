#libfxcrt
CC=aarch64-linux-android-gcc
CPP=aarch64-linux-android-clang++
AR=aarch64-linux-android-ar
CFLAGS=-c
INCLUDE=-I./core/include/fxcrt -I./core/src/fxcrt -I./third_party/freetype/include

libfpdfapi.a: ./core/src/fpdfapi/fpdf_basic_module.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/Adobe-CNS1-UCS2_5.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/B5pc-H_0.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/B5pc-V_0.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/cmaps_cns1.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/CNS-EUC-H_0.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/CNS-EUC-V_0.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/ETen-B5-H_0.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/ETen-B5-V_0.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/ETenms-B5-H_0.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/ETenms-B5-V_0.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/HKscs-B5-H_5.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/HKscs-B5-V_5.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/UniCNS-UCS2-H_3.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/UniCNS-UCS2-V_3.cpp ./core/src/fpdfapi/fpdf_cmaps/CNS1/UniCNS-UTF16-H_0.cpp ./core/src/fpdfapi/fpdf_cmaps/fpdf_cmaps.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/Adobe-GB1-UCS2_5.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/cmaps_gb1.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/GB-EUC-H_0.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/GB-EUC-V_0.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/GBK-EUC-H_2.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/GBK-EUC-V_2.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/GBK2K-H_5.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/GBK2K-V_5.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/GBKp-EUC-H_2.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/GBKp-EUC-V_2.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/GBpc-EUC-H_0.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/GBpc-EUC-V_0.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/UniGB-UCS2-H_4.cpp ./core/src/fpdfapi/fpdf_cmaps/GB1/UniGB-UCS2-V_4.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/83pv-RKSJ-H_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/90ms-RKSJ-H_2.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/90ms-RKSJ-V_2.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/90msp-RKSJ-H_2.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/90msp-RKSJ-V_2.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/90pv-RKSJ-H_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/Add-RKSJ-H_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/Add-RKSJ-V_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/Adobe-Japan1-UCS2_4.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/cmaps_japan1.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/EUC-H_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/EUC-V_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/Ext-RKSJ-H_2.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/Ext-RKSJ-V_2.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/H_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-HW-H_4.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-HW-V_4.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-H_4.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-V_4.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UTF16-H_5.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UTF16-V_5.cpp ./core/src/fpdfapi/fpdf_cmaps/Japan1/V_1.cpp  ./core/src/fpdfapi/fpdf_cmaps/Korea1/Adobe-Korea1-UCS2_2.cpp ./core/src/fpdfapi/fpdf_cmaps/Korea1/cmaps_korea1.cpp ./core/src/fpdfapi/fpdf_cmaps/Korea1/KSC-EUC-H_0.cpp ./core/src/fpdfapi/fpdf_cmaps/Korea1/KSC-EUC-V_0.cpp ./core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-HW-H_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-HW-V_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-H_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-V_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Korea1/KSCpc-EUC-H_0.cpp ./core/src/fpdfapi/fpdf_cmaps/Korea1/UniKS-UCS2-H_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Korea1/UniKS-UCS2-V_1.cpp ./core/src/fpdfapi/fpdf_cmaps/Korea1/UniKS-UTF16-H_0.cpp ./core/src/fpdfapi/fpdf_edit/fpdf_edit_content.cpp ./core/src/fpdfapi/fpdf_edit/fpdf_edit_create.cpp ./core/src/fpdfapi/fpdf_edit/fpdf_edit_doc.cpp ./core/src/fpdfapi/fpdf_edit/fpdf_edit_image.cpp ./core/src/fpdfapi/fpdf_font/fpdf_font.cpp ./core/src/fpdfapi/fpdf_font/fpdf_font_charset.cpp ./core/src/fpdfapi/fpdf_font/fpdf_font_cid.cpp ./core/src/fpdfapi/fpdf_font/ttgsubtable.cpp ./core/src/fpdfapi/fpdf_page/fpdf_page.cpp ./core/src/fpdfapi/fpdf_page/fpdf_page_colors.cpp ./core/src/fpdfapi/fpdf_page/fpdf_page_doc.cpp ./core/src/fpdfapi/fpdf_page/fpdf_page_func.cpp ./core/src/fpdfapi/fpdf_page/fpdf_page_graph_state.cpp ./core/src/fpdfapi/fpdf_page/fpdf_page_image.cpp ./core/src/fpdfapi/fpdf_page/fpdf_page_parser.cpp ./core/src/fpdfapi/fpdf_page/fpdf_page_parser_old.cpp  ./core/src/fpdfapi/fpdf_page/fpdf_page_path.cpp  ./core/src/fpdfapi/fpdf_page/fpdf_page_pattern.cpp ./core/src/fpdfapi/fpdf_parser/fpdf_parser_decode.cpp ./core/src/fpdfapi/fpdf_parser/fpdf_parser_document.cpp ./core/src/fpdfapi/fpdf_parser/fpdf_parser_encrypt.cpp ./core/src/fpdfapi/fpdf_parser/fpdf_parser_fdf.cpp ./core/src/fpdfapi/fpdf_parser/fpdf_parser_filters.cpp ./core/src/fpdfapi/fpdf_parser/fpdf_parser_objects.cpp ./core/src/fpdfapi/fpdf_parser/fpdf_parser_parser.cpp ./core/src/fpdfapi/fpdf_parser/fpdf_parser_utility.cpp ./core/src/fpdfapi/fpdf_render/fpdf_render.cpp ./core/src/fpdfapi/fpdf_render/fpdf_render_cache.cpp ./core/src/fpdfapi/fpdf_render/fpdf_render_image.cpp ./core/src/fpdfapi/fpdf_render/fpdf_render_loadimage.cpp ./core/src/fpdfapi/fpdf_render/fpdf_render_pattern.cpp ./core/src/fpdfapi/fpdf_render/fpdf_render_text.cpp
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_basic_module.cpp	-o	fpdf_basic_module.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/Adobe-CNS1-UCS2_5.cpp	-o	Adobe-CNS1-UCS2_5.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/B5pc-H_0.cpp	-o	B5pc-H_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/B5pc-V_0.cpp	-o	B5pc-V_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/cmaps_cns1.cpp	-o	cmaps_cns1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/CNS-EUC-H_0.cpp	-o	CNS-EUC-H_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/CNS-EUC-V_0.cpp	-o	CNS-EUC-V_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/ETen-B5-H_0.cpp	-o	ETen-B5-H_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/ETen-B5-V_0.cpp	-o	ETen-B5-V_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/ETenms-B5-H_0.cpp	-o	ETenms-B5-H_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/ETenms-B5-V_0.cpp	-o	ETenms-B5-V_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/HKscs-B5-H_5.cpp	-o	HKscs-B5-H_5.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/HKscs-B5-V_5.cpp	-o	HKscs-B5-V_5.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/UniCNS-UCS2-H_3.cpp	-o	UniCNS-UCS2-H_3.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/UniCNS-UCS2-V_3.cpp	-o	UniCNS-UCS2-V_3.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/CNS1/UniCNS-UTF16-H_0.cpp	-o	UniCNS-UTF16-H_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/fpdf_cmaps.cpp	-o	fpdf_cmaps.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/Adobe-GB1-UCS2_5.cpp	-o	Adobe-GB1-UCS2_5.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/cmaps_gb1.cpp	-o	cmaps_gb1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/GB-EUC-H_0.cpp	-o	GB-EUC-H_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/GB-EUC-V_0.cpp	-o	GB-EUC-V_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/GBK-EUC-H_2.cpp	-o	GBK-EUC-H_2.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/GBK-EUC-V_2.cpp	-o	GBK-EUC-V_2.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/GBK2K-H_5.cpp	-o	GBK2K-H_5.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/GBK2K-V_5.cpp	-o	GBK2K-V_5.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/GBKp-EUC-H_2.cpp	-o	GBKp-EUC-H_2.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/GBKp-EUC-V_2.cpp	-o	GBKp-EUC-V_2.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/GBpc-EUC-H_0.cpp	-o	GBpc-EUC-H_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/GBpc-EUC-V_0.cpp	-o	GBpc-EUC-V_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/UniGB-UCS2-H_4.cpp	-o	UniGB-UCS2-H_4.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/GB1/UniGB-UCS2-V_4.cpp	-o	UniGB-UCS2-V_4.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/83pv-RKSJ-H_1.cpp	-o	fpdf_cmaps83pv-RKSJ-H_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/90ms-RKSJ-H_2.cpp	-o	fpdf_cmaps90ms-RKSJ-H_2.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/90ms-RKSJ-V_2.cpp	-o	fpdf_cmaps90ms-RKSJ-V_2.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/90msp-RKSJ-H_2.cpp	-o	fpdf_cmaps90msp-RKSJ-H_2.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/90msp-RKSJ-V_2.cpp	-o	fpdf_cmaps90msp-RKSJ-V_2.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/90pv-RKSJ-H_1.cpp	-o	fpdf_cmaps90pv-RKSJ-H_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/Add-RKSJ-H_1.cpp	-o	fpdf_cmapsAdd-RKSJ-H_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/Add-RKSJ-V_1.cpp	-o	fpdf_cmapsAdd-RKSJ-V_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/Adobe-Japan1-UCS2_4.cpp	-o	fpdf_cmapsAdobe-Japan1-UCS2_4.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/cmaps_japan1.cpp	-o	fpdf_cmapscmaps_japan1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/EUC-H_1.cpp	-o	fpdf_cmapsEUC-H_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/EUC-V_1.cpp	-o	fpdf_cmapsEUC-V_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/Ext-RKSJ-H_2.cpp	-o	fpdf_cmapsExt-RKSJ-H_2.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/Ext-RKSJ-V_2.cpp	-o	fpdf_cmapsExt-RKSJ-V_2.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/H_1.cpp	-o	fpdf_cmapsH_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-HW-H_4.cpp	-o	fpdf_cmapsUniJIS-UCS2-HW-H_4.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-HW-V_4.cpp	-o	fpdf_cmapsUniJIS-UCS2-HW-V_4.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-H_4.cpp	-o	fpdf_cmapsUniJIS-UCS2-H_4.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UCS2-V_4.cpp	-o	fpdf_cmapsUniJIS-UCS2-V_4.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UTF16-H_5.cpp	-o	fpdf_cmapsUniJIS-UTF16-H_5.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/UniJIS-UTF16-V_5.cpp	-o	fpdf_cmapsUniJIS-UTF16-V_5.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Japan1/V_1.cpp	-o	fpdf_cmapsV_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/Adobe-Korea1-UCS2_2.cpp	-o	Adobe-Korea1-UCS2_2.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/cmaps_korea1.cpp	-o	cmaps_korea1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/KSC-EUC-H_0.cpp	-o	KSC-EUC-H_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/KSC-EUC-V_0.cpp	-o	KSC-EUC-V_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-HW-H_1.cpp	-o	KSCms-UHC-HW-H_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-HW-V_1.cpp	-o	KSCms-UHC-HW-V_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-H_1.cpp	-o	KSCms-UHC-H_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/KSCms-UHC-V_1.cpp	-o	KSCms-UHC-V_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/KSCpc-EUC-H_0.cpp	-o	KSCpc-EUC-H_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/UniKS-UCS2-H_1.cpp	-o	UniKS-UCS2-H_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/UniKS-UCS2-V_1.cpp	-o	UniKS-UCS2-V_1.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_cmaps/Korea1/UniKS-UTF16-H_0.cpp	-o	UniKS-UTF16-H_0.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_edit/fpdf_edit_content.cpp	-o	fpdf_edit_content.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_edit/fpdf_edit_create.cpp	-o	fpdf_edit_create.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_edit/fpdf_edit_doc.cpp	-o	fpdf_edit_doc.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_edit/fpdf_edit_image.cpp	-o	fpdf_edit_image.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_font/fpdf_font.cpp	-o	fpdf_font.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_font/fpdf_font_charset.cpp	-o	fpdf_font_charset.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_font/fpdf_font_cid.cpp	-o	fpdf_font_cid.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_font/ttgsubtable.cpp	-o	ttgsubtable.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_page/fpdf_page.cpp	-o	fpdf_page.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_page/fpdf_page_colors.cpp	-o	fpdf_page_colors.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_page/fpdf_page_doc.cpp	-o	fpdf_page_doc.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_page/fpdf_page_func.cpp	-o	fpdf_page_func.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_page/fpdf_page_graph_state.cpp	-o	fpdf_page_graph_state.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_page/fpdf_page_image.cpp	-o	fpdf_page_image.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_page/fpdf_page_parser.cpp	-o	fpdf_page_parser.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_page/fpdf_page_parser_old.cpp	-o	fpdf_page_parser_old.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_page/fpdf_page_path.cpp	-o	fpdf_page_path.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_page/fpdf_page_pattern.cpp	-o	fpdf_page_pattern.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_parser/fpdf_parser_decode.cpp	-o	fpdf_parser_decode.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_parser/fpdf_parser_document.cpp	-o	fpdf_parser_document.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_parser/fpdf_parser_encrypt.cpp	-o	fpdf_parser_encrypt.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_parser/fpdf_parser_fdf.cpp	-o	fpdf_parser_fdf.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_parser/fpdf_parser_filters.cpp	-o	fpdf_parser_filters.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_parser/fpdf_parser_objects.cpp	-o	fpdf_parser_objects.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_parser/fpdf_parser_parser.cpp	-o	fpdf_parser_parser.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_parser/fpdf_parser_utility.cpp	-o	fpdf_parser_utility.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_render/fpdf_render.cpp	-o	fpdf_render.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_render/fpdf_render_cache.cpp	-o	fpdf_render_cache.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_render/fpdf_render_image.cpp	-o	fpdf_render_image.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_render/fpdf_render_loadimage.cpp	-o	fpdf_render_loadimage.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_render/fpdf_render_pattern.cpp	-o	fpdf_render_pattern.o
	$(CPP) $(INCLUDE) $(CFLAGS)		./core/src/fpdfapi/fpdf_render/fpdf_render_text.cpp	-o	fpdf_render_text.o

	$(AR) rcs libfpdfapi.a fpdf_basic_module.o Adobe-CNS1-UCS2_5.o B5pc-H_0.o B5pc-V_0.o cmaps_cns1.o CNS-EUC-H_0.o CNS-EUC-V_0.o ETen-B5-H_0.o ETen-B5-V_0.o ETenms-B5-H_0.o ETenms-B5-V_0.o HKscs-B5-H_5.o HKscs-B5-V_5.o UniCNS-UCS2-H_3.o UniCNS-UCS2-V_3.o UniCNS-UTF16-H_0.o fpdf_cmaps.o Adobe-GB1-UCS2_5.o cmaps_gb1.o GB-EUC-H_0.o GB-EUC-V_0.o GBK-EUC-H_2.o GBK-EUC-V_2.o GBK2K-H_5.o GBK2K-V_5.o GBKp-EUC-H_2.o GBKp-EUC-V_2.o GBpc-EUC-H_0.o GBpc-EUC-V_0.o UniGB-UCS2-H_4.o UniGB-UCS2-V_4.o fpdf_cmaps83pv-RKSJ-H_1.o fpdf_cmaps90ms-RKSJ-H_2.o fpdf_cmaps90ms-RKSJ-V_2.o fpdf_cmaps90msp-RKSJ-H_2.o fpdf_cmaps90msp-RKSJ-V_2.o fpdf_cmaps90pv-RKSJ-H_1.o fpdf_cmapsAdd-RKSJ-H_1.o fpdf_cmapsAdd-RKSJ-V_1.o fpdf_cmapsAdobe-Japan1-UCS2_4.o fpdf_cmapscmaps_japan1.o fpdf_cmapsEUC-H_1.o fpdf_cmapsEUC-V_1.o fpdf_cmapsExt-RKSJ-H_2.o fpdf_cmapsExt-RKSJ-V_2.o fpdf_cmapsH_1.o fpdf_cmapsUniJIS-UCS2-HW-H_4.o fpdf_cmapsUniJIS-UCS2-HW-V_4.o fpdf_cmapsUniJIS-UCS2-H_4.o fpdf_cmapsUniJIS-UCS2-V_4.o fpdf_cmapsUniJIS-UTF16-H_5.o fpdf_cmapsUniJIS-UTF16-V_5.o fpdf_cmapsV_1.o Adobe-Korea1-UCS2_2.o cmaps_korea1.o KSC-EUC-H_0.o KSC-EUC-V_0.o KSCms-UHC-HW-H_1.o KSCms-UHC-HW-V_1.o KSCms-UHC-H_1.o KSCms-UHC-V_1.o KSCpc-EUC-H_0.o UniKS-UCS2-H_1.o UniKS-UCS2-V_1.o UniKS-UTF16-H_0.o fpdf_edit_content.o fpdf_edit_create.o fpdf_edit_doc.o fpdf_edit_image.o fpdf_font.o fpdf_font_charset.o fpdf_font_cid.o ttgsubtable.o fpdf_page.o fpdf_page_colors.o fpdf_page_doc.o fpdf_page_func.o fpdf_page_graph_state.o fpdf_page_image.o fpdf_page_parser.o fpdf_page_parser_old.o fpdf_page_path.o fpdf_page_pattern.o fpdf_parser_decode.o fpdf_parser_document.o fpdf_parser_encrypt.o fpdf_parser_fdf.o fpdf_parser_filters.o fpdf_parser_objects.o fpdf_parser_parser.o fpdf_parser_utility.o fpdf_render.o fpdf_render_cache.o fpdf_render_image.o fpdf_render_loadimage.o fpdf_render_pattern.o fpdf_render_text.o 

clean:
	rm -f libfpdfapi.a
