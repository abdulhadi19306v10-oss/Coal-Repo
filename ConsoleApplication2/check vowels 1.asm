INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    count   DWORD 0
    str1    BYTE "This string is a vowel", 0
    vowels  BYTE "aeiouAEIOU"

.code
main PROC
    mov esi, OFFSET str1
    mov ecx, LENGTHOF str1 - 1

outer_loop:
    push ecx
    mov edi, OFFSET vowels
    mov ecx, LENGTHOF vowels
    mov bl, [esi]

inner_loop:
    cmp bl, [edi]
    je  found_vowel
    inc edi
    loop inner_loop
    jmp next_char

found_vowel:
    inc count


next_char:
    pop ecx
    inc esi
    loop outer_loop

exit_prog:
    mov eax, count
    call WriteDec

    INVOKE ExitProcess, 0
main ENDP
END main