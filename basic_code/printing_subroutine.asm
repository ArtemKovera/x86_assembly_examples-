section .data

    SYS_WRITE       equ 1
    STANDARD_OUTPUT equ 1
    SYS_EXIT        equ 60
    EXIT_SUCCESS    equ 0


    string1 db "First string", 10,0
    string2 db "Second string",10,0
    string3 db "Third string",10,0


section .text
    global _start

_printString:
    push rax       ; this is a poiter to a string to print
    mov  rbx, 0
_loop:             ; this loop executes until rax points to 0
    inc  rax
    inc  rbx       ; length of a string
    mov  cl, byte [rax]
    cmp  cl, 0
    jne  _loop
    mov rax, SYS_WRITE
    mov rdi, STANDARD_OUTPUT
    pop rsi        ; poiter to a string (rax, which has been pushed at the beginning of the subroutine)
    mov rdx, rbx  
    syscall
    ret
    ; end of _printString subroutine


_start:
    mov rax, string1
    call _printString

    mov rax, string2
    call _printString

    mov rax, string3
    call _printString

    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall


; nasm -f elf64 printing_subroutine.asm -o basic_6.o -l list_file_6.lst
; ld basic_6.o -o basic_6