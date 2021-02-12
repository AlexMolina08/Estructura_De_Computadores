.data
msg:    .string "¡hola, mundo!\n"
tam:    .quad . - msg # como es un .quad , tenemos 0x00000010 (64 bits = 8 Bytes)

.text
        .global _start

write:  mov   $1,   %rax  # write
        mov   $1,   %rdi  # stdout (file descriptor)
        mov   $msg, %rsi  # texto (*buf)
        mov   tam,  %rdx  # tamaño (count)
        syscall           # llamada a write
        ret

exit:   mov   $60,  %rax  # exit
        xor   %rdi, %rdi  # 0
        syscall           # llamada a exit
        ret

_start: call  write       # llamada a función
        call  exit        # llamada a función

