; Calculator (ATOI)
; Compile with: nasm -f elf calculator-atoi.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 calculator-atoi.o -o calculator-atoi
; Run with: ./calculator-atoi 20 1000 317

%include 'functions3.asm'

SECTION .text
global _start

_start:
    pop ecx  ; first value on the stack is the number of arguments
    pop edx  ; second value on the stack is the program name (discarded)
    dec ecx  ; decrease ecx by 1 (number of arguments without program name)
    xor edx, edx  ; initialize sum

nextArg:
    test ecx, ecx
    jz noMoreArgs

    pop eax
    call atoi
    add edx, eax

    dec ecx
    jmp nextArg

noMoreArgs:
    mov eax, edx
    call iprintLF
    call quit

