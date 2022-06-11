.model small
.stack 100h

.data
count db 0
a dw 0
a1 dw 0
a2 dw 0
a3 dw 0
a4 dw 0
t dw 0
t1 dw 0
t2 dw 0
t3 dw 0
t4 dw 0
.code
main proc

mov ax,@data
mov ds,ax


mov ah,01h
int 21h
mov ah,0
sub ax,48
mov a,ax

mov ah,01h
int 21h
mov ah,0
sub ax,48
sub ax,48
mov t,ax

;---------
mov ah,01h
int 21h
mov ah,0
sub ax,48
mov a1,ax

mov ah,01h
int 21h
mov ah,0
sub ax,48
mov t1,ax

;---------
mov ah,01h
int 21h
mov ah,0
sub ax,48
mov a2,ax

mov ah,01h
int 21h
mov ah,0
sub ax,48
mov t2,ax

;---------
mov ah,01h
int 21h
mov ah,0
sub ax,48
mov a3,ax

mov ah,01h
int 21h
mov ah,0
sub ax,48
mov t3,ax

;---------
mov ah,01h
int 21h
mov ah,0
sub ax,48
mov a4,ax

mov ah,01h
int 21h
mov ah,0
sub ax,48
mov t4,ax

mov bx,t4
add bx,t3
add bx,t2
add bx,t1
add bx,t

mov cx,a
add cx,a1
add cx,a2
add cx,a3
add cx,a4

mov dx,bx
add dx,48
add dx,48
mov ah,02h
int 21h


mov ah,4ch
int 21h

main endp
end main