; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_sum_naturals.s                                  :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/17 14:41:35 by ebaudet           #+#    #+#              ;
;    Updated: 2019/12/17 20:53:25 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_sum_naturals

_ft_sum_naturals:
	cmp rdi, 65535				; overflow after 65535
	jg error
	mov rax, rdi				; result = n
while:
	dec rdi						; n--
	cmp rdi, 0
	jle end
	add rax, rdi				; result += n
	jmp while
error:
	mov rax, -1					; error return -1
end:
	ret

; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax
; int ft_sum_naturals(unsigned int n);
; return if error, return -1, else return result
; error: max int 65535. overflow after.
