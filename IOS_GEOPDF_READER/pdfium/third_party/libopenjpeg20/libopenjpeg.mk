INCLUDE=-I.

libfx_libopenjpeg.a: bio.c cio.c dwt.c event.c function_list.c image.c invert.c j2k.c jp2.c mct.c mqc.c openjpeg.c opj_clock.c pi.c raw.c t1.c t2.c tcd.c tgt.c
		$(CC) $(INCLUDE) $(CFLAGS)	bio.c 	-o	bio.o 
	$(CC) $(INCLUDE) $(CFLAGS)	cio.c	-o	cio.o
	$(CC) $(INCLUDE) $(CFLAGS)	dwt.c	-o	dwt.o
	$(CC) $(INCLUDE) $(CFLAGS)	event.c	-o	event.o
	$(CC) $(INCLUDE) $(CFLAGS)	function_list.c	-o	function_list.o
	$(CC) $(INCLUDE) $(CFLAGS)	image.c	-o	image.o
	$(CC) $(INCLUDE) $(CFLAGS)	invert.c	-o	invert.o
	$(CC) $(INCLUDE) $(CFLAGS)	j2k.c	-o	j2k.o
	$(CC) $(INCLUDE) $(CFLAGS)	jp2.c	-o	jp2.o
	$(CC) $(INCLUDE) $(CFLAGS)	mct.c	-o	mct.o
	$(CC) $(INCLUDE) $(CFLAGS)	mqc.c	-o	mqc.o
	$(CC) $(INCLUDE) $(CFLAGS)	openjpeg.c	-o	openjpeg.o
	$(CC) $(INCLUDE) $(CFLAGS)	opj_clock.c	-o	opj_clock.o
	$(CC) $(INCLUDE) $(CFLAGS)	pi.c	-o	pi.o
	$(CC) $(INCLUDE) $(CFLAGS)	raw.c	-o	raw.o
	$(CC) $(INCLUDE) $(CFLAGS)	t1.c	-o	t1.o
	$(CC) $(INCLUDE) $(CFLAGS)	t2.c	-o	t2.o
	$(CC) $(INCLUDE) $(CFLAGS)	tcd.c	-o	tcd.o
	$(CC) $(INCLUDE) $(CFLAGS)	tgt.c	-o	tgt.o
	$(AR) rcs libfx_libopenjpeg.a bio.o cio.o dwt.o event.o function_list.o image.o invert.o j2k.o jp2.o mct.o mqc.o openjpeg.o opj_clock.o pi.o raw.o t1.o t2.o tcd.o tgt.o
	
clean:
	rm -f *.o
	rm -f *.a