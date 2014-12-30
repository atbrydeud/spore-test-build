#!/bin/bash

set -e -x

pwd

# read build.txt file to download image
while read line
do
    name=$line
    echo "Text read from file - $name"
done < build.txt
