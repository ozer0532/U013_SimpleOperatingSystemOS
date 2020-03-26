#!/bin/bash

./generate.sh
./compile.sh
./compile-ext.sh
./run.sh <<< "c"
