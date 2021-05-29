INCLUDE=-I./core/include/fxcodec$(CXXFLAGS) 

libfxcodec.a: ./core/src/fxcodec/codec/fx_codec.cpp ./core/src/fxcodec/codec/fx_codec_fax.cpp ./core/src/fxcodec/codec/fx_codec_flate.cpp ./core/src/fxcodec/codec/fx_codec_icc.cpp ./core/src/fxcodec/codec/fx_codec_jbig.cpp ./core/src/fxcodec/codec/fx_codec_jbig_enc.cpp ./core/src/fxcodec/codec/fx_codec_jpeg.cpp ./core/src/fxcodec/codec/fx_codec_jpx_opj.cpp ./core/src/fxcodec/jbig2/JBig2_ArithIntDecoder.cpp ./core/src/fxcodec/jbig2/JBig2_Context.cpp ./core/src/fxcodec/jbig2/JBig2_GeneralDecoder.cpp ./core/src/fxcodec/jbig2/JBig2_HuffmanDecoder.cpp ./core/src/fxcodec/jbig2/JBig2_HuffmanTable.cpp ./core/src/fxcodec/jbig2/JBig2_Image.cpp ./core/src/fxcodec/jbig2/JBig2_Object.cpp ./core/src/fxcodec/jbig2/JBig2_PatternDict.cpp ./core/src/fxcodec/jbig2/JBig2_Segment.cpp ./core/src/fxcodec/jbig2/JBig2_SymbolDict.cpp
	$(CPP) $(INCLUDE) $(CXXFLAGS) 		./core/src/fxcodec/codec/fx_codec.cpp       -o      fx_codec.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/codec/fx_codec_fax.cpp	-o	fx_codec_fax.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/codec/fx_codec_flate.cpp	-o	fx_codec_flate.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/codec/fx_codec_icc.cpp	-o	fx_codec_icc.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/codec/fx_codec_jbig.cpp	-o	fx_codec_jbig.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/codec/fx_codec_jbig_enc.cpp	-o	fx_codec_jbig_enc.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/codec/fx_codec_jpeg.cpp	-o	fx_codec_jpeg.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/codec/fx_codec_jpx_opj.cpp	-o	fx_codec_jpx_opj.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/jbig2/JBig2_ArithIntDecoder.cpp	-o	JBig2_ArithIntDecoder.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/jbig2/JBig2_Context.cpp	-o	JBig2_Context.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/jbig2/JBig2_GeneralDecoder.cpp	-o	JBig2_GeneralDecoder.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/jbig2/JBig2_HuffmanDecoder.cpp	-o	JBig2_HuffmanDecoder.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/jbig2/JBig2_HuffmanTable.cpp	-o	JBig2_HuffmanTable.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/jbig2/JBig2_Image.cpp	-o	JBig2_Image.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/jbig2/JBig2_Object.cpp	-o	JBig2_Object.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/jbig2/JBig2_PatternDict.cpp	-o	JBig2_PatternDict.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/jbig2/JBig2_Segment.cpp	-o	JBig2_Segment.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		./core/src/fxcodec/jbig2/JBig2_SymbolDict.cpp	-o	JBig2_SymbolDict.o

	$(AR) rcs libfxcodec.a fx_codec.o fx_codec_fax.o fx_codec_flate.o fx_codec_icc.o fx_codec_jbig.o fx_codec_jbig_enc.o fx_codec_jpeg.o fx_codec_jpx_opj.o JBig2_ArithIntDecoder.o JBig2_Context.o JBig2_GeneralDecoder.o JBig2_HuffmanDecoder.o JBig2_HuffmanTable.o JBig2_Image.o JBig2_Object.o JBig2_PatternDict.o JBig2_Segment.o JBig2_SymbolDict.o

clean:
	rm -f libfxcodec.a


