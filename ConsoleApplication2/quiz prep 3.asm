INCLUDE Irvine32.inc

.data
    prmpt1  BYTE "Please enter a string: ", 0
    prmpt2  BYTE "Length of string: ", 0
    prmpt3  BYTE 50 DUP(?), 0
    strLen  DWORD ?

.code
main PROC
    ; Prompt user
    mov edx, OFFSET prmpt1
    call WriteString

    ; Read string
    mov edx, OFFSET prmpt3
    mov ecx, SIZEOF prmpt3
    call ReadString
    mov strLen, eax

    ; Output message
    mov edx, OFFSET prmpt2
    call WriteString

    ; Display length
    mov eax, strLen
    call WriteDec
    call Crlf

    exit
main ENDP
END main