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
#include "foo.h"

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

  func = dlsym(handle,"thefunc");
  if (!func) ERR("dlsym could not find symbol \"thefunc\" due to: %s", dlerror());
  /* err = (*func)();CHK(err); */

  test_fxstat64 = dlsym(handle,"thetest_fxstat64");
  if (!func) ERR("dlsym could not find symbol \"thetest_fxstat64\" due to: %s", dlerror());
  /* err = (*test_fxstat64)(path);CHK(err); */

  err = dlclose(handle);
  if (err) ERR("dlclose failed due to: %s", dlerror());
  return 0;
}

void collfs_init_pointers( 
                          int (*p_MPI_Initialized) (int *flag),
                          int (*p_MPI_Comm_rank) (MPI_Comm comm, int *rank),
                          int (*p_MPI_Bcast) (void *buffer, int count, 
                                              MPI_Datatype datatype, int root, MPI_Comm comm),
                          int (*p_MPI_Allreduce) (void *sendbuf, void *recvbuf, int count,
                                                  MPI_Datatype datatype, MPI_Op op,
                                                  MPI_Comm comm),
                          int (*p_MPI_Barrier) (MPI_Comm comm) 
                           );

int __collfs_comm_push(MPI_Comm comm);

int main(int argc, char *argv[])
{
  int err;
  char path[MAXPATHLEN];

  if (MPI_Init) {
    printf("MPI initialized\n");
    MPI_Init(&argc,&argv);
  }

  collfs_init_pointers( &MPI_Initialized,
                        &MPI_Comm_rank,
                        &MPI_Bcast,
                        &MPI_Allreduce,
                        &MPI_Barrier);

  if(!__collfs_comm_push(MPI_COMM_WORLD)) ERR("comm push failed");

  if (!getcwd(path,sizeof path)) ERR("getcwd failed");
  strcat(path,"/libthefunc.so");
  err = run_tests(path, path);CHK(err);
  //  err = foo(path);CHK(err);
  //  err = foo2("alphabet.txt");CHK(err);
  if (MPI_Finalize) MPI_Finalize();
  return 0;
}
