################################################################
#
################################################################
. ./config3.sh

cd $src
rm -rf libdrm-2.4.82
tar -xvjf libdrm-2.4.82.tar.bz2
cd libdrm-2.4.82

./configure --prefix=/usr --enable-udev &&
make -j$(nproc)

make install

cd $aa
