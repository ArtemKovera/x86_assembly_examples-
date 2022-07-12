
; how to integrate external printf function from stdio into assembly

extern printf

section .data
    
    SYS_EXIT            equ 60
    EXIT_SUCCESS        equ 0
    XMM_REGISTERS_USED  equ 0    
    
    stringToPrintf db "String to print: %s",10,0
    value          db  "some silly words",0

section .bss

section .text

global main

main:

    ; calling external printf
    push rbp
    mov  rbp, rsp
    mov  rdi, stringToPrintf
    mov  rsi, value
    mov  rax, XMM_REGISTERS_USED
    call printf
    mov  rsp, rbp
    pop  rbp


    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall

; nasm -f elf64 integrating_printf.asm -o basic_4.o -l list_file_4.lst
; gcc basic_4.o -o basic_4 -no-pie  