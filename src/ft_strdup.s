; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:53 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/18 22:33:36 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_memcpy

_ft_strdup:
	cmp		rdi, 0
	je		error
	xor		rax, rax

	push	rdi 			; save source in stack
	call	_ft_strlen
	push	rax  			; save size

	mov		rdi, rax 		; malloc size
	inc		rdi 			; add 1 for \0
	push	rdi 			; save size of var in stack
	call	_malloc
	pop		rdx				; get size from stack
	test	rax, rax 		; test return
	jz		error 			; if null, goto error

	mov		rdi, rax		; destination
	pop		rbx
	pop		rsi				; get the source for stack
	call	_ft_memcpy		; copy src to dest
	ret
error:
	xor		rax, rax		; return NULL
	pop		rdx				; clean stack
	pop		rsi				; clean stack
	ret


; Ordre des arguments d'une fonction
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; retour d'une fonction
; %rax