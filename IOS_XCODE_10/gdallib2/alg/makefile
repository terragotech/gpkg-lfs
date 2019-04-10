gdalmediancut.o: gdalmediancut.cpp	
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalmediancut.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdaldither.cpp
	$(CC) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CFLAGS) -c gdal_crs.c
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdaltransformer.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalsimplewarp.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalwarper.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalwarpkernel.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalwarpoperation.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalchecksum.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdal_rpc.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdal_tps.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c thinplatespline.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c llrasterize.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(OGR_INCLUDE)/ogrsf_frmts $(CXXFLAGS) -c gdalrasterize.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalgeoloc.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalgrid.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalcutline.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalproximity.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c rasterfill.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalrasterpolygonenumerator.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalsievefilter.cpp
	$(CC) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CFLAGS) -c gdalwarpkernel_opencl.c
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c polygonize.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c contour.cpp gdaltransformgeolocs.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdal_octave.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdal_simplesurf.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalmatching.cpp
	$(CC) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CFLAGS) -c delaunay.c
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE)  $(CXXFLAGS) -c gdalpansharpen.cpp

clean:
	rm -f *.o