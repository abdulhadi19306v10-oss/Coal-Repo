Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data
input1 DWORD 10 dup(?)
min DWORD ?
prmpt1 BYTE "Please Enter a number: " , 0
prmpt2 BYTE "Minimum Value: ", 0

.code
main proc

mov esi, offset input1
call ArrInput

mov esi, offset input1
call FindMin

mov edx, offset prmpt2
call WriteString
mov eax, offset min
call WriteInt

INvOKE ExitProcess, 0
main ENDP


ArrInput proc

mov ecx, lengthof input1

L1:
push ecx
mov ecx, sizeof prmpt1
mov edx, offset prmpt1
call WriteString
pop ecx
call ReadInt
mov [esi], eax
add esi, 4
Loop L1
RET

ArrInput ENDP

FindMin proc

mov eax, [esi]
mov ecx, lengthof input1
L1:
mov edx, [esi]
cmp edx, eax
jge dontupdate
mov eax, edx

dontupdate:
add esi, 4
Loop L1

mov min, eax
RET
FindMin ENDP

END main