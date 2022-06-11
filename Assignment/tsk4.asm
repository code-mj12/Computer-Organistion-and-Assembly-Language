.model small
.stack 100h

.data
count db 0
a db 0
b db 0
d db 0

.code
main proc

mov ax,@data
mov ds,ax

;taking input 1
mov ah,1
int 21h
sub al,48
mov a,al

;taking input 2
mov ah,1
int 21h
sub al,48
mov b,al

;taking input 3
mov ah,1
int 21h
sub al,48
mov d,al


;new line
mov dl,10
mov ah,02h
int 21h

fgh:

;a>=b
mov bl,a
cmp bl,b
jge cmpad
;b>=a
jmp cmpb_d1

;a>=d
cmpad:
mov bl,a
cmp bl,d 
jge cmpb_d
jmp cmpd_b

;b>=d
cmpb_d:
mov bl,b
cmp bl,d
jge printdba
jmp printb_d_a

cmpb_d1:
mov bl,b
cmp bl,d 
jge cmpad1
jmp printa_b_d

cmpad1:
mov bl,a
cmp bl,d 
jge printd_a_b
jmp printa_d_b

cmpd_b:
mov bl,d 
cmp bl,b 
jge cmpa_b

cmpa_b:
mov bl,a 
cmp bl,b
jge printb_a_d
jmp printa_b_d

;asscending order
printdba:
mov bl,d
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,b
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,a
add bl,48
mov dl,bl
mov ah,02h
int 21h
;new line
mov dl,10
mov ah,02h
int 21h
;descending

jmp exit

;asscending order
printb_d_a:
mov bl,b
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,d
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,a
add bl,48
mov dl,bl
mov ah,02h
int 21h
;new line
mov dl,10
mov ah,02h
int 21h
;descending

jmp exit

;asscending order
printd_a_b:
mov bl,d
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,a
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,b
add bl,48
mov dl,bl
mov ah,02h
int 21h
;new line
mov dl,10
mov ah,02h
int 21h
;descending

jmp exit

;asscending order
printa_d_b:
mov bl,a
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,d
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,b
add bl,48
mov dl,bl
mov ah,02h
int 21h
;new line
mov dl,10
mov ah,02h
int 21h
;descending

jmp exit


;asscending order
printb_a_d:
mov bl,b
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,a
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,d
add bl,48
mov dl,bl
mov ah,02h
int 21h
;new line
mov dl,10
mov ah,02h
int 21h
;descending

jmp exit

;asscending order
printa_b_d:
mov bl,a
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,b
add bl,48
mov dl,bl
mov ah,02h
int 21h
mov bl,d
add bl,48
mov dl,bl
mov ah,02h
int 21h
;new line
mov dl,10
mov ah,02h
int 21h
;descending

jmp exit


exit:


mov ah,4ch
int 21h

main endp
end main