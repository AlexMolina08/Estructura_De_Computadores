.data
msg: .string "hola desde assembly\n"
tam: .quad . - msg # el tamanio de msg es la dir de memoria actual menos la del principio del mensaje

.text
	.global _start

write:  mov $1 , %rax #write
	mov $1 , %rdi #stdout
	mov $msg , %rsi #texto
	mov tam , %rdx #tamanio
	syscall #llamada a write
	ret

exit:   mov $60 , %rax #exit
	xor %rdi , %rdi # poner a 0 rdi
	syscall #llamada a exit

_start: call write	
	call exit
