#ifndef _DLCOLLFS_H
#include <dlfcn/dlfcn.h>
#include <dlfcn/dlcollfs.h>
#include <link.h>		/* For ElfW.  */
#include <stdbool.h>

/* Now define the internal interfaces.  */

extern int __libc_dlcollfsinitialize (collfs_debug_vprintf_fp debug_printf, 
                                      const struct libc_collfs_api *api, 
                                      struct libc_collfs_api *unwrap);
extern int __libc_dlcollfsfinalize (void);
  
libc_hidden_proto (__libc_dlcollfsfinalize);
libc_hidden_proto (__libc_dlcollfsinitialize);

extern int _dl_collfsinitialize (collfs_debug_vprintf_fp debug_printf, 
                                 const struct libc_collfs_api *api, 
                                 struct libc_collfs_api *unwrap) internal_function;
extern int _dl_collfsfinalize (void) internal_function;


struct dlcollfs_hook
{
  int (*dlcollfsfinalize) (void);
  int (*dlcollfsinitialize) (collfs_debug_vprintf_fp debug_printf, 
                             const struct libc_collfs_api *api, 
                             struct libc_collfs_api *unwrap);
  void *pad[4];
};

extern struct dlcollfs_hook *_dlcollfs_hook;
libdl_hidden_proto (_dlcollfs_hook)

extern int __dlcollfsinitialize (collfs_debug_vprintf_fp debug_printf, 
                                const struct libc_collfs_api *api, 
                                struct libc_collfs_api *unwrap) attribute_hidden;
extern int __dlcollfsfinalize (void) attribute_hidden;


#ifndef SHARED
struct link_map;
extern void __libc_register_dlcollfs_hook (struct link_map *map)
     attribute_hidden;
#endif

#endif
