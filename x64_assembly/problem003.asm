;The prime factors of 13195 are 5, 7, 13 and 29.
;What is the largest prime factor of the number 600851475143? 

;Assemble and link: nasm -f elf64 problem003.asm -o problem003.o && ld problem003.o -o solution003

section .data
    N dq 600851475143 ;13195

section .bss
    digitSpace resb 100 ;for printing answer
    digitSpacePos resb 8 ;for printing answer

section .text
    global _start

_start:
    
    push rbx
     
    mov rbx, [N]
    mov rcx, 2

    call _while

    call _printRAX
    
    pop rbx

    mov rax, 60
    mov rdi, 0
    syscall

_while:
    
    mov rax, rbx 
    div rcx
    cmp rdx, 0
    je _call

    jmp _skip

    _call:
        call _div

    _skip:

    inc rcx

    mov rax, rcx
    mul rax
    cmp rax, [N]
    jl _while

    mov rax, rbx

    ret

_div:
    mov rax, rbx
    div rcx
    mov rbx, rax
    mov [N], rbx
    mov rcx, 1
    ret

;for printing answer
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



