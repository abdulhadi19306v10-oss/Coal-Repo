; Name: Abdul Hadi
; Roll Number: 2025(s)-SE-5
; Q4: Generates the first 15 Fibonacci numbers and prints a 1-to-N multiplication table using nested LOOPs and repeated addition

Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
arr1 DWORD 15 dup(?)
comma BYTE ",", 0
prmpt1 BYTE "List of 1st 15 fibonnaci numbers: ", 0

N DWORD ?
multiples BYTE "Multiples of ", 0
colon BYTE ":", 0
prmpt2 BYTE "Please enter a number: ", 0

.code
main proc
mov ecx, lengthof arr1              ; 2-operand
mov esi, offset arr1                ; 2-operand
mov eax, 1                          ; 2-operand
mov ebx, 1                          ; 2-operand

L1:
mov [esi], eax                      ; 2-operand
add esi, type arr1                  ; 2-operand
mov edx, eax                        ; 2-operand
add edx, ebx                        ; 2-operand
mov eax, ebx                        ; 2-operand
mov ebx, edx                        ; 2-operand
loop L1                             ; 1-operand

mov edx, offset prmpt1              ; 2-operand
call WriteString                    ; 1-operand
mov esi, offset arr1                ; 2-operand
mov ecx, lengthof arr1              ; 2-operand
mov edx, offset comma               ; 2-operand

L2:
mov eax, [esi]                      ; 2-operand
call WriteDec                       ; 1-operand
call WriteString                    ; 1-operand
add esi, 4                          ; 2-operand
loop L2                             ; 1-operand
call Crlf                           ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset prmpt2              ; 2-operand
call WriteString                    ; 1-operand
call ReadDec                        ; 1-operand
mov N, eax                          ; 2-operand

cmp eax, 0                          ; 2-operand
je SkipTable                        ; 1-operand

mov ecx, N                          ; 2-operand
mov ebx, 1                          ; 2-operand
call Crlf                           ; 1-operand

L3:
mov edx, offset multiples           ; 2-operand
call WriteString                    ; 1-operand
mov eax, ebx                        ; 2-operand
call WriteInt                       ; 1-operand
mov edx, offset colon               ; 2-operand
call WriteString                    ; 1-operand

push ecx                            ; 1-operand
mov ecx, 10                         ; 2-operand
mov eax, ebx                        ; 2-operand

L4:
call WriteDec                       ; 1-operand
mov edx, offset comma               ; 2-operand
call WriteString                    ; 1-operand
add eax, ebx                        ; 2-operand
loop L4                             ; 1-operand

call Crlf                           ; 1-operand
inc ebx                             ; 1-operand
pop ecx                             ; 1-operand
loop L3                             ; 1-operand

SkipTable:
INvOKE ExitProcess, 0               ; 2-operand
main ENDP
END main
