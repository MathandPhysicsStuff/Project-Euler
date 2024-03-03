;The sum of the squares of the first ten natural numbers is,
;1^2 + 2^2 + ... + 10^2 = 385.
  
;The square of the sum of the first ten natural numbers is,
;(1 + 2 + ... + 10)^2 = 55^2 = 3025.
  
;Hence the difference between the sum of the squares of the first ten natural numbers
;and the square of the sum is 3025 - 385 = 2640.
  
;Find the difference between the sum of the squares of the first one hundred natural numbers
;and the square of the sum.

;Assemble and link: nasm -f elf64 problem006.asm -o problem006.o && ld problem006.o -o solution006

section .data
    N dq 100
    sumOfSquares dq 0
    squareOfSums dq 0

section .bss
    digitSpace resb 100 ;for printing the answer
    digitSpacePos resb 8 ;for printing the answer

section .text
    global _start

_start:
    
    mov rcx, [N]
    call sumSquares

    mov rcx, [N]
    call squareSums

    mov rax, [squareOfSums]
    mov rbx, [sumOfSquares]
    sub rax, rbx 

    call _printRAX


    mov rax, 60
    mov rdi, 0
    syscall

sumSquares:
    mov rax, rcx
    mov rbx, rcx
    mul rbx
    add [sumOfSquares], rax

    dec rcx
    cmp rcx, 0
    jg sumSquares 
    ret

squareSums:
    mov rax, rcx
    add [squareOfSums], rax 

    dec rcx
    cmp rcx, 0
    jg squareSums 

    mov rax, [squareOfSums]
    mov rbx, [squareOfSums]
    mul rbx
    mov [squareOfSums], rax 

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



