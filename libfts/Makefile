# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/11 15:02:11 by ebaudet           #+#    #+#              #
#    Updated: 2019/12/17 21:42:20 by ebaudet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

AC		= nasm
AFLAGS	= -f macho64 -g
NAME	= libfts.a
OBJ_DIR	= .obj/
INC		= -I .
ASRC	= ft_bzero.s ft_strcat.s ft_isalpha.s ft_isdigit.s ft_isalnum.s \
		  ft_isascii.s ft_isprint.s ft_toupper.s ft_tolower.s ft_puts.s \
		  ft_strlen.s ft_memset.s ft_memcpy.s ft_strdup.s \
		  ft_cat.s \
		  ft_strncat.s ft_sum_naturals.s ft_factoriel.s ft_pow.s ft_psqrt.s \
		  ft_strchr.s
AOBJ	= $(addprefix $(OBJ_DIR), $(ASRC:.s=.o))

all: $(NAME)

$(NAME): $(AOBJ)
	@ar -rc $(NAME) $(AOBJ)
	@ranlib $(NAME)
	@echo "\n> Compiling LibftASM [\033[32mDONE\033[m]"

$(OBJ_DIR)%.o: src/%.s
	@mkdir -p $(OBJ_DIR)
	@$(AC) $(AFLAGS) -o $@ $^  $(INC)
	@echo -n .

clean:
	@/bin/rm -rf $(OBJ_DIR)
	@echo "libfts clean : [\033[32mDONE\033[m]"

fclean: clean
	@/bin/rm -rf $(NAME)
	@echo "libfts fclean [\033[32mDONE\033[m]"

re: fclean all

.PHONY: all clean fclean re
