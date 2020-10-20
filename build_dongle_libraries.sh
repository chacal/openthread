#!/bin/bash
set -e

make -j6 -f examples/Makefile-nrf52840 clean
./bootstrap
make -f examples/Makefile-nrf52840 DISABLE_BUILTIN_MBEDTLS=1 EXTERNAL_HEAP=1 BORDER_ROUTER=1 COAP=1 COMMISSIONER=1 DNS_CLIENT=1 JOINER=1 MAC_FILTER=1 MTD_NETDIAG=1 SERVICE=1 UDP_PROXY=1 BORDER_AGENT=1 USB=1 BOOTLOADER=USB

REF=$(git rev-parse HEAD | cut -c -8)
rm -rf /mnt/hgfs/jihartik/arduino/thread/router/openthread-usb-"${REF}"
mkdir /mnt/hgfs/jihartik/arduino/thread/router/openthread-usb-"${REF}"
cp -r output/* /mnt/hgfs/jihartik/arduino/thread/router/openthread-usb-"${REF}"
