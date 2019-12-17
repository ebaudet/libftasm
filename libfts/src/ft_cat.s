; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/18 22:38:59 by ebaudet           #+#    #+#              ;
;    Updated: 2019/10/11 15:48:29 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define READ				3
%define WRITE				4
%define BUFF_SIZE			0xFF ; max size. otherwise byte data exceeds bounds

section .data
buffer:
	.buf db BUFF_SIZE

section .text
	global _ft_cat

_ft_cat:
read:
	lea rsi, [rel buffer.buf]    ; buf =
	mov rdx, BUFF_SIZE           ; nbyte = 0xFF
	mov rax, MACH_SYSCALL(READ)  ; define syscall as READ
	syscall                      ; call the syscall
	jc end                       ; if carry flag is set to error
	test rax, rax                ; test RAX
	jz end                       ; if RAX = 0, jump to label <end>
write:
	push rdi                     ; save fd (RDI) on stack
	mov rdi, STDOUT              ; fildes = STDOUT (1)
	mov rdx, rax                 ; nbyte = return of read
	mov rax, MACH_SYSCALL(WRITE) ; define syscall as WRITE
	syscall                      ; call the syscall
	pop rdi                      ; get old RDI
	jmp read                     ; jump to label <read>
end:
	xor rax, rax                 ; RAX = 0
	ret                          ; return


; void	ft_cat(int fd);
;
; Arguments order in a function :
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; Return value :
; %rax

; ssize_t	write(int fildes, const void *buf, size_t nbyte);
; ssize_t	read(int fildes, void *buf, size_t nbyte);
