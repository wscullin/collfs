$(common-objpfx)string/bzero.os: \
 ../sysdeps/powerpc/powerpc64/elf/bzero.S ../include/libc-symbols.h \
 $(common-objpfx)config.h \
 ../sysdeps/generic/symbol-hacks.h

../include/libc-symbols.h:

$(common-objpfx)config.h:

../sysdeps/generic/symbol-hacks.h:
