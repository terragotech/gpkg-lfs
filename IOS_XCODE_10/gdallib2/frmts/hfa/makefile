hfaopen.o: hfaopen.cpp
	$(CXX) $(PORT_INCLUDE) $(CXXFLAGS) -c hfaopen.cpp
	$(CXX) $(PORT_INCLUDE) $(CXXFLAGS) -c hfaentry.cpp 
	$(CXX) $(PORT_INCLUDE) $(CXXFLAGS) -c hfadictionary.cpp 
	$(CXX) $(PORT_INCLUDE) $(CXXFLAGS) -c hfafield.cpp 
	$(CXX) $(PORT_INCLUDE) $(CXXFLAGS) -c hfatype.cpp 
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE) $(CXXFLAGS) -c hfaband.cpp 
	$(CXX) $(CORE_INCLUDE) $(PORT_INCLUDE) $(CXXFLAGS) -c hfacompress.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE) $(CXXFLAGS) -c hfadataset.cpp
	$(CXX) $(OGR_INCLUDE) $(CORE_INCLUDE) $(PORT_INCLUDE) $(CXXFLAGS) -c hfa_overviews.cpp

clean:
	rm -f *.o