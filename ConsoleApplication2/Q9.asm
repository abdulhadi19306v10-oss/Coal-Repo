; Name: Abdul Hadi
; Roll Number: 2025(s)-SE-5
; Q9: Reverses a string, checks for case-insensitive palindromes, and validates balanced brackets using only PUSH and POP

Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
strBuf BYTE 100 dup(?), 0
strLen DWORD ?
isPal BYTE 1
isBalanced BYTE 1

msgPrompt BYTE "Enter a string: ", 0
msgRev BYTE "Reversed string: ", 0
msgPalYes BYTE "Palindrome: Yes", 0
msgPalNo BYTE "Palindrome: No", 0
msgBalYes BYTE "Balanced", 0
msgBalNo BYTE "Not balanced", 0

.code
main proc
mov edx, offset msgPrompt           ; 2-operand
call WriteString                    ; 1-operand

mov edx, offset strBuf              ; 2-operand
mov ecx, sizeof strBuf              ; 2-operand
call ReadString                     ; 1-operand
mov strLen, eax                     ; 2-operand

cmp eax, 0                          ; 2-operand
je emptyInput                       ; 1-operand

mov esi, offset strBuf              ; 2-operand
mov ecx, strLen                     ; 2-operand

L1:
movzx eax, BYTE PTR [esi]           ; 2-operand
push eax                            ; 1-operand
inc esi                             ; 1-operand
loop L1                             ; 1-operand

mov esi, offset strBuf              ; 2-operand
mov ecx, strLen                     ; 2-operand

L2:
pop eax                             ; 1-operand
mov [esi], al                       ; 2-operand
inc esi                             ; 1-operand
loop L2                             ; 1-operand

mov edx, offset msgRev              ; 2-operand
call WriteString                    ; 1-operand
mov edx, offset strBuf              ; 2-operand
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand

mov esi, offset strBuf              ; 2-operand
mov ecx, strLen                     ; 2-operand

L3:
movzx eax, BYTE PTR [esi]           ; 2-operand
push eax                            ; 1-operand
inc esi                             ; 1-operand
loop L3                             ; 1-operand

mov esi, offset strBuf              ; 2-operand
mov ecx, strLen                     ; 2-operand

L4:
pop eax                             ; 1-operand
mov bl, [esi]                       ; 2-operand

cmp al, 'A'                         ; 2-operand
jb checkBL                          ; 1-operand
cmp al, 'Z'                         ; 2-operand
ja checkBL                          ; 1-operand
or al, 20h                          ; 2-operand

checkBL:
cmp bl, 'A'                         ; 2-operand
jb compareChars                     ; 1-operand
cmp bl, 'Z'                         ; 2-operand
ja compareChars                     ; 1-operand
or bl, 20h                          ; 2-operand

compareChars:
cmp al, bl                          ; 2-operand
je nextChar                         ; 1-operand
mov isPal, 0                        ; 2-operand

nextChar:
inc esi                             ; 1-operand
loop L4                             ; 1-operand

cmp isPal, 1                        ; 2-operand
jne notPal                          ; 1-operand
mov edx, offset msgPalYes           ; 2-operand
jmp showPal                         ; 1-operand

notPal:
mov edx, offset msgPalNo            ; 2-operand

showPal:
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand

mov esi, offset strBuf              ; 2-operand
mov ecx, strLen                     ; 2-operand
xor ebx, ebx                        ; 2-operand

L5:
movzx eax, BYTE PTR [esi]           ; 2-operand

cmp al, '('                         ; 2-operand
je pushBracket                      ; 1-operand
cmp al, '['                         ; 2-operand
je pushBracket                      ; 1-operand
cmp al, '{'                         ; 2-operand
je pushBracket                      ; 1-operand

cmp al, ')'                         ; 2-operand
je checkParen                       ; 1-operand
cmp al, ']'                         ; 2-operand
je checkSquare                      ; 1-operand
cmp al, '}'                         ; 2-operand
je checkCurly                       ; 1-operand
jmp nextBracket                     ; 1-operand

pushBracket:
push eax                            ; 1-operand
inc ebx                             ; 1-operand
jmp nextBracket                     ; 1-operand

checkParen:
cmp ebx, 0                          ; 2-operand
je unbalanced                       ; 1-operand
pop edx                             ; 1-operand
dec ebx                             ; 1-operand
cmp dl, '('                         ; 2-operand
jne unbalanced                      ; 1-operand
jmp nextBracket                     ; 1-operand

checkSquare:
cmp ebx, 0                          ; 2-operand
je unbalanced                       ; 1-operand
pop edx                             ; 1-operand
dec ebx                             ; 1-operand
cmp dl, '['                         ; 2-operand
jne unbalanced                      ; 1-operand
jmp nextBracket                     ; 1-operand

checkCurly:
cmp ebx, 0                          ; 2-operand
je unbalanced                       ; 1-operand
pop edx                             ; 1-operand
dec ebx                             ; 1-operand
cmp dl, '{'                         ; 2-operand
jne unbalanced                      ; 1-operand

nextBracket:
inc esi                             ; 1-operand
loop L5                             ; 1-operand

cmp ebx, 0                          ; 2-operand
je showBal                          ; 1-operand

unbalanced:
mov isBalanced, 0                   ; 2-operand

cleanStack:
cmp ebx, 0                          ; 2-operand
je showBal                          ; 1-operand
pop edx                             ; 1-operand
dec ebx                             ; 1-operand
jmp cleanStack                      ; 1-operand

showBal:
cmp isBalanced, 1                   ; 2-operand
jne notBal                          ; 1-operand
mov edx, offset msgBalYes           ; 2-operand
jmp printBal                        ; 1-operand

notBal:
mov edx, offset msgBalNo            ; 2-operand

printBal:
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand
jmp done                            ; 1-operand

emptyInput:
mov edx, offset msgPalYes           ; 2-operand
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand
mov edx, offset msgBalYes           ; 2-operand
call WriteString                    ; 1-operand
call Crlf                           ; 1-operand

done:
INvOKE ExitProcess, 0               ; 2-operand
main ENDP
END main
