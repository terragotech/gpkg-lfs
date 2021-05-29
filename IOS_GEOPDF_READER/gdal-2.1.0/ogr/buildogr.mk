INCLUDE=-I. -I.. -I../port -I../alg -I../gcore -I./ogrsf_frmts/ -I./ogrsf_frmts/mem
OBJ = ogrgeometryfactory.o \
	ogrpoint.o \
	ogrcurve.o \
	ogrlinestring.o \
	ogrlinearring.o \
	ogrpolygon.o \
	ogrutils.o \
	ogrgeometry.o \
	ogrgeometrycollection.o \
	ogrmultipolygon.o \
	ogrsurface.o \
	ogrmultipoint.o \
	ogrmultilinestring.o \
    ogrcircularstring.o \
    ogrcompoundcurve.o \
    ogrcurvepolygon.o \
    ogrcurvecollection.o \
    ogrmulticurve.o \
    ogrmultisurface.o \
	ogr_api.o \
	ogrfeature.o \
	ogrfeaturedefn.o \
	ogrfeaturequery.o\
	ogrfeaturestyle.o \
	ogrfielddefn.o \
	ogrspatialreference.o \
	ogr_srsnode.o \
	ogr_srs_proj4.o \
	ogr_fromepsg.o \
	ogrct.o \
	ogr_opt.o \
	ogr_srs_esri.o \
	ogr_srs_pci.o \
	ogr_srs_usgs.o \
	ogr_srs_dict.o \
	ogr_srs_panorama.o \
	ogr_srs_ozi.o \
	ogr_srs_erm.o \
	swq.o \
	swq_expr_node.o \
	swq_parser.o \
	swq_select.o \
	swq_op_registrar.o \
	swq_op_general.o \
	ogr_srs_validate.o \
	ogr_srs_xml.o \
	ograssemblepolygon.o \
	ogr2gmlgeometry.o \
	gml2ogrgeometry.o \
	ogr_expat.o \
	ogrpgeogeometry.o \
	ogrgeomediageometry.o \
	ogr_geocoding.o \
       ogrgeomfielddefn.o \
    ograpispy.o

EXTRAFLAGS = -I../../proj4/arm64/include
	
%.o: %.cpp
	$(CPP) $(INCLUDE) $(EXTRAFLAGS) $(CXXFLAGS) -o $@ $<
	

libogr.a: $(OBJ)
	$(CC) $(INCLUDE) $(EXTRAFLAGS) $(CFLAGS) osr_cs_wkt.c -o osr_cs_wkt.o
	$(CC) $(INCLUDE) $(EXTRAFLAGS) $(CFLAGS) osr_cs_wkt_parser.c -o osr_cs_wkt_parser.o
	ar rcs libogr.a *.o

clean:
	rm -f libogr.a
	rm -f *.o
	