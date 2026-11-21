INCLUDE Irvine32.inc

.data
    prmpt1      BYTE "Enter a string: ", 0
    prmpt2      BYTE "Total vowels found: ", 0
    buffer      BYTE 80 DUP(?), 0
    vowelCount  DWORD ?

.code
main PROC
    ; --- 1. Get User Input ---
    mov edx, OFFSET prmpt1
    call WriteString

    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString              ; EAX = actual string length

    ; --- 2. Push Arguments onto Stack (Right-to-Left / Reverse Order) ---
    push OFFSET buffer           ; Will be at [ebp + 12]
    push eax                     ; Will be at [ebp + 8] (string length)
    call CountVowels             ; Pushes return address and jumps

    ; --- 3. Display Returned Result (in EAX) ---
    mov vowelCount, eax

    mov edx, OFFSET prmpt2
    call WriteString

    mov eax, vowelCount
    call WriteDec
    call Crlf

    exit
main ENDP

; =====================================================================
; Procedure: CountVowels
; Receives:  [ebp + 12] = OFFSET of string buffer
;            [ebp + 8]  = Length of string
; Returns:   EAX = Count of vowels (a, e, i, o, u - case insensitive)
; =====================================================================
CountVowels PROC
    ; --- 1. Prologue: Set up Stack Frame ---
    push ebp                     ; Save caller's base pointer
    mov ebp, esp                 ; Establish our own stack frame

    ; --- 2. Save Modified Registers (Callee-Saved) ---
    push ecx
    push esi
    push ebx

    ; --- 3. Retrieve Parameters from Stack using PTR ---
    mov ecx, DWORD PTR [ebp + 8]     ; Get string length
    mov esi, DWORD PTR [ebp + 12]    ; Get string starting address

    mov ebx, 0                     ; EBX = vowel counter (0)

    cmp ecx, 0
    je DoneCounting                  ; Safety check for empty string

CheckLoop:
    mov al, BYTE PTR [esi]           ; Load 1 character from string

    ; Normalize uppercase letters ('A'-'Z') to lowercase ('a'-'z')
    cmp al, 'A'
    jb CheckVowel
    cmp al, 'Z'
    ja CheckVowel
    add al, 32                       ; Convert to lowercase

CheckVowel:
    cmp al, 'a'
    je IsVowel
    cmp al, 'e'
    je IsVowel
    cmp al, 'i'
    je IsVowel
    cmp al, 'o'
    je IsVowel
    cmp al, 'u'
    je IsVowel
    jmp NextChar

IsVowel:
    inc ebx                          ; Increment vowel count

NextChar:
    inc esi
    loop CheckLoop

DoneCounting:
    mov eax, ebx                     ; Place return value in EAX

    ; --- 4. Epilogue: Restore Registers in Exact Reverse Order ---
    pop ebx
    pop esi
    pop ecx
    pop ebp

    ; --- 5. Clean up 8 bytes of pushed arguments (2 DWORDs) & Return ---
    ret 8
CountVowels ENDP

END main