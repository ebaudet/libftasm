; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strchr.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/17 17:40:11 by ebaudet           #+#    #+#              ;
;    Updated: 2019/12/17 20:50:42 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strchr

_ft_strchr:
	push rbx					; we have to save this since we use it
	mov rbx, rsi				; put c on RBX to use his 1 byte part (BL)
while:
	cmp byte[rdi], bl			; compare *s to (char)c
	je found
	cmp byte[rdi], 0			; found the \0 final string.
	jz not_found
	inc rdi						; s++
	jmp while
found:
	lea rax, [rdi]				; return *s founded
	jmp end
not_found:
	xor rax, rax				; return NULL
	jmp end
end:
	pop rbx						; restore rbx before returning
	ret

; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax
; char	*ft_strchr(const char *s, int c)
; Return :
; - if perfect sqrt found return value.
; - else -1.
