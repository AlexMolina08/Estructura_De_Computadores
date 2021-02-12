.section .data

lista: .int 268435456,268435456,268435456,268435456,268435456,268435456,268435456,268435456,268435456,268435456,268435456,268435456,268435456,268435456,268435456,268435455
longlista: .int (.-lista)/4 # cada el. de la lista ocupa 4B , por eso divido entre 4
resultado: .int 0 # inicializamos resultado a 0
formato: 	.asciz	"suma = %u = 0x%x (hexadecimal)\n"
mensaje: .asciz "se va a sumar\n"

.section .text


main: .global main
    call trabajar
    call imprimir_c
    call fin_c
ret

trabajar:
    call imprimir_mensaje
    mov $lista , %rbx # guardamos dir. inicio lista
    mov longlista , %ecx # guardamos long. lista
    call sumar
    mov %eax , resultado
ret


# Llama a la funcion printf
imprimir_c:
    # Lllamamoos printf(formato(rdi) , resultado(esi) , resultado(esi))
    mov $formato , %rdi 
    mov resultado , %esi 
    mov resultado , %edx 
    mov $0 , %eax 
    call printf
ret


sumar:
	push     %rdx
	mov  $0, %eax
	mov  $0, %rdx
bucle:
	add  (%rbx,%rdx,4), %eax
	inc   %rdx
	cmp   %rdx,%rcx
	jne    bucle

	pop   %rdx
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



