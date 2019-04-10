./clean-build.sh
cd o
rm -f *.o
cd ..
./start-build.sh armv7s iphoneos
export GDAL_OBJ=./o/*.o
rm libgdal.a
ar -cr libgdal.a $GDAL_OBJ
cp libgdal.a ./armv7s/
