fibonacci:
    push    rbp              ; Зберегти базовий указник
    mov     rbp, rsp         ; Встановити новий базовий указник
    sub     rsp, 24          ; Виділити пам'ять для локальних змінних
    mov     DWORD PTR [rbp-20], edi ; Зберегти n у стеку

    cmp     DWORD PTR [rbp-20], 0 ; Якщо n == 0
    jne     .L2
    mov     eax, 0           ; Результат = 0
    jmp     .L3

.L2:
    cmp     DWORD PTR [rbp-20], 1 ; Якщо n == 1
    jne     .L4
    mov     eax, 1           ; Результат = 1
    jmp     .L3

.L4:
    sub     eax, 1           ; Рекурсивний виклик fibonacci(n-1)
    mov     edi, eax
    call    fibonacci
    mov     rbx, rax         ; Зберегти результат fibonacci(n-1)
    sub     eax, 2           ; Рекурсивний виклик fibonacci(n-2)
    mov     edi, eax
    call    fibonacci
    add     rax, rbx         ; Сума результатів fibonacci(n-1) + fibonacci(n-2)

.L3:
    leave                    ; Завершення функції
    ret

main:
    push    rbp              ; Зберегти базовий указник
    mov     rbp, rsp         ; Встановити новий базовий указник
    sub     rsp, 16          ; Виділити пам'ять для локальних змінних

    call    printf           ; Вивести запрошення
    call    __isoc99_scanf   ; Отримати n від користувача

    cmp     DWORD PTR [rbp-4], 0 ; Перевірити, чи n < 0
    js      .L6
    cmp     eax, 93          ; Перевірити, чи n > 93
    jle     .L7

.L6:
    call    puts             ; Вивести повідомлення про помилку
    mov     eax, 1           ; Завершити програму з кодом 1
    jmp     .L9

.L7:
    call    fibonacci        ; Обчислити fibonacci(n)
    call    printf           ; Вивести результат

.L9:
    leave                    ; Завершення програми
    ret
