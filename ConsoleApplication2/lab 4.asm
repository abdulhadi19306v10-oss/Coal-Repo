Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data
prompt1 byte "Enter a String: ", 0
prompt2 byte "Reversed String: ", 0
prompt3 byte "Size of String: ", 0
str1 byte 50 dup(?),0
str2 byte 50 dup(?),0

.code
main proc
mov edx, offset prompt1
call WriteString

mov edx, offset str1
mov ecx, sizeof str1 - 1
call ReadString

mov edx, offset prompt3
call WriteString

mov edx, eax
call WriteDec


mov edx, offset str1
mov ecx, eax
mov esi, offset str1
add esi, eax
dec esi

mov edi, offset str2

L1:
mov al, [esi]
mov [edi], al
dec esi
inc edi
loop L1

mov byte ptr [edi], 0

mov edx, offset prompt2
call WriteString

mov edx, offset str2
call WriteString

INvOKE ExitProcess, 0
main ENDP
END main