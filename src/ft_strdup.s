; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:53 by ebaudet           #+#    #+#              ;
;    Updated: 2019/10/10 11:56:49 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_memcpy

_ft_strdup:
	test	rdi, rdi        ; test 1st arg (RDI)
	jz		error           ; if null, jump to label <error>
	xor		rax, rax        ; set RAX to 0

	push	rdi 			; save source in stack
	call	_ft_strlen
	push	rax  			; save size

	mov		rdi, rax 		; malloc size
	inc		rdi 			; add 1 for \0
	push	rdi 			; save size of var in stack
	call	_malloc
	pop		rdx				; get size from stack
	test	rax, rax 		; test return malloc (RAX)
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


; char	*ft_strdup(const char *s1);
; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax
