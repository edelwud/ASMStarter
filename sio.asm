; Helpers for standart input/output in MS DOS
.model small
.stack 100h

.code
; Define print string function
print_string proc
    push ah
    
    mov ah, 09h
    int 21h

    pop ah
    ret
print_string endp

; Geting char procedure
getchar proc
    push ah

    mov ah, 01h
    int 21h

    pop ah
    ret
getchar endp

; Putting char to display
; | input:
; dl - char to display
; | output:
; al - printed char
putchar proc
    push ah 

    mov ah, 02h
    int 21h

    pop ah
    ret
putchar endp


; Getting string from console
; | input:
; dx - empty buffer string
; | output:
; dx - buffer filled data
getstring proc
    push ah
    push bx

    mov ah, 0ah
    int 21
    
    mov bx, dx
    mov bl, [bx + 1]
    add bl, dx
    xor bh, bh
    mov byte ptr[bx + 2], "$"
    add dx, 2
    pop bx
    pop ah
    ret
getstring endp