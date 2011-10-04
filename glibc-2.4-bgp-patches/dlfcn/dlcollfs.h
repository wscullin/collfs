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

#include <sys/param.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdarg.h>

/* Collect various system dependent definitions and declarations.  */
#include <bits/dlfcn.h>

/* The libc printf cannot be called directly from libdl, so call via this function pointer when appropriate. */
typedef int (*collfs_debug_vprintf_fp)(int level,const char *fmt,va_list ap);

typedef int (*collfs_fxstat64_fp)(int vers, int fd, struct stat64 *buf);
typedef int (*collfs_xstat64_fp)(int vers, const char *file, struct stat64 *buf);
typedef int (*collfs_open_fp)(const char *pathname, int flags, mode_t mode);
typedef int (*collfs_close_fp)(int fd);
typedef ssize_t (*collfs_read_fp)(int fd, void *buf, size_t count);
typedef off_t (*collfs_lseek_fp)(int fildes, off_t offset, int whence);
typedef void *(*collfs_mmap_fp)(void *addr, size_t len, int prot, int flags, int fildes, off_t off);
typedef int (*collfs_munmap_fp)(__ptr_t addr, size_t len);

struct libc_collfs_api {
  collfs_fxstat64_fp fxstat64;
  collfs_xstat64_fp  xstat64;
  collfs_open_fp     open;
  collfs_close_fp    close;
  collfs_read_fp     read;
  collfs_lseek_fp    lseek;
  collfs_mmap_fp     mmap;
  collfs_munmap_fp   munmap;
};

__BEGIN_DECLS

extern int dlcollfsinitialize(collfs_debug_vprintf_fp debug_printf, const struct libc_collfs_api *api, struct libc_collfs_api *unwrap);
extern int dlcollfsfinalize(void);

__END_DECLS

#endif	/* dlcollfs.h */
