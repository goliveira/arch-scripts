#!/bin/bash

#
# verify_iso.sh
#

b2sum -c b2sums.txt
sq wkd get pierre@archlinux.de > release-key.pgp
sq verify --signer-cert release-key.pgp --detached archlinux-x86_64.iso.sig archlinux-x86_64.iso
