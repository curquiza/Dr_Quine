; comment
%define MACH_SYSCALL(nb) 0x2000000 | nb
%define OPEN 5
%define OPEN2 5
%define FILENAME "Grace_kid.s"

%macro MAIN 1
global _main
global start

start:
call _main
ret

_main:
push rbp
mov rbp, rsp

; lea rdi, [rel %1]
; mov rsi, 1
; mov rdx, 0644
; mov rax, MACH_SYSCALL(OPEN)
; syscall

lea rdi, [rel %1]
mov rsi, 0777
mov rax, MACH_SYSCALL(OPEN2)
syscall

mov rdi, 1
lea rsi, [rel code]
mov rdx, rax
; mov rdx, 10
; mov rcx, 34
; lea r8, [rel code]
call _dprintf

mov rsp, rbp
pop rbp
ret
%endmacro

section .data
code: db "CODE => %d", 10, 0
filename: db FILENAME, 0

section .text
extern _dprintf

MAIN filename
