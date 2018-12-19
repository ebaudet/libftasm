# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/11 15:02:11 by ebaudet           #+#    #+#              #
#    Updated: 2018/12/19 17:39:47 by ebaudet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
# main makefile :
AC		= nasm
CC		= gcc
AFLAGS	= -f macho64 -g
CFLAGS	= -Wall -Werror -Wextra
NAME	= libfts.a
TEST	= test.out
SRC		= main.c
OBJ_DIR	= obj
INC		= -I inc
OBJ		= $(addprefix obj/, $(SRC:.c=.o))
ASRC	= ft_bzero.s ft_strcat.s ft_tolower.s ft_toupper.s ft_isascii.s \
		ft_isalnum.s ft_isalpha.s ft_isdigit.s ft_isprint.s ft_puts.s \
		ft_strlen.s ft_memset.s ft_memcpy.s ft_strdup.s ft_cat.s
AOBJ	= $(addprefix obj/, $(ASRC:.s=.o))

all: $(NAME) $(TEST)

$(TEST): $(OBJ) $(NAME)
	@$(CC) -o $(TEST) $(SRC) $(INC) $(NAME)

$(NAME): $(AOBJ)
	@ar -rc $(NAME) $(AOBJ)
	@ranlib $(NAME)
	@echo "\n> Compiling LibftASM [\033[32mDONE\033[m]"

obj/%.o: src%.c
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $^ -o $@ -I .

obj/%.o: src/%.s
	@mkdir -p $(OBJ_DIR)
	@$(AC) $(AFLAGS) -o $@ $^ -I .
	@echo -n .

clean:
	@/bin/rm -rf $(AOBJ)
	@/bin/rm -rf $(OBJ_DIR)
	@echo "clean : [\033[32mDONE\033[m]"

fclean: clean
	@/bin/rm -rf $(NAME)
	@/bin/rm -rf $(TEST)
	@echo "fclean [\033[32mDONE\033[m]"

re: fclean all

# tests
minima:
	nasm -f macho64 minima.s -o minima.o
	ld minima.o -macosx_version_min 10.12 -lSystem
	./a.out
libc:
	nasm -f macho64 libc.s -o libc.o
	ld libc.o -macosx_version_min 10.12 -lSystem
	./a.out
syscall:
	nasm -f macho64 syscall.s -o syscall.o
	ld syscall.o -macosx_version_min 10.12 -lSystem
	./a.out
test:
	nasm -f macho64 test.s -o test.o
	ld test.o -macosx_version_min 10.12 -lSystem
	./a.out

.PHONY: all clean fclean re
