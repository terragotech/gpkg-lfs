#fx_lcms2
CC=aarch64-linux-android-gcc
CPP=aarch64-linux-android-clang++
AR=aarch64-linux-android-ar
CFLAGS=-c
INCLUDE=-I./core/include/fdrm


libfdrm.a: ./core/src/fdrm/crypto/fx_crypt.cpp ./core/src/fdrm/crypto/fx_crypt_aes.cpp ./core/src/fdrm/crypto/fx_crypt_sha.cpp
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fdrm/crypto/fx_crypt.cpp	-o	fx_crypt.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fdrm/crypto/fx_crypt_aes.cpp	-o	fx_crypt_aes.o
	$(CC) $(INCLUDE) $(CFLAGS)		./core/src/fdrm/crypto/fx_crypt_sha.cpp	-o	fx_crypt_sha.o

	$(AR) rcs libfdrm.a fx_crypt.o fx_crypt_aes.o fx_crypt_sha.o
clean:
	rm -f libfdrm.a
