
.model small
.stack 100h
.data
VAR Dw 0abcdh,01234h
VAR1 Dw 01234h,05678h
RES1 dw ?
.code
main proc
mov AX, @DATA
mov DS,AX


mov ax,VAR+2
mov bx,VAR1+2
add ax,bx;if carry
jnc ji
jmp jj

ji:
mov RES1,ax
mov ax, VAR
mov bx,VAR1
add ax,bx
jnc store
inc cx
jmp store

jj:
mov RES1,ax
mov ax, VAR
mov bx,VAR1
add ax,1
add ax,bx
jnc store
inc cx

store:
mov RES1+2,ax


mov ax,RES1
mov dx,RES1+2

mov ah,4ch
int 21h



main endp
end main
