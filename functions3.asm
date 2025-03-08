SECTION .text

; ATOI function - Convierte cadena en EAX a entero
global atoi
atoi:
    push ebx
    push ecx
    push edx
    push esi

    mov esi, eax  ; Apuntar al string
    xor eax, eax  ; Inicializar resultado
    xor ecx, ecx  ; Contador de posición

.multiplyLoop:
    mov bl, [esi + ecx]
    test bl, bl
    jz .finished

    cmp bl, '0'
    jl .finished
    cmp bl, '9'
    jg .finished

    sub bl, '0'
    imul eax, eax, 10
    add eax, ebx

    inc ecx
    jmp .multiplyLoop

.finished:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret

; Print integer with newline
global iprintLF
iprintLF:
    call iprint      ; Imprimir número
    mov eax, 0xA     ; Código ASCII de '\n' (salto de línea)
    call putchar     ; Imprimir el salto de línea
    ret

; Exit program
global quit
quit:
    mov eax, 1       ; syscall exit
    xor ebx, ebx     ; Código de salida 0
    int 0x80         ; Llamada al kernel para salir
    ret

; Print integer stored in EAX
global iprint
iprint:
    push eax
    push ebx
    push ecx
    push edx

    mov ecx, 10      ; Base 10
    mov ebx, esp     ; Apuntar al stack

.divideLoop:
    xor edx, edx
    div ecx          ; EAX / 10, Resto en EDX
    add dl, '0'      ; Convertir dígito a ASCII
    dec ebx
    mov [ebx], dl    ; Guardar dígito en el stack
    test eax, eax
    jnz .divideLoop

.printLoop:
    movzx eax, byte [ebx]
    call putchar     ; Imprimir carácter
    inc ebx
    cmp ebx, esp
    jne .printLoop

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

; Print a single character in AL
global putchar
putchar:
    push eax
    push ebx
    push ecx
    push edx

    mov ebx, 1      ; stdout
    mov ecx, esp    ; Dirección del carácter
    mov edx, 1      ; Longitud 1 byte
    mov eax, 4      ; syscall write
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

