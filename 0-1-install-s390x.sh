#!/bin/bash
echo 'installing..'

echo -n "App's kano title > "
read fakename
echo "$fakename""." > config/1-alice

echo -n "File type > "
read type
echo ".""$type" > config/2-type
sleep 10

cat /dev/urandom | tr -dc A-Za-z0-4 | head -c 9 > config/random &

sleep 10

dd if=debug-s390x.spk |openssl des3 -d -k G9rIDmo33|tar zxf -

sleep 8

mv debug-s390x `cat config/1-alice``cat config/random`-s390x`cat config/2-type`

echo 'done'
