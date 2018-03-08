#####################################################################
#
#####################################################################
. ./config2.sh

cd $src
rm -rf nano-2.9.3
tar -xvf nano-2.9.3.tar.xz
cd nano-2.9.3

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --enable-utf8     \
            --docdir=/usr/share/doc/nano-2.9.2 &&
make -j$(nproc)
make install &&
install -v -m644 doc/{nano.html,sample.nanorc} /usr/share/doc/nano-2.9.2

wget https://github.com/scopatz/nanorc/archive/master.zip

unzip master.zip

#cp nanorc-master/* /root/.nano
#echo "include '/root/.nano/*'" >> /etc/nanorc

cd nanorc-master/

./install.sh

cd $src && rm -rf nano-2.9.3
