; comment
%define OPEN_SYSCALL 0x2000005
%define CLOSE_SYSCALL 0x2000006
%define O_CREAT_WRONLY_TRUNC 03001o

; Macro with argument (called %1 in marco code line 20)
%macro MAIN 1
global _main
global start

start:
call _main
ret

_main:
push rbp
mov rbp, rsp
sub rsp, 16

lea rdi, [rel %1]				; fd
mov rsi, O_CREAT_WRONLY_TRUNC	; flags
mov rdx, 0644o					; permissions
mov rax, OPEN_SYSCALL			; load syscall
syscall							; call open

jc .end							; check open return with carry

mov [rsp], rax					; load fd onto the stack

mov rdi, rax					; fd
lea rsi, [rel code]				; code as format
mov rdx, 10						; \n
mov rcx, 34						; "
mov r8, 37						; %
lea r9, [rel code]				; code as argument
call _dprintf

mov rdi, [rsp]					; fd
mov rax, CLOSE_SYSCALL			; close
syscall

.end:
mov rsp, rbp
pop rbp
ret
%endmacro

section .data
code: db "; comment%1$c%3$cdefine OPEN_SYSCALL 0x2000005%1$c%3$cdefine CLOSE_SYSCALL 0x2000006%1$c%3$cdefine O_CREAT_WRONLY_TRUNC 03001o%1$c%1$c%3$cmacro MAIN 1%1$cglobal _main%1$cglobal start%1$c%1$cstart:%1$ccall _main%1$cret%1$c%1$c_main:%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 16%1$c%1$clea rdi, [rel %3$c1]%1$cmov rsi, O_CREAT_WRONLY_TRUNC%1$cmov rdx, 0644o%1$cmov rax, OPEN_SYSCALL%1$csyscall%1$c%1$cjc .end%1$c%1$cmov [rsp], rax%1$c%1$cmov rdi, rax%1$clea rsi, [rel code]%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, 37%1$clea r9, [rel code]%1$ccall _dprintf%1$c%1$cmov rdi, [rsp]%1$cmov rax, CLOSE_SYSCALL%1$csyscall%1$c%1$c.end:%1$cmov rsp, rbp%1$cpop rbp%1$cret%1$c%3$cendmacro%1$c%1$csection .data%1$ccode: db %2$c%4$s%2$c, 0%1$cfilename: db %2$cGrace_kid.s%2$c, 0%1$c%1$csection .text%1$cextern _dprintf%1$c%1$cMAIN filename%1$c", 0
filename: db "Grace_kid.s", 0

section .text
extern _dprintf

MAIN filename
