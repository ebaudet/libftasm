; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:47 by ebaudet           #+#    #+#              ;
;    Updated: 2019/10/03 17:10:46 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_memcpy

_ft_memcpy:
	push rdi     ; push RDI (1st arg) on stack
	mov rcx, rdx ; move rdx in counter register
	cld          ; clear DF flag. When the DF flag is set to 0, string
	             ; operations increment the index registers (RSI and/or RDI).
	rep movsb    ; move byte at address RSI (2nd arg) to address RDI (1st arg)
	             ; RCX times. Each times, RSI and RDI are increased cause of DF.
end:
	pop rax      ; pop the last stack (old RDI) on RAX (return value)
	ret          ; return


; void	*ft_memcpy(void *s1, void const *s2, size_t n);
; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax

; The MOVS instruction moves the string element addressed by the ESI
; register to the location addressed by the EDI register. The assembler
; recognizes three “short forms” of this instruction, which specify the
; size of the string to be moved: MOVSB (move byte string), MOVSW (move
; word string), and MOVSD (move doubleword string).
