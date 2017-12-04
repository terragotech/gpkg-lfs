#/bin/sh

# ./build-lin.sh all: do the gyp, download, build, normal and copy steps

# ./build-lin.sh gyp : download and installs gyp
# ./build-lin.sh download : download pdfium
# ./build-lin.sh build: build pdfium
# ./build-lin.sh normal : make a static library from the build
# ./build-lin.sh copy : copy static library to install prefix

# ./build-lin.sh link : make a pseudo install with symbolic links

# You may edit the following variables:

cd pdfium
rm -rf out/
cd ..
SUDO=
PREFIX=$3/pdfium/install
#SUDO=sudo
#PREFIX=/usr/local

PROCS=4

BUILDTYPE=Release
#BUILDTYPE=Debug


set -e
export PATH=`pwd`/pdfium_deps/depot_tools:$PATH
export PYTHONPATH=$PWD/pdfium_deps/gyp/build/`ls $PWD/pdfium_deps/gyp/build`
###########################################
#cross complie for linux 
export ANDROID_PATH=$1
export PATH=$PATH:$ANDROID_PATH
export AR=$2-ar
export AS=$2-as
export LD=$2-ld
export NM=$2-nm
export RANLIB=$2-ranlib
export CC=$2-gcc
export CXX=$2-g++
#export CFLAGS="-mthumb"
#export CXXFLAGS="-mthumb" LIBS="-lsupc++ -lstdc++"
export LIBS="-lsupc++ -lstdc++"


############################################
cd pdfium
./build/gyp_pdfium


make -j$PROCS BUILDTYPE=$BUILDTYPE \
    pdfium \
    fdrm \
    fpdfdoc \
    fpdfapi \
    fpdftext \
    fxcodec \
    fxcrt \
    fxge \
    fxedit \
    pdfwindow \
    formfiller

    # third_party targets
    make -j$PROCS BUILDTYPE=$BUILDTYPE \
    bigint \
    freetype \
    fx_agg \
    fx_lcms2 \
    fx_zlib \
    pdfium_base \
    fx_libjpeg \
    fx_libopenjpeg

    cd ..
cd pdfium/out/$BUILDTYPE/obj.target
  for lib in `find -name '*.a'`;
      do ar -t $lib | xargs ar rvs $lib.new && mv -v $lib.new $lib;
  done

  cd third_party
  for lib in `find -name '*.a'`;
      do ar -t $lib | xargs ar rvs $lib.new && mv -v $lib.new $lib;
  done

#cd pdfium/out/$BUILDTYPE/obj.target/

  cd ../../../../..
 # Copy libraries into $PREFIX
  $SUDO mkdir -p $PREFIX/lib/pdfium
  $SUDO cp pdfium/out/$BUILDTYPE/obj.target/lib*.a $PREFIX/lib/pdfium/
  $SUDO cp pdfium/out/$BUILDTYPE/obj.target/third_party/lib*.a $PREFIX/lib/pdfium/
  
  # Copy all headers
  $SUDO mkdir -p $PREFIX/include/pdfium/fpdfsdk/include
  $SUDO mkdir -p $PREFIX/include/pdfium/core/include
  $SUDO mkdir -p $PREFIX/include/pdfium/third_party/base/numerics
  $SUDO mkdir -p $PREFIX/include/pdfium/public
  $SUDO cp -r pdfium/public/*.h $PREFIX/include/pdfium/
  $SUDO cp -r pdfium/public/*.h $PREFIX/include/pdfium/public
  $SUDO cp -r pdfium/fpdfsdk/include/* $PREFIX/include/pdfium/fpdfsdk/include/
  $SUDO cp -r pdfium/core/include/* $PREFIX/include/pdfium/core/include
  $SUDO cp -r pdfium/third_party/base/numerics/* $PREFIX/include/pdfium/third_party/base/numerics
  $SUDO cp -r pdfium/third_party/base/* $PREFIX/include/pdfium/third_party/base/

  echo "./configure --with-pdfium=$PREFIX"

