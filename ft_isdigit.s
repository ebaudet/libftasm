; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isdigit.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:28:28 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/13 16:07:14 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_isdigit

_ft_isdigit:
	cmp rdi, '0'
	jl false
	cmp rdi, '9'
	jg false
true:
	mov rax, 1
	ret
false:
	mov rax, 0
	ret