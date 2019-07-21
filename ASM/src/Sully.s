%define OPEN_SYSCALL 0x2000005
%define CLOSE_SYSCALL 0x2000006
%define O_CREAT_WRONLY_TRUNC 03001o

section .data
filename: db "Sully_%d.s", 0
compile: db "nasm -f macho64 Sully_%1$d.s -o Sully_%1$d.o", 0
link: db "ld Sully_%1$d.o -macosx_version_min 10.8 -lSystem -o Sully_%1$d", 0
execute: db "./Sully_%d", 0
code: db "section .text", 10, "global start", 10, "global _main", 10, "start: call _main", 10, "ret", 10, "_main: mov rdi, rsi", 0

section .text
global start
global _main
extern _system
extern _asprintf
extern _dprintf
extern _free
extern __progname

start:
call _main
ret

_main:
push rbp
mov rbp, rsp
sub rsp, 96

mov rdi, 1
mov rsi, __progname
call _dprintf

; INIT
; mov byte[rsp], 5
; lea rdi, [rel rsp + 16]
; mov rsi, filename
; mov rdx, [rsp]
; call _asprintf
; lea rdi, [rel rsp + 32]
; mov rsi, compile
; mov rdx, [rsp]
; call _asprintf
; lea rdi, [rel rsp + 48]
; mov rsi, link
; mov rdx, [rsp]
; call _asprintf
; lea rdi, [rel rsp + 64]
; mov rsi, execute
; mov rdx, [rsp]
; call _asprintf
; ; OPEN
; mov rdi, [rsp + 16]
; mov rsi, O_CREAT_WRONLY_TRUNC
; mov rdx, 0644o
; mov rax, OPEN_SYSCALL
; syscall
; jc .end
; mov [rsp + 80], rax
; ; WRITE
; mov rdi, [rsp + 80]
; mov rsi, code
; call _dprintf
; ; CLOSE
; mov rdi, [rsp + 80]
; mov rax, CLOSE_SYSCALL
; syscall
; ; COMPILE
; mov rdi, [rsp + 32]
; call _system
; ; LINK
; mov rdi, [rsp + 48]
; call _system
; ; EXECUTE
; mov rdi, [rsp + 64]
; call _system
; ; FREE
; mov rdi, [rsp + 16]
; call _free
; mov rdi, [rsp + 32]
; call _free
; mov rdi, [rsp + 48]
; call _free
; mov rdi, [rsp + 64]
; call _free

.end:
mov rsp, rbp
pop rbp
ret
