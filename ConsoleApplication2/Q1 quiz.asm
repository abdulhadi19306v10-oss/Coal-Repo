Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data
prmpt1 BYTE "Rickshaw (1),",0
prmpt2 BYTE "Car (2),",0
prmpt3 BYTE "Van (3),",0
prmpt4 BYTE "Bus (4),",0
prmpt5 BYTE "Truck (5)",0
prmpt6 BYTE "Please select your vehicle (1-5): ",0
prmpt7 BYTE "Invalid Input ",0
choice DWORD ?
prmpt8 BYTE "Your fare: ", 0

.code
main proc
mov edx, offset prmpt1
call WriteString
mov edx, offset prmpt2
call WriteString
mov edx, offset prmpt3
call WriteString
mov edx, offset prmpt4
call WriteString
mov edx, offset prmpt5
call WriteString
L1:
mov edx, offset prmpt6
call WriteString

call ReadDec
mov choice, eax

L2:
cmp eax, 1
jb invalidinput
cmp eax, 5
ja invalidinput


cmp eax, 1
je Rickshaw
cmp eax, 2
je Car
cmp eax, 3
je Van
cmp eax, 4
je Bus
cmp eax, 5
je Truck

Rickshaw:
mov eax, 50
jmp exit1
Car:
mov eax, 100
jmp exit1
Van:
mov eax, 200
jmp exit1
Bus:
mov eax, 500
jmp exit1
Truck:
mov eax, 700
jmp exit1

invalidinput:
jmp L1

exit1:
mov edx, offset prmpt8
call WriteString
call WriteDec

INvOKE ExitProcess, 0
main ENDP
END main