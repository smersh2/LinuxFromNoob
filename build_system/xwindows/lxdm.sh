################################################################
#
################################################################
. ./config3.sh

cd $src
rm -rf lxdm-0.5.3
tar -xvf lxdm-0.5.3.tar.xz
cd lxdm-0.5.3

cat > pam/lxdm << "EOF"
# Begin /etc/pam.d/lxdm

auth     requisite      pam_nologin.so
auth     required       pam_env.so
auth     include        system-auth

account  include        system-account

password include        system-password

session  required       pam_limits.so
session  include        system-session

# End /etc/pam.d/lxdm
EOF

sed -i 's:sysconfig/i18n:profile.d/i18n.sh:g' data/lxdm.in &&
sed -i 's:/etc/xprofile:/etc/profile:g' data/Xsession &&
sed -e 's/^bg/#&/'        \
    -e '/reset=1/ s/# //' \
    -e 's/logou$/logout/' \
    -e "/arg=/a arg=$XORG_PREFIX/bin/X" \
    -i data/lxdm.conf.in


./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --with-pam        \
            --with-systemdsystemunitdir=/lib/systemd/system &&
make -j$(nproc)

make install

cd $aa
