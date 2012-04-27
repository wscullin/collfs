$(common-objpfx)csu/elf-init.oS: elf-init.c \
 ../include/libc-symbols.h \
 $(common-objpfx)config.h \
 ../sysdeps/generic/symbol-hacks.h \
 /bgsys/drivers/toolchain/V1R1M0-/gnu-linux/lib/gcc/powerpc64-bgq-linux/4.4.6/include/stddef.h

../include/libc-symbols.h:

$(common-objpfx)config.h:

../sysdeps/generic/symbol-hacks.h:

/bgsys/drivers/toolchain/V1R1M0-/gnu-linux/lib/gcc/powerpc64-bgq-linux/4.4.6/include/stddef.h:
