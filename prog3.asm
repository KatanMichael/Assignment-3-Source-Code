.model small
.stack 100h
.DATA

arr dw 5,4,7,6,9,8
n dw 6   


.CODE

big proc
push bp
mov bp,sp

mov bx,[bp+4]
mov cx, [bx]

mov bx,[bp+6]
mov dx,[bx]

mov ax,dx
inc bx
inc bx    
dec cx
mov dx,[bx]    
lop:
    
    cmp ax,dx
    jb update
    inc bx
    inc bx
    mov dx,[bx]
    loop lop
    jmp ex
    
update:
    mov ax,dx
    inc bx
    inc bx
    mov dx,[bx]
    loop lop
        
ex:
    pop bp
    ret 4    
    
        
    
    
big endp


main:
mov ax, @DATA
mov ds, ax

mov ax,0

mov bx, offset arr
push bx
mov bx, offset n
push bx

call big


mov ax, 4C00h
int 21h
END main