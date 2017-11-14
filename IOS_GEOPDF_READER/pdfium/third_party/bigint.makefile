CFLAGS_Release := -Wall -W -Wno-missing-field-initializers -Wno-sign-compare -Wno-unused-parameter -pthread -fno-exceptions -fPIC -fno-strict-aliasing -fdata-sections -ffunction-sections -O3 -O2
CFLAGS_CC_Release := -std=c++0x -Wnon-virtual-dtor -fno-rtti
DEFS_Release := '-DOPJ_STATIC' '-D_CRT_SECURE_NO_WARNINGS' '-DV8_DEPRECATION_WARNINGS'
CUS_CFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_Release)
CUS_CXXFLAGS := $(DEFS_Release) $(CFLAGS_Release) $(CFLAGS_CC_Release)
CUS_INCLUDES := -I./bigint
CUS_LIB := -lstdc++
libbigint.a:
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./bigint/BigInteger.cc -o ./bigint/BigInteger.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./bigint/BigIntegerUtils.cc -o ./bigint/BigIntegerUtils.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./bigint/BigUnsigned.cc -o ./bigint/BigUnsigned.o
	$(CXX) $(CFLAGS) $(LDFLAGS) $(CUS_CFLAGS) $(CUS_CXXFLAGS) $(CUS_INCLUDES) $(CUS_LIB) -c ./bigint/BigUnsignedInABase.cc -o ./bigint/BigUnsignedInABase.o
	ar rcs ./bigint/libbigint.a ./bigint/*.o
	rm ./bigint/*.o

clean:
	rm ./bigint/libbigint.a


