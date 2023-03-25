// svc_os.s
// Supervisor call routines implemented in assembly for testing SVC handler functionality

.cpu cortex-m4
.syntax unified
.thumb
.section .text
.align 2
// .requires8
// .preserve8

.global	SVC_OS_Id
.global SVC_OS_Sleep
.global	SVC_OS_Kill
.global	SVC_OS_Time
.global	SVC_OS_AddThread

.type SVC_OS_Id, %function
.thumb_func
SVC_OS_Id:
	SVC		#0
	BX		LR

.type SVC_OS_Kill, %function
.thumb_func
SVC_OS_Kill:
	SVC		#1
	BX		LR

.type SVC_OS_Sleep, %function
.thumb_func
SVC_OS_Sleep:
	SVC		#2
	BX		LR

.type SVC_OS_Time, %function
.thumb_func
SVC_OS_Time:
	SVC		#3
	BX		LR

.type SVC_OS_AddThread, %function
.thumb_func
SVC_OS_AddThread:
	SVC		#4
	BX		LR

.align
.end
