; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcat.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/14 12:25:26 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/18 01:11:46 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
segment .text
	global _ft_strcat

_ft_strcat:
	mov r12, rdi
	mov r13, rsi
	mov r14, 0
while:
	cmp byte[r12], 0
	je while2
	inc r12
	jmp while
while2:
	cmp byte[r13], 0
	je incr13
	mov rax, [r13]
	mov [r12], rax
	inc r12
	inc r13
	jmp while2
incr13:
	mov byte[r12], 0
end:
	mov rax, rdi
	ret