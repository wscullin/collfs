	.file	"pt-initfini.c"
	.section	".toc","aw"
	.section	".text"
#APP
	
#include "defs.h"
	
/*@HEADER_ENDS*/
	
/*@TESTS_BEGIN*/
#NO_APP
	.align 2
	.p2align 4,,15
	.globl dummy
	.section	".opd","aw"
	.align 3
dummy:
	.quad	.L.dummy,.TOC.@tocbase,0
	.previous
	.type	dummy, @function
.L.dummy:
	mflr 0
	cmpdi 0,3,0
	std 0,16(1)
	stdu 1,-128(1)
	beq 0,.L3
	ld 0,0(3)
	std 2,40(1)
	mtctr 0
	ld 11,16(3)
	ld 2,8(3)
	bctrl
	ld 2,40(1)
.L3:
	addi 1,1,128
	ld 0,16(1)
	mtlr 0
	blr
#APP
	
/*@TESTS_END*/
	
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
 # 0 "" 2
 # 86 "../nptl/sysdeps/pthread/pt-initfini.c" 1
	
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
 # 0 "" 2
#NO_APP
	bl i_am_not_a_leaf
	nop
#APP
 # 115 "../nptl/sysdeps/pthread/pt-initfini.c" 1
	
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
