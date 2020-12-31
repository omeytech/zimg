#! /bin/sh
zimgDir=`pwd`/zimg_pre_lib

rm -r $zimgDir
mkdir $zimgDir
cd $zimgDir

sudo yum install libtool
sudo yum install git
sudo yum install make gcc gcc-c++ nasm ImageMagick-devel libpng-devel –y
sudo yum install openssl-devel libevent-devel libjpeg-devel giflib-devel  libwebp-devel libmemcached-devel

sudo rpm -e --nodeps autoconf-2.63

wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz


tar -zxvf autoconf-2.69.tar.gz
cd autoconf-2.69
./configure
sudo make && sudo make install
