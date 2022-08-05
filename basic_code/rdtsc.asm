; how to use rdtsc instruction to determine how many CPU ticks took place

extern printf

section .data
    message db "Invoking WRITE SYS_CALL", 10
    

    MESSAGE_LENGTH      equ 24
    SYS_WRITE           equ 1
    STANDARD_OUTPUT     equ 1
    SYS_EXIT            equ 60
    EXIT_SUCCESS        equ 0
    XMM_REGISTERS_USED  equ 0   
   
    stringToPrintf db "CPU ticks took place: %lu",10,0
    res_low        dd 0
    res_high       dd 0



section .text

global main

display_cpu_ticks:
    ; calling printf to display how many CPU ticks took place
    push rbp
    mov  rbp, rsp
    mov  rdi, stringToPrintf
    mov  rsi, qword [res_low]                         
    mov  rax, XMM_REGISTERS_USED
    call printf
    mov  rsp, rbp
    pop  rbp    
    ret

main:
    xor  rcx, rcx                         ; set RCX to 0 
    xor  rax, rax                         ; set RAX to 0
    xor  rdx, rdx                         ; set RDX to 0
 
    rdtsc                                 ; get first values of CPU ticks

    mov  ecx, eax                         ; save first values in ebx/ecx
    mov  ebx, edx

    mov rax, SYS_WRITE
    mov rdi, STANDARD_OUTPUT
    mov rsi, message
    mov rdx, MESSAGE_LENGTH  
    syscall
   
    rdtsc                                 ; get second values of CPU ticks
 
    sub  eax, ecx                         ; subtruct first values from second value 
    sub  ebx, edx

    mov  dword [res_low],  eax            ; save CPU ticks  which took place
    mov  dword [res_high], ebx

    call display_cpu_ticks

    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall

; nasm -f elf64 rdtsc.asm
; gcc rdtsc.o -no-pie
