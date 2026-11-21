Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data

.code
main proc


INvOKE ExitProcess, 0
main ENDP
END main