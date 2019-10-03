; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isprint.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:28:59 by ebaudet           #+#    #+#              ;
;    Updated: 2019/10/03 17:12:23 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_isprint

_ft_isprint:
	cmp rdi, 32   ; compare 32 to  RDI (1st arg)
	jl false      ; if lower, jump to label <false>
	cmp rdi, 126  ; compare 126 to  RDI (1st arg)
	jg false      ; if greater, jump to label <false>
true:
	mov rax, 1    ; move 1 to RAX (return value)
	ret           ; return
false:
	mov rax, 0    ; move 0 to RAX (return value)
	ret           ; return


; int	ft_isprint(int c);
; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax
