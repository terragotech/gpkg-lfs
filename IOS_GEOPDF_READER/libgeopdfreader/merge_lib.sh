#!/bin/sh
#This script mergers the static library
lipo ./sim/x86_64/libgeopdfreader.a ./sim/i386/libgeopdfreader.a ./device/armv7/libgeopdfreader.a ./device/armv7s/libgeopdfreader.a ./device/arm64/libgeopdfreader.a -output ./merged/libgeopdfreader.a -create