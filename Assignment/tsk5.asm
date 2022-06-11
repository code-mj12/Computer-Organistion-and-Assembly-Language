.model small
.stack 100h

.data
count db 0
a dw 0
a1 dw 0
a2 dw 0
a3 dw 0
a4 dw 0
a5 dw 0
ob dw 0

.code
main proc

mov ax,@data
mov ds,ax

Input:
mov ah,01h
int 21h

cmp al,13
je Input1

sub al,48
mov cl,al
mov ah,0
mov ax,a
mov bl,10
mul bl
mov ch,0
add ax,cx
mov a,ax

jmp Input

;second input
Input1:
mov dx,a
add ob, dx
mov ax,0
mov cx,0
mov dx,0
mov bx,0
mov ah,01h
int 21h

cmp al,13
je Input2

sub al,48
mov cl,al
mov ah,0
mov ax,a1
mov bl,10
mul bl
mov ch,0
add ax,cx
mov a1,ax

jmp Input1

;third input
Input2:
mov dx,a1
add ob, dx

mov ax,0
mov cx,0
mov dx,0
mov bx,0
mov ah,01h
int 21h

cmp al,13
je Output

sub al,48
mov cl,al
mov ah,0
mov ax,a2
mov bl,10
mul bl
mov ch,0
add ax,cx
mov a2,ax

jmp Input2


Output:
mov bx,a
cmp bx,a1
jg aga1
jmp a1ga

a1ga:
mov bx,a1
cmp bx,a2
jg a1g
jmp a2g

a1g:
mov ax,a1
jmp norm


aga1:
mov bx,a
cmp bx,a2
jg ag; a is greatest
jmp a2g

a2g:
mov ax,a2
jmp norm

ag:
mov ax,a
jmp norm

norm:
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
je e1
pop dx
add dx,48
mov ah, 02h
int 21h
dec count
jmp disp

e1:

mov count,0

mov bx,a
cmp bx,a1
jl ala1
jmp a1la

a1la:
mov bx,a1
cmp bx,a2
jl a1l ;a1 least
jmp a2l ;a2 least

a1l:
mov ax,a1
jmp norm1


ala1:
mov bx,a
cmp bx,a2
jl ala; a is least
jmp a2l

a2l:
mov ax,a2
jmp norm1

ala:
mov ax,a
jmp norm1

norm1:
mov bl,10

L11:
cmp al,0
je disp1

div bl
mov cl,ah
mov ch,0
push cx
mov ah,0
inc count
jmp L11

disp1:
cmp count,0
je exit
pop dx
add dx,48
mov ah, 02h
int 21h
dec count
jmp disp1


exit:

mov ah,4ch
int 21h


main endp
end main