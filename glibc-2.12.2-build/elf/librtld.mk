rtld-csu +=sysdep.os
rtld-csu +=check_fds.os
rtld-csu +=errno.os
rtld-setjmp +=setjmp.os
rtld-setjmp +=sigjmp.os
rtld-setjmp +=__longjmp.os
rtld-setjmp +=novmx-sigjmp.os
rtld-signal +=sigprocmask.os
rtld-string +=strchr.os
rtld-string +=strcmp.os
rtld-string +=strcpy.os
rtld-string +=strlen.os
rtld-string +=strnlen.os
rtld-string +=strncmp.os
rtld-string +=memchr.os
rtld-string +=memcmp.os
rtld-string +=memmove.os
rtld-string +=memset.os
rtld-string +=mempcpy.os
rtld-string +=stpcpy.os
rtld-string +=memcpy.os
rtld-string +=wordcopy.os
rtld-string +=rawmemchr.os
rtld-posix +=uname.os
rtld-posix +=_exit.os
rtld-posix +=getpid.os
rtld-posix +=environ.os
rtld-io +=xstat.os
rtld-io +=fxstat.os
rtld-io +=open.os
rtld-io +=close.os
rtld-io +=read.os
rtld-io +=write.os
rtld-io +=access.os
rtld-io +=fcntl.os
rtld-io +=getcwd.os
rtld-misc +=getpagesize.os
rtld-misc +=mmap.os
rtld-misc +=munmap.os
rtld-misc +=mprotect.os
rtld-misc +=llseek.os
rtld-gmon +=profil.os
rtld-gmon +=prof-freq.os
rtld-nptl +=libc-cancellation.os
rtld-csu +=errno-loc.os
rtld-signal +=sigaction.os
rtld-stdlib +=getenv.os
rtld-stdlib +=strtol.os
rtld-stdlib +=strtol_l.os
rtld-stdlib +=grouping.os
rtld-time +=setitimer.os
rtld-nptl +=forward.os
rtld-locale +=global-locale.os
rtld-stdlib +=exit.os
rtld-stdlib +=cxa_atexit.os
rtld-nptl +=libc-lowlevellock.os
rtld-locale +=C_name.os
rtld-subdirs = csu gmon io locale misc nptl posix setjmp signal stdlib string time
