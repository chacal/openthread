#!/bin/bash
set -e

make -j6 -f examples/Makefile-nrf52840 clean
./bootstrap
make -f examples/Makefile-nrf52840 DISABLE_BUILTIN_MBEDTLS=0 COAP=1 DNS_CLIENT=1 DISABLE_SPI=1

REF=$(git rev-parse HEAD | cut -c -8)

rm -rf /mnt/hgfs/jihartik/arduino/thread/router/openthread-"${REF}"
rm -rf /mnt/hgfs/jihartik/arduino/thread/network-display/openthread-"${REF}"

mkdir /mnt/hgfs/jihartik/arduino/thread/router/openthread-"${REF}"
mkdir /mnt/hgfs/jihartik/arduino/thread/network-display/openthread-"${REF}"

cp -r output/* /mnt/hgfs/jihartik/arduino/thread/router/openthread-"${REF}"
cp -r output/* /mnt/hgfs/jihartik/arduino/thread/network-display/openthread-"${REF}"
