; Name: Abdul Hadi
; Roll Number: 2025(s)-SE-5
; Q7: Searches arrays for the first negative value and first differing value using LOOPNZ and LOOPZ

Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
array1 SDWORD 12, 5, 0, 23, 18, -7, 4, 9, 15, 0
array2 SDWORD 42, 42, 42, 42, 99, 42, 42, 42

msgNegFound BYTE "First negative value found at index: ", 0
msgNoNeg BYTE "No negative value found", 0
msgDiff BYTE "First differing value found at index: ", 0

.code
main proc
mov esi, offset array1              ; 2-operand
mov ecx, lengthof array1            ; 2-operand

L1:
mov eax, [esi]                      ; 2-operand
and eax, 80000000h                  ; 2-operand
xor eax, 80000000h                  ; 2-operand
lea esi, [esi + type array1]        ; 2-operand

; loopnz tests the zero flag in addition to ecx > 0
; it continues looping as long as ecx is not zero and zf is 0

loopnz L1                           ; 1-operand

jz found                            ; 1-operand

mov edx, offset msgNoNeg            ; 2-operand
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand
jmp part2                           ; 1-operand

found:
mov edx, offset msgNegFound         ; 2-operand
call WriteString                    ; 1-operand
mov eax, lengthof array1            ; 2-operand
dec eax                             ; 1-operand
sub eax, ecx                        ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

part2:
mov esi, offset array2              ; 2-operand
mov ecx, lengthof array2            ; 2-operand
mov ebx, [esi]                      ; 2-operand

L2:
mov eax, [esi]                      ; 2-operand
cmp eax, ebx                        ; 2-operand
lea esi, [esi + type array2]        ; 2-operand

; loopz tests the zero flag in addition to ecx > 0.
; it continues looping as long as ecx is not zero and zf is set

loopz L2                            ; 1-operand

mov edx, offset msgDiff             ; 2-operand
call WriteString                    ; 1-operand
mov eax, lengthof array2            ; 2-operand
dec eax                             ; 1-operand
sub eax, ecx                        ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

INvOKE ExitProcess, 0               ; 2-operand
main ENDP
END main
