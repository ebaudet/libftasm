# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/11 15:02:11 by ebaudet           #+#    #+#              #
#    Updated: 2019/12/17 17:46:17 by ebaudet          ###   ########.fr        #
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
ASRC	= ft_bzero.s ft_strcat.s ft_isalpha.s ft_isdigit.s ft_isalnum.s \
		  ft_isascii.s ft_isprint.s ft_toupper.s ft_tolower.s ft_puts.s \
		  ft_strlen.s ft_memset.s ft_memcpy.s ft_strdup.s \
		  ft_cat.s \
		  ft_strncat.s ft_sum_naturals.s ft_factoriel.s ft_pow.s ft_psqrt.s \
		  ft_strchr.s
AOBJ	= $(addprefix obj/, $(ASRC:.s=.o))

all: $(NAME) $(TEST)

$(TEST): $(OBJ) $(NAME)
	@$(CC) -o $(TEST) $(SRC) $(INC) $(NAME)

$(NAME): $(AOBJ)
	@ar -rc $(NAME) $(AOBJ)
	@ranlib $(NAME)
	@echo "\n> Compiling LibftASM [\033[32mDONE\033[m]"

obj/%.o: %.c
	@mkdir -p $(OBJ_DIR)
	@$(CC) -c $^ -o $@  $(INC)

obj/%.o: src/%.s
	@mkdir -p $(OBJ_DIR)
	@$(AC) $(AFLAGS) -o $@ $^  $(INC)
	@echo -n .

clean:
	@/bin/rm -rf $(AOBJ)
	@/bin/rm -rf $(OBJ_DIR)
	@echo "clean : [\033[32mDONE\033[m]"

fclean: clean
	@/bin/rm -rf $(NAME)
	@/bin/rm -rf $(TEST)
	@/bin/rm -rf a.out
	@echo "fclean [\033[32mDONE\033[m]"

re: fclean all

# tests
minima:
	@mkdir -p $(OBJ_DIR)
	nasm -f macho64 example/minima.s -o $(OBJ_DIR)/minima.o
	ld minima.o -macosx_version_min 10.12 -lSystem
	./a.out

libc:
	@mkdir -p $(OBJ_DIR)
	nasm -f macho64 example/libc.s -o $(OBJ_DIR)/libc.o
	ld libc.o -macosx_version_min 10.12 -lSystem
	./a.out

syscall:
	@mkdir -p $(OBJ_DIR)
	nasm -f macho64 example/syscall.s -o $(OBJ_DIR)/syscall.o
	ld syscall.o -macosx_version_min 10.12 -lSystem
	./a.out

test:
	@mkdir -p $(OBJ_DIR)
	nasm -f macho64 example/test.s -o $(OBJ_DIR)/test.o
	ld $(OBJ_DIR)/test.o -macosx_version_min 10.12 -lSystem
	./a.out

.PHONY: all clean fclean re
