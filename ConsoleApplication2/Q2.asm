; Name: Abdul Hadi
; Roll Number: 2025(s)-SE-5
; Q2: Demonstrates LENGTHOF, SIZEOF, TYPE, OFFSET, and PTR operators to inspect array sizes and little-endian memory layout.

Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
byteArray BYTE  10h, 20h, 30h, 40h, 50h, 60h
wordArray WORD  1000h, 2000h, 3000h, 4000h, 5000h
dwordArray DWORD 10000000h, 20000000h, 30000000h, 40000000h
myVal DWORD 12345678h

prmpt1 BYTE "BYTE Array", 0
prmpt2 BYTE "WORD Array", 0
prmpt3 BYTE "DWORD Array", 0

msgElem BYTE "Number of element: ", 0
msgBytes BYTE "Total bytes: ", 0
msgType BYTE "Type Size: ", 0
msgOffset BYTE "Starting address: ", 0

prmpt4 BYTE "DWORD Variable in Memory", 0
prmpt5 BYTE "Low Word: ", 0
msgByte0 BYTE "Byte 0: ", 0
msgByte1 BYTE "Byte 1: ", 0
msgByte2 BYTE "Byte 2: ", 0
msgByte3 BYTE "Byte 3: ", 0

.code
main proc
mov edx, offset prmpt1              ; 2-operand
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgElem             ; 2-operand
call WriteString                    ; 1-operand
mov eax, lengthof byteArray         ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgBytes            ; 2-operand
call WriteString                    ; 1-operand
mov eax, sizeof byteArray           ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgType             ; 2-operand
call WriteString                    ; 1-operand
mov eax, type byteArray             ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgOffset           ; 2-operand
call WriteString                    ; 1-operand
mov eax, offset byteArray           ; 2-operand
call WriteHex                       ; 1-operand
call Crlf                           ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset prmpt2              ; 2-operand
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgElem             ; 2-operand
call WriteString                    ; 1-operand
mov eax, lengthof wordArray         ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgBytes            ; 2-operand
call WriteString                    ; 1-operand
mov eax, sizeof wordArray           ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgType             ; 2-operand
call WriteString                    ; 1-operand
mov eax, type wordArray             ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgOffset           ; 2-operand
call WriteString                    ; 1-operand
mov eax, offset wordArray           ; 2-operand
call WriteHex                       ; 1-operand
call Crlf                           ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset prmpt3              ; 2-operand
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgElem             ; 2-operand
call WriteString                    ; 1-operand
mov eax, lengthof dwordArray        ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgBytes            ; 2-operand
call WriteString                    ; 1-operand
mov eax, sizeof dwordArray          ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgType             ; 2-operand
call WriteString                    ; 1-operand
mov eax, type dwordArray            ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgOffset           ; 2-operand
call WriteString                    ; 1-operand
mov eax, offset dwordArray          ; 2-operand
call WriteHex                       ; 1-operand
call Crlf                           ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset prmpt4              ; 2-operand
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset prmpt5              ; 2-operand
call WriteString                    ; 1-operand
mov esi, offset myVal               ; 2-operand
mov ax, WORD PTR [esi]              ; 2-operand
mov ebx, 2                          ; 2-operand
call WriteHexB                      ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgByte0            ; 2-operand
call WriteString                    ; 1-operand
mov ebx, 1                          ; 2-operand
mov al, BYTE PTR [esi]              ; 2-operand
call WriteHexB                      ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgByte1            ; 2-operand
call WriteString                    ; 1-operand
mov ebx, 1                          ; 2-operand
mov al, BYTE PTR [esi+1]            ; 2-operand
call WriteHexB                      ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgByte2            ; 2-operand
call WriteString                    ; 1-operand
mov ebx, 1                          ; 2-operand
mov al, BYTE PTR [esi+2]            ; 2-operand
call WriteHexB                      ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgByte3            ; 2-operand
call WriteString                    ; 1-operand
mov ebx, 1                          ; 2-operand
mov al, BYTE PTR [esi+3]            ; 2-operand
call WriteHexB                      ; 1-operand
call Crlf                           ; 1-operand


; Explanation of byte order:
; x86 processors use little endian memory ordering
; LSB is stored at the lowest memory address and MSB is stored at the highest address
; which causes the memory to be sorted as follows
; 78
; 56
; 34
; 12



INvOKE ExitProcess, 0               ; 2-operand
main ENDP
END main
