; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_tolower.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:17 by ebaudet           #+#    #+#              ;
;    Updated: 2019/10/03 17:13:05 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_tolower

_ft_tolower:
	cmp rdi, 'A' ; compare 'A' to  RDI (1st arg)
	jl end       ; if lower, jump to label <end>
	cmp rdi, 'Z' ; compare 'Z' to  RDI (1st arg)
	jg end       ; if greater, jump to label <end>
	add rdi, 32  ; add 32 to RDI ('A' - 'a')
end:
	mov rax, rdi ; move RDI to RAX (return value)
	ret          ; return


; int	ft_tolower(int c);
; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax
