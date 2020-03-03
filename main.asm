.model small
.stack 100h

include sio.asm

.data
    message db 80, 0, 79 dup (?), "$"

.code
start:
    mov ax, @data
    mov ds, ax
    lea dx, message

    call getchar
    mov dl, al
    call putchar

    call exit
exit:
    mov ah, 4ch
    int 21h
end start