gdalallregister.o:
		$(CXX) -DFRMT_gtiff -DFRMT_hfa -DFRMT_jpeg -DFRMT_png -DFRMT_raw -DFRMT_mem -DFRMT_vrt  -DFRMT_pdf $(OGR_INCLUDE) $(OGRFRMTS_INCLUDE) $(PORT_INCLUDE) $(CORE_INCLUDE) $(CXXFLAGS) -c gdalallregister.cpp

clean:
	rm -f *.o
