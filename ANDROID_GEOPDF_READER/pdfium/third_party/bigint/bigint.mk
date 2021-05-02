#bigint
CC=aarch64-linux-android-gcc
CPP=aarch64-linux-android-clang++
AR=aarch64-linux-android-ar
CFLAGS=-c
INCLUDE=-I.

libbigint.a: BigInteger.cc BigIntegerUtils.cc BigUnsigned.cc BigUnsignedInABase.cc
	$(CC) $(INCLUDE) $(CFLAGS) BigInteger.cc -o BigInteger.o
	$(CC) $(INCLUDE) $(CFLAGS) BigIntegerUtils.cc -o BigIntegerUtils.o
	$(CC) $(INCLUDE) $(CFLAGS) BigUnsigned.cc -o BigUnsigned.o
	$(CC) $(INCLUDE) $(CFLAGS) BigUnsignedInABase.cc -o BigUnsignedInABase.o
	$(AR) rcs libbigint.a BigInteger.o BigIntegerUtils.o BigUnsigned.o BigUnsignedInABase.o

clean:
	rm -f *.o
	rm -f *.a
