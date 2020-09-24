#!/bin/sh -e
echo "get info"
./rpmb -v get-info /dev/rpmb0
echo "program key"
./rpmb -v program-key /dev/rpmb0 key
echo "get write counter"
./rpmb -v write-counter /dev/rpmb0 key
echo "generating data"
dd if=/dev/urandom of=data.in count=1 bs=256
echo "write data"
./rpmb -v write-blocks /dev/rpmb0 0 1 data.in key
echo "read data back"
./rpmb -v read-blocks /dev/rpmb0 0 1 data.out key
