; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/11 13:58:12 by ebaudet           #+#    #+#              ;
;    Updated: 2019/10/07 18:02:20 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
segment .text
	global _ft_bzero

_ft_bzero:
	mov rcx, rsi ; move RSI(n) in RCX (counter register)
	mov rax, 0   ; move 0 in RAX (register use by stosb)
	cld          ; clear DF flag. When the DF flag is set to 0, string
	             ; operations increment the index registers (RSI and/or RDI).
	rep stosb    ; store RAX at address RDI (1st arg) RCX times. Each times, RDI
	             ; is increased cause of DF=0.
	ret


; void	ft_bzero(void *s, size_t n);
;
; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax
