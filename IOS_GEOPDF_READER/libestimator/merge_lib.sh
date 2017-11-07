#!/bin/sh
#This script mergers the static library
lipo ./sim/libestimator.a ./device/armv7/libestimator.a ./device/armv7s/libestimator.a ./device/arm64/libestimator.a -output ./merged/libestimator.a -create