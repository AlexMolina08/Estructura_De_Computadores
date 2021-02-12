/*
*   saludo.s : Imprimir por pantalla el saludo
*
*   
*
* date : 2020/12/06
* author : Alex Molina Criado
*/
.section .data

saludo:
    .ascii "Hola a Alex :D\nHellow to Alex :D\n"

longSaludo: 
    .quad .-saludo

# Sección de codigo 
.section .text

.global 

_start:
    # (1) ssize_t write(int fd, const void *buf, size_t count);

    mov $1 , %rax  
    mov $1 , %rdi # fd
    mov $saludo , %rsi # *buf = &saludo 
    mov longSaludo , %rsi # size_t
    syscall # Llama a write(stdout , &saludo , longSaludo)

    # (60) void _Exit(int status);

    mov $60 , %rax 
    mov $0 , %rdi # status = 0
    syscall # Lama a exit(0)

    
