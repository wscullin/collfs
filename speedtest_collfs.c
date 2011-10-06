#include <dlfcn.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <sys/param.h>
#include <unistd.h>

#include <mpi.h>

#include "errmacros.h"
#include "collfs.h"
#include "foo.h"

#include <sys/stat.h>

extern int MPI_Init(int *argc, char ***argv) __attribute__ ((weak));
extern int MPI_Finalize() __attribute__ ((weak));

int run_tests(const char *soname, const char *path)
{
  void *handle;
  int err;
  int (*func)(void);
  int (*test_fxstat64)(const char *);

  handle = dlopen(soname,RTLD_GLOBAL | RTLD_LAZY);
  if (!handle) ERR("failed to dlopen(\"%s\",RTLD_GLOBAL | RTLD_LAZY) due to: %s", soname, dlerror());

  /* func = dlsym(handle,"thefunc"); */
  /* if (!func) ERR("dlsym could not find symbol \"thefunc\" due to: %s", dlerror()); */
  /* err = (*func)();CHK(err); */

  /* test_fxstat64 = dlsym(handle,"thetest_fxstat64"); */
  /* if (!func) ERR("dlsym could not find symbol \"thetest_fxstat64\" due to: %s", dlerror()); */
  /* err = (*test_fxstat64)(path);CHK(err); */

  err = dlclose(handle);
  if (err) ERR("dlclose failed due to: %s", dlerror());
  return 0;
}

int main(int argc, char *argv[])
{
  int err;
  char path[MAXPATHLEN];
  double start_time, end_time;
  int rank;

  if (MPI_Init) {
    MPI_Init(&argc,&argv);
  }
  if (!getcwd(path,sizeof path)) ERR("getcwd failed");

  err = collfs_initialize(0, abort);CHK(err);
  err = collfs_comm_push(MPI_COMM_WORLD);CHK(err);

  strcat(path,"/libthefunc.so");

  start_time = MPI_Wtime();

  /* err = run_tests(path, path);CHK(err); */
  /* err = run_tests("/project/k47/prod/petsc/3.1.8/ppc450d-bgp_gnu_shared/lib/libpetsc.so", */
  /*                 "/project/k47/prod/petsc/3.1.8/ppc450d-bgp_gnu_shared/lib/libpetsc.so"); CHK(err); */
  /* int fd = __collfs_open("/project/k47/prod/petsc/3.1.8/ppc450d-bgp_gnu_shared/lib/libpetsc.so",O_RDONLY); */
  /* err = __collfs_close(fd); CHK(err); */
  struct stat64 st;
  err = __collfs_xstat64(_STAT_VER, "/project/k47/prod/petsc/3.1.8/ppc450d-bgp_gnu_shared/lib/libpetsc.so", &st);CHK(err);

  MPI_Barrier(MPI_COMM_WORLD);
  end_time = MPI_Wtime();

  if (MPI_Comm_rank) { 
    err = MPI_Comm_rank(MPI_COMM_WORLD,&rank);CHK(err); 
    if (!rank) printf("collfs_open run test time: %e\n", end_time-start_time);
  }

  start_time = MPI_Wtime();

  char *p; 
  p = malloc(16*1024*1024); 
  memset(p,1,16*1024*1024); 
  MPI_Bcast(p,16*1024*1024,MPI_CHAR,0,MPI_COMM_WORLD);
  MPI_Barrier(MPI_COMM_WORLD);
  end_time = MPI_Wtime();
  if (!rank) printf("bcast run test time: %e\n", end_time-start_time);

  err = collfs_comm_pop();CHK(err);
  err = collfs_finalize();CHK(err);

  if (MPI_Finalize) MPI_Finalize();
  return 0;
}
