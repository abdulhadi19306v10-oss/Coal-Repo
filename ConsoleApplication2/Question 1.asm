Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data
	prmpt1 Byte "Please enter your name: ",0
	prmpt2 Byte "Invalid input ",0
	prmpt3 Byte 50 dup(?),0
	prmpt4 Byte "Number of Chars: ",0
	count Dword ?
.code
main proc
	L1:
		mov edx, offset prmpt1
		call WriteString
		mov ecx, sizeof prmpt3
		mov edx, offset prmpt3
		call ReadString
		mov count, eax
		
		mov ecx, eax
		mov esi, offset prmpt3

		L2:
			cmp BYTE PTR [esi], "0"	
			je invalidinput
			cmp BYTE PTR [esi], "1"
			je invalidinput
			cmp BYTE PTR [esi], "2"
			je invalidinput
			cmp BYTE PTR [esi], "3"
			je invalidinput
			cmp BYTE PTR [esi], "4"
			je invalidinput
			cmp BYTE PTR [esi], "5"
			je invalidinput
			cmp BYTE PTR [esi], "6"
			je invalidinput
			cmp BYTE PTR [esi], "7"
			je invalidinput
			cmp BYTE PTR [esi], "8"
			je invalidinput
			cmp BYTE PTR [esi], "9"
			je invalidinput
			
			inc esi
			loop L2

		jmp exit1

		invalidinput:
		mov edx, offset prmpt2
		call WriteString
		jmp L1
		

		exit1:
		mov edx, offset prmpt4
		call WriteString
		mov eax, count
		call WriteDec


exit
main ENDP
END main