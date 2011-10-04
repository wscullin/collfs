#include <dlfcn.h>
#include <dlcollfs.h>
#include <stddef.h>
#include <ldsodefs.h>


#if !defined SHARED && defined IS_IN_libdl

int dlcollfsinitialize (collfs_debug_vprintf_fp debug_printf, 
                        const struct libc_collfs_api *api, 
                        struct libc_collfs_api *unwrap)
{
  return __dlcollfsinitialize (debug_printf,
                               api,
                               unwrap);
}

#else

struct dlcollfsinitialize_args
{
  /* The arguments to dlcollfsinitialize_doit.  */
  collfs_debug_vprintf_fp debug_printf;
  const struct libc_collfs_api *api;
  struct libc_collfs_api *unwrap;
  /* The return value of dlcollfsinitialize_doit.  */
  int returnint;
};


static void
dlcollfsinitialize_doit (void *ptr)
{
  struct dlcollfsinitialize_args *args = (struct dlcollfsinitialize_args *) ptr;

  args->returnint = GLRO(dl_collfsinitialize) (args->debug_printf,
                                               args->api,
                                               args->unwrap);
  return;
}

int
__dlcollfsinitialize (collfs_debug_vprintf_fp debug_printf, const struct libc_collfs_api *api, struct libc_collfs_api *unwrap)
{
# ifdef SHARED
  if (__builtin_expect (_dlcollfs_hook != NULL, 0))
    return _dlcollfs_hook->dlcollfsinitialize (debug_printf, api, unwrap);
# endif
  struct dlcollfsinitialize_args args;
  args.debug_printf = debug_printf;
  args.api          = api;
  args.unwrap       = unwrap;

  return (_dlerror_run (dlcollfsinitialize_doit, &args) ? -1 : args.returnint);
}

# ifdef SHARED
strong_alias (__dlcollfsinitialize, dlcollfsinitialize)
# endif
#endif
