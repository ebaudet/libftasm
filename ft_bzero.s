; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/11 13:58:12 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/14 16:46:21 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
segment .text
	global _ft_bzero

_ft_bzero:
	cmp rdi, 0
	je end
	mov r12, rdi
	mov r13, rsi
while:
	cmp r13, 0
	je end
	mov byte[r12], 0
	inc r12
	dec r13
	jmp while
end:
	ret