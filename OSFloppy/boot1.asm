org 0x7c00;

entry:
	mov ax, 0
	mov ss, ax
	mov ds, ax
	mov es, ax
	mov si, msg

readFloopy:
	mov CH, 1
	mov DH, 0
	mov CL, 2
	mov BX, msg
	mov AH, 0x02
	mov AL, 1
	mov DL, 0
	INT 0x13
	jc error

putloop:
	mov al, [si]
	add si, 1
	cmp al, 0
	je fin
	mov ah, 0x0e
	mov bx, 15
	int 0x10
	jmp putloop

fin:
	HLT
	jmp fin

error:
	mov si, errmsg
	jmp putloop

msg:
	RESB	64
errmsg:
	DB "error"
