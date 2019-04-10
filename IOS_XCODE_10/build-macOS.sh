./clean-build.sh
cd o
rm -f *.o
cd ..
./start-build2.sh x86_64 macosx
export GDAL_OBJ=./o/*.o
rm libgdal.a
ar -cr libgdal.a $GDAL_OBJ
cp libgdal.a ./macosx/
