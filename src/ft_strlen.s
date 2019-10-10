; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:42 by ebaudet           #+#    #+#              ;
;    Updated: 2019/10/08 16:53:50 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_strlen

_ft_strlen:
	push r12              ; save R12
	push rcx              ; save RCX (counter)
	mov r12, rdi          ; save old pointer value (s)
	xor al, al            ; set AL = 0
	mov rcx, 0xffffffff   ; define RCX as max value (32bits)
	cld                   ; clear DF flag. When DF=0, RDI will be incremented in
	                      ; rep operations
	repne scasb           ; scan while [RDI] != AL
	dec rdi               ; count \0, so decrement last ptr RDI
	sub rdi, r12          ; compare final address to initial address
	mov rax, rdi          ; and return it in RAX
	pop rcx               ; save RCX
	pop r12               ; pop R12
	ret                   ; return


; size_t	ft_strlen(const char *s);
; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax

; SCAS : Compares the byte, word, or double word specified with the memory
; operand with the value in the AL, AX, or EAX register, and sets the status
; flags in the EFLAGS register according to the results. The memory operand
; address is read from either the ES:EDI or the ES:DI registers (depending on
; the address-size attribute of the instruction, 32 or 16, respectively). The
; ES segment cannot be overridden with a segment override prefix.

; The SCAS, SCASB, SCASW, and SCASD instructions can be preceded by the REP
; prefix for block comparisons of ECX bytes, words, or doublewords. More often,
; however, these instructions will be used in a LOOP construct that takes some
; action based on the setting of the status flags before the next comparison is
; made.
