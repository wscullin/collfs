#define _GNU_SOURCE

#include <sys/types.h>
#include <sys/stat.h>
#include <dlfcn.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdio.h>
#include <unistd.h>


typedef int (*openX_proto)(char const *, int, ...);
typedef FILE* (*fopen_proto)(const char *, const char*);

static openX_proto next_open = NULL;
static openX_proto next_open64 = NULL;

void __attribute__((constructor)) interpose_init(void)
{
    fprintf(stderr, "%s", "interpose_init()\n");
    next_open = dlsym(RTLD_NEXT, "open");
    next_open64 = dlsym(RTLD_NEXT, "open64");
}

void __attribute__((destructor)) interpose_fini(void)
{
    fprintf(stderr, "%s", "interpose_fini()\n");
}

static int openX(openX_proto func, char const *pathname, int flags, va_list ap)
{
  return func(pathname, flags, va_arg(ap, mode_t));
}

int open(char const *pathname, int flags, ...)
{
  fprintf(stderr, "open(%s,%d)\n", pathname, flags);
  fflush(stderr);
  va_list ap;
  va_start(ap, flags);
  int ret = openX(next_open, pathname, flags, ap);
  va_end(ap);
  return ret;
}

int open64(char const *pathname, int flags, ...)
{
    fprintf(stderr, "open64()\n");
    fflush(stderr);
    va_list ap;
    va_start(ap, flags);
    int ret = openX(next_open64, pathname, flags, ap);
    va_end(ap);
    return ret;
}
