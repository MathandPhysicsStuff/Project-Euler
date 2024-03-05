;The four adjacent digits in the 1000-digit number that have the greatest product are 9 x 9 x 8 x 9 = 5832.
      
;    73167176531330624919225119674426574742355349194934
;    96983520312774506326239578318016984801869478851843
;    85861560789112949495459501737958331952853208805511
;    12540698747158523863050715693290963295227443043557
;    66896648950445244523161731856403098711121722383113
;    62229893423380308135336276614282806444486645238749
;    30358907296290491560440772390713810515859307960866
;    70172427121883998797908792274921901699720888093776
;    65727333001053367881220235421809751254540594752243
;    52584907711670556013604839586446706324415722155397
;    53697817977846174064955149290862569321978468622482
;    83972241375657056057490261407972968652414535100474
;    82166370484403199890008895243450658541227588666881
;    16427171479924442928230863465674813919123162824586
;    17866458359124566529476545682848912883142607690042
;    24219022671055626321111109370544217506941658960408
;    07198403850962455444362981230987879927244284909188
;    84580156166097919133875499200524063689912560717606
;    05886116467109405077541002256983155200055935729725
;    71636269561882670428252483600823257530420752963450
     
;Find the thirteen adjacent digits in the
;1000-digit number that have the greatest product. What is the value of this product?

;Assemble and link: nasm -f elf64 problem008.asm -o problem008.o && ld problem008.o -o solution008

section .data
    numberString db "73167176531330624919225119674426574742355349194934",
                 db "96983520312774506326239578318016984801869478851843",
                 db "85861560789112949495459501737958331952853208805511",
                 db "12540698747158523863050715693290963295227443043557",
                 db "66896648950445244523161731856403098711121722383113",
                 db "62229893423380308135336276614282806444486645238749",
                 db "30358907296290491560440772390713810515859307960866",
                 db "70172427121883998797908792274921901699720888093776",
                 db "65727333001053367881220235421809751254540594752243",
                 db "52584907711670556013604839586446706324415722155397",
                 db "53697817977846174064955149290862569321978468622482",
                 db "83972241375657056057490261407972968652414535100474",
                 db "82166370484403199890008895243450658541227588666881",
                 db "16427171479924442928230863465674813919123162824586",
                 db "17866458359124566529476545682848912883142607690042",
                 db "24219022671055626321111109370544217506941658960408",
                 db "07198403850962455444362981230987879927244284909188",
                 db "84580156166097919133875499200524063689912560717606",
                 db "05886116467109405077541002256983155200055935729725",
                 db "71636269561882670428252483600823257530420752963450", 0

    nStrLen dq 1000
    digitsLen dq 13
    solution dq 0

section .bss
    digitSpace resb 100 ;for printing the answer
    digitSpacePos resb 8 ;for printing the answer

section .text
    global _start

_start:
    mov r10, [nStrLen]
    sub r10, [digitsLen] 
    mov rcx, 0
    
    call while

    mov rax, [solution]
    call _printRAX

    mov rax, 60
    mov rdi, 0
    syscall

;while (rcx < nStrLen - digitsLen)
while:
    mov r8, 1 ;digitProduct
    mov rbx, 0
    ;while (rbx < digitsLen) 
    findProduct:
        ;digitProduct *= numberString[i + j] - 48;
        xor rdx, rdx
        mov dl, [numberString + rcx+rbx]
        sub rdx, 48
        mov rax, r8
        mul rdx
        mov r8, rax

        inc rbx
        cmp rbx, [digitsLen]
        jl findProduct
   
    ;if (digitProduct > solution) solution = digitProduct
    mov rax, r8;[digitProduct]
    cmp rax, [solution]
    jl skip
    mov [solution], rax
    skip:

    inc rcx
    cmp rcx, r10 
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



