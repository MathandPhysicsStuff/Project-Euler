;Largest Palindrome Product
;Problem 4
  
;A palindromic number reads the same both ways.
;The largest palindrome made from the product of two 2-digit numbers is
;9009 = 91 x 99.
  
;Find the largest palindrome made from the product of two 3-digit numbers.


;Assemble and link: nasm -f elf64 problem004.asm -o problem004.o && ld problem004.o -o solution004

section .data
    palMax dq 998000
    palMin dq 100000 
    max3digit dq 999
    min3digit dq 100
    strLen dq 6
    halfLen dq 3
    count dq 0
    testNum dq 123456 
    tensPower dq 1
    tempPal dq 0
    newLine db 10
    counter dq 0

section .bss
    digitSpace resb 100 ;for printing answer
    digitSpacePos resb 8 ;for printing answer

    palString resb 6 ;the answer with be a 6 digit string
    tempChar resb 1
    temp resb 4
    divTest resb 8

section .text
    global _start

_start:

    call mainLoop

    done:
        mov rax, [palMax]
        call _printRAX

    mov rax, 60
    mov rdi, 0
    syscall

mainLoop:
    mov rcx, 6
    call intToString

    mov rcx, 0
    call reverseString
 
    mov rax, 1
    mov [tensPower], rax
    mov rax, 0
    mov [tempPal], rax
    mov rcx, 6
    call stringToInt

    mov rax, [tempPal]
    cmp rax, [palMax]
    jne skipLoop
    call divCheck
    skipLoop:

    mov rax, 1
    sub [palMax], rax
    
    mov rax, [palMax]
    cmp rax, [palMin]
    jg mainLoop
    ret

intToString:
    mov r10, [palMax]

    _loop:    
        xor rdx, rdx
        mov rax, [palMax]
        mov rbx, 10
        div rbx
        add rdx, 48
        mov [palString + rcx-1], dl 
        mov [palMax], rax

        dec rcx
        cmp rcx, 0
        jg _loop

    mov [palMax], r10
    ret

stringToInt:
    xor eax, eax
    mov al, [palString + rcx-1]
    sub rax, 48
    mov rbx, [tensPower]
    mul rbx
    add [tempPal], rax 

    mov rax, [tensPower]
    mov rbx, 10
    mul rbx
    mov [tensPower], rax

    dec rcx 
    test rcx, rcx 
    jne stringToInt  
    ret

reverseString:
    xor eax, eax
    mov rax, [palString + rcx]
    mov [tempChar], rax
    mov rbx, [strLen]
    sub rbx, rcx
    mov rax, [palString + rbx-1]
    mov [palString + rcx], al
    xor eax, eax
    mov rax, [tempChar]
    mov rbx, [strLen]
    sub rbx, rcx
    mov [palString + rbx-1], al
    
    inc rcx
    cmp rcx, [halfLen]
    jl reverseString
    ret

divCheck:
    ;mov rax, [tempPal]
    ;call _printRAX
    mov rax, [max3digit]
    mov [divTest], rax

    divLoop:
        
        xor rdx, rdx  
        mov rax, [palMax]
        mov rbx, [divTest]
        div rbx

        cmp rdx, 0
        jne skip

        cmp rax, [min3digit]
        jle skip

        cmp rax, [max3digit]
        jge skip

        jmp done 

        skip:
        
        mov rax, 1
        sub [divTest], rax 

        mov rax, [divTest]
        cmp rax, [min3digit]
        jg divLoop
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



