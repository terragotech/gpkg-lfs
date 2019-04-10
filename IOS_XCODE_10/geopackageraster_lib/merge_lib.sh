#!/bin/sh
#This script mergers the static library
lipo ./sim/x86_64/libestimator.a ./sim/i386/libestimator.a ./device/armv7/libestimator.a ./device/armv7s/libestimator.a ./device/arm64/libestimator.a -output ./merged/libestimator.a -create