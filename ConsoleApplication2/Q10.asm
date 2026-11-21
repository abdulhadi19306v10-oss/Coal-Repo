; Name: Abdul Hadi
; Roll Number: 2025(s)-SE-5
; Q10: Implements and tests a utility library (Max2, Max3, Gcd, Gcd3) using register arguments and nested procedure calls.

Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
num1 DWORD ?
num2 DWORD ?
num3 DWORD ?

msgPrompt1 BYTE "Enter first positive integer:  ", 0
msgPrompt2 BYTE "Enter second positive integer: ", 0
msgPrompt3 BYTE "Enter third positive integer:  ", 0
msgMax BYTE "Largest = ", 0
msgGcd BYTE "GCD     = ", 0

.code
main proc
mov edx, offset msgPrompt1          ; 2-operand
call WriteString                    ; 1-operand
call ReadInt                        ; 1-operand
mov num1, eax                       ; 2-operand

mov edx, offset msgPrompt2          ; 2-operand
call WriteString                    ; 1-operand
call ReadInt                        ; 1-operand
mov num2, eax                       ; 2-operand

mov edx, offset msgPrompt3          ; 2-operand
call WriteString                    ; 1-operand
call ReadInt                        ; 1-operand
mov num3, eax                       ; 2-operand

mov eax, num1                       ; 2-operand
mov ebx, num2                       ; 2-operand
mov ecx, num3                       ; 2-operand
call Max3                           ; 1-operand

mov edx, offset msgMax              ; 2-operand
call WriteString                    ; 1-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov eax, num1                       ; 2-operand
mov ebx, num2                       ; 2-operand
mov ecx, num3                       ; 2-operand
call Gcd3                           ; 1-operand

mov edx, offset msgGcd              ; 2-operand
call WriteString                    ; 1-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

INvOKE ExitProcess, 0               ; 2-operand
main ENDP


; Procedure: Max2
; Inputs: EAX, EBX (signed 32-bit integers)
; Output: EAX = larger of EAX and EBX
; Preserves: All registers except EAX


Max2 proc
cmp eax, ebx                        ; 2-operand
jge done                            ; 1-operand
mov eax, ebx                        ; 2-operand

done:
ret                                 ; 0-operand
Max2 ENDP

; Procedure: Max3
; Inputs: EAX, EBX, ECX (signed 32-bit integers)
; Output: EAX = largest of EAX, EBX, and ECX (calls Max2)
; Preserves: EBX, ECX (all registers except EAX)

Max3 proc
push ebx                            ; 1-operand
call Max2                           ; 1-operand
mov ebx, ecx                        ; 2-operand
call Max2                           ; 1-operand
pop ebx                             ; 1-operand
ret                                 ; 0-operand
Max3 ENDP

; Procedure: Gcd
; Inputs: EAX, EBX (positive 32-bit integers)
; Output: EAX = greatest common divisor via repeated subtraction
; Preserves: EBX (all registers except EAX)

Gcd proc
push ebx                            ; 1-operand

L1:
cmp eax, ebx                        ; 2-operand
je done                             ; 1-operand
jg subA                             ; 1-operand
sub ebx, eax                        ; 2-operand
jmp L1                              ; 1-operand

subA:
sub eax, ebx                        ; 2-operand
jmp L1                              ; 1-operand

done:
pop ebx                             ; 1-operand
ret                                 ; 0-operand
Gcd ENDP

; Procedure: Gcd3
; Inputs: EAX, EBX, ECX (positive 32-bit integers)
; Output: EAX = GCD of EAX, EBX, and ECX (calls Gcd twice)
; Preserves: EBX, ECX (all registers except EAX)

Gcd3 proc
push ebx                            ; 1-operand
call Gcd                            ; 1-operand
mov ebx, ecx                        ; 2-operand
call Gcd                            ; 1-operand
pop ebx                             ; 1-operand
ret                                 ; 0-operand
Gcd3 ENDP

END main
