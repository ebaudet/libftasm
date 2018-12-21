; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/18 22:38:59 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/21 21:09:51 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define READ				3
%define WRITE				4
%define BUFF_SIZE			0xFF ; max size. otherwise byte data exceeds bounds

; read(int fd, user_addr_t cbuf, user_size_t nbyte)
; write(int fd, user_addr_t cbuf, user_size_t nbyte)

section .text
	global _ft_cat

section .data
buffer:
	.buf db BUFF_SIZE
	.len equ $ - buffer.buf

_ft_cat:
	push rbp
	mov rbp, rsp
read:
	lea rsi, [rel buffer.buf]
	mov rdx, BUFF_SIZE
	mov rax, MACH_SYSCALL(READ)
	syscall
	jc end_error ; if carry flag is set to error
	test rax, rax
	jz end
write:
	mov rdi, STDOUT
	lea rsi, [rel buffer.buf]
	mov rdx, rax
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	jmp read
end:
	mov rsp, rbp
	pop rbp
	xor rax, rax
	ret
end_error:
	mov rsp, rbp
	pop rbp
	mov rax, -1
	ret

; Ordre des arguments d'une fonction
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; retour d'une fonction
; %rax