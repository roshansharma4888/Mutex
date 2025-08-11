global enter_region
global leave_region

section .text

; void enter_region(char *lock)
enter_region:
    mov al, 1
.try_lock:
    xchg al, [rdi]      ; rdi points to lock
    cmp al, 0
    jne .try_lock
    ret

; void leave_region(char *lock)
leave_region:
    mov byte [rdi], 0   ; rdi points to lock
    ret