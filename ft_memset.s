; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memset.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/11 16:04:09 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/18 16:04:21 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_memset

_ft_memset:
	push rdi
	cld
	mov rcx, rdx
	mov rax, rsi
	rep stosb
end:
	pop rax
	ret

; Ordre des arguments d'une fonction
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; retour d'une fonction
; %rax

; The STOS instruction stores the source string element from the EAX (doubleword
; string), AX (word string), or AL (byte string) register into the memory
; location identified with the EDI register. The “short forms” for this
; instruction are STOSB (store byte string), STOSW (store word string), and
; STOSD (store doubleword string). This instruction is also normally used in a
; loop. Here a string is commonly loaded into the register with a LODS
; instruction, operated on by other instructions, and then stored again in
; memory with a STOS instruction.