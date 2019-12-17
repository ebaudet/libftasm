; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_factoriel.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/17 15:29:56 by ebaudet           #+#    #+#              ;
;    Updated: 2019/12/17 20:57:27 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_factoriel

_ft_factoriel:
	cmp rdi, 12					; overflow after 12
	jg error
	cmp rdi, 0					; 0! == 1
	jz one
	mov rax, rdi				; result = n
while:
	dec rdi						; n--
	cmp rdi, 1
	jle end
	mul rdi						; result *= n
	jmp while
error:
	mov rax, -1					; error return -1
	jmp end
one:
	mov rax, 1
end:
	ret

; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax
; int		ft_factoriel(unsigned int n);
; return if error, return -1, else return result
; error: max int 12. overflow after.
