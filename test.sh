#!/bin/bash

set -e -x

pwd

rm -rf machines vagrant-build.box spore-test-build/vagrant-build.box

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
echo -e '\nDownloading image: ${BUILD_TXT[1]}\n'
wget ${BUILD_TXT[1]}

VMDK=$(basename ${BUILD_TXT[1]})

echo -e '\nRunning create-box\n'
bash spore-test-build/createbox-complete.sh ${VMDK}

mv vagrant-build.box spore-test-build/
cd spore-test-build
vagrant up || true

sleep 100
