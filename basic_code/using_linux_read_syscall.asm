; taking user input using linux read syscall

section .data

    message_1 db "Please enter some string", 10
    message_2 db "You've entered: ", 10

    MESSAGE_1_LENGTH  equ 25
    MESSAGE_2_LENGTH  equ 17
    SYS_WRITE         equ 1
    STANDARD_OUTPUT   equ 1
    STANDARD_INPUT    equ 0
    SYS_READ          equ 0
    BUFFER_LENGTH     equ 256
    SYS_EXIT          equ 60
    EXIT_SUCCESS      equ 0  

section .bss
    
    buffer resb BUFFER_LENGTH

section .text



global _start

_start:
    mov rax, SYS_WRITE
    mov rdi, STANDARD_OUTPUT
    mov rsi, message_1
    mov rdx, MESSAGE_1_LENGTH
    syscall

    mov rax, SYS_READ
    mov rdi, STANDARD_INPUT
    mov rsi, buffer
    mov rdx, BUFFER_LENGTH
    syscall    
    
    mov rax, SYS_WRITE
    mov rdi, STANDARD_OUTPUT
    mov rsi, message_2
    mov rdx, MESSAGE_2_LENGTH
    syscall

    mov rax, SYS_WRITE
    mov rdi, STANDARD_OUTPUT
    mov rsi, buffer
    mov rdx, BUFFER_LENGTH 
    syscall

    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall

; nasm -f elf64 using_linux_read_syscall.asm -o basic_3.o -l list_file_3.lst
; ld basic_3.o -o basic_3 