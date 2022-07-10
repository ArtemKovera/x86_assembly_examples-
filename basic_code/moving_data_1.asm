;moving data example 


section .data
    
    ; constants
    EXIT_SUCCESS equ 0
    SYS_exit     equ 60


    value_1 db  0x10                 ; 1 byte
    value_2 dw  0x1000               ; 2 bytes
    value_3 dd  0x100000             ; 4 bytes
    value_4 dq  0x10000000000        ; 8 bytes

section .bss
    
    ud_1 resb  1
    ud_2 resw  1
    ud_3 resd  1
    ud_4 resq  1
    
section .text
    global _start

_start:
    
    mov al,  byte  [value_1]
    mov bx,  word  [value_2]
    mov ecx, dword [value_3]
    mov rdx, qword [value_4]
    mov byte  [ud_1], al
    mov word  [ud_2], bx
    mov dword [ud_3], ecx
    mov qword [ud_4], rdx 
    

    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall 

; nasm -f elf64 moving_data_1.asm -o basic_1.o -l list_file_1.lst
; ld basic_1.o -o basic_1