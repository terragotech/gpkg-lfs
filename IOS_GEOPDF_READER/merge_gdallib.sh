#!/bin/sh
#This script mergers the static library
lipo ./gdal210/armv7/libgdal.a ./gdal210/armv7s/libgdal.a ./gdal210/arm64/libgdal.a ./gdal210/X86_64/libgdal.a ./gdal210/i386/libgdal.a -output ./merged/libgdal.a -create