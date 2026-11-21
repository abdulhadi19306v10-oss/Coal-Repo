; Name: Abdul Hadi
; Roll Number: 2025(s)-SE-5
; Q3: Calculates sum, min, max, negative count, and positive sum of an SDWORD array using ESI indirect addressing and LOOP

Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
array SDWORD 15, -8, 42, -19, 0, 77, -35, 12, -4, 28

totalSum SDWORD 0
maxVal SDWORD ?
minVal SDWORD ?
negCount DWORD 0
posSum SDWORD 0

msgSum BYTE "Sum of all elements: ", 0
msgMax BYTE "Largest element: ", 0
msgMin BYTE "Smallest element: ", 0
msgNeg BYTE "Count of negative elements: ", 0
msgPosSum BYTE "Sum of positive elements only: ", 0

.code
main proc
mov esi, offset array               ; 2-operand
mov ecx, lengthof array             ; 2-operand

mov eax, [esi]                      ; 2-operand
mov maxVal, eax                     ; 2-operand
mov minVal, eax                     ; 2-operand

L1:
mov eax, [esi]                      ; 2-operand
add totalSum, eax                   ; 2-operand

cmp eax, maxVal                     ; 2-operand
jle checkMin                        ; 1-operand
mov maxVal, eax                     ; 2-operand

checkMin:
cmp eax, minVal                     ; 2-operand
jge checkSign                       ; 1-operand
mov minVal, eax                     ; 2-operand

checkSign:
cmp eax, 0                          ; 2-operand
jge isPositive                      ; 1-operand
inc negCount                        ; 1-operand
jmp nextElement                     ; 1-operand

isPositive:
add posSum, eax                     ; 2-operand

nextElement:
add esi, type array                 ; 2-operand
loop L1                             ; 1-operand

mov edx, offset msgSum              ; 2-operand
call WriteString                    ; 1-operand
mov eax, totalSum                   ; 2-operand
call WriteInt                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgMax              ; 2-operand
call WriteString                    ; 1-operand
mov eax, maxVal                     ; 2-operand
call WriteInt                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgMin              ; 2-operand
call WriteString                    ; 1-operand
mov eax, minVal                     ; 2-operand
call WriteInt                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgNeg              ; 2-operand
call WriteString                    ; 1-operand
mov eax, negCount                   ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgPosSum           ; 2-operand
call WriteString                    ; 1-operand
mov eax, posSum                     ; 2-operand
call WriteInt                       ; 1-operand
call Crlf                           ; 1-operand

INvOKE ExitProcess, 0               ; 2-operand
main ENDP
END main
