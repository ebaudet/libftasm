/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/12/14 12:30:51 by ebaudet           #+#    #+#             */
/*   Updated: 2019/12/17 21:01:04 by ebaudet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libftasm.h"
#include <stdio.h>
#include <ctype.h>
#include <fcntl.h>
#include <string.h>
#include <math.h>

int test_sum_naturals(unsigned int n)
{
	if (n > 65535)
		return (-1);
	int result = 0;
	for (int i = 1; i <= n; i++) {
		result += i;
	}
	return (result);
}

int		main(void)
{
	int error, i;

	int part_1 = 1;
	int part_2 = 1;
	int part_3 = 1;
	int part_bonus = 1;

	// ******************************
	// *********** PART 1 ***********
	// ******************************
	if (part_1) {

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
		ft_bzero(NULL,0);
		if (error == 0)
			printf("\033[32mSUCCESS\033[m ft_bzero\n");

		// ======= ft_strcat ========
		printf("\n======= ft_strcat =========\n");


		error = 0;


		// char big_string[2000000];
		// bzero(big_string, 2000000);
		// char big_string2[2000000];
		// bzero(big_string2, 2000000);
		// int i = 0;
		// while (++i < 50000)
		// {
		// 	ft_strcat(big_string, "test");
		// 	strcat(big_string2, "test");
		// 	if (strcmp(big_string, big_string2) != 0) {
		// 		printf("\033[31mERROR\033[m ft_strcat : [%s|%s]\n", big_string2, big_string2);
		// 		error++;
		// 	}
		// }

		// bzero(big_string, 2000000);
		// bzero(big_string2, 2000000);
		// while (++i < 2000)
		// {
		// 	ft_strcat(big_string, "test jhfkhw abdfk jabhsd kfjabsdkfjabskdjfb askjdbf askjhdbf ksajhdbf ksajhdbf kjashdbf kjashdbf\n");
		// 	strcat(big_string2, "test jhfkhw abdfk jabhsd kfjabsdkfjabskdjfb askjdbf askjhdbf ksajhdbf ksajhdbf kjashdbf kjashdbf\n");
		// 	if (strcmp(big_string, big_string2) != 0) {
		// 		printf("\033[31mERROR\033[m ft_strcat : [%s|%s]\n", big_string2, big_string2);
		// 		error++;
		// 	}
		// }



		char string_cat[22] = "\0n1234567890123456789";
		char string_cat2[22] = "\0n1234567890123456789";

		ft_strcat(string_cat, "t\0test");
		strcat(string_cat2, "t\0test");
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





		// char string_cat[22] = "\0n1234567890123456789";

		// char string_cat2[22] = "\0n1234567890123456789";

		ft_strcat(string_cat, "hey");
		strcat(string_cat2, "t\0test");



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
		int res_put = 0;

		puts("coucou");
		ft_puts("coucou");

		puts("coucou\0sdds");
		ft_puts("coucou\0sdds");

		puts("salrweoijr oweij pqwoeijr qpwoiei rpqvwjiejn fewirgn welirjfncq pwoeifij pqoi%^&*()9876545^&*()987654%^&898765^789876");
		ft_puts("salrweoijr oweij pqwoeijr qpwoiei rpqvwjiejn fewirgn welirjfncq pwoeifij pqoi%^&*()9876545^&*()987654%^&898765^789876");

		printf("\n\nft_puts:\"");
		fflush(stdout);
		res_put = ft_puts("Hello word");
		printf("\"[%d], puts:\"", res_put);
		fflush(stdout);
		res_put = puts("Hello word");
		printf("\"[%d]\n", res_put);
		fflush(stdout);

		printf("\n\nft_puts:\"");
		fflush(stdout);
		res_put = ft_puts("");
		printf("\"[%d], puts:\"", res_put);
		fflush(stdout);
		res_put = puts("");
		printf("\"[%d]\n", res_put);
		fflush(stdout);

		printf("ft_puts:\"");
		fflush(stdout);
		res_put = ft_puts(NULL);
		printf("\"[%d], puts:\"", res_put);
		fflush(stdout);
		res_put = puts(NULL);
		printf("\"[%d]\n", res_put);
		fflush(stdout);


		int a1 = puts("ici puts, puis ft_puts");
		int a2 = ft_puts("int a1 = ici ft_puts, avant puts");
		if (a1 != a2)
			printf("\033[31mERROR\033[m ft_puts bad return value (expected: %d | get: %d)\n", a1, a2);

		a1 = puts(NULL);
		a2 = ft_puts(NULL);
		if (a1 != a2)
			printf("\033[31mERROR\033[m ft_puts bad return value (expected: %d | get: %d)\n", a1, a2);

		a1 = puts("coucou dfa dfasd fasd f");
		a2 = ft_puts("coucou1srtertwert wert wert ");
		printf("%d %d\n", a1, a2);
		if (a1 != a2)
			printf("\033[31mERROR\033[m ft_puts bad return value (expected: %d | get: %d)\n", a1, a2);


		ft_puts("\033[32mSUCCESS\033[m ft_puts");

	}


	if (part_2) {

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
		char memset1[27] = "\0qwertyuiopasdfghjklzxcvbn\0";
		char memset2[27] = "\0qwertyuiopasdfghjklzxcvbn\0";

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




		char memcpy3[5] = "qwer\0";
		char memcpy4[5] = "qwer\0";
		ft_memcpy(memcpy3, "a", 4);
		memcpy(memcpy4, "a", 4);
		for (int i = 0; i < 4; i++) {
			if (memcpy3[i] != memcpy4[i]) {
				printf("\033[31mERROR\033");
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

	}

	// ******************************
	// *********** PART 3 ***********
	// ******************************
	if (part_3) {

		printf("\n*********** PART 3 ***********\n");

		printf("\n======= ft_cat =========\n");
		int fd = open("blob.txt", O_RDONLY);
		ft_cat(fd);
		// printf("\nRepeat it:\n");
		// fflush(stdout);
		// ft_cat(0);
		printf("\n======= fin ft_cat =========\n");

	}

	// ******************************
	// *********** PART Bonus *******
	// ******************************
	if (part_bonus) {

		printf("\n*********** PART Bonus ***********\n");

		// ======= ft_strncat ========

		printf("\n======= ft_strncat =========\n");

		error = 0;

		char string_ncat[22] = "\0n1234567890123456789";
		char string_ncat2[22] = "\0n1234567890123456789";
		// test 1
		ft_strncat(string_ncat, "1t\0test", 6);
		strncat(string_ncat2, "1t\0test", 6);
		if (strcmp(string_ncat, string_ncat2) != 0) {
			printf("\033[31mERROR\033[m ft_strcat : [%s|%s]\n", string_ncat, string_ncat2);
			error++;
		} else {
			printf("\033[32m{OK}\033[m string_ncat : '%s', string_ncat2 : '%s'\n", string_ncat, string_ncat2);
		}
		// test 2
		ft_strncat(string_ncat, ".2test", 4);
		strncat(string_ncat2, ".2test", 4);
		if (strcmp(string_ncat, string_ncat2) != 0) {
			printf("\033[31mERROR\033[m ft_strcat : [%s|%s]\n", string_ncat, string_ncat2);
			error++;
		} else {
			printf("\033[32m{OK}\033[m string_ncat : '%s', string_ncat2 : '%s'\n", string_ncat, string_ncat2);
		}
		// test 3
		ft_strncat(string_ncat, ".3test", -3);
		strncat(string_ncat2, ".3test", -3);
		if (strcmp(string_ncat, string_ncat2) != 0) {
			printf("\033[31mERROR\033[m ft_strcat : [%s|%s]\n", string_ncat, string_ncat2);
			error++;
		} else {
			printf("\033[32m{OK}\033[m string_ncat : '%s', string_ncat2 : '%s'\n", string_ncat, string_ncat2);
		}
		// test 4
		ft_strncat(string_ncat, ".4test", 50);
		strncat(string_ncat2, ".4test", 50);
		if (strcmp(string_ncat, string_ncat2) != 0) {
			printf("\033[31mERROR\033[m ft_strcat : [%s|%s]\n", string_ncat, string_ncat2);
			error++;
		} else {
			printf("\033[32m{OK}\033[m string_ncat : '%s', string_ncat2 : '%s'\n", string_ncat, string_ncat2);
		}

		if (error == 0)
			printf("\033[32mSUCCESS\033[m ft_strcat\n");


		// ======= ft_strchr ========

		char	str[] = "Hello je tesx";
		printf("in '%s' find '%c' at %s\n", str, 'j', ft_strchr(str, 'j'));
		if (strchr(str, 'H') != ft_strchr(str, 'H'))
		{
			printf("\033[31mERROR\033[m ft_strchr with caract 'H' \n");
			error++;
		}
		if (strchr(str, 'j') != ft_strchr(str, 'j'))
		{
			printf("\033[31mERROR\033[m ft_strchr with caract 'j' \n");
			error++;
		}
		if (strchr(str, 'x') != ft_strchr(str, 'x'))
		{
			printf("\033[31mERROR\033[m ft_strchr with caract 'x' \n");
			error++;
		}
		if (strchr(str, 'y') != ft_strchr(str, 'y'))
		{
			printf("\033[31mERROR\033[m ft_strchr with caract 'y' \n");
			error++;
		}
		if (strchr(str, 0) != ft_strchr(str, 0))
		{
			printf("\033[31mERROR\033[m ft_strchr with caract 0 \n");
			error++;
		}
		if (error == 0)
			printf("\033[32mSUCCESS\033[m ft_strchr\n");

		// ======= ft_psqrt ========

		printf("========= ft_psqrt =============\n");
		for (i = -5; i <= 100; i++) {
			printf("perfect sqrt: %d -> %d\n", i, ft_psqrt(i));
		}

		// ======= ft_pow ========

		printf("========= ft_pow ===============\n");
		error = 0;
		int pow_val, base;
		for (pow_val = 0; pow_val < 10; pow_val++) {
			for (base = 0; base <= 10; base++) {
				if ((unsigned int)pow((double)base, (double)pow_val) != ft_pow(base, pow_val)) {
					error++;
					printf("\033[31mERROR\033[m ft_pow(%d, %d)\n", base, pow_val);
					break;
				}
			}
			// printf("--------------------\n");
		}
		if (error == 0)
			printf("\033[32mSUCCESS\033[m ft_pow\n");

		// ======= ft_sum_naturals ========

		printf("========= ft_sum_naturals =====\n");

		error = 0;
		for (i = -30; i < 70000; i++) {
			// printf("%d -> %d\n", i, ft_sum_naturals(i));
			if (ft_sum_naturals(i) != test_sum_naturals(i)) {
				error++;
				printf("\033[31mERROR\033[m ft_sum_naturals with caract %d \n", i);
			}
		}
		if (error == 0)
			printf("\033[32mSUCCESS\033[m ft_sum_naturals\n");

		// ======= ft_factoriel ========

		printf("========= ft_factoriel =====\n");

		for (i = -1; i < 15; i++) {
			printf("facto: %d -> %d\n", i, ft_factoriel(i));
		}
	}

	return (0);
}