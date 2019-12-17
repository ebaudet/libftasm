; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcat.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/14 12:25:26 by ebaudet           #+#    #+#              ;
;    Updated: 2019/12/16 20:11:23 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
segment .text
	global _ft_strcat

_ft_strcat:
	push rdi          ; save ptr s1 on stack
while:
	cmp byte[rdi], 0  ; compare *s1 to 0
	je while2         ; if equal, jump label <while2>
	inc rdi           ; s1++
	jmp while         ; jump label <while>
while2:
	cmp byte[rsi], 0  ; compare *s2 to 0
	je end            ; if equal, jump label <end>
	mov rbx, [rsi]    ; RBX = *s2
	mov [rdi], rbx    ; *s1 = RBX
	inc rdi           ; s1++
	inc rsi           ; s2++
	jmp while2        ; jump label <while2>
end:
	pop rax           ; pop s1 to return it
	ret               ; return

; char	*ft_strcat(char *s1, const char *s2);
;
; Ordre des arguments d'une fonction
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; retour d'une fonction
; %rax
