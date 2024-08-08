#!/bin/bash

rm -rf build
if [ ! -d "./build" ] 
then
    mkdir build
fi

cd build
echo "Run cmake"
cmake ..

if [ $? != 0 ]
then
    echo "Run cmake fail"
else
    echo "Build start"
    make -j12
    echo "Build finish"
    if [ $? == 0 ]
    then
        echo "Build success"
    else
        echo "Build fail"
    fi
fi