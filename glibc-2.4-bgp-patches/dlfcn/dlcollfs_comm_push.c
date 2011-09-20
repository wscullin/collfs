#include <dlfcn.h>
#include <stddef.h>
#include <ldsodefs.h>

#include <mpi.h>

#if !defined SHARED && defined IS_IN_libdl

int
dlcollfs_comm_push (MPI_Comm comm)
{
  return __dlcollfs_comm_push (comm);
}

#else

struct dlcollfs_comm_push_args
{
  /* The arguments to dlcollfs_comm_push_doit.  */
  MPI_Comm comm;
  /* The return value of dlcollfs_comm_push_doit.  */
  int _return;
};


static void
dlcollfs_comm_push_doit (void *ptr)
{
  struct dlcollfs_comm_push_args *args = (struct dlcollfs_comm_push_args *) ptr;
  args->_return = GLRO(_collfs_comm_push) (args->comm);
}

int
__dlcollfs_comm_push (MPI_Comm comm)
{
# ifdef SHARED
  if (__builtin_expect (_dlfcn_hook != NULL, 0))
    return _dlfcn_hook->dlcollfs_comm_push (comm);
# endif
  struct dlcollfs_comm_push_args args;
  args.comm = MPI_Comm;
  return (_dlerror_run (dlcollfs_comm_push_doit, &args) ? -1 : args->_return);
}
# ifdef SHARED
strong_alias (__dlcollfs_comm_push, dlcollfs_comm_push)
# endif
#endif
