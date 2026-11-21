
Include Irvine32.inc
.data
arr1 word 10 dup(?)
str1 BYTE "Enter a number: ",0
str2 BYTE "The Total Count is :",0
count Dword ?
.code
main proc
mov esi, offset arr1
mov ecx, lengthof arr1

call fillarray

mov esi, offset arr1
mov ecx, lengthof arr1
mov eax, 0
mov ebx, 0
mov edx, 20

call countp

mov count, ebx
mov eax, count
call writedec


exit
main ENDP

fillarray proc
L1:
mov edx, offset str1
call WriteString
call ReadInt
mov [esi], eax
add esi, 2
Loop L1
RET
fillarray endp


countp proc
L2:
cmp dx,word ptr [esi]
ja exit1
add ebx, 1

exit1:
add esi, 2
loop l2
RET
countp endp


END main