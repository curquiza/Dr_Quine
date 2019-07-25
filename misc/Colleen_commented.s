; commentaire outside
section .data
code: db "; commentaire outside%1$csection .data%1$ccode: db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cglobal start%1$cglobal _main%1$cextern _printf%1$c%1$cstart:%1$ccall _main%1$cret%1$c%1$c_main:%1$c; commentaire inside%1$cpush rbp%1$cmov rbp, rsp%1$c%1$clea rdi, [rel code]%1$cmov rsi, 10%1$cmov rdx, 34%1$clea rcx, [rel code]%1$ccall _printf%1$c%1$cmov rsp, rbp%1$cpop rbp%1$ccall end%1$c%1$cend:%1$cret%1$c", 0

section .text
global start
global _main
extern _printf

start:
call _main
ret

_main:
; commentaire inside
push rbp
mov rbp, rsp

lea rdi, [rel code]		; code as format
mov rsi, 10				; \n
mov rdx, 34				; "
lea rcx, [rel code]		; code as string argument
call _printf

mov rsp, rbp
pop rbp
call end

end:
ret
