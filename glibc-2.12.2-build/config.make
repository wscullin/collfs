# config.make.  Generated from config.make.in by configure.
# Don't edit this file.  Put configuration parameters in configparms instead.

version = 2.12.2
release = stable

# Installation prefixes.
install_root =
prefix = /home/wscullin/bgqsys
exec_prefix = ${prefix}
datadir = /usr/share
libdir = /lib
slibdir = /lib
localedir = 
sysconfdir = /etc
libexecdir = /libexec
rootsbindir = 
infodir = ${datarootdir}/info
includedir = ${prefix}/include
datarootdir = ${prefix}/share

# Should we use and build ldconfig?
use-ldconfig = yes

# Maybe the `ldd' script must be rewritten.
ldd-rewrite-script = ../sysdeps/unix/sysv/linux/powerpc/ldd-rewrite.sed

# System configuration.
config-machine = powerpc64
base-machine = powerpc
config-vendor = bgq
config-os = linux-gnu
config-sysdirs =  sysdeps/powerpc/powerpc64/elf sysdeps/powerpc/elf sysdeps/unix/sysv/linux/powerpc/powerpc64/fpu sysdeps/powerpc/powerpc64/fpu nptl/sysdeps/unix/sysv/linux/powerpc/powerpc64 sysdeps/unix/sysv/linux/powerpc/powerpc64 sysdeps/unix/sysv/linux/wordsize-64 nptl/sysdeps/unix/sysv/linux/powerpc sysdeps/unix/sysv/linux/powerpc sysdeps/ieee754/ldbl-128ibm sysdeps/ieee754/ldbl-opt nptl/sysdeps/unix/sysv/linux nptl/sysdeps/pthread sysdeps/pthread sysdeps/unix/sysv/linux sysdeps/gnu sysdeps/unix/common sysdeps/unix/mman sysdeps/unix/inet nptl/sysdeps/unix/sysv sysdeps/unix/sysv sysdeps/unix/powerpc nptl/sysdeps/unix sysdeps/unix sysdeps/posix sysdeps/powerpc/powerpc64 sysdeps/wordsize-64 sysdeps/powerpc/fpu nptl/sysdeps/powerpc sysdeps/powerpc sysdeps/ieee754/dbl-64 sysdeps/ieee754/flt-32 sysdeps/ieee754 sysdeps/generic/elf sysdeps/generic
cflags-cpu = 
asflags-cpu = 

config-cflags-sse4 = 
config-cflags-avx = 
config-asflags-i686 = 

defines =  -D_LIBC_REENTRANT
sysincludes = -nostdinc -isystem /bgsys/drivers/toolchain/V1R1M0-/gnu-linux/lib/gcc/powerpc64-bgq-linux/4.4.6/include -isystem /bgsys/drivers/toolchain/V1R1M0-/gnu-linux/lib/gcc/powerpc64-bgq-linux/4.4.6/include-fixed -isystem /bgsys/drivers/V1R1M0/ppc64/toolchain/gnu/build-powerpc64-bgq-linux/templinuxheaders-build/include
c++-sysincludes = -isystem ../../../../include/c++/4.4.6 -isystem ../../../../include/c++/4.4.6/powerpc64-bgq-linux -isystem ../../../../include/c++/4.4.6/backward
all-warnings = 

elf = yes
have-z-combreloc = yes
have-z-execstack = yes
have-initfini = 
have-Bgroup = yes
have-as-needed = yes
libgcc_s_suffix = 
need-nopic-initfini = 
with-fp = yes
with-cvs = no
old-glibc-headers = no
unwind-find-fde = no
have-cpp-asm-debuginfo = 
enable-check-abi = no
have-forced-unwind = yes
have-fpie = yes
gnu89-inline-CFLAGS = -fgnu89-inline
have-ssp = yes
have-selinux = no
have-libaudit = 
have-libcap = 
have-cc-with-libunwind = no
fno-unit-at-a-time = -fno-toplevel-reorder -fno-section-anchors
bind-now = no
have-hash-style = yes

static-libgcc = -static-libgcc

versioning = yes
oldest-abi = default
no-whole-archive = -Wl,--no-whole-archive
exceptions = -fexceptions
multi-arch = no

mach-interface-list = 

have-bash2 = yes
have-ksh = yes

sizeof-long-double = 16

experimental-malloc = 

nss-crypt = no

# Configuration options.
build-static = yes
build-shared = yes
build-pic-default= no
build-profile = no
build-omitfp = no
build-bounded = no
build-static-nss = yes
add-ons = nptl
add-on-subdirs = 
sysdeps-add-ons =  nptl
cross-compiling = yes
force-install = yes

# Build tools.
CC = powerpc64-bgq-linux-gcc -g -lgcc_eh -lgcc -specs=/bgsys/drivers/toolchain/V1R1M0-/gnu-linux/lib/gcc/powerpc64-bgq-linux/4.4.6/specs.orig
CXX = powerpc64-bgq-linux-g++
BUILD_CC = gcc
CFLAGS = -g -O2
ASFLAGS-config = 
AR = /bgsys/drivers/toolchain/V1R1M0-/gnu-linux/powerpc64-bgq-linux/bin/ar
RANLIB = :
MAKEINFO = makeinfo
AS = $(CC) -c
MIG = 
PWD_P = /bin/pwd
BISON = /usr/bin/bison
AUTOCONF = autoconf
OBJDUMP = /bgsys/drivers/toolchain/V1R1M0-/gnu-linux/powerpc64-bgq-linux/bin/objdump

# Installation tools.
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_INFO = /sbin/install-info
LN_S = ln -s
MSGFMT = msgfmt

# Script execution tools.
BASH = /bin/bash
KSH = /bin/bash
AWK = gawk
PERL = /usr/bin/perl

# Additional libraries.
LIBGD = no

# More variables may be inserted below by configure.

override stddef.h = # The installed <stddef.h> seems to be libc-friendly.
