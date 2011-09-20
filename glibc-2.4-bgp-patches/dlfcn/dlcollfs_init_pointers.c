#include <dlfcn.h>
#include <stddef.h>
#include <ldsodefs.h>

#include <mpi.h>

#if !defined SHARED && defined IS_IN_libdl

void dlcollfs_init_pointers( int (*_MPI_Initialized)(int *flag),
                             int (*_MPI_Comm_rank) (MPI_Comm comm, int *rank),
                             int (*_MPI_Bcast) (void *buffer, int count, 
                                                MPI_Datatype datatype, int root,MPI_Comm comm),
                             int (*_MPI_Allreduce) (void *sendbuf, void *recvbuf, int count,
                                                    MPI_Datatype datatype, MPI_Op op,
                                                    MPI_Comm comm),
                             int (*_MPI_Barrier) (MPI_Comm comm))
{
  __dlcollfs_init_pointers(_MPI_Initialized, 
                           _MPI_Comm_rank,
                           _MPI_Bcast,
                           _MPI_Allreduce,
                           _MPI_Barrier);
}

#else

struct dlcollfs_init_pointers_args
{
  /* Arguments to dlcollfs_init_pointers.  */
  int (*_MPI_Initialized)(int *flag);
  int (*_MPI_Comm_rank) (MPI_Comm comm, int *rank);
  int (*_MPI_Bcast) (void *buffer, int count, 
                     MPI_Datatype datatype, int root,MPI_Comm comm);
  int (*_MPI_Allreduce) (void *sendbuf, void *recvbuf, int count,
                         MPI_Datatype datatype, MPI_Op op,
                         MPI_Comm comm);
  int (*_MPI_Barrier) (MPI_Comm comm);
};

static void
dlcollfs_init_pointers_doit (void *ptr)
{
  struct dlcollfs_init_pointers_args *args = (struct dlcollfs_init_pointers_args *) ptr;

  GLRO(_collfs_init_pointers) (args->_MPI_Initialized,
                               args->_MPI_Comm_rank,
                               args->_MPI_Bcast,
                               args->_MPI_Allreduce,
                               args->_MPI_Barrier);
}

void
__dlcollfs_init_pointers (int (*_MPI_Initialized)(int *flag),
                          int (*_MPI_Comm_rank) (MPI_Comm comm, int *rank),
                          int (*_MPI_Bcast) (void *buffer, int count, 
                                             MPI_Datatype datatype, int root,MPI_Comm comm),
                          int (*_MPI_Allreduce) (void *sendbuf, void *recvbuf, int count,
                                                 MPI_Datatype datatype, MPI_Op op,
                                                 MPI_Comm comm),
                          int (*_MPI_Barrier) (MPI_Comm comm))
{
# ifdef SHARED
  if (__builtin_expect (_dlfcn_hook != NULL, 0))
    return _dlfcn_hook->dlcollfs_init_pointers (comm);
# endif
  struct dlcollfs_init_pointers_args args;
  args._MPI_Initialized = _MPI_Initialized;
  args._MPI_Comm_rank = _MPI_Comm_rank;
  args._MPI_Bcast = _MPI_Bcast;
  args._MPI_Allreduce = _MPI_Allreduce;
  args._MPI_Barrier = _MPI_Barrier;

  _dlerror_run (dlcollfs_init_pointers_doit, &args);
}
# ifdef SHARED
strong_alias (__dlcollfs_init_pointers, dlcollfs_init_pointers)
# endif
#endif
