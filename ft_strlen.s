; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:42 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/18 00:29:56 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_strlen

_ft_strlen:
	mov r12, rdi
	mov r13, 0
while:
	cmp byte[r12], 0
	je end
	inc r12
	inc r13
	jmp while
end:
	mov rax, r13
	ret