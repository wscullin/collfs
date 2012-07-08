include ${MAKEINC}

COLLFS_SRC_C = collfs.c
COLLFS_SRC_O = $(COLLFS_SRC_C:.c=.o)

all : main-mpi 

# main-nompi and minimal_main are currently unverified
libinterpose.so: interpose.c
	${CC} -fPIC -Wall -Wl,--version-script -Wl,VERSION.txt -ldl -o $@ -shared $^ 

interpose_python: interpose_python.c
	${CC} -I/home/aron/opt/include/python2.7 -o interpose_python interpose_python.c -L/home/aron/opt/lib -lpython2.7 -lm -lpthread -ldl -lutil

# Depends on MPI, must be called from an executable using patched ld.so because _dl_collfs_api is referenced.
libcollfs.so : collfs.o
	${MPICC} -shared -g3 -o $@ $^

# Depends on libcollfs.so and MPI, can be preloaded to make an ignorant program use collective IO
libcollfs-easy.so : collfs-easy.o libcollfs.so
	${MPICC} -shared -g3 -o $@ $^ ${LDFLAGS}

# Depends only on libc, just prints "called thefunc"
libminimal_thefunc.so: minimal_thefunc.o
	${CC} -shared -g3 -fPIC -o $@ $^
libthefunc.so : thefunc.o
	${CC} -shared -g3 -fPIC -o $@ $^

minimal_main : minimal_main.o libminimal_thefunc.so
	${MPICC} -g3 -o $@ minimal_main.o ${LDFLAGS}

# Explicitly uses libcollfs to push communicators. Loads libminimal_thefunc.so (so only a run-time dependency)
main-mpi : main-mpi.o libcollfs.so libminimal_thefunc.so
	${MPICC} -g3 -o $@ $< libcollfs.so ${LDFLAGS} ${LDCOLLFSFLAGS}

main-mpi.o : main-mpi.c
	${MPICC} ${CFLAGS} -c -g3 -FPIC -o $@ $^

collfs.o : collfs.c collfs.h libc-collfs.h
	${MPICC} ${CFLAGS} -c -fPIC -g3  $<

# Depends only on libc, loads libminimal_thefunc (only run-time dependency), libcollfs-easy.so should be preloaded.
main-nompi : main-nompi.o libcollfs-easy.so libminimal_thefunc.so
	${CC} -g3 -o $@ $< ${LDFLAGS}

test_collfs : test_collfs.o libfoo.so libcollfs.so libminimal_thefunc.so
	${MPICC} -g3 -o $@ $^ ${LDFLAGS} 
.c.o :
	${CC} ${CFLAGS} -fPIC -c $<

libfoo.so : foo.o collfs.o
	${MPICC} -g3 -shared -o $@ $^ ${LDFLAGS}

libc-collfs.o : libc-collfs.c libc-collfs.h libc-collfs-private.h

foo.o : foo.c foo.h errmacros.h collfs.h libc-collfs-private.h
	${MPICC} ${CFLAGS} -c -fPIC -g3  $<

test_collfs.o : test_collfs.c errmacros.h
	${MPICC} ${CFLAGS} -c -fPIC -g3  $<

thefunc.o : thefunc.h collfs.h

clean :
	rm -f *.o *.so main

.PHONY: clean all
