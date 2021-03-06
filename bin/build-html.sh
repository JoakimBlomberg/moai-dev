#!/bin/bash

#
# Build script for Html5 Host
# Usage: Run from Moai SDK's root directory:
#
# ./bin/build-html.sh
#
# You can change the CMake options using -DOPTION=VALUE
# Check moai-dev/cmake/CMakeLists.txt for all the available options.
#
# The modules that are set in FALSE are not working or tested
#
# Please, check cmake/[module] for more info.
#
# Thanks!

: ${EMSCRIPTEN_HOME?"EMSCRIPTEN_HOME is not defined. Please set to the location of your emscripten install (path)"}

cd `dirname $0`/..
cd cmake
rm -rf build
mkdir build
cd build
cmake \
-DEMSCRIPTEN_ROOT_PATH=${EMSCRIPTEN_HOME} \
-DCMAKE_TOOLCHAIN_FILE=${EMSCRIPTEN_HOME}/cmake/Modules/Platform/Emscripten.cmake \
-DCMAKE_BUILD_TYPE=Debug \
-G "Unix Makefiles" \
-DBUILD_HTML=TRUE \
-DMOAI_BOX2D=TRUE \
-DMOAI_CHIPMUNK=FALSE \
-DMOAI_CURL=FALSE \
-DMOAI_CRYPTO=FALSE \
-DMOAI_EXPAT=FALSE \
-DMOAI_FREETYPE=TRUE \
-DMOAI_JSON=TRUE \
-DMOAI_JPG=FALSE \
-DMOAI_MONGOOSE=FALSE \
-DMOAI_OGG=FALSE \
-DMOAI_OPENSSL=FALSE \
-DMOAI_SQLITE3=FALSE \
-DMOAI_TINYXML=TRUE \
-DMOAI_PNG=TRUE \
-DMOAI_SFMT=FALSE \
-DMOAI_VORBIS=FALSE \
-DMOAI_HTTP_CLIENT=FALSE \
-DMOAI_UNTZ=TRUE \
-DPLUGIN_SKYTURNS-GEOMETRY-GENERATOR=1 \
-DPLUGIN_DIR=/home/joakim/dev/projects/skyturns/moai-plugins \
../
if [[ $? -ne 0 ]]; then
    exit 1
fi

make host-html-template
if [[ $? -ne 0 ]]; then
  exit 1
fi

#
# Copy libs to lib/blackberry
#
#rm -rf ../../lib/blackberry
#mkdir -p ../../lib/blackberry
#for i in * ; do
#  if [ -d "$i" ]; then
#    if [ -f $i/lib$i.a ]; then
#      echo "Copying $i/lib$i.a to lib/blackberry/"
#      cp $i/lib$i.a ../../lib/blackberry
#    fi
#  fi
#done
