; Helpers for standart input/output in MS DOS
.model small

.code
; Define print string function
; | input:
; string - string offset in memory
printstring proc pascal near
arg string:word
uses ax, dx
    add string, 2 ; header offset
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
; string - empty buffer string
; | output:
; string - buffer filled data
getstring proc pascal near
arg string:word
uses ax, bx
    mov ah, 0ah
    mov dx, string
    int 21h
    
    mov bx, dx
    mov bl, [bx + 1]
    add bx, dx
    xor bh, bh
    mov byte ptr[bx + 2], "$"
    add dx, 2
    ret
endp

; Getting integer from console
; | output:
; ax - integer
getint proc pascal near
arg number:word
uses cx
    xor ax, ax
    xor cx, cx
    mov ch, 10
getint_iterator:
    push ax
    call getchar
    cmp al, 0dh
    je getint_break
    sub al, "0"
    mov cl, al
    pop ax
    mul ch
    add al, cl
    jmp getint_iterator
getint_break:
    pop ax
    ret
endp

; Print integer
; | input:
; number - integer
printint proc pascal near
arg number:word
uses ax, bx, cx, dx
    mov ax, number
    mov bl, 10
    xor cx, cx
    xor dx, dx
printint_iterator:
    div bl
    inc cx
    
    mov dl, ah
    push dx

    cmp al, 0
    je printint_break
    
    xor ah, ah

    jmp printint_iterator
printint_break:
    pop ax
    xor ah, ah
    add ax, 30h
    call putchar pascal, ax
    loop printint_break
    ret
endp