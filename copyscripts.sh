################################################################
#
################################################################
. ./config.sh

cd $aa
cp -r build_system $LFS

mkdir $LFS/etc
mkdir $LFS/root
cp -r $aa/files/etc $LFS/
cp $aa/files/.conkyrc $LFS/root/
#cp $aa/files/.bashrc $LFS/root/
cp $aa/files/inittab $LFS/etc/
cp $aa/files/nanorc $LFS/etc/
cp $aa/files/logo $LFS/etc/
cp $aa/files/motd $LFS/etc/
