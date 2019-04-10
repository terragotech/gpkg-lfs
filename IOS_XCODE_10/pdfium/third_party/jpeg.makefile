DEFS_Release := '-DOPJ_STATIC' '-D_CRT_SECURE_NO_WARNINGS' '-DV8_DEPRECATION_WARNINGS' '-DFT2_BUILD_LIBRARY'
CFLAGS_Release := -Wall -W -Wno-missing-field-initializers -Wno-sign-compare -Wno-unused-parameter -pthread -fno-exceptions -fPIC -fno-strict-aliasing -fdata-sections -ffunction-sections -O3 -O2

CUS_LIB := -lstdc++

CUS_CFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_Release)
CUS_CXXFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_CC_Release)
CUS_INCLUDES := -I./libjpeg
CUS_LIB := -lstdc++
libfx_libjpeg.a:
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcapimin.c -o ./libjpeg/fpdfapi_jcapimin.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcapistd.c -o ./libjpeg/fpdfapi_jcapistd.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jccoefct.c -o ./libjpeg/fpdfapi_jccoefct.o 
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jccolor.c -o ./libjpeg/fpdfapi_jccolor.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcdctmgr.c -o ./libjpeg/fpdfapi_jcdctmgr.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jchuff.c -o ./libjpeg/fpdfapi_jchuff.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcinit.c -o ./libjpeg/fpdfapi_jcinit.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcmainct.c -o ./libjpeg/fpdfapi_jcmainct.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcmarker.c -o ./libjpeg/fpdfapi_jcmarker.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcmaster.c -o ./libjpeg/fpdfapi_jcmaster.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcomapi.c -o ./libjpeg/fpdfapi_jcomapi.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcparam.c -o ./libjpeg/fpdfapi_jcparam.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcphuff.c -o ./libjpeg/fpdfapi_jcphuff.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcprepct.c -o ./libjpeg/fpdfapi_jcprepct.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jcsample.c -o ./libjpeg/fpdfapi_jcsample.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jctrans.c -o ./libjpeg/fpdfapi_jctrans.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdapimin.c -o ./libjpeg/fpdfapi_jdapimin.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdapistd.c -o ./libjpeg/fpdfapi_jdapistd.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdcoefct.c -o ./libjpeg/fpdfapi_jdcoefct.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdcolor.c -o ./libjpeg/fpdfapi_jdcolor.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jddctmgr.c -o ./libjpeg/fpdfapi_jddctmgr.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdhuff.c -o ./libjpeg/fpdfapi_jdhuff.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdinput.c -o ./libjpeg/fpdfapi_jdinput.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdmainct.c -o ./libjpeg/fpdfapi_jdmainct.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdmarker.c -o ./libjpeg/fpdfapi_jdmarker.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdmaster.c -o ./libjpeg/fpdfapi_jdmaster.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdmerge.c -o ./libjpeg/fpdfapi_jdmerge.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdphuff.c -o ./libjpeg/fpdfapi_jdphuff.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdpostct.c -o ./libjpeg/fpdfapi_jdpostct.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdsample.c -o ./libjpeg/fpdfapi_jdsample.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jdtrans.c -o ./libjpeg/fpdfapi_jdtrans.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jerror.c -o ./libjpeg/fpdfapi_jerror.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jfdctfst.c -o ./libjpeg/fpdfapi_jfdctfst.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jfdctint.c -o ./libjpeg/fpdfapi_jfdctint.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jidctfst.c -o ./libjpeg/fpdfapi_jidctfst.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jidctint.c -o ./libjpeg/fpdfapi_jidctint.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jidctred.c -o ./libjpeg/fpdfapi_jidctred.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jmemmgr.c -o ./libjpeg/fpdfapi_jmemmgr.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jmemnobs.c -o ./libjpeg/fpdfapi_jmemnobs.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./libjpeg/fpdfapi_jutils.c -o ./libjpeg/fpdfapi_jutils.o

	ar rcs ./libjpeg/libfx_libjpeg.a ./libjpeg/*.o
	rm ./libjpeg/*.o

clean:
	rm ./libfx_libjpeg.a