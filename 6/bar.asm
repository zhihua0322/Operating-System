; Disassembly of file: ../6/bar.o
; Mon Dec 30 19:49:21 2019
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64

default rel

; global bar_func: function

; extern foo_print                                        ; near
extern _GLOBAL_OFFSET_TABLE_                            ; byte


SECTION .text   align=1 execute                         ; section number 1, code

bar_func:; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 16                                 ; 0004 _ 48: 83. EC, 10
        mov     dword [rbp-4H], edi                     ; 0008 _ 89. 7D, FC
        mov     dword [rbp-8H], esi                     ; 000B _ 89. 75, F8
        mov     eax, dword [rbp-4H]                     ; 000E _ 8B. 45, FC
        cmp     eax, dword [rbp-8H]                     ; 0011 _ 3B. 45, F8
        jle     ?_001                                   ; 0014 _ 7E, 13
        mov     esi, 13                                 ; 0016 _ BE, 0000000D
        lea     rdi, [rel ?_003]                        ; 001B _ 48: 8D. 3D, 00000000(rel)
        call    foo_print                               ; 0022 _ E8, 00000000(PLT r)
        jmp     ?_002                                   ; 0027 _ EB, 11

?_001:  mov     esi, 13                                 ; 0029 _ BE, 0000000D
        lea     rdi, [rel ?_004]                        ; 002E _ 48: 8D. 3D, 00000000(rel)
        call    foo_print                               ; 0035 _ E8, 00000000(PLT r)
?_002:  mov     eax, 0                                  ; 003A _ B8, 00000000
        leave                                           ; 003F _ C9
        ret                                             ; 0040 _ C3
; bar_func End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

?_003:                                                  ; byte
        db 74H, 68H, 65H, 20H, 31H, 73H, 74H, 20H       ; 0000 _ the 1st 
        db 6FH, 6EH, 65H, 0AH, 00H                      ; 0008 _ one..

?_004:                                                  ; byte
        db 74H, 68H, 65H, 20H, 32H, 6EH, 64H, 20H       ; 000D _ the 2nd 
        db 6FH, 6EH, 65H, 0AH, 00H                      ; 0015 _ one..


