                            ; Calculator (Addition)
                            ; Compile with: nasm -f elf calculator-addition.asm
                            ; Link with (64-bit systems require elf_i386 option): ld -m elf_i386 calculator-addition.o -o calculator-addition
                            ; Run with: ./calculator-addition

                            %include "functions.asm"

                            SECTION .text
                            global _start

                            _start:
                                mov     eax, 90      ; Load first number into eax
                                mov     ebx, 9       ; Load second number into ebx
                                add     eax, ebx     ; Perform addition: eax = eax + ebx
                                call    iprintLF     ; Print the result with a linefeed

                                call    quit         ; Exit the program

