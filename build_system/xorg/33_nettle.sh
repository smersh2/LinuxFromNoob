################################################################
#
################################################################
. ./config3.sh

cd $src
rm -rf nettle-3.3
tar -xvf nettle-3.3.tar.gz
cd nettle-3.3

./configure --prefix=/usr --disable-static &&
make -j$(nproc)

make install

cd $aa
