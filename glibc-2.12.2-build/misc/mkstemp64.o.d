$(common-objpfx)misc/mkstemp64.o: \
 ../sysdeps/wordsize-64/mkstemp64.c ../include/libc-symbols.h \
 $(common-objpfx)config.h \
 ../sysdeps/generic/symbol-hacks.h

../include/libc-symbols.h:

$(common-objpfx)config.h:

../sysdeps/generic/symbol-hacks.h:
