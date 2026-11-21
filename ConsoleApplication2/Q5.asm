; Name: Abdul Hadi
; Roll Number: 2025(s)-SE-5
; Q5: Counts positive, negative, zero, and above-threshold elements in an SWORD array using signed CMP and conditional jumps.

Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
array SWORD 12, -5, 0, 23, -18, 0, 7, -1, 45, -30, 0, 10

posCount DWORD 0
negCount DWORD 0
zeroCount DWORD 0
aboveCount DWORD 0
threshold SDWORD ?

msgPos BYTE "Positive elements: ", 0
msgNeg BYTE "Negative elements: ", 0
msgZero BYTE "Zero elements:     ", 0
prmpt1 BYTE "Enter a threshold: ", 0
msgAbove BYTE "Elements greater than threshold: ", 0
comma BYTE ",", 0

.code
main proc
mov esi, offset array               ; 2-operand
mov ecx, lengthof array             ; 2-operand

L1:
mov ax, [esi]                       ; 2-operand
cmp ax, 0                           ; 2-operand
je zero                             ; 1-operand
jl negative                         ; 1-operand

mov eax, posCount                   ; 2-operand
inc eax                             ; 1-operand
mov posCount, eax                   ; 2-operand
jmp exit1                           ; 1-operand

zero:
mov eax, zeroCount                  ; 2-operand
inc eax                             ; 1-operand
mov zeroCount, eax                  ; 2-operand
jmp exit1                           ; 1-operand

negative:
mov eax, negCount                   ; 2-operand
inc eax                             ; 1-operand
mov negCount, eax                   ; 2-operand

exit1:
add esi, type array                 ; 2-operand
loop L1                             ; 1-operand

mov edx, offset msgPos              ; 2-operand
call WriteString                    ; 1-operand
mov eax, posCount                   ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgNeg              ; 2-operand
call WriteString                    ; 1-operand
mov eax, negCount                   ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgZero             ; 2-operand
call WriteString                    ; 1-operand
mov eax, zeroCount                  ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset prmpt1              ; 2-operand
call WriteString                    ; 1-operand
call ReadInt                        ; 1-operand
mov threshold, eax                  ; 2-operand
call Crlf                           ; 1-operand

mov edx, offset msgAbove            ; 2-operand
call WriteString                    ; 1-operand

mov esi, offset array               ; 2-operand
mov ecx, lengthof array             ; 2-operand
mov eax, threshold                  ; 2-operand
mov ebx, aboveCount                 ; 2-operand

L2:
movsx eax, SWORD PTR [esi]          ; 2-operand
cmp eax, threshold                  ; 2-operand
jle exit2                           ; 1-operand
inc ebx                             ; 1-operand

exit2:
add esi, type array                 ; 2-operand
loop L2                             ; 1-operand

mov aboveCount, ebx                 ; 2-operand
mov eax, aboveCount                 ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

INvOKE ExitProcess, 0               ; 2-operand
main ENDP
END main
