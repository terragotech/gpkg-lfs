#!/bin/bash
export TP=$PWD/pdfiumBuild/device/pdfium/install
cd libgeopdfreader
./build-i-dev-all.sh $TP
./build-i-sim-lib-x86_64.sh $TP