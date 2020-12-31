#! /bin/sh
zimgDir=`pwd`/zimg_all_lib
zimgChangeSrc=`pwd`/zimgChangeCode
zimgMyConfig=`pwd`/zimgConfig/zimg.lua


cd $zimgDir


cd $zimgDir/openssl-1.0.1i
./config shared --prefix=/usr/local --openssldir=/usr/ssl
make && make install

cd $zimgDir/cmake-3.0.1
./bootstrap --prefix=/usr/local
make && make install

cd $zimgDir/libevent-2.0.21-stable
./configure --prefix=/usr/local
make && make install


cd $zimgDir/libwebp-0.4.1
./configure
make && make install

cd $zimgDir/jpeg-9b
./configure
make libdir=/usr/lib64
make libdir=/usr/lib64  install

cd $zimgDir/ImageMagick-7.0.5-5
./configure --prefix=/usr/local
make && make install

cd $zimgDir/libmemcached-1.0.18
./configure --prefix=/usr/local
make && make install


