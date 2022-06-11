;COAL
;Majid Ahmed khan 19i1796 AI-J
;this code adds 2 32 bit number first divding the each 32 bit numbers into 2 16 bit numbers
; (ffff ffff + ffff ffff ) <- it can add this as highest also 
;the result is stored in CX,DX,AX in this respective way to store the number
;then the first 4 lsb are added and if their is a carry then their carry is added to var
;var1 and var are then added and if carry is here then it is stored in cx
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
