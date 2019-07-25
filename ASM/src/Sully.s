%define OPEN_SYSCALL 0x2000005
%define CLOSE_SYSCALL 0x2000006
%define O_CREAT_WRONLY_TRUNC 03001o

section .data
filename: db "Sully_%d.s", 0
compile: db "nasm -f macho64 Sully_%1$d.s -o Sully_%1$d.o", 0
link: db "ld Sully_%1$d.o -macosx_version_min 10.8 -lSystem -o Sully_%1$d", 0
execute: db "./Sully_%d", 0
code: db "section .text", 10, "global start", 10, "global _main", 10, "start: call _main", 10, "ret", 10, "_main: mov rdi, rsi", 0
sully_str: db "/Sully", 0

format_nb: db "nb = %d", 10, 0
format: db "str = %s", 10, 0

section .text
global start
global _main
extern _system
extern _asprintf
extern _dprintf
extern _free
extern _strrchr
extern _strcmp

start:
call _main
ret

_main:
push rbp
mov rbp, rsp
sub rsp, 96

mov byte[rsp], 5
; CPT
mov rdi, [rbp + 32]
mov rsi, '/'
call _strrchr
cmp rax, 0
je end
mov rdi, rax
mov rsi, sully_str
call _strcmp

cmp rax, 0
movzx r8, byte[rsp]
dec r8
mov [rsp], r8

mov rdi, 1
mov rsi, format_nb
mov rdx, [rsp]
call _dprintf

; INIT
sully:
; lea rdi, [rel rsp + 16]
; mov rsi, filename
; movzx rdx, byte[rsp]
; call _asprintf
; lea rdi, [rel rsp + 32]
; mov rsi, compile
; movzx rdx, byte[rsp]
; call _asprintf
; lea rdi, [rel rsp + 48]
; mov rsi, link
; movzx rdx, byte[rsp]
; call _asprintf
; lea rdi, [rel rsp + 64]
; mov rsi, execute
; movzx rdx, byte[rsp]
; call _asprintf
; ; OPEN
; mov rdi, [rsp + 16]
; mov rsi, O_CREAT_WRONLY_TRUNC
; mov rdx, 0644o
; mov rax, OPEN_SYSCALL
; syscall
; jc end
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

end:
mov rsp, rbp
pop rbp
ret
