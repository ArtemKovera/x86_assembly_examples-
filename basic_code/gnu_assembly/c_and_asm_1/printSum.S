    .intel_syntax noprefix

.data
    S: .string "The sum = %d \n"
    string_ptr: .quad S    

.text
    .global printSum

printSum:
    
    push rbp
    mov rbp, rsp

    add rsi, rdi     //summation goes to rsi

    mov  rdi, string_ptr
    mov  rax, 0
   
    call printf


    mov rsp, rbp
    pop rbp
    ret
    





