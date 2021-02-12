.data
	resultado: .int 0xff223344
	formato:   .string "i:%i / u:%u / 0x%x\n"

.text

_start: .globl _start

	mov $formato, %rdi
	mov resultado, %esi
	mov %esi, %edx
	mov %esi, %ecx
	xor %eax, %eax
	call printf

	xor %edi, %edi
	call exit

