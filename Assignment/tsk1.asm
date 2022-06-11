dosseg
.model small
.stack 100h
.data
var1 Db 0
var2 DB 0
.code
main proc
mov AX, @DATA
MOV DS,AX

mov ah,1
int 21h


mov ah,0
sub al,48
mov bl,al
dec bl
mov bh,0
mul bl
dec bx
cmp bx,0
je exit

l1:
mul bx
dec bx
cmp bx,0
je exit
jmp l1

exit:
mov bx,10

disp1:

    inc var1
    cmp ax,0
    je disp2
    div bx
    push dx
    mov dx,0
    jmp disp1

disp2:
    dec var1
    cmp var1,0
    je e2
    pop dx
    add dx,48
    mov ah, 02h
    int 21h
    jmp disp2



e2:
mov ah,4ch
int 21h

main endp
end main
