#!/bin/sh
GCONV_PATH='/home/wscullin/collfs/glibc-2.12.2-build/iconvdata' \
exec  /home/wscullin/collfs/glibc-2.12.2-build/elf/ld64.so.1 --library-path /home/wscullin/collfs/glibc-2.12.2-build:/home/wscullin/collfs/glibc-2.12.2-build/math:/home/wscullin/collfs/glibc-2.12.2-build/elf:/home/wscullin/collfs/glibc-2.12.2-build/dlfcn:/home/wscullin/collfs/glibc-2.12.2-build/nss:/home/wscullin/collfs/glibc-2.12.2-build/nis:/home/wscullin/collfs/glibc-2.12.2-build/rt:/home/wscullin/collfs/glibc-2.12.2-build/resolv:/home/wscullin/collfs/glibc-2.12.2-build/gmon:/home/wscullin/collfs/glibc-2.12.2-build/crypt:/home/wscullin/collfs/glibc-2.12.2-build/nptl ${1+"$@"}
