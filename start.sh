#!/bin/bash

./generate.sh
./compile.sh
if [ $1 = "-ext" ]
then
	./compile-ext.sh
fi
./run.sh <<< "c"
