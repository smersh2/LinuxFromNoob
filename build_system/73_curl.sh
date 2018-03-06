################################################################
#
################################################################
. ./config2.sh

cd $src
rm -rf curl-7.55.1
tar -xvf curl-7.55.1.tar.xz
cd curl-7.55.1

./configure --prefix=/usr                           \
            --disable-static                        \
            --enable-threaded-resolver              \
            --with-ca-path=/etc/ssl/certs &&
make -j$(nproc)

make install

cd $src && rm -rf curl-7.55.1
