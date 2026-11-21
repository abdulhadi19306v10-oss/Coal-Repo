INCLUDE Irvine32.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    count DWORD 0
    buf   BYTE "This is a string", 0

.code
main PROC
    push esi
    push ecx

    mov esi, OFFSET buf
    mov ecx, LENGTHOF buf

L1:
    cmp BYTE PTR [esi], 'a'
    je contit
    cmp BYTE PTR [esi], 'e'
    je contit
    cmp BYTE PTR [esi], 'i'
    je contit
    cmp BYTE PTR [esi], 'o'
    je contit
    cmp BYTE PTR [esi], 'u'
    je contit
    jmp next_char

contit:
    inc count

next_char:
    inc esi
    loop L1

    pop ecx
    pop esi

    mov eax, count
    call WriteInt


INvOKE ExitProcess, 0
main ENDP
END main