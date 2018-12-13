; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_toupper.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:08 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/13 15:48:22 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_toupper

_ft_toupper:
	cmp rdi, 'a'
	jl end
	cmp rdi, 'z'
	jg end
	sub rdi, 32
end:
	mov rax, rdi
	ret
