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

# hack:
cp -r $DRAKE_DIR/examples/humanoid_controller/config/ $DESTINATION/share/drake/examples/humanoid_controller/config
