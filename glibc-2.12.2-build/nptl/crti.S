	.file	"pt-initfini.c"
	.section	".toc","aw"
	.section	".text"
#APP
	
#include "defs.h"
	
/*@HEADER_ENDS*/
/*@_init_PROLOG_BEGINS*/
	.section .init
#NO_APP
	.section	.init,"ax",@progbits
	.align 2
	.p2align 4,,15
	.globl _init
	.section	".opd","aw"
	.align 3
_init:
	.quad	.L._init,.TOC.@tocbase,0
	.previous
	.type	_init, @function
.L._init:
	mflr 0
	std 0,16(1)
	stdu 1,-128(1)
	bl __pthread_initialize_minimal_internal
	nop
#APP
 # 82 "../nptl/sysdeps/pthread/pt-initfini.c" 1
	ALIGN
 # 0 "" 2
 # 83 "../nptl/sysdeps/pthread/pt-initfini.c" 1
	END_INIT
 # 0 "" 2
 # 85 "../nptl/sysdeps/pthread/pt-initfini.c" 1
	
/*@_init_PROLOG_ENDS*/
/*@_fini_PROLOG_BEGINS*/
	.section .fini
#NO_APP
	.section	.fini,"ax",@progbits
	.align 2
	.p2align 4,,15
	.globl _fini
	.section	".opd","aw"
	.align 3
_fini:
	.quad	.L._fini,.TOC.@tocbase,0
	.previous
	.type	_fini, @function
.L._fini:
	mflr 0
	std 0,16(1)
	stdu 1,-128(1)
#APP
 # 102 "../nptl/sysdeps/pthread/pt-initfini.c" 1
	ALIGN
 # 0 "" 2
 # 103 "../nptl/sysdeps/pthread/pt-initfini.c" 1
	END_FINI
 # 0 "" 2
 # 104 "../nptl/sysdeps/pthread/pt-initfini.c" 1
	
/*@_fini_PROLOG_ENDS*/
/*@TRAILER_BEGINS*/
	.hidden	__pthread_initialize_minimal_internal
	.ident	"GCC: (BGQ-V1R1M0-120410) 4.4.6"
