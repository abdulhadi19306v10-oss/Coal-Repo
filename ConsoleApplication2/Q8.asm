; Name: Abdul Hadi
; Roll Number: 2025(s)-SE-5
; Q8: Validates user marks in a loop, assigns letter grades, and displays summary statistics using MASM control flow directives.

Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
mark SDWORD ?
count DWORD 0
total SDWORD 0
highest SDWORD 0

msgPrompt BYTE "Enter mark (0-100, or -1 to stop):", 0
msgInvalid BYTE "Invalid mark! Please enter a value between 0 and 100.", 0
msgGrade BYTE "Grade:", 0
msgCount BYTE "Total marks entered:", 0
msgTotal BYTE "Sum of marks:", 0
msgHighest BYTE "Highest mark:", 0

.code
main proc
.REPEAT
    mov edx, offset msgPrompt       ; 2-operand
    call WriteString                ; 1-operand
    call ReadInt                    ; 1-operand
    mov mark, eax                   ; 2-operand

    .IF mark > 100 || mark < -1
        mov edx, offset msgInvalid  ; 2-operand
        call WriteString            ; 1-operand
        call Crlf                   ; 1-operand

    .ELSEIF mark != -1
        inc count                   ; 1-operand
        mov eax, mark               ; 2-operand
        add total, eax              ; 2-operand

        .IF eax > highest
            mov highest, eax        ; 2-operand
        .ENDIF

        mov edx, offset msgGrade    ; 2-operand
        call WriteString            ; 1-operand

        .IF mark >= 85 && mark <= 100
            mov al, 'A'             ; 2-operand
        .ELSEIF mark >= 70 && mark <= 84
            mov al, 'B'             ; 2-operand
        .ELSEIF mark >= 55 && mark <= 69
            mov al, 'C'             ; 2-operand
        .ELSEIF mark >= 40 && mark <= 54
            mov al, 'D'             ; 2-operand
        .ELSE
            mov al, 'F'             ; 2-operand
        .ENDIF

        call WriteChar              ; 1-operand
        call Crlf                   ; 1-operand
    .ENDIF

.UNTIL mark == -1

mov edx, offset msgCount            ; 2-operand
call WriteString                    ; 1-operand
mov eax, count                      ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgTotal            ; 2-operand
call WriteString                    ; 1-operand
mov eax, total                      ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

mov edx, offset msgHighest          ; 2-operand
call WriteString                    ; 1-operand
mov eax, highest                    ; 2-operand
call WriteDec                       ; 1-operand
call Crlf                           ; 1-operand

INvOKE ExitProcess, 0               ; 2-operand
main ENDP
END main
