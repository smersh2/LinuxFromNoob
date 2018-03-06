################################################################
#
################################################################
. ./config3.sh

cd $src
rm -rf cmake-3.9.1
tar -xvf cmake-3.9.1.tar.gz
cd cmake-3.9.1

sed -i '/CMAKE_USE_LIBUV 1/s/1/0/' CMakeLists.txt     &&
sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake &&

./bootstrap --prefix=/usr        \
            --system-libs        \
            --mandir=/share/man  \
            --no-system-jsoncpp  \
            --no-system-librhash \
            --docdir=/share/doc/cmake-3.9.1 &&
make -j$(nproc)

make install

cd $aa
