; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    minima.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/11 14:01:15 by ebaudet           #+#    #+#              ;
;    Updated: 2019/12/17 21:52:46 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global start
	global _main

start:
	call _main
	ret

_main:
	xor rax, rax
	ret
