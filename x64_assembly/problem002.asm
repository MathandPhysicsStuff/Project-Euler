
;Assemble and link: nasm -f elf64 problem002.asm -o problem002.o && ld problem002.o -o solution002

section .data
    max_fib dd 4000000
    a dd 1
    b dd 2
    temp dd 0
    sum dd 0

section .bss
    digitSpace resb 100 ;for printing the answer
    digitSpacePos resb 8 ;for printing the answer

section .text
    global _start

_start:
    
    push rbx
    
    mov rbx, 1  ;seed value
    mov rcx, 2  ;seed value

    mov r8, 2

    call _while

    mov rax, [sum]

    call _printRAX

    mov rax, 60
    mov rdi, 0
    syscall

_while:
    
    mov rax, rcx ;copy rcx to rax div test
    div r8       ;r8 is always 2
    cmp rdx, 0   ;true if rax is divisible by 2
    je _call

    jmp _skip

    _call:
        call _add 

    _skip:
    
    ;r9 = temp = rbx + rcx
    mov r9, rbx 
    add r9, rcx 
    
    mov rbx, rcx ;rbx = rcx
    mov rcx, r9  ;rcx = temp
    
    cmp rcx, max_fib
    jl _while

    ret

_add:
    add [sum], rcx
    ret
 

;for printing the answer
_printRAX:
    mov rcx, digitSpace ;moves 100 resurved bytes into rcx
    mov rbx, 10 ;10 is a new line
    mov [rcx], rbx
    inc rcx
    mov [digitSpacePos], rcx

_printRAXLoop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48

    mov rcx, [digitSpacePos]
    mov [rcx], dl

    inc rcx
    mov [digitSpacePos], rcx

    pop rax
    cmp rax, 0
    jne _printRAXLoop

_printRAXLoop2:
    mov rcx, [digitSpacePos]
 
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall
 
 
    mov rcx, [digitSpacePos]
    dec rcx
    mov [digitSpacePos], rcx
 
    cmp rcx, digitSpace
    jge _printRAXLoop2
 
    ret



