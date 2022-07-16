extern printf

section .data

    SYS_EXIT            equ 60
    EXIT_SUCCESS        equ 0
    XMM_REGISTERS_USED  equ 0 

    data_1        dq 10
    data_2        dq 10
    data_3        dq 10
    string_1      db "The memory address of data_1 = %p",10,0   
    string_2      db "The memory address of data_2 = %p",10,0   
    string_3      db "The memory address of data_3 = %p",10,0 
    string_4      db "The memory address of data_4 (bss section) = %p",10,0   

section .bss
    
    data_4 resb 1 

section .text
   
global main

main:
    

    mov  rdi, string_1
    mov  rsi, data_1
    mov  rax, XMM_REGISTERS_USED
    call printf    

    mov  rdi, string_2
    mov  rsi, data_2
    mov  rax, XMM_REGISTERS_USED
    call printf   

    mov  rdi, string_3
    lea  rsi, [data_3]                     ; using lea instead of mov
    mov  rax, XMM_REGISTERS_USED
    call printf  

    mov  rdi, string_4
    mov  rsi, data_4
    mov  rax, XMM_REGISTERS_USED
    call printf                
    
    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
    
; nasm -f elf64 examining_memory_addresses.asm -o basic_7.o -l list_file_7.lst
; gcc basic_7.o -o basic_7 -no-pie 