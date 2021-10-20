#!/bin/sh
cmake ../ -DCMAKE_VERBOSE_MAKEFILE=ON
make

cp ../Boot/Limine/limine.cfg ./

if [ ! -d "limine" ]
then
  git clone https://github.com/limine-bootloader/limine.git --branch=v2.0-branch-binary --depth=1
  make -C limine
fi

if [ ! -d "iso_root" ]
then
  mkdir -p iso_root
fi

cp -v troonix.elf limine.cfg limine/limine.sys \
      limine/limine-cd.bin limine/limine-eltorito-efi.bin iso_root/

xorriso -as mkisofs -b limine-cd.bin \
        -no-emul-boot -boot-load-size 4 -boot-info-table \
        --efi-boot limine-eltorito-efi.bin \
        -efi-boot-part --efi-boot-image --protective-msdos-label \
        iso_root -o image.iso
