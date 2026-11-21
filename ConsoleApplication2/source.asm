.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data
 str1 byte "Abdul Hadi"
 str2 byte (sizeof str1) dup(?)

.code
main PROC
mov edx, sizeof str1
mov ecx, sizeof str1
mov eax, offset str1
add eax, (sizeof str1-1)
mov ebx, offset str2

L1:
mov dl, [eax]
mov [ebx], dl
dec eax
inc ebx
loop l1

INVOKE ExitProcess, 0
main ENDP
END main
