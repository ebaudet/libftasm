; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memset.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/11 16:04:09 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/11 17:10:15 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_memset

_ft_memset:
	cmp rdi, 0
	je end

loop:
	cmp rax, 0
	jle end
	jmp loop

end:
	ret