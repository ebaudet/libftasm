; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_tolower.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:17 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/13 15:24:24 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_tolower

ft_tolower:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	cmp rdi, 'A'
	jl end
	cmp rdi, 'Z'
	jg end
	add rdi, 32
end:
	mov rax, rdi
	ret
