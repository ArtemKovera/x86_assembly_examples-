#include <sys/syscall.h>

    .intel_syntax noprefix
    .global _start

_start:
    mov rax, SYS_write
    mov rdi, 1
    mov rsi, pointer
    mov rdx, 17
    syscall

    mov rax, SYS_exit
    mov rdi, 0
    syscall
    
S: .string "String to print\n\0"
pointer: .quad S

// gcc -no-pie write.S -nostdlib 
