;Assemble and link: nasm -f elf64 problem007.asm -o problem007.o && ld problem007.o -o solution007

section .data
    maxPrime dq 1000000
    nthPrime dq 10001
    primes dq 10001 dup(2)
    prime dq 2
    primeCount dq 1
    isPrime dq 0
    index dq 0

section .bss
    digitSpace resb 100 ;for printing the answer
    digitSpacePos resb 8 ;for printing the answer

section .text
    global _start

_start:
    call while
    
    done:
    mov rax, [prime]
    call _printRAX

    mov rax, 60
    mov rdi, 0
    syscall

while:

    mov rcx, 0 
    primeTest:
        ;test if prime % primes[rcx] == 0
        xor rdx, rdx 
        mov rax, [prime] 
        mov rbx, [primes + rcx*8] 
        div rbx 
        
        ;set isPrime = false 
        mov rax, 0 
        mov [isPrime], rax 
        
        ;if (remainder == 0) break
        test rdx, rdx 
        je break
        
        ;set isPrime = true
        mov rax, 1 
        mov [isPrime], rax ;set isPrime to True
        
        ;while (rcx*rcx < prime)
        inc rcx 
        mov rax, rcx
        mul rax
        cmp rax, [prime]
        jl primeTest

    break:
    
    ;if (isPrime == 0) 
    mov rax, [isPrime]
    test rax, rax
    je skip
    
    ;primeCount++
    mov rax, [primeCount]
    inc rax
    mov [primeCount], rax
    
    ;index++
    mov rax, [index]
    inc rax
    mov [index], rax

    ;primes[index] = prime
    mov rax, [prime]
    mov rbx, [index]
    mov [primes + rbx*8], rax
    skip:
    
    ;if (primeCount == nthPrime) break
    mov rax, [primeCount]
    cmp rax, [nthPrime]
    je done
    
    ;prime++
    mov rax, [prime]
    inc rax
    mov [prime], rax
    
    ;while prime < maxPrime
    mov rax, [prime]
    cmp rax, [maxPrime]
    jl while
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



