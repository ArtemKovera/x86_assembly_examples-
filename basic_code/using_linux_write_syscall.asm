; how to print to standard output using linux write sys call

section .data
    message db "Message to the screen", 10
    
    ;constants
    MESSAGE_LENGTH  equ 22
    SYS_WRITE       equ 1
    STANDARD_OUTPUT equ 1
    SYS_EXIT        equ 60
    EXIT_SUCCESS    equ 0


section .text

global _start

_start:
    mov rax, SYS_WRITE
    mov rdi, STANDARD_OUTPUT
    mov rsi, message
    mov rdx, MESSAGE_LENGTH  
    syscall

    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall
    
; nasm -f elf64 using_linux_write_syscall.asm -o basic_2.o -l list_file_2.lst
; ld basic_2.o -o basic_2   