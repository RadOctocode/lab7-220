.intel_syntax noprefix
.text
.global reverse_asm

reverse_asm:
    push ebx
    mov eax, 0x0
    mov ebx, eax
    mov ecx, eax
    mov edx, eax
    mov eax, [esp + 8]
    cmp eax, 0
    je null_ret

null_ret:
    pop ebx
    ret
    add eax, [esp + 12]
    mov ebx, eax

while_start:
    cmp headptr, 0x0
    je while_done
    mov nextptr, [headptr]
    mov [headptr], new_headptr
    mov new_headptr, headptr
    mov headptr, nextptr
    jmp while_start

while_done:
    mov eax, new_headptr
    sub eax, [esp+12]
