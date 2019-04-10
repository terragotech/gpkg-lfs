ogr2kmlgeometry.o:
	$(CXX) $(CORE_INCLUDE) $(PORT_INCLUDE) $(OGR_INCLUDE) $(CXXFLAGS) -c ogr2kmlgeometry.cpp
	$(CXX) $(CORE_INCLUDE) $(PORT_INCLUDE) $(OGR_INCLUDE) $(OGR_INCLUDE)/ogrsf_frmts $(CXXFLAGS) -c ogrkmldriver.cpp
	$(CXX) $(CORE_INCLUDE) $(PORT_INCLUDE) $(OGR_INCLUDE) $(OGR_INCLUDE)/ogrsf_frmts $(CXXFLAGS) -c ogrkmldatasource.cpp
	$(CXX) $(CORE_INCLUDE) $(PORT_INCLUDE) $(OGR_INCLUDE) $(OGR_INCLUDE)/ogrsf_frmts $(CXXFLAGS) -c ogrkmllayer.cpp

clean:
	rm -f *.o
