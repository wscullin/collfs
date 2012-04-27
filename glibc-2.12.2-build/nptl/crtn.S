	.file	"pt-initfini.c"
	.section	".toc","aw"
	.section	".text"
#APP
	
#include "defs.h"
	
/*@HEADER_ENDS*/
/*@_init_EPILOG_BEGINS*/
 # 0 "" 2
 # 87 "../nptl/sysdeps/pthread/pt-initfini.c" 1
	.section .init
 # 0 "" 2
#NO_APP
	addi 1,1,128
	ld 0,16(1)
	mtlr 0
	blr
#APP
	END_INIT
	
/*@_init_EPILOG_ENDS*/
/*@_fini_EPILOG_BEGINS*/
 # 0 "" 2
 # 116 "../nptl/sysdeps/pthread/pt-initfini.c" 1
	.section .fini
 # 0 "" 2
#NO_APP
	addi 1,1,128
	ld 0,16(1)
	mtlr 0
	blr
#APP
	END_FINI
	
/*@_fini_EPILOG_ENDS*/
/*@TRAILER_BEGINS*/
	.hidden	__pthread_initialize_minimal_internal
	.ident	"GCC: (BGQ-V1R1M0-120410) 4.4.6"
