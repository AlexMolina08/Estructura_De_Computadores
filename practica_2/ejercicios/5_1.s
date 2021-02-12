/*
*
*   Sumar N enteros sin signo de 32 bits sobre 2 regs de 32 bits
*   Usando uno de ellos como acumulador de acarreos
*   
*   Se usa EDX:EAX para guardar resultado (en EDX se suman los acarreos)
*
*   Compilar con :  gcc -g ejercicios/5_1.s -o ejercicios/5_1 -no-pie
*
*
*   Fecha : 21 / 12 / 2020
*
*/

.section .data

lista: .int 0xffffffff , 1 # valor max. 32 bits = 4294967295
longlista: .int (.-lista)/4 # cada el. de la lista ocupa 4B , por eso divido entre 4
resultado: .quad 0 # inicializamos resultado a 0
formato: 	.asciz	"suma = %llu = 0x%016llx (hexadecimal)\n"
mensaje: .asciz "se va a sumar\n"

.section .text


main: .global main
    call trabajar
    call imprimir_c
    call fin_c
ret


# Llama a la funcion printf
imprimir_c:
    # Lllamamoos printf(formato(rdi) , resultado(esi) , resultado(esi))
    mov $formato , %rdi 
    mov resultado , %rsi 
    mov resultado , %rdx 
    xor %eax , %eax
    call printf
ret

trabajar:
    call imprimir_mensaje
    mov $lista , %rdi # rdi = dir.inicio lista (8B)
    mov longlista , %esi # esi = long.lista (4B)
    call sumar  
    mov %eax , resultado # guardamos eax en res.
    mov %edx , resultado + 4 # guardamos edx en la sig. pos en memoria
ret

sumar:
	xor  %edx , %edx  # edx = acumulador acarreo 
	xor  %eax, %eax  # acumulador 
	xor  %ecx, %ecx  # contador

    .bucle:
    cmp %rcx , %rsi # comparamos longlista(rsi) con contador(rcx) 
    je .fin # si hemos llegado al final saltamos a fin
	add (%rdi,%rcx,4), %eax # hacemos la suma y la metemos en el acumulador
    jnc .incrementa_contador # saltamos a incrementa_contador si no carry
	inc %edx # si hay acarreo ,  edx += 1     
    .incrementa_contador:
        inc %rcx 
        jmp .bucle

    .fin:
        ret

# imprime " se va a sumar "
imprimir_mensaje:
    mov $mensaje , %rdi 
    mov $0 , %eax 
    call printf
ret

# Llama a la funcion exit
fin_c :
    mov resultado , %edi 
    call exit
ret
