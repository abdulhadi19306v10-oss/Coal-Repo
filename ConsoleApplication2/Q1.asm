; Name: Abdul Hadi
; Roll Number: 2025(s)-SE-5
; Q1: Evaluates integer expressions and computes division via repeated subtraction using basic arithmetic instructions.

Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
A DWORD 50
B DWORD 12
C1 DWORD 7

Result1 DWORD ?
Quotient DWORD 0
Remainder DWORD ?
Result2 DWORD ?

prmpt1 BYTE "Result 1: ", 0
prmpt2 BYTE "Quotient: ", 0
prmpt3 BYTE "Remainder: ", 0
prmpt4 BYTE "Result 2: ", 0

.code
main proc
mov eax, A                          ; 2-operand
add eax, B                          ; 2-operand
sub eax, C1                         ; 2-operand
add eax, 15                         ; 2-operand
mov Result1, eax                    ; 2-operand

mov edx, offset prmpt1              ; 2-operand
call WriteString                    ; 1-operand
call WriteInt                       ; 1-operand
call Crlf                           ; 1-operand

mov eax, Result1                    ; 2-operand
mov Quotient, 0                     ; 2-operand

L1:
cmp eax, B                          ; 2-operand
jb L1done                           ; 1-operand
sub eax, B                          ; 2-operand
inc Quotient                        ; 1-operand
jmp L1                              ; 1-operand

L1done:
mov Remainder, eax                  ; 2-operand

mov edx, offset prmpt2              ; 2-operand
call WriteString                    ; 1-operand
mov eax, Quotient                   ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset prmpt3              ; 2-operand
call WriteString                    ; 1-operand
mov eax, Remainder                  ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov eax, A                          ; 2-operand
sub eax, C1                         ; 2-operand
neg eax                             ; 1-operand
add eax, B                          ; 2-operand
mov Result2, eax                    ; 2-operand

mov edx, offset prmpt4              ; 2-operand
call WriteString                    ; 1-operand
call WriteInt                       ; 1-operand
call Crlf                           ; 1-operand

INvOKE ExitProcess, 0               ; 2-operand
main ENDP
END main
