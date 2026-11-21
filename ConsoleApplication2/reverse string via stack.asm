INCLUDE Irvine32.inc

.data
    prmpt1  BYTE "Please enter a string: ", 0
    prmpt2  BYTE "Result: ", 0
    prmpt3  BYTE 50 DUP(?), 0
    count   DWORD ?

.code
main PROC
    ; 1. Read input string
    mov edx, OFFSET prmpt1
    call WriteString

    mov edx, OFFSET prmpt3
    mov ecx, SIZEOF prmpt3
    call ReadString

    ; 2. Save length & verify string is not empty
    mov count, eax
    mov ecx, eax
    cmp ecx, 0
    je Done

    ; 3. Push characters onto the stack
    mov esi, OFFSET prmpt3

L1:
    movzx eax, BYTE PTR [esi]
    push eax
    inc esi
    loop L1

    ; 4. Pop characters back to reverse order
    mov esi, OFFSET prmpt3
    mov ecx, count

L2:
    pop eax
    mov BYTE PTR [esi], al
    inc esi
    loop L2

Done:
    ; 5. Print reversed string
    mov edx, OFFSET prmpt2
    call WriteString

    mov edx, OFFSET prmpt3
    call WriteString
    call Crlf

    exit
main ENDP
END main