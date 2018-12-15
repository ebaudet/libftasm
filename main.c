/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/12/14 12:30:51 by ebaudet           #+#    #+#             */
/*   Updated: 2018/12/14 18:50:10 by ebaudet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libftASM.h"
#include <stdio.h>
#include <ctype.h>

int		main(void)
{
	// char tabint[11] = "0123456789\0";
	// char tabchar[53] = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM\0";
	// char tabspecial[26] = "!@#$%^&*()_+{}|[];:,./<>?\0";
	int error;
	printf("\n*********** PART 1 ***********\n");

	// ======= ft_bzero ========
	printf("\n======= ft_bzero =========\n");
	error = 0;
	char bzero1[27] = "qwertyuiopasdfghjklzxcvbnm\0";
	char bzero2[27] = "qwertyuiopasdfghjklzxcvbnm\0";

	ft_bzero(bzero1, 24);
	bzero(bzero2, 24);
	for (int i = 0; i < 27; i++) {
		if (bzero1[i] != bzero2[i]) {
			printf("\033[31mERROR\033[m bzero with caract %d[%d|%d] \n", i, bzero1[i], bzero2[i]);
			error++;
		}
	}
	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_bzero\n");

	// ======= ft_strcat ========
	printf("\n======= ft_strcat =========\n");


	error = 0;
	char string_cat[20];
	bzero(string_cat, 20);

	char string_cat2[20];
	bzero(string_cat2, 20);

	ft_strcat(string_cat, "test");
	strcat(string_cat2, "test");
	if (strcmp(string_cat, string_cat2) != 0) {
		printf("\033[31mERROR\033[m ft_strcat : [%s|%s]\n", string_cat, string_cat2);
		error++;
	} else {
		printf("string_cat : '%s', string_cat2 : '%s'\n", string_cat, string_cat2);

	}

	ft_strcat(string_cat, ".test2");
	strcat(string_cat2, ".test2");
	if (strcmp(string_cat, string_cat2) != 0) {
		printf("\033[31mERROR\033[m ft_strcat : [%s|%s]\n", string_cat, string_cat2);
		error++;
	} else {
		printf("string_cat : '%s', string_cat2 : '%s'\n", string_cat, string_cat2);

	}

	char *null_cat = NULL;
	ft_strcat(null_cat, "test");
	if (null_cat == NULL) {
		printf("null_cat : '%s'\n", null_cat);
	} else {
		printf("\033[31mERROR\033[m ft_strcat : [%s|%s]\n", string_cat, string_cat2);
		error++;
	}

	// char *null_cat2 = NULL;
	// strcat(null_cat2, "test");
	// if (strcmp(string_cat, string_cat2) != 0) {
	// 		printf("\033[31mERROR\033[m ft_strcat :\n");
	// 		error++;
	// }

	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_strcat\n");

	// ======= ft_isalpha ========
	printf("\n======= ft_isalpha =========\n");
	error = 0;
	for (int i = 0; i < 256; i++) {
		if (ft_isalpha(i) != isalpha(i)) {
			printf("\033[31mERROR\033[m ft_isalpha with %c | %d\n", i, i);
			error++;
		}
	}
	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_isalpha\n");

	// ======= ft_isdigit ========
	printf("\n======= ft_isdigit =========\n");
	error = 0;
	for (int i = 0; i < 256; i++) {
		if (ft_isdigit(i) != isdigit(i)) {
			printf("\033[31mERROR\033[m ft_isdigit with %c | %d\n", i, i);
			error++;
		}
	}
	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_isdigit\n");

	// ======= ft_isalnum ========
	printf("\n======= ft_isalnum =========\n");
	error = 0;
	for (int i = 0; i < 256; i++) {
		if (ft_isalnum(i) != isalnum(i)) {
			printf("\033[31mERROR\033[m ft_isalnum with %c | %d\n", i, i);
			error++;
		}
	}
	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_isalnum\n");

	// ======= ft_isascii ========
	printf("\n======= ft_isascii =========\n");
	error = 0;
	for (int i = 0; i < 256; i++) {
		if (ft_isascii(i) != isascii(i)) {
			printf("\033[31mERROR\033[m ft_isascii with %c | %d\n", i, i);
			error++;
		}
	}
	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_isascii\n");

	// ======= ft_isprint ========
	printf("\n======= ft_isprint =========\n");
	error = 0;
	for (int i = 0; i < 256; i++) {
		if (ft_isprint(i) != isprint(i)) {
			printf("\033[31mERROR\033[m ft_isprint with %c | %d\n", i, i);
			error++;
		}
	}
	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_isprint\n");

	// ======= ft_toupper ========
	printf("\n======= ft_toupper =========\n");
	error = 0;
	for (int i = 0; i < 256; i++) {
		if (ft_toupper(i) != toupper(i)) {
			printf("\033[31mERROR\033[m ft_toupper with %c | %d\n", i, i);
			error++;
		}
	}
	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_toupper\n");

	// ======= ft_tolower ========
	printf("\n======= ft_tolower =========\n");
	error = 0;
	for (int i = 0; i < 256; i++) {
		if (ft_tolower(i) != tolower(i)) {
			printf("\033[31mERROR\033[m ft_tolower with %c | %d\n", i, i);
			error++;
		}
	}
	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_tolower\n");


	// int i = -1;
	// while (tabint[++i] != 0)
	// {
	// 	if (!ft_isdigit(tabint[i]))
	// 		printf("%c is not a digit\n", tabint[i]);
	// 	else
	// 		printf("%c is a digit\n", tabint[i]);
	// }
	// i = -1;
	// while (tabchar[++i] != 0)
	// {
	// 	if (!ft_isdigit(tabchar[i]))
	// 		printf("%c is not a digit\n", tabchar[i]);
	// 	else
	// 		printf("%c is a digit\n", tabchar[i]);
	// }
	// i = -1;
	// while (tabspecial[++i] != 0)
	// {
	// 	if (!ft_isdigit(tabspecial[i]))
	// 		printf("%c is not a digit\n", tabspecial[i]);
	// 	else
	// 		printf("%c is a digit\n", tabspecial[i]);
	// }

	return 0;
}