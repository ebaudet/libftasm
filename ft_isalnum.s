; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalnum.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:28:41 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/13 16:03:51 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_isalnum

_ft_isalnum:
	cmp rdi, 'A'
	jl if2
	cmp rdi, 'Z'
	jg if2
	jmp true
if2:
	cmp rdi, 'a'
	jl if3
	cmp rdi, 'z'
	jg if3
	jmp true
if3:
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