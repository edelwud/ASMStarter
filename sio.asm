; Helpers for standart input/output in MS DOS
.model small

.code
; Define print string function
; | input:
; string - string offset in memory
printstring proc pascal near
arg string:word
uses ax, dx
    mov dx, string
    mov ah, 09h
    int 21h
    ret
endp

; Getting char procedure
; | output:
; al - printed char
getchar proc pascal near
uses bx
    push ax
    mov ah, 01h
    int 21h
    mov bl, al
    pop ax
    mov al, bl
    ret
endp

; Putting char to display
; | input:
; char - char to display
putchar proc pascal near
arg char:byte
uses ax, dx
    mov ah, 02h
    mov dl, char
    int 21h
    ret
endp

; Getting string from console
; | input:
; dx - empty buffer string
; | output:
; dx - buffer filled data
getstring proc pascal near
uses ax, bx
    mov ah, 0ah
    int 21
    
    mov bx, dx
    mov bl, [bx + 1]
    add bx, dx
    xor bh, bh
    mov byte ptr[bx + 2], "$"
    add dx, 2
    ret
endp