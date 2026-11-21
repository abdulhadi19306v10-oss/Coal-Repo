INCLUDE Irvine32.inc

.data
    prmpt1  BYTE "Enter a lowercase string: ", 0
    prmpt2  BYTE "Result: ", 0
    prmpt3  BYTE 50 DUP(?), 0

.code
main PROC
    ; 1. Prompt and Read String
    mov edx, OFFSET prmpt1
    call WriteString

    mov ecx, SIZEOF prmpt3
    mov edx, OFFSET prmpt3
    call ReadString

    ; 2. Prepare Loop and Pointer
    mov ecx, eax                 ; Length returned by ReadString

    mov esi, OFFSET prmpt3

L1:
    cmp BYTE PTR [esi], 'a'
    jb skipconvert               ; Skip if character < 'a'

    cmp BYTE PTR [esi], 'z'
    ja skipconvert

    sub BYTE PTR [esi], 32       ; Convert lowercase to uppercase in place

skipconvert:
    inc esi
    loop L1

    mov edx, OFFSET prmpt2
    call WriteString

    mov edx, OFFSET prmpt3
    call WriteString
    call Crlf

    exit
main ENDP
END main