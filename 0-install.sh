#!/bin/bash
echo 'installing..'

echo -n "CF_Key > "
read cfkey
echo "$cfkey" > config/ID

echo -n "NG_Key > "
read ngkey
echo "$ngkey" > config/ID-ng

echo -n "App's kano title > "
read fakename
echo "$fakename""." > config/1-alice

echo -n "File type > "
read type
echo ".""$type" > config/2-type

sleep 10

cat /dev/urandom | tr -dc A-Za-z0-4 | head -c 9 > config/random &

sleep 10

dd if=debug-test.spk |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -
dd if=debug-ng.spk |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -
dd if=debug.spk |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -

sleep 10

mv debug `cat config/1-alice``cat config/random``cat config/2-type`
mv debug-test `cat config/1-alice``cat config/random`-test`cat config/2-type`
mv debug-ng `cat config/1-alice``cat config/random`-ng`cat config/2-type`

sleep 2
echo 'done'

