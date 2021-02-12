.data
    msg: .string "me llamo Alex Molina\n" # string indica que es una cadena byte a byte acabada en 0
    tam: .quad . - msg # tamaño de la cadena

.text
    .global _start


write: 
    mov $1 , %rax # sys_write
    mov $1 , %rdi # salida estandar
    mov $msg , %rsi # inicio de la cadena
    mov tam , %rdx # tam de la cadena
    syscall # se llama a write
    ret

exit: 
    mov $60 , %rax 
    xor %rdi , %rdi
    syscall 


_start:
    call write
    call exit
