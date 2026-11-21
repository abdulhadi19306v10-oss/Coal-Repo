INCLUDE Irvine32.inc

.data
    marks   DWORD ?
    grade   BYTE ?

    prmpt1  BYTE "Enter marks (0-100): ", 0
    prmpt2  BYTE "Grade: ", 0
    prmpt3  BYTE "Invalid input!", 0

.code
main PROC
    ; --- 1. Prompt and Read Marks ---
    mov edx, OFFSET prmpt1
    call WriteString
    call ReadDec
    mov marks, eax

    ; --- 2. Input Validation (0 to 100) ---
    cmp eax, 100
    ja invalid

    ; --- 3. Grade Conditions ---
    cmp eax, 90
    jb L2
    mov grade, 'A'
    jmp DisplayGrade

L2:
    cmp eax, 80
    jb L3
    mov grade, 'B'
    jmp DisplayGrade

L3:
    cmp eax, 70
    jb L4
    mov grade, 'C'
    jmp DisplayGrade

L4:
    cmp eax, 60
    jb L5
    mov grade, 'D'
    jmp DisplayGrade

L5:
    ; Any remaining score (0 to 59) is failing
    mov grade, 'F'
    jmp DisplayGrade

invalid:
    mov edx, OFFSET prmpt3
    call WriteString
    call Crlf
    jmp QuitProgram

DisplayGrade:
    mov edx, OFFSET prmpt2
    call WriteString

    mov al, grade
    call WriteChar
    call Crlf

QuitProgram:
    exit
main ENDP
END main