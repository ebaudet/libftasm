; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_psqrt.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/17 16:44:47 by ebaudet           #+#    #+#              ;
;    Updated: 2019/12/17 16:49:59 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_psqrt

_ft_psqrt:
	cmp rdi, 0
	jl error
	xor rcx, rcx
while:
	mov rax, rcx
	mul rcx
	cmp rax, rdi
	jg error
	je ok
	inc rcx
	jmp while
error:
	mov rax, -1
	jmp end
ok:
	mov rax, rcx
end:
	ret

; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax
; int ft_psqrt(int pow);
; Return :
; - if perfect sqrt found return value.
; - else -1.
