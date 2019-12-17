; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memset.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/11 16:04:09 by ebaudet           #+#    #+#              ;
;    Updated: 2019/10/03 17:12:11 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_memset

_ft_memset:
	push rdi     ; push RDI (1st arg) on stack to save it.
	mov rcx, rdx ; move RDX in RCX (counter register)
	mov rax, rsi ; move RSI in RAX (return register)
	cld          ; clear DF flag. When the DF flag is set to 0, string
	             ; operations increment the index registers (RSI and/or RDI).
	rep stosb    ; store RAX at address RDI (1st arg) RCX times. Each times, RDI
	             ; is increased cause of DF=0.
end:
	pop rax      ; pop the last stack (old RDI) on RAX (return value)
	ret          ; return


; void	*ft_memset(void *b, int c, size_t len);
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
