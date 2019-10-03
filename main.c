/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/12/14 12:30:51 by ebaudet           #+#    #+#             */
/*   Updated: 2019/10/03 16:51:16 by ebaudet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libftasm.h"
#include <stdio.h>
#include <ctype.h>
#include <fcntl.h>

int		main(void)
{
	// char tabint[11] = "0123456789\0";
	// char tabchar[53] = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM\0";
	// char tabspecial[26] = "!@#$%^&*()_+{}|[];:,./<>?\0";
	int error;


	// ******************************
	// *********** PART 1 ***********
	// ******************************
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
		printf("\033[32m{OK}\033[m string_cat : '%s', string_cat2 : '%s'\n", string_cat, string_cat2);

	}

	ft_strcat(string_cat, ".test2");
	strcat(string_cat2, ".test2");
	if (strcmp(string_cat, string_cat2) != 0) {
		printf("\033[31mERROR\033[m ft_strcat : [%s|%s]\n", string_cat, string_cat2);
		error++;
	} else {
		printf("\033[32m{OK}\033[m string_cat : '%s', string_cat2 : '%s'\n", string_cat, string_cat2);

	}

	// for null pointer, strcat provoc a segmentation fault :
	//
	// char *null_cat = NULL;
	// ft_strcat(null_cat, "test");
	// if (null_cat == NULL) {
	// 	printf("\033[32m{OK}\033[m null_cat : '%s'\n", null_cat);
	// } else {
	// 	printf("\033[31mERROR\033[m ft_strcat : [%s|%s]\n", string_cat, string_cat2);
	// 	error++;
	// }
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


	// ======= ft_puts ========
	printf("\n======= ft_puts =========\n");

	ft_puts("coucou\n");
	ft_puts("salrweoijr oweij pqwoeijr qpwoiei rpqvwjiejn fewirgn welirjfncq pwoeifij pqoi%^&*()9876545^&*()987654%^&898765^789876\n");
	puts("ft_puts:\"");
	ft_puts("");
	puts("\", puts:\"");
	puts("");
	puts("\"\n");

	puts("ft_puts:\"");
	ft_puts(NULL);
	puts("\", puts:\"");
	puts(NULL);
	puts("\"\n");
	ft_puts("\033[32mSUCCESS\033[m ft_puts\n");

	// ******************************
	// *********** PART 2 ***********
	// ******************************
	printf("\n*********** PART 2 ***********\n");



	// ======= ft_strlen ========
	printf("\n======= ft_strlen =========\n");
	char len[255] = "coucou les gens\0";
	char len2[255] = "poerkwg weoiirg powejrg pweoirj gpweoirjjg poweirjg pk a\0";
	error = 0;
	if (ft_strlen(len) != strlen(len)) {
		printf("\033[31mERROR\033[m ft_strlen with %s | ft_strlen:%lu | strlen:%lu\n", len, ft_strlen(len), strlen(len));
			error++;
	}
	if (ft_strlen(len2) != strlen(len2)) {
		printf("\033[31mERROR\033[m ft_strlen with %s | ft_strlen:%lu | strlen:%lu\n", len2, ft_strlen(len2), strlen(len2));
			error++;
	}
	if (ft_strlen("salut les gens oaoaoa") != strlen("salut les gens oaoaoa")) {
		printf("\033[31mERROR\033[m ft_strlen with %s | ft_strlen:%lu | strlen:%lu\n", "salut les gens oaoaoa", ft_strlen("salut les gens oaoaoa"), strlen("salut les gens oaoaoa"));
			error++;
	}
	if (ft_strlen("") != strlen("")) {
		printf("\033[31mERROR\033[m ft_strlen with %s | ft_strlen:%lu | strlen:%lu\n", "", ft_strlen(""), strlen(""));
			error++;
	}
	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_strlen\n");

	// ======= ft_memset ========
	printf("\n======= ft_memset =========\n");
	error = 0;
	char memset1[27] = "qwertyuiopasdfghjklzxcvbnm\0";
	char memset2[27] = "qwertyuiopasdfghjklzxcvbnm\0";

	ft_memset(memset1,'a', 5);
	memset(memset2,'a', 5);
	for (int i = 0; i < 27; i++) {
		if (memset1[i] != memset2[i]) {
			printf("\033[31mERROR\033[m memset with caract %d[%d|%d] \n", i, memset1[i], memset2[i]);
			error++;
		}
	}
	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_memset\n");

	// ======= ft_memcpy ========
	printf("\n======= ft_memcpy =========\n");
	error = 0;
	char memcpy1[27] = "qwertyuiopasdfghjklzxcvbnm\0";
	char memcpy2[27] = "lkjhgfdsapoiuytrewqmnbvcx\0";
	char ft_memcpy1[27] = "qwertyuiopasdfghjklzxcvbnm\0";
	char ft_memcpy2[27] = "lkjhgfdsapoiuytrewqmnbvcx\0";
	printf("[BEFORE] : memcpy1: '%s'\nmemcpy2: '%s'\nft_memcpy1: '%s'\nft_memcpy2: '%s'\n", memcpy1, memcpy2, ft_memcpy1, ft_memcpy2);
	ft_memcpy(memcpy1,memcpy2, 9);
	memcpy(ft_memcpy1,ft_memcpy2, 9);
	printf("[AFTER] : memcpy1: '%s'\nmemcpy2: '%s'\nft_memcpy1: '%s'\nft_memcpy2: '%s'\n", memcpy1, memcpy2, ft_memcpy1, ft_memcpy2);
	for (int i = 0; i < 27; i++) {
		if (memcpy1[i] != ft_memcpy1[i]) {
			printf("\033[31mERROR\033[m memcpy origin with caract %d[%d|%d] \n", i, memcpy2[i], ft_memcpy2[i]);
			error++;
		}
		if (memcpy2[i] != ft_memcpy2[i]) {
			printf("\033[31mERROR\033[m memcpy copy with caract %d[%d|%d] \n", i, memcpy2[i], ft_memcpy2[i]);
			error++;
		}
	}
	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_memcpy\n");

	// ======= ft_strdup ========
	printf("\n======= ft_strdup =========\n");
	error = 0;
	char strinit[12] = "Hello Wolrd\0";
	char *strcpy;
	char *strcpy2;
	strcpy = ft_strdup(strinit);
	strcpy2 = strdup(strinit);
	for (int i = 0; i < 12; i++) {
		if (strcpy[i] != strcpy2[i]) {
			printf("\033[31mERROR\033[m strdup origin with caract %d[%d|%d] \n", i, strcpy[i], strcpy2[i]);
			error++;
		}
	}

	if (error == 0)
		printf("\033[32mSUCCESS\033[m ft_strdup\n");


	// ******************************
	// *********** PART 3 ***********
	// ******************************
	printf("\n*********** PART 3 ***********\n");

	printf("\n======= ft_cat =========\n");
	int fd = open("blob.txt", O_RDONLY);
	ft_cat(fd);
	printf("\n======= fin ft_cat =========\n");

	return 0;
}