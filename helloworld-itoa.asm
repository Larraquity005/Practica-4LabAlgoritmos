; Hello World Program (Count to 10 itoa)
; Compile with: nasm -f elf helloworld-itoa.asm
; Link with (64-bit systems require elf_i386 option): ld -m elf_i386 helloworld-itoa.o -o helloworld-itoa
; Run with: ./helloworld-itoa

%include "functions.asm"

SECTION .text
global _start

_start:
    mov ecx, 0          ; Inicializa contador en 0

nextNumber:
    inc ecx             ; Incrementa contador
    mov eax, ecx        ; Mueve el valor a eax (argumento para iprintLF)
    call iprintLF       ; Llama a la función para imprimir número con salto de línea
    cmp ecx, 10         ; Compara con 10
    jne nextNumber      ; Si no es 10, sigue contando

    call quit           ; Termina el programa correctamente

