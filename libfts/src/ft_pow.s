; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_pow.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/17 15:42:32 by ebaudet           #+#    #+#              ;
;    Updated: 2019/12/17 16:31:19 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_pow

_ft_pow:
	cmp rsi, 0
	jz one
	mov rax, rdi
while:
	dec rsi
	cmp rsi, 0
	jle end
	mul rdi
	jmp while
error:
	mov rax, -1
	jmp end
one:
	mov rax, 1
end:
	ret

; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax
; unsigned int ft_pow(unsigned int base, unsigned int power);
