section .data
    message db "Kachenko Anastasia, KI-231", 10
    len equ $ - message

section .text
global _start

_start:
    mov rax, 1          ; syscall для запису
    mov rdi, 1          ; запис у stdout
    mov rsi, message    ; адреса повідомлення
    mov rdx, len        ; довжина повідомлення
    syscall             ; виклик системного виклику

    mov rax, 60         ; syscall для виходу
    xor rdi, rdi        ; код завершення 0
    syscall             ; виклик системного виклику

