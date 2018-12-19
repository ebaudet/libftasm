; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:47 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/18 18:07:15 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_memcpy



_ft_memcpy:
	push rdi
	mov rcx, rdx
	cld
	rep movsb
end:
	pop rax
	ret

; Ordre des arguments d'une fonction
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; retour d'une fonction
; %rax

; The MOVS instruction moves the string element addressed by the ESI
; register to the location addressed by the EDI register. The assembler
; recognizes three “short forms” of this instruction, which specify the
; size of the string to be moved: MOVSB (move byte string), MOVSW (move
; word string), and MOVSD (move doubleword string).