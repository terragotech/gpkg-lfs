#!/bin/bash
#This script generated compiler tool chain for all targets for specified platform
#Check if there exists two parameters
if [ $# -lt 2 ]
then
   echo less number of parameters
   echo ./all-tools.sh android-ndk-folder android-platform-no
   echo  
   echo example:
   echo ./all-tools.sh android-ndk-r14b android-21
else
for f in "arm" "arm64" "mips" "mips64" "x86" "x86_64"; do
echo Building $f
$1/build/tools/make-standalone-toolchain.sh --arch=$f --platform=$2 --install-dir=$2-$f
done
fi


