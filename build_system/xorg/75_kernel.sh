################################################################
#
################################################################
. ./config3.sh

cd $src
rm -rf linux-4.12.7
tar -xvf linux-4.12.7.tar.xz
cd linux-4.12.7

make -j$(nproc) mrproper

make -j$(nproc) defconfig

make -j$(nproc) bzImage

cp arch/x86/boot/bzImage /02_build_system/bzImage

make -j$(nproc) INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include

cd $aa
