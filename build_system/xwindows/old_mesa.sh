################################################################
#
################################################################
. ./config3.sh

cd $src
rm -rf mesa-17.1.6
tar -xvf mesa-17.1.6.tar.xz
cd mesa-17.1.6

patch -Np1 -i ../mesa-17.1.6-add_xdemos-1.patch

sed -i "/pthread_stubs_possible=/s/yes/no/" configure.ac &&

./autogen.sh CFLAGS='-O2' CXXFLAGS='-O2'       \
            --prefix=$XORG_PREFIX              \
            --sysconfdir=/etc                  \
            --enable-texture-float             \
            --enable-osmesa                    \
            --with-dri-drivers=                \
            --with-gallium-drivers=r600        \
            --disable-gallium-llvm             \
            --enable-xa                        \
            --enable-glx-tls                   \
            --with-platforms="drm,x11,wayland" &&

make -j$(nproc)

make -C xdemos DEMOS_PREFIX=$XORG_PREFIX

make install

make -C xdemos DEMOS_PREFIX=$XORG_PREFIX install

cd $aa
