; multi-segment executable file template.

data segment
    msg1 db "Insert Number: $"
    num1 db ?
    msg2 db "Insert Power: $"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
            
    lea dx, msg1
    mov ah, 09
    int 21h
        
    mov ah, 01
    int 21h
    
    sub al, 30h
    
    mov num1, al
    
    mov bl, al
    
    lea dx, msg2   
    mov ah, 09
    int 21h
    
    mov ah, 01
    int 21h 
    
    sub al, 30h
    
    mov dl, al
    dec dl
    
    mov cx, dx
    loop1:
        
        mov al, num1
        l1:
            add bl, num1
            
            dec al
            
            cmp al, 1
            je nxt
            jmp l1   
    
    loop loop1
    
    nxt:
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
