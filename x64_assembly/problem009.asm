;Assemble and link: nasm -f elf64 problem009.asm -o problem009.o && ld problem009.o -o solution009

section .data

section .bss
    digitSpace resb 100 ;for printing the answer
    digitSpacePos resb 8 ;for printing the answer
    a resb 8
    b resb 8
    c resb 8

section .text
    global _start

_start:
    mov rcx, 2
    call outerLoop
    
    done: 
    call _printRAX 

    mov rax, 60
    mov rdi, 0
    syscall

;for (rcx = 2; rcx < 1000; inc rcx)
outerLoop:
    mov rbx, 1 
    ;for (rbx = 1; rbx < rcx; inc rbx)
    innerLoop:

        ;a = rcx*rcx - rbx*rbx
        mov rax, rbx ;rax = j
        mul rax ;j*j
        mov r10, rax ;rdx = j*j
        mov rax, rcx ;rax = i
        mul rax ;rax = i*i
        sub rax, r10 ;i*i - j*j 
        mov [a], rax ;a = rax
        
        ;b = 2*rcx*rbx
        mov rax, rcx
        mul rbx
        mov r10, 2
        mul r10
        mov [b], rax

        ;c = rcx*rcx + rbx*rbx
        mov rax, rbx
        mul rax
        mov r10, rax
        mov rax, rcx
        mul rax
        add rax, r10
        mov [c], rax
        
        ;a + b + c
        mov rax, [a]
        add rax, [b]
        add rax, [c]

        ;if (a + b + c == 1000)
        cmp rax, 1000
        jne skip
        mov rax, [a]
        mov r10, [b]
        mul r10
        mov r10, [c]
        mul r10
        jmp done
        skip:

        inc rbx
        cmp rbx, rcx
        jl innerLoop

    inc rcx
    cmp rcx, 1000
    jl outerLoop
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



