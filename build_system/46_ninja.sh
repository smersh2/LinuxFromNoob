################################################################
#
################################################################
. ./config2.sh

cd $src
rm -rf ninja-1.8.2
tar -xvf ninja-1.8.2.tar.gz
cd ninja-1.8.2

patch -Np1 -i ../ninja-1.8.2-add_NINJAJOBS_var-1.patch

python3 configure.py --bootstrap

install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja

cd $src && rm -rf ninja-1.8.2
