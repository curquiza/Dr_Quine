%define OPEN_SYSCALL 0x2000005
%define CLOSE_SYSCALL 0x2000006
%define O_CREAT_WRONLY_TRUNC 03001o
%define O_RDONLY 0

section .data
filename: db "Sully_%d.s", 0
compile: db "nasm -f macho64 Sully_%1$d.s -o Sully_%1$d.o", 0
link: db "ld Sully_%1$d.o -macosx_version_min 10.8 -lSystem -o Sully_%1$d", 0
execute: db "./Sully_%d", 0
code: db "%3$cdefine OPEN_SYSCALL 0x2000005%1$c%3$cdefine CLOSE_SYSCALL 0x2000006%1$c%3$cdefine O_CREAT_WRONLY_TRUNC 03001o%1$c%3$cdefine O_RDONLY 0%1$c%1$csection .data%1$cfilename: db %2$cSully_%3$cd.s%2$c, 0%1$ccompile: db %2$cnasm -f macho64 Sully_%3$c1$d.s -o Sully_%3$c1$d.o%2$c, 0%1$clink: db %2$cld Sully_%3$c1$d.o -macosx_version_min 10.8 -lSystem -o Sully_%3$c1$d%2$c, 0%1$cexecute: db %2$c./Sully_%3$cd%2$c, 0%1$ccode: db %2$c%5$s%2$c, 0%1$csully5_asm_file: db %2$cSully_5.s%2$c, 0%1$c%1$csection .text%1$cglobal start%1$cglobal _main%1$cextern _system%1$cextern _asprintf%1$cextern _dprintf%1$cextern _free%1$c%1$cstart:%1$ccall _main%1$cret%1$c%1$c_main:%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 96%1$c; CPT%1$cmov byte[rsp], %4$d%1$cmov rdi, sully5_asm_file%1$cmov rsi, O_RDONLY%1$cmov rax, OPEN_SYSCALL%1$csyscall%1$cjc sully%1$cmovzx r8, byte[rsp]%1$cdec r8%1$cmov [rsp], r8%1$cmov rdi, rax%1$cmov rax, CLOSE_SYSCALL%1$csyscall%1$csully:%1$c; INIT%1$clea rdi, [rel rsp + 16]%1$cmov rsi, filename%1$cmovzx rdx, byte[rsp]%1$ccall _asprintf%1$clea rdi, [rel rsp + 32]%1$cmov rsi, compile%1$cmovzx rdx, byte[rsp]%1$ccall _asprintf%1$clea rdi, [rel rsp + 48]%1$cmov rsi, link%1$cmovzx rdx, byte[rsp]%1$ccall _asprintf%1$clea rdi, [rel rsp + 64]%1$cmov rsi, execute%1$cmovzx rdx, byte[rsp]%1$ccall _asprintf%1$c; OPEN%1$cmov rdi, [rsp + 16]%1$cmov rsi, O_CREAT_WRONLY_TRUNC%1$cmov rdx, 0644o%1$cmov rax, OPEN_SYSCALL%1$csyscall%1$cjc end%1$cmov [rsp + 80], rax%1$c; WRITE%1$cmov rdi, [rsp + 80]%1$clea rsi, [rel code]%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, 37%1$cmovzx r9, byte[rsp]%1$clea r10, [rel code]%1$ccall _dprintf%1$c; CLOSE%1$cmov rdi, [rsp + 80]%1$cmov rax, CLOSE_SYSCALL%1$csyscall%1$c; COMPILE%1$cmov rdi, [rsp + 32]%1$ccall _system%1$c; LINK%1$cmov rdi, [rsp + 48]%1$ccall _system%1$c; EXECUTE%1$ccmp byte[rsp], 0%1$cjg free%1$cmov rdi, [rsp + 64]%1$ccall _system%1$c; FREE%1$cfree:%1$cmov rdi, [rsp + 16]%1$ccall _free%1$cmov rdi, [rsp + 32]%1$ccall _free%1$cmov rdi, [rsp + 48]%1$ccall _free%1$cmov rdi, [rsp + 64]%1$ccall _free%1$c%1$cend:%1$cmov rsp, rbp%1$cpop rbp%1$cret%1$c", 0
sully5_asm_file: db "Sully_5.s", 0

section .text
global start
global _main
extern _system
extern _asprintf
extern _dprintf
extern _free

start:
call _main
ret

_main:
push rbp
mov rbp, rsp
sub rsp, 96
; CPT
mov byte[rsp], 5
mov rdi, sully5_asm_file
mov rsi, O_RDONLY
mov rax, OPEN_SYSCALL
syscall
jc sully
movzx r8, byte[rsp]
dec r8
mov [rsp], r8
mov rdi, rax
mov rax, CLOSE_SYSCALL
syscall
sully:
; INIT
lea rdi, [rel rsp + 16]
mov rsi, filename
movzx rdx, byte[rsp]
call _asprintf
lea rdi, [rel rsp + 32]
mov rsi, compile
movzx rdx, byte[rsp]
call _asprintf
lea rdi, [rel rsp + 48]
mov rsi, link
movzx rdx, byte[rsp]
call _asprintf
lea rdi, [rel rsp + 64]
mov rsi, execute
movzx rdx, byte[rsp]
call _asprintf
; OPEN
mov rdi, [rsp + 16]
mov rsi, O_CREAT_WRONLY_TRUNC
mov rdx, 0644o
mov rax, OPEN_SYSCALL
syscall
jc end
mov [rsp + 80], rax
; WRITE
mov rdi, [rsp + 80]
lea rsi, [rel code]
mov rdx, 10
mov rcx, 34
mov r8, 37
movzx r9, byte[rsp]
lea r10, [rel code]
call _dprintf
; CLOSE
mov rdi, [rsp + 80]
mov rax, CLOSE_SYSCALL
syscall
; COMPILE
mov rdi, [rsp + 32]
call _system
; LINK
mov rdi, [rsp + 48]
call _system
; EXECUTE
cmp byte[rsp], 0
jg free
mov rdi, [rsp + 64]
call _system
; FREE
free:
mov rdi, [rsp + 16]
call _free
mov rdi, [rsp + 32]
call _free
mov rdi, [rsp + 48]
call _free
mov rdi, [rsp + 64]
call _free

end:
mov rsp, rbp
pop rbp
ret
