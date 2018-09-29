#!/bin/bash
mypath=`realpath $0`
cd ~
./build-bitmains3.sh --cgminer

cd `dirname $mypath`
if [ -f cgminer-ants3-mod.tgz ]
then
rm cgminer-ants3-mod.tgz
fi
tar xvfJ cgminer-ants3-source.tar.xz
cp ~/avalon/openwrt/build_dir/target*/cgminer*/cgminer usr/bin/
cp ~/avalon/openwrt/build_dir/target*/cgminer*/cgminer-api usr/bin/
tar cvf cgminer-ants3-mod.tgz etc usr www

ftp -nv ftpperso.free.fr <<EOF
user wareck zorn69
bin
passive
cd /antminer
mput cgminer-ants3-mod.tgz
quit
EOF
sleep 1

ftp -nv ftpperso.free.fr <<EOF
user wareck zorn69
bin
passive
cd /antminer
mput cgminer-origin.tgz
quit
EOF
sleep 1

ftp -nv ftpperso.free.fr <<EOF
user wareck zorn69
bin
passive
cd /antminer
mput cgminer-nicehash.tgz
quit
EOF
sleep 1

ftp -nv ftpperso.free.fr <<EOF
user wareck zorn69
bin
passive
cd /antminer
mput cgminer_mod.txt
quit
EOF

rm -r etc www usr
echo ""
echo "Done !"
