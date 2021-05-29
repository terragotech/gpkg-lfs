INCLUDE=-I../frmts/zlib -DHAVE_LIBZ=1 
libport.a: cpl_conv.cpp cpl_error.cpp cpl_string.cpp cplgetsymbol.cpp cplstringlist.cpp cpl_strtod.cpp cpl_path.cpp cpl_csv.cpp cpl_findfile.cpp cpl_minixml.cpp cpl_multiproc.cpp cpl_list.cpp cpl_getexecpath.cpp cplstring.cpp cpl_vsil_win32.cpp cpl_vsisimple.cpp cpl_vsil.cpp cpl_vsi_mem.cpp cpl_vsil_unix_stdio_64.cpp cpl_http.cpp cpl_hash_set.cpp cplkeywordparser.cpp cpl_recode.cpp cpl_recode_iconv.cpp cpl_recode_stub.cpp cpl_quad_tree.cpp cpl_atomic_ops.cpp cpl_vsil_subfile.cpp cpl_time.cpp cpl_vsil_stdout.cpp cpl_vsil_sparsefile.cpp cpl_vsil_abstract_archive.cpp cpl_vsil_tar.cpp cpl_vsil_stdin.cpp cpl_vsil_buffered_reader.cpp cpl_base64.cpp cpl_vsil_curl.cpp cpl_vsil_curl_streaming.cpp cpl_vsil_cache.cpp cpl_xml_validate.cpp cpl_spawn.cpp cpl_google_oauth2.cpp cpl_progress.cpp cpl_virtualmem.cpp cpl_worker_thread_pool.cpp cpl_vsil_crypt.cpp cpl_sha256.cpp cpl_aws.cpp cpl_vsi_error.cpp cpl_vsil_gzip.cpp cpl_minizip_ioapi.cpp cpl_minizip_unzip.cpp cpl_minizip_zip.cpp
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_conv.cpp		-o	cpl_conv.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_error.cpp		-o	cpl_error.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_string.cpp		-o	cpl_string.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cplgetsymbol.cpp		-o	cplgetsymbol.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cplstringlist.cpp		-o	cplstringlist.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_strtod.cpp		-o	cpl_strtod.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_path.cpp		-o	cpl_path.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_csv.cpp		-o	cpl_csv.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_findfile.cpp		-o	cpl_findfile.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_minixml.cpp		-o	cpl_minixml.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_multiproc.cpp		-o	cpl_multiproc.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_list.cpp		-o	cpl_list.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_getexecpath.cpp		-o	cpl_getexecpath.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cplstring.cpp		-o	cplstring.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_win32.cpp		-o	cpl_vsil_win32.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsisimple.cpp		-o	cpl_vsisimple.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil.cpp		-o	cpl_vsil.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsi_mem.cpp		-o	cpl_vsi_mem.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_unix_stdio_64.cpp		-o	cpl_vsil_unix_stdio_64.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_http.cpp		-o	cpl_http.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_hash_set.cpp		-o	cpl_hash_set.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cplkeywordparser.cpp		-o	cplkeywordparser.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_recode.cpp		-o	cpl_recode.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_recode_iconv.cpp		-o	cpl_recode_iconv.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_recode_stub.cpp		-o	cpl_recode_stub.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_quad_tree.cpp		-o	cpl_quad_tree.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_atomic_ops.cpp		-o	cpl_atomic_ops.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_subfile.cpp		-o	cpl_vsil_subfile.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_time.cpp		-o	cpl_time.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_stdout.cpp		-o	cpl_vsil_stdout.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_sparsefile.cpp		-o	cpl_vsil_sparsefile.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_abstract_archive.cpp		-o	cpl_vsil_abstract_archive.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_tar.cpp		-o	cpl_vsil_tar.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_stdin.cpp		-o	cpl_vsil_stdin.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_buffered_reader.cpp		-o	cpl_vsil_buffered_reader.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_base64.cpp		-o	cpl_base64.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_curl.cpp		-o	cpl_vsil_curl.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_curl_streaming.cpp		-o	cpl_vsil_curl_streaming.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_cache.cpp		-o	cpl_vsil_cache.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_xml_validate.cpp		-o	cpl_xml_validate.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_spawn.cpp		-o	cpl_spawn.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_google_oauth2.cpp		-o	cpl_google_oauth2.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_progress.cpp		-o	cpl_progress.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_virtualmem.cpp		-o	cpl_virtualmem.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_worker_thread_pool.cpp		-o	cpl_worker_thread_pool.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_crypt.cpp		-o	cpl_vsil_crypt.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_sha256.cpp		-o	cpl_sha256.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_aws.cpp		-o	cpl_aws.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsi_error.cpp		-o	cpl_vsi_error.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_vsil_gzip.cpp		-o	cpl_vsil_gzip.o	
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_minizip_ioapi.cpp		-o	cpl_minizip_ioapi.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_minizip_unzip.cpp		-o	cpl_minizip_unzip.o
	$(CPP) $(INCLUDE) $(CXXFLAGS)		cpl_minizip_zip.cpp		-o	cpl_minizip_zip.o

clean:
	rm -f *.o