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
je Input3

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


;fourth input
Input3:
mov dx,a2
add ob, dx
mov ax,0
mov cx,0
mov dx,0
mov bx,0
mov ah,01h
int 21h

cmp al,13
je Input4

sub al,48
mov cl,al
mov ah,0
mov ax,a3
mov bl,10
mul bl
mov ch,0
add ax,cx
mov a3,ax

jmp Input3


;fifth input
Input4:
mov dx,a3
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
mov ax,a4
mov bl,10
mul bl
mov ch,0
add ax,cx
mov a4,ax

jmp Input4


Output:
mov ax,a4
add ax,a3
add ax,a1
add ax,a2
add ax,a
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
add dx,48
mov ah, 02h
int 21h
dec count
jmp disp

exit:

mov ah,4ch
int 21h


main endp
end main
