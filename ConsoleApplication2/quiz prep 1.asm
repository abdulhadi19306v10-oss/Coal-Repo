    INCLUDE Irvine32.inc

.data
    str1    BYTE 50 DUP(?), 0
    str2    BYTE 50 DUP(?), 0

    prmpt1  BYTE "The strings are same", 0
    prmpt2  BYTE "The strings are unequal", 0
    prmpt3  BYTE "Please enter a string: ", 0
    prmpt4  BYTE "Please enter another string: ", 0

    len1    DWORD ?

.code
main PROC
    ; --- 1. Read First String ---
    mov edx, OFFSET prmpt3
    call WriteString

    mov edx, OFFSET str1
    mov ecx, SIZEOF str1
    call ReadString
    mov len1, eax

    mov edx, OFFSET prmpt4
    call WriteString

    mov edx, OFFSET str2
    mov ecx, SIZEOF str2
    call ReadString

    ; --- 3. Check Lengths First ---
    cmp eax, len1
    jne L2

    ; --- 4. Setup Loop Comparison ---
    mov ecx, eax
    cmp ecx, 0
    je StringsMatch

    mov esi, OFFSET str1
    mov edi, OFFSET str2

L1:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne L2

    inc esi
    inc edi
    loop L1

StringsMatch:
    mov edx, OFFSET prmpt1
    call WriteString
    call Crlf
    jmp QuitProgram

L2:
    mov edx, OFFSET prmpt2
    call WriteString
    call Crlf

QuitProgram:
exit
main ENDP
END main