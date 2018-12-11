; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/11 13:58:12 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/11 17:01:32 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
segment .text
	global _ft_bzero
	extern _ft_memset

_ft_bzero:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	push rsp, rsi
	mov rsi, 0
	pop rdx
	call _ft_memset
	leave
	ret