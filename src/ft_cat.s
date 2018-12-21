; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/18 22:38:59 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/21 23:45:25 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define READ				3
%define WRITE				4
%define BUFF_SIZE			0xFF ; max size. otherwise byte data exceeds bounds

; read(int fd, user_addr_t cbuf, user_size_t nbyte)
; write(int fd, user_addr_t cbuf, user_size_t nbyte)

section .data
buffer:
	.buf db BUFF_SIZE

section .text
	global _ft_cat

_ft_cat:
read:
	lea rsi, [rel buffer.buf]
	mov rdx, BUFF_SIZE
	mov rax, MACH_SYSCALL(READ)
	syscall
	jc end ; if carry flag is set to error
	test rax, rax
	jz end
write:
	push rdi
	mov rdi, STDOUT
	mov rdx, rax
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	pop rdi
	jmp read
end:
	xor rax, rax
	ret

; Ordre des arguments d'une fonction
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; retour d'une fonction
; %rax