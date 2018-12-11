# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/11 15:02:11 by ebaudet           #+#    #+#              #
#    Updated: 2018/12/11 16:57:54 by ebaudet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
# main makefile :
AC		= nasm
CC		= gcc
AFLAGS	= -f macho64 -g
CFLAGS	= -Wall -Werror -Wextra
NAME	= libfts.a
TEST	= a.aout
SRC		= main.c
OBJ_DIR	= obj
OBJ		= $(addprefix obj/, $(SRC:.c=.o))
ASRC 	= ft_bzero.s
AOBJ	= $(addprefix obj/, $(SRC:.s=.o))

all: $(NAME) $(TEST)

$(TEST): $(OBJ) $(NAME)
	@$(CC) -o $(TEST) $(SRC) $(NAME)

obj/%.o: %.c
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $^ -o $@ -I .

obj/%.o: %.s
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

.PHONY: all clean fclean re
