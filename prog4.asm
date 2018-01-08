.model small
.stack 100h
.DATA

string db 'P','X','e','J','t','c',0
char db 'c'


.CODE

findChar proc
    push bp
    mov bp,sp
    mov bx,[bp+4]
    mov cl,[bx]
    
    mov bx,[bp+6]
    inc bx
    mov ax,1
    
    lop:
        cmp cl,[bx]
        je ex
        inc ax
        inc bx
        jmp lop
       
        
    ex:
        inc ax
        pop bp
        ret 4

main:
mov ax, @DATA
mov ds, ax

mov cx,0
mov ax,0
mov bx,offset string
push bx

mov bx, offset char
push bx

call findChar




mov ax, 4C00h
int 21h
END main