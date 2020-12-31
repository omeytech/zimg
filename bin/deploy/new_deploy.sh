#! /bin/sh
homeDir=`pwd`


zimgDir=$homeDir/zimg_pre_lib

rm -r $zimgDir
mkdir $zimgDir
cd $zimgDir

yum install -y libtool
yum install -y git
yum install -y make gcc gcc-c++ nasm ImageMagick-devel libpng-devel –y
yum install -y openssl-devel libevent-devel libjpeg-devel giflib-devel  libwebp-devel libmemcached-devel

rpm -e --nodeps autoconf-2.63

wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz


tar -zxvf autoconf-2.69.tar.gz
cd $zimgDir/autoconf-2.69
./configure
make && make install



zimgDir=$homeDir/zimg_all_lib

rm -r $zimgDir
mkdir $zimgDir
cd $zimgDir

wget http://www.cmake.org/files/v3.0/cmake-3.0.1.tar.gz
wget http://www.imagemagick.org/download/ImageMagick.tar.gz
wget http://www.ijg.org/files/jpegsrc.v9b.tar.gz
wget http://cloud.github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
wget https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz
wget http://downloads.webmproject.org/releases/webp/libwebp-0.4.1.tar.gz
wget http://www.openssl.org/source/openssl-1.0.1i.tar.gz
git clone https://github.com/buaazp/zimg -b master --depth=1

ls $zimgDir/*tar.gz > list.txt
for TAR in `cat list.txt`
do
    tar -zxvf $TAR
done
rm -rf list.txt



zimgChangeSrc=$homeDir/zimgChangeCode
zimgMyConfig=$homeDir/zimgConfig



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

yes | cp -f -R $zimgChangeSrc/zhttpd.* $zimgDir/zimg/src/
yes | cp -f -R $zimgMyConfig/* $zimgDir/zimg/bin/conf/
cd $zimgDir/zimg
make