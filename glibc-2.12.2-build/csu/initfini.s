	.file	"initfini.c"
	.section	".toc","aw"
	.section	".text"
#APP
	
#include "defs.h"
	
/*@HEADER_ENDS*/
	
/*@TESTS_BEGIN*/
#NO_APP
	.align 2
	.globl dummy
	.section	".opd","aw"
	.align 3
dummy:
	.quad	.L.dummy,.TOC.@tocbase,0
	.previous
	.type	dummy, @function
.L.dummy:
	mflr 0
	std 0,16(1)
	stdu 1,-128(1)
	cmpdi 0,3,0
	beq 0,.L3
	ld 0,0(3)
	std 2,40(1)
	ld 11,16(3)
	mtctr 0
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
#NO_APP
	.section	".toc","aw"
.LC0:
	.tc __gmon_start__[TC],__gmon_start__
	.section	".text"
	.align 2
	.section	".opd","aw"
	.align 3
call_gmon_start:
	.quad	.L.call_gmon_start,.TOC.@tocbase,0
	.previous
	.type	call_gmon_start, @function
.L.call_gmon_start:
	mflr 0
	std 0,16(1)
	stdu 1,-128(1)
	ld 0,.LC0@toc(2)
	cmpdi 7,0,0
	beq- 7,.L6
	bl __gmon_start__
	nop
.L6:
	addi 1,1,128
	ld 0,16(1)
	mtlr 0
	blr
#APP
	.section .init
#NO_APP
	.section	.init,"ax",@progbits
	.align 2
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
	bl call_gmon_start
#APP
 # 96 "../sysdeps/generic/initfini.c" 1
	ALIGN
 # 0 "" 2
 # 97 "../sysdeps/generic/initfini.c" 1
	END_INIT
 # 0 "" 2
 # 99 "../sysdeps/generic/initfini.c" 1
	
/*@_init_PROLOG_ENDS*/
 # 0 "" 2
 # 100 "../sysdeps/generic/initfini.c" 1
	
/*@_init_EPILOG_BEGINS*/
 # 0 "" 2
 # 101 "../sysdeps/generic/initfini.c" 1
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
 # 116 "../sysdeps/generic/initfini.c" 1
	ALIGN
 # 0 "" 2
 # 117 "../sysdeps/generic/initfini.c" 1
	END_FINI
 # 0 "" 2
 # 118 "../sysdeps/generic/initfini.c" 1
	
/*@_fini_PROLOG_ENDS*/
 # 0 "" 2
#NO_APP
	bl i_am_not_a_leaf
	nop
#APP
 # 129 "../sysdeps/generic/initfini.c" 1
	
/*@_fini_EPILOG_BEGINS*/
 # 0 "" 2
 # 130 "../sysdeps/generic/initfini.c" 1
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
	.weak	__gmon_start__
	.weak	__gmon_start__
	.weak	__gmon_start__
	.weak	__gmon_start__
	.ident	"GCC: (BGQ-V1R1M0-120410) 4.4.6"
