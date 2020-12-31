#! /bin/sh

cd /etc/yum.repos.d
wget http://people.centos.org/tru/devtools-1.1/devtools-1.1.repo
yum --enablerepo=testing-1.1-devtools-6 install -y devtoolset-1.1-gcc devtoolset-1.1-gcc-c++
export PATH=/opt/centos/devtoolset-1.1/root/usr/bin/:$PATH
echo 'export PATH=/opt/centos/devtoolset-1.1/root/usr/bin/:$PATH'  >> ~/.bash_profile
source ~/.bash_profile