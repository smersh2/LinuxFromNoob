######################################################
#
######################################################

export aa=$(pwd)
export LFS=/mnt/lfs
export iso=$aa/isoimage

case $(uname -m) in
  x86_64) mkdir -v $LFS/lib && ln -sv lib $LFS/lib64 ;;
esac

