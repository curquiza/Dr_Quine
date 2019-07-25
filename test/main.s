; nasm -f macho64 main.s ; ld -macosx_version_min 10.8 -lSystem main.o -o TEST
section .data
format: db "rslt = %s", 10, 0
format_nb: db "nb = %d", 10, 0
sully_str: db "TEST", 0
ok_str: db "OK", 0
ko_str: db "KO", 0

section .text
global start
global _main
extern _printf
extern _exit
extern _strrchr
extern _strcmp

start:
call _main
mov rdi, 0
call _exit

_main:
push rbp
mov rbp, rsp

lea rdi, [rel format]
mov rsi, [rbp + 32]
call _printf

mov rdi, [rbp + 32]
mov rsi, '/'
call _strrchr
cmp rax, 0
je end

inc rax
mov rdi, rax
mov rsi, sully_str
call _strcmp

cmp rax, 0
je ok
jmp ko

ok:
mov rsi, ok_str
jmp print

ko:
mov rsi, ko_str
jmp print

print:
mov rdi, format
call _printf

end:
mov rsp, rbp
pop rbp
ret
