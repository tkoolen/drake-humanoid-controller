#!/bin/bash
set -e

DRAKE_DIR=$1
SOURCE="$DRAKE_DIR/install"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
DESTINATION="$SCRIPTPATH/install"

rm -rf $DESTINATION
mkdir -p $DESTINATION

FILES="share/drake/examples/humanoid_controller/
lib/libBulletCollision.so
lib/libLinearMath.so
lib/libgurobi75.so
lib/libscsdir.so
lib/liblcm.so
share/drake/examples/valkyrie/
share/drake/common
share/drake/.drake-find_resource-sentinel"

cd $SOURCE

for f in $FILES
do
    cp -r --parent $f $DESTINATION
done

cp -r $DRAKE_DIR/examples/humanoid_controller/config/ $DESTINATION/share/drake/examples/humanoid_controller/config

SYSTEM_LIBS="/usr/lib/x86_64-linux-gnu/libprotobuf.so.9
/usr/lib/x86_64-linux-gnu/libtinyxml2.so.2
/usr/lib/libdreal.so
/usr/lib/libibex.so
/usr/lib/x86_64-linux-gnu/libClp.so.1
/usr/lib/x86_64-linux-gnu/libCoinUtils.so.3
/usr/lib/libipopt.so.1
/usr/lib/libdmumps_seq-4.10.0.so
/usr/lib/x86_64-linux-gnu/libnlopt.so.0
/usr/lib/libmumps_common_seq-4.10.0.so"

for lib in $SYSTEM_LIBS
do
    cp $lib $DESTINATION/lib
done
