; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalpha.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:28:20 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/13 16:05:23 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_isalpha

_ft_isalpha:
	cmp rdi, 'A'
	jl if2
	cmp rdi, 'Z'
	jg if2
	jmp true
if2:
	cmp rdi, 'a'
	jl false
	cmp rdi, 'z'
	jg false
true:
	mov rax, 1
	ret
false:
	mov rax, 0
	ret