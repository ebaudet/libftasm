# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/11 15:02:11 by ebaudet           #+#    #+#              #
#    Updated: 2019/12/17 21:46:03 by ebaudet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
# main makefile :

CC		= gcc
CFLAGS	= -Wall -Werror -Wextra
NAME	= test.out
SRC		= main.c
OBJ_DIR	= .obj/
INC		= -I libfts
OBJ		= $(addprefix $(OBJ_DIR), $(SRC:.c=.o))
LIB		= libfts/libfts.a

all: $(NAME)

$(NAME): make_libfts $(OBJ)
	@$(CC) -o $(NAME) $(SRC) $(INC) $(LIB)

$(OBJ_DIR)%.o: %.c
	@mkdir -p $(OBJ_DIR)
	@$(CC) -c $^ -o $@  $(INC)

clean:
	make -C libfts clean
	@/bin/rm -rf $(OBJ_DIR)
	@echo "clean : [\033[32mDONE\033[m]"

fclean: clean
	make -C libfts fclean
	@/bin/rm -rf $(NAME)
	@echo "fclean [\033[32mDONE\033[m]"

make_libfts:
	@echo "Compilation de la \033[35mlibfts\033[m :"
	@make -C libfts
	@echo ""

re: fclean all

.PHONY: all clean fclean re
