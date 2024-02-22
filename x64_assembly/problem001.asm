;Multiples of 3 or 5
;Problem 1
  
;If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
;The sum of these multiples is 23.
 
;Find the sum of all the multiples of 3 or 5 below 1000.

;Assemble and link: nasm -f elf64 problem001.asm -o problem001.o && ld problem001.o -o solution001

section .data
    N  dw 1000 ;find multiple of 3 or 5 below this number

section .bss
    digitSpace resb 100 ;for printing answer
    digitSpacePos resb 8 ;for printing answer
    n1 resb 64
    n2 resb 64
    n3 resb 64
    a resb 64 
    b resb 64
    c resb 64

section .text
    global _start

_start:
    
    ;n1 = N / 3 
    mov rax, [N]
    dec rax
    mov rcx, 3
    div rcx
    mov rdx, 0
    mov [n1], rax
      
    ;n2 = N / 5 
    mov rax, [N]
    dec rax
    mov rcx, 5
    div rcx
    mov rdx, 0
    mov [n2], rax
   
    ;n3 = N / 15 
    mov rax, [N]
    dec rax
    mov rcx, 15
    div rcx
    mov rdx, 0
    mov [n3], rax

    ;a = 3 * (n1 * (n1 + 1)) / 2
    mov rax, [n1] ;rax = n1
    inc rax       ;n1 + 1
    mov rcx, [n1] ;rcx = n1
    mul rcx       ;n1 * (n1 + 1)
    mov rcx, 3    ;rcx = 3
    mul rcx       ;3 * (n1 * (n1 + 1))
    mov rcx, 2    ;rcx = 2
    div rcx       ;3 * (n1 * (n1 + 1)) / 2
    mov [a], rax  ;a = 3 * (n1 * (n1 + 1)) / 2

    ;b = 3 * (n2 * (n2 + 1)) / 2
    mov rax, [n2] ;rax = n2
    inc rax       ;n1 + 1
    mov rcx, [n2] ;rcx = n2
    mul rcx       ;n2 * (n2 + 1)
    mov rcx, 5    ;rcx = 5
    mul rcx       ;5 * (n2 * (n2 + 1))
    mov rcx, 2    ;rcx = 2
    div rcx       ;5 * (n2 * (n2 + 1)) / 2
    mov [b], rax  ;b = 5 * (n2 * (n2 + 1)) / 2
 
    ;c = 15 * (n3 * (n3 + 1)) / 2
    mov rax, [n3] ;rax = n3
    inc rax       ;n1 + 1
    mov rcx, [n3] ;rcx = n3
    mul rcx       ;n3 * (n3 + 1)
    mov rcx, 15   ;rcx = 15
    mul rcx       ;15 * (n3 * (n3 + 1))
    mov rcx, 2    ;rcx = 2
    div rcx       ;15 * (n3 * (n3 + 1)) / 2
    mov [c], rax  ;c = 15 * (n3 * (n3 + 1)) / 2
    
    c = a + b - c
    mov rax, [a] ;rax = a
    add rax, [b] ;rax = a + b
    sub rax, [c] ;rax = a + b - c
    
    ;not the most concise but it gets the job done 
    call _printRAX
    
    mov rax, 60
    mov rdi, 0
    syscall

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



