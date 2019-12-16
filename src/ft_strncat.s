; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strncat.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/16 20:10:51 by ebaudet           #+#    #+#              ;
;    Updated: 2019/12/16 21:49:21 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

segment .text
	global _ft_strncat

_ft_strncat:
	push rdi          ; save ptr s1 on stack
while:
	cmp byte[rdi], 0  ; compare *s1 to 0
	je while2         ; if equal, jump label <while2>
	inc rdi           ; s1++
	jmp while         ; jump label <while>
while2:
	cmp rdx, 0        ; compare n to 0
	je terminate_zero ; terminate with 0
	cmp byte[rsi], 0  ; compare *s2 to 0
	je end            ; if equal, jump label <end>
	mov rbx, [rsi]    ; RBX = *s2
	mov [rdi], rbx    ; *s1 = RBX
	inc rdi           ; s1++
	inc rsi           ; s2++
	dec rdx           ; n--
	jmp while2        ; jump label <while2>
terminate_zero:
	mov byte[rdi], 0
end:
	pop rax           ; pop s1 to return it
	ret               ; return

; char	*ft_strncat(char *s1, const char *s2, size_t n)
;
; Ordre des arguments d'une fonction
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; retour d'une fonction
; %rax
