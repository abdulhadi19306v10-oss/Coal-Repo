; Name: Abdul Hadi
; Roll Number: 2025(s)-SE-5
; Q6: Performs uppercase conversion, case toggling, bit counting, and odd/even checks using bitwise and shift instructions.

Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
strOrig BYTE 50 dup(?), 0
strCopy BYTE 50 dup(?), 0
strLen DWORD ?
bitCount DWORD 0

msgPrompt1 BYTE "Enter a string:", 0
msgUpper BYTE "Uppercase:", 0
msgToggle BYTE "Toggled:", 0
msgPrompt2 BYTE "Enter an integer:", 0
msgBits BYTE "Number of 1 bits:", 0
msgEven BYTE "The number is even.", 0
msgOdd BYTE "The number is odd.", 0

.code
main proc
mov edx, offset msgPrompt1          ; 2-operand
call WriteString                    ; 1-operand

mov edx, offset strOrig             ; 2-operand
mov ecx, sizeof strOrig             ; 2-operand
call ReadString                     ; 1-operand
mov strLen, eax                     ; 2-operand

cmp eax, 0                          ; 2-operand
je nextPart                         ; 1-operand

mov esi, offset strOrig             ; 2-operand
mov edi, offset strCopy             ; 2-operand
mov ecx, strLen                     ; 2-operand

L1:
mov al, [esi]                       ; 2-operand
mov [edi], al                       ; 2-operand
inc esi                             ; 1-operand
inc edi                             ; 1-operand
loop L1                             ; 1-operand

mov esi, offset strOrig             ; 2-operand
mov ecx, strLen                     ; 2-operand

L2:
cmp BYTE PTR [esi], 'a'             ; 2-operand
jb skip1                            ; 1-operand
cmp BYTE PTR [esi], 'z'             ; 2-operand
ja skip1                            ; 1-operand
and BYTE PTR [esi], 0DFh            ; 2-operand

skip1:
inc esi                             ; 1-operand
loop L2                             ; 1-operand

mov edx, offset msgUpper            ; 2-operand
call WriteString                    ; 1-operand
mov edx, offset strOrig             ; 2-operand
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand

mov esi, offset strCopy             ; 2-operand
mov ecx, strLen                     ; 2-operand

L3:
cmp BYTE PTR [esi], 'A'             ; 2-operand
jb skip2                            ; 1-operand
cmp BYTE PTR [esi], 'Z'             ; 2-operand
jbe doToggle                        ; 1-operand
cmp BYTE PTR [esi], 'a'             ; 2-operand
jb skip2                            ; 1-operand
cmp BYTE PTR [esi], 'z'             ; 2-operand
ja skip2                            ; 1-operand

doToggle:
xor BYTE PTR [esi], 20h             ; 2-operand

skip2:
inc esi                             ; 1-operand
loop L3                             ; 1-operand

mov edx, offset msgToggle           ; 2-operand
call WriteString                    ; 1-operand
mov edx, offset strCopy             ; 2-operand
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand

nextPart:
mov edx, offset msgPrompt2          ; 2-operand
call WriteString                    ; 1-operand
call ReadInt                        ; 1-operand
mov ebx, eax                        ; 2-operand

mov ecx, 32                         ; 2-operand

L4:
test eax, 1                         ; 2-operand
jz skip3                            ; 1-operand
inc bitCount                        ; 1-operand

skip3:
shr eax, 1                          ; 2-operand
loop L4                             ; 1-operand

mov edx, offset msgBits             ; 2-operand
call WriteString                    ; 1-operand
mov eax, bitCount                   ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

test ebx, 1                         ; 2-operand
jz isEven                           ; 1-operand
mov edx, offset msgOdd              ; 2-operand
jmp printResult                     ; 1-operand

isEven:
mov edx, offset msgEven             ; 2-operand

printResult:
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand

INvOKE ExitProcess, 0               ; 2-operand
main ENDP
END main
