#include <dlfcn.h>
#include <dlcollfs.h>
#include <stddef.h>
#include <ldsodefs.h>


#if !defined SHARED && defined IS_IN_libdl

int dlcollfsfinalize ()
{
  return __dlcollfsfinalize();
}

#else

struct dlcollfsfinalize_args
{
  /* The return value of dlcollfsfinalize_doit.  */
  int returnint;
};



static void
dlcollfsfinalize_doit (void *ptr)
{
  struct dlcollfsfinalize_args *args = (struct dlcollfsfinalize_args *) ptr;

  args->returnint = GLRO(dl_collfsfinalize) ();
}

int
__dlcollfsfinalize ()
{
# ifdef SHARED
  if (__builtin_expect (_dlfcn_hook != NULL, 0))
    return _dlfcn_hook->dlcollfsfinalize ();
# endif
  struct dlcollfsfinalize_args args;

  return (_dlerror_run (dlcollfsfinalize_doit, &args) ? -1 : args.returnint);
}

# ifdef SHARED
strong_alias (__dlcollfsfinalize, dlcollfsfinalize)
# endif
#endif
