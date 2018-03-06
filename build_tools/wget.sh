#############################################################################
#
#############################################################################
. ./config.sh

rm -rf /LFS-new-source
mkdir /LFS-new-source
wget --input-file=wget-list --continue --directory-prefix=/LFS-new-source

