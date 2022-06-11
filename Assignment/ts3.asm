.model small
.stack 100h

.data
count db 0
a dw 0
b dw 0
e dw 0
d dw 0
suo dw 0
sue dw 0

.code
main proc

mov ax,@data
mov ds,ax

Input1:
mov ah,01h
int 21h

cmp al,13
je Input2

sub al,48
mov cl,al
mov ah,0
mov ax,a
mov bl,10
mul bl
mov ch,0
add ax,cx
mov a,ax
mov e,ax

jmp Input1


Input2:
mov ah,01h
int 21h

cmp al,13
je prog

sub al,48
mov cl,al
mov ah,0
mov ax,b
mov bl,10
mul bl
mov ch,0
add ax,cx
mov b,ax
mov d,ax

jmp Input2

prog:
dec a


cmpki:

inc a

mov bx,a

cmp bx,b
jg Screen

mov ax,a
mov bl,2
div bl

cmp ah,0

jne cmpki

mov ax,a
mov bx,sue
add bx,ax
mov sue,bx

jmp cmpki

Screen:

mov ax,sue
mov bl,10

L1:
cmp al,0
je disp

div bl
mov cl,ah
mov ch,0
push cx
mov ah,0
inc count
jmp L1

disp:
cmp count,0
je exit
pop dx
add dx,24
add dx,24
mov ah, 02h
int 21h
dec count
jmp disp


exit:

mov ah,4ch
int 21h


main endp
end main