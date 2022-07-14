; integer arithmetic operations

extern printf

section .data

    SYS_EXIT            equ 60
    EXIT_SUCCESS        equ 0
    XMM_REGISTERS_USED  equ 0    
    
    string_1 db "10 + 10 = %d",10,0
    string_2 db "20 - 10 = %d",10,0
    string_3 db "10 * 10 = %d",10,0
    string_4 db "100/10  = %d",10,0

section .bss

    result resq 1

section .text
    
global main

main:

    mov rbx, 10
    mov qword [result], 10
    add qword [result], rbx ;  10 + 10 
    
    push rbp
    mov  rbp, rsp
    mov  rdi, string_1
    mov  rsi, qword [result]
    mov  rax, XMM_REGISTERS_USED
    call printf    
    mov rsp, rbp
    pop rbp
    
    
    sub qword [result], rbx ; 20 - 10 

    push rbp
    mov  rbp, rsp
    mov  rdi, string_2
    mov  rsi, qword [result]
    mov  rax, XMM_REGISTERS_USED
    call printf    
    mov rsp, rbp
    pop rbp 

    mov rax, qword [result]
    mul rbx                   ; 10 * 10
    mov qword [result], rax

    push rbp
    mov  rbp, rsp
    mov  rdi, string_3
    mov  rsi, qword [result]
    mov  rax, XMM_REGISTERS_USED
    call printf    
    mov rsp, rbp
    pop rbp 

    mov rax, qword [result]
    mov ebx, 10
    div ebx
    mov qword [result], rax    

    push rbp
    mov  rbp, rsp
    mov  rdi, string_4
    mov  rsi, qword [result]
    mov  rax, XMM_REGISTERS_USED
    call printf    
    mov rsp, rbp
    pop rbp       
    
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall 

; nasm -f elf64 integer_arithmetic.asm -o basic_5.o -l list_file_5.lst
; gcc basic_5.o -o basic_5 -no-pie 

