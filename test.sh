#!/bin/bash

set -e -x

pwd

BUILD_TXT=()
# read build.txt file to download image
echo -e '\nReading build.txt\n'
while read line
do
    name=$line
    BUILD_TXT+=($name)
    echo ${name}
done < build.txt

#Download latest image
wget ${BUILD_TXT[1]}

VMDK=$(basename ${BUILD_TXT[1]})

bash spore-test-build/createbox-complete.sh ${VMDK}
