Include Irvine32.inc
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data

.code
main proc
    push 20
    push 10

    call addtwo

    call WriteDec

    INVOKE ExitProcess, 0
main ENDP

addtwo proc
    mov ebp, esp

    mov eax, [ebp + 4]
    add eax, [ebp + 8]

    ret 8
addtwo ENDP

END main