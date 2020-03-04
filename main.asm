.model small
.stack 100h

include sio.asm

.data
    message db 80, 0, 79 dup (?), "$"

.code
start:
    mov ax, @data
    mov ds, ax

    call getstring pascal, offset message
    call printstring pascal, offset message
exit:
    mov ah, 4ch
    int 21h
end start