; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_toupper.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:08 by ebaudet           #+#    #+#              ;
;    Updated: 2019/10/07 16:52:30 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_toupper

_ft_toupper:
	cmp rdi, 'a' ; compare 'a' to  RDI (1st arg)
	jl end       ; if lower, jump to label <end>
	cmp rdi, 'z' ; compare 'z' to  RDI (1st arg)
	jg end       ; if greater, jump to label <end>
	sub rdi, 32  ; sub 32 to RDI ('A' - 'a')
end:
	mov rax, rdi ; move RDI to RAX (return value)
	ret          ; return


; int	ft_toupper(int c);
; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax
