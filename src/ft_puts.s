; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:31 by ebaudet           #+#    #+#              ;
;    Updated: 2019/10/10 12:17:26 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .data
null:
	.string db "(null)", 10
	.len equ $ - null.string

section .text
	global _ft_puts
	extern _ft_strlen

_ft_puts:
	cmp rdi, 0                    ; compare s to NULL
	je _put_null                  ; if equal, jump label <_put_null>
	call _ft_strlen               ; call ft_strlen function. No need to change
	                              ; any register because it is a the same order
	cmp rax, 0                    ; compare return ft_strlen to 0
	je end                        ; if equal, jump to label <end>

_ft_putchar:
	mov rsi, rdi                  ; buf = s
	mov rdi, STDOUT               ; fildes = STDOUT (1)
	mov rdx, rax                  ; nbyte = len of s (ft_strlen(s))
	mov rax, MACH_SYSCALL(WRITE)  ; define syscall as WRITE
	syscall                       ; call the syscall.
	ret                           ; return (WRITE change RAX to his value)

_put_null:
	mov rdi, STDOUT               ; fildes = STDOUT (1)
	lea rsi, [rel null.string]    ; buf = null.string (section <.data>)
	mov rdx, null.len             ; nbyte = null.len (len of null.string)
	mov rax, MACH_SYSCALL(WRITE)  ; define syscall as WRITE
	syscall                       ; call the syscall
	ret                           ; return (WRITE change RAX to his value)

end:
	ret                           ; return. RAX == 0

; int		ft_puts(const char *s);
;
; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax

; ssize_t	write(int fildes, const void *buf, size_t nbyte);
