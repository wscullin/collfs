#ifndef _DLCOLLFS_H
#include <dlfcn/dlcollfs.h>
#include <link.h>		/* For ElfW.  */
#include <stdbool.h>
#include <mpi.h>

/* Now define the internal interfaces.  */

extern int __libc_dlcollfs_comm_push (MPI_Comm comm);
extern void __libc_dlcollfs_init_pointers ( int (*_MPI_Initialized)(int *flag),
                                             int (*_MPI_Comm_rank) (MPI_Comm comm, int *rank),
                                             int (*_MPI_Bcast) (void *buffer, int count, 
                                                                MPI_Datatype datatype, int root,MPI_Comm comm),
                                             int (*_MPI_Allreduce) (void *sendbuf, void *recvbuf, int count,
                                                                    MPI_Datatype datatype, MPI_Op op,
                                                                    MPI_Comm comm),
                                            int (*_MPI_Barrier) (MPI_Comm comm));
  
libc_hidden_proto (__libc_dlcollfs_comm_push);
libc_hidden_proto (__libc_dlcollfs_init_pointers);

extern int __collfs_comm_push (MPI_Comm comm) internal_function;
extern void __collfs_init_pointers (int (*_MPI_Initialized)(int *flag),
                                             int (*_MPI_Comm_rank) (MPI_Comm comm, int *rank),
                                             int (*_MPI_Bcast) (void *buffer, int count, 
                                                                MPI_Datatype datatype, int root,MPI_Comm comm),
                                             int (*_MPI_Allreduce) (void *sendbuf, void *recvbuf, int count,
                                                                    MPI_Datatype datatype, MPI_Op op,
                                                                    MPI_Comm comm),
                                            int (*_MPI_Barrier) (MPI_Comm comm)) internal_function;


struct dlcollfs_hook
{
  int (*dlcollfs_comm_push) (MPI_Comm comm);
  void (*dlcollfs_init_pointers) ( int (*_MPI_Initialized)(int *flag),
                                 int (*_MPI_Comm_rank) (MPI_Comm comm, int *rank),
                                 int (*_MPI_Bcast) (void *buffer, int count, 
                                                    MPI_Datatype datatype, int root,MPI_Comm comm),
                                 int (*_MPI_Allreduce) (void *sendbuf, void *recvbuf, int count,
                                                        MPI_Datatype datatype, MPI_Op op,
                                                        MPI_Comm comm),
                                 int (*_MPI_Barrier) (MPI_Comm comm))
  void *pad[4];
};

extern struct dlcollfs_hook *_dlcollfs_hook;
libdl_hidden_proto (_dlcollfs_hook)

#ifndef SHARED
struct link_map;
extern void __libc_register_dlcollfs_hook (struct link_map *map)
     attribute_hidden;
#endif

#endif
