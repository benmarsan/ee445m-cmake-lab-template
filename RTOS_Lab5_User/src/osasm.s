@/*****************************************************************************/
@/* OSasm.s: low-level OS commands, written in assembly                       */
@/*****************************************************************************/
@Jonathan Valvano/Andreas Gerstlauer, OS Lab 5 solution, 2/28/16


.thumb
.section .text
.align 2
@REQUIRE8
@PRESERVE8

.global	OS_Id
.global OS_Sleep
.global	OS_Kill
.global	OS_Time
.global	OS_AddThread

.type OS_Id, %function
.thumb_func
OS_Id:
	SVC		#0
	BX		LR

.type OS_Kill, %function
.thumb_func
OS_Kill:
	SVC		#1
	BX		LR

.type OS_Sleep, %function
.thumb_func
OS_Sleep:
	SVC		#2
	BX		LR

.type OS_Time, %function
.thumb_func
OS_Time:
	SVC		#3
	BX		LR

.type OS_AddThread, %function
.thumb_func
OS_AddThread:
	SVC		#4
	BX		LR

.align
.end
