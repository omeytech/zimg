#! /bin/sh
zimgDir=`pwd`/zimg_all_lib
zimgChangeSrc=`pwd`/zimgChangeCode
zimgMyConfig=`pwd`/zimgConfig/zimg.lua

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
wget https://downloads.sourceforge.net/project/libjpeg-turbo/1.3.1/libjpeg-turbo-1.5.1.tar.gz
git clone https://github.com/buaazp/zimg -b master --depth=1

ls $zimgDir/*tar.gz > list.txt
for TAR in `cat list.txt`
do
    tar -zxvf $TAR
done
rm -rf list.txt