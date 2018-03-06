################################################################
#
################################################################
. ./config3.sh

cd $src
rm -rf Python-3.6.2
tar -xvf Python-3.6.2.tar.xz
cd Python-3.6.2

CXX="/usr/bin/g++"              \
./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes &&
make -j$(nproc)

make install &&
chmod -v 755 /usr/lib/libpython3.6m.so &&
chmod -v 755 /usr/lib/libpython3.so

cd $aa
