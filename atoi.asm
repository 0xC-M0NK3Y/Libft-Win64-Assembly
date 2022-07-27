bits 64

section .text

global ft_atoi

; int ft_atoi(char *str);

ft_atoi:
    mov r15, rcx                ; on met str dans r15

    xor r14, r14
    mov r10, 1                  ; r10 notre signe
    xor rax, rax                ; rax notre return

    jmp while1
end_while1:
    jmp pass_sign

done:
    jmp while2
end_while2:
    imul rax, r10
    ret

while1:
    mov r14b, BYTE [r15]
    cmp r14b, 32                ; pass ' '
    je pass
    cmp r14b, 9                 ; pass '\t'
    je pass
    cmp r14b, 10                ; pass '\n'
    je pass
    cmp r14b, 11                ; pass '\v'
    je pass
    cmp r14b, 12                ; pass '\f'
    je pass
    cmp r14b, 13                ; pass '\r'
    je pass
    jmp end_while1

pass:
    inc r15
    jmp while1

pass_sign:
    cmp r14b, 45                ; cmp with '-'
    je isneg
    cmp r14b, 43                ; cmp with '+'
    je ispos
    jmp done

ispos:
    inc r15
    mov r14b, BYTE [r15]
    jmp done

isneg:
    neg r10
    inc r15
    mov r14b, byte [r15]
    jmp done

while2:
    cmp r14b, 48
    jb end_while2
    cmp r14b, 57
    ja end_while2
    imul rax, 10
    sub r14b, 48
    add rax, r14
    inc r15
    mov r14b, BYTE [r15]
    jmp while2