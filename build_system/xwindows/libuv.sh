################################################################
#
################################################################
. ./config3.sh

cd $src
rm -rf libuv-1.19.1
tar -xvf libuv-1.19.1.tar.gz
cd libuv-1.19.1

sh autogen.sh                              &&
./configure --prefix=/usr --disable-static &&
make -j$(nproc)

make install


cd $aa
