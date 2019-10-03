; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalnum.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:28:41 by ebaudet           #+#    #+#              ;
;    Updated: 2019/10/03 17:12:38 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_isalnum

_ft_isalnum:
	cmp rdi, '0' ; compare '0' to  RDI (1st arg)
	jl false     ; if greater, jump to label <false>
	cmp rdi, '9' ; compare '9' to  RDI (1st arg)
	jle true     ; if lower equal, jump to label <true>
	cmp rdi, 'A' ; compare 'A' to  RDI (1st arg)
	jl false     ; if lower, jump to label <false>
	cmp rdi, 'Z' ; compare 'Z' to  RDI (1st arg)
	jle true     ; if lower equal, jump to label <true>
	cmp rdi, 'a' ; compare 'a' to  RDI (1st arg)
	jl false     ; if lower, jump to label <false>
	cmp rdi, 'z' ; compare 'z' to  RDI (1st arg)
	jg false     ; if greater, jump to label <false>
true:
	mov rax, 1   ; move 1 to RAX (return value)
	ret          ; return
false:
	mov rax, 0   ; move 1 to RAX (return value)
	ret          ; return


; int	ft_isalnum(int c);
; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax
