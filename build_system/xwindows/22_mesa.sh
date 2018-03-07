################################################################
#
################################################################
. ./config3.sh

cd $src
rm -rf mesa-17.3.5
tar -xvf mesa-17.3.5.tar.xz
cd mesa-17.3.5

GLL_DRV="i915,r600,nouveau,radeonsi,svga,swrast"

./configure CFLAGS='-O2' CXXFLAGS='-O2' LDFLAGS=-lLLVM \
            --prefix=$XORG_PREFIX              \
            --sysconfdir=/etc                  \
            --enable-texture-float             \
            --enable-osmesa                    \
            --enable-xa                        \
            --enable-glx-tls                   \
            --with-platforms="drm,x11,wayland" \
            --with-gallium-drivers=$GLL_DRV    &&

unset GLL_DRV &&

make -j$(nproc)

make install

cd $aa
