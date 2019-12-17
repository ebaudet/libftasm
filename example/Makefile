# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/17 21:43:28 by ebaudet           #+#    #+#              #
#    Updated: 2019/12/17 22:00:59 by ebaudet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

OBJ_DIR	= .obj/

all: test minima libc syscall

# tests
minima:
	@mkdir -p $(OBJ_DIR)
	nasm -f macho64 minima.s -o $(OBJ_DIR)minima.o
	ld $(OBJ_DIR)minima.o -macosx_version_min 10.12 -lSystem
	@echo ""
	./a.out

libc:
	@mkdir -p $(OBJ_DIR)
	nasm -f macho64 libc.s -o $(OBJ_DIR)libc.o
	ld $(OBJ_DIR)libc.o -macosx_version_min 10.12 -lSystem
	@echo ""
	./a.out
	@echo ""

syscall:
	@mkdir -p $(OBJ_DIR)
	nasm -f macho64 syscall.s -o $(OBJ_DIR)syscall.o
	ld $(OBJ_DIR)syscall.o -macosx_version_min 10.12 -lSystem
	@echo ""
	./a.out
	@echo ""

test:
	@mkdir -p $(OBJ_DIR)
	nasm -f macho64 test.s -o $(OBJ_DIR)test.o
	ld $(OBJ_DIR)test.o -macosx_version_min 10.12 -lSystem
	@echo ""
	./a.out
	@echo ""

clean:
	@/bin/rm -rf $(OBJ_DIR)
	@echo "clean : [\033[32mDONE\033[m]"

fclean: clean
	@/bin/rm -rf a.out
	@echo "fclean [\033[32mDONE\033[m]"

re: fclean all

.PHONY: all clean fclean re
