/* User functions for run-time dynamic loading.
   Copyright (C) 1995-1999,2000,2001,2003,2004,2006
	Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#ifndef	_DLCOLLFS_H
#define	_DLCOLLFS_H 1

#include <features.h>
#define __need_size_t
#include <stddef.h>

/* Collect various system dependent definitions and declarations.  */
#include <bits/dlfcn.h>

#include <mpi.h>

__BEGIN_DECLS

extern void dlcollfs_init_pointers( int (*_MPI_Initialized)(int *flag),
                                    int (*_MPI_Comm_rank) (MPI_Comm comm, int *rank),
                                    int (*_MPI_Bcast) (void *buffer, int count, 
                                                       MPI_Datatype datatype, int root,MPI_Comm comm),
                                    int (*_MPI_Allreduce) (void *sendbuf, void *recvbuf, int count,
                                                           MPI_Datatype datatype, MPI_Op op,
                                                           MPI_Comm comm),
                                    int (*_MPI_Barrier) (MPI_Comm comm));

extern int dlcollfs_comm_push (MPI_Comm comm);

__END_DECLS

#endif	/* dlfcn.h */
