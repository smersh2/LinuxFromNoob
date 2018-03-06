#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf patch-2.7.5
tar -xvf patch-2.7.5.tar.xz
cd patch-2.7.5

./configure --prefix=/usr

make -j$(nproc)
make install
echo "need to fix patch-2.7.5"
cd $aa

