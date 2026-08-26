/*
 * fname: c-string-to-string-view-testing.c
 * from:  C Strings are Terrible! (Tsoding)
 *        https://www.youtube.com/watch?v=y8PLpDgZc0E
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h> // for free()

/* draw line screen width */
#include <sys/ioctl.h>
#include <unistd.h>

/* for isspace */
#include <ctype.h>

/* function and structs initializations */
void begin();
void end();
void sep();
void draw_line_across();

/* for E2 */
typedef struct {
	const char *data;
	size_t count;
} String_View;

void sv_printf_simple(String_View *sv);
void sv_printf(String_View *sv, char *prefix, char border);

void sv_chop_right(String_View *sv);
void sv_chop_left(String_View *sv);
String_View sv(const char *cstr);

void sv_chop_n_right(String_View *sv, size_t n);
void sv_chop_n_left(String_View *sv, size_t n);

void sv_trim_left(String_View *sv);
void sv_trim_right(String_View *sv);

/* main */
int main(int argc, char **argv) {

#if 1
	/* E1 */
	/* classic c-string */
	printf("#########################\n");
	printf("# [E1] classic c-string #\n");
	printf("#########################\n");
	char *s = "Hello, World!";
	printf("printing 's' as string '%%s':\n");
	printf("s = '%s'\n", s);

	sep(); // ---
	printf("printing 's' as integer '%%ld':\n");
	printf("s = '%ld'\n", s);

	sep(); // ---
	printf("'s'is a pointer '%%p':\n");
	printf("s = '%p'\n", s);
	printf("sizeof(s) = %zu\n", sizeof(s));

	sep(); // ---
	printf("dereferenced '*s' as '%%ld':\n");
	printf("*s = '%d' ('%c' is '%d' in ASCII table)\n", *s, *s, *s);
	printf("sizeof(*s) = %zu (dereferenced 'char *' is just a pointer to the first char)\n", sizeof(*s));

	sep(); // ---
	printf("'s' represents just a view of bytes stored somewhere in memory\n");
	printf("    and we can change that view:\n");
	printf("Let's print 's + 1':\n");
	printf("s = '%s'\n", s + 1);
	printf("... which is ideal for chopping off chars from left\n");
	printf("but chopping off from right is not possible with string literals\n");
	printf("as we need to 'change' last char of read-only string litteral to '\\0'\n");
	printf("if we try to set s[strlen(s) - 1] = '\\0', the program will segfault\n");
	printf("as we try to touch memory that we are not supposed to touch\n");
	printf("that is possible if we duplicae the string, but that means allocating new memory\n");
	printf("that need to be freed after use\n");

	sep(); // ---
	printf("duplicating string litteral with: char *sc = strdup(\"Hello, World\");\n");
	char *sc = strdup("Hello, World");
	int n = strlen(sc);
	printf("sc[n-1] = '\\0'\n");
	sc[n-1] = '\0';
	printf("sc = '%s'\n", sc);
	printf("sizeof(*sc) = %zu\n", sizeof(*sc));
	free(sc);
	// sep_big(); // ------------------
	draw_line_across();
#endif


#if 1
	/* E2 */
	/* string-view */
	printf("####################\n");
	printf("# [E2] string-view #\n");
	printf("####################\n");
	printf("c-string is a single pointer to memory address at the beginning of charcter array\n");
	printf("string-view has two integers: 'pointer' at the addres at the beginning of string and 'length'\n");
	printf("it is very easy to convert null-terminated string into string-view because we just ignore the\n");
	printf("'\\0' character without allocating any memory or destroying any data\n\n");
	
	String_View s2 = sv("Hello, World");
	printf("string.view s2 = '%s'\n", s2.data);

	sep(); // ---
	printf("if we want to sv_chop_right, we need to use special printf format string count:\n");
	printf("printf(\".*%%s\"), s2.count, s2.data);\n\n");

	printf("after chopping from right 2 times:\n");
	sv_chop_right(&s2);
	sv_chop_right(&s2);
	printf("s2 = '%.*s'\n\n", s2.count, s2.data);
	
	printf("and after chopping from left 2 times:\n");
	sv_chop_left(&s2);
	sv_chop_left(&s2);
	printf("s2 = '%.*s'\n\n", s2.count, s2.data);

	sep(); // ---
	printf("updated chopp functions to accept number of characters to chopp off\n");
	String_View s3 = sv("Hello, World");
	printf("string.view s3 = '%s'\n", s3.data);
	printf("and after chopping from right 3 times and from left 2 times:\n");
	sv_chop_n_right(&s3, 3);
	sv_chop_n_left(&s3, 2);
	printf("s3 = '%.*s'\n\n", s3.count, s3.data);

	sep(); // ---
	printf("new fucntions to trim off leading or trailing spaces from string-view:\n");
	String_View s4 = sv("      Hello, World      ");
	sv_printf(&s4, "s4 = ", '|');

	printf("after trimming from left:\n");
	sv_trim_left(&s4);
	sv_printf(&s4, "s4 = ", '|');

	printf("and after trimming from right:\n");
	sv_trim_right(&s4);
	sv_printf(&s4, "s4 = ", '|');


#endif

#if 0
/* E3 */

#endif

#if 0
/* E4 */

#endif

#if 0
/* E5 */

#endif

#if 0
/* E6 */

#endif

#if 0
/* E7 */

#endif

#if 0
/* E8 */

#endif

#if 0
/* E9 */

#endif

#if 0
/* E10 */

#endif

	end();
	return 0;

} /* end main */

void begin() {
	printf("[INFO] result:\n\n");
}

void end() {
	printf("\n\n");
	printf("[INFO] end\n---\n");
}

void sep() {
	printf("---\n");
}

void sep_big() {
	printf("------------------\n\n");
}

void draw_line_across() {
	struct winsize w;
	ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);

	// printf ("lines %d\n", w.ws_row);
	// printf ("columns %d\n", w.ws_col);
	for (int i = 0; i < w.ws_col; i++) {
		putchar('-');
	}
	putchar('\n');
}

/* for E2 */

/* convert c-string to String_View sv */
String_View sv(const char *cstr) {
	return (String_View) {
		.data = cstr,
		.count = strlen(cstr),
	};
}

void sv_printf_simple(String_View *sv) {
	printf("%.*s\n", sv->count, sv->data);
}

void sv_printf(String_View *sv, char *prefix, char border) {
	if (border == '0') {
		printf("%s%.*s", prefix, sv->count, sv->data);
	} else {
		printf("%s%c%.*s%c\n", prefix, border, sv->count, sv->data, border);
	}
}

void sv_chop_left(String_View *sv) {
	if (sv->count == 0) return;
	sv->count -= 1;
	sv->data += 1;
}

void sv_chop_right(String_View *sv) {
	if (sv->count == 0) return;
	sv->count -= 1;
}

void sv_chop_n_left(String_View *sv, size_t n) {
	if (n > sv->count) n =sv->count;
	sv->count -= n;
	sv->data += n;
}

void sv_chop_n_right(String_View *sv, size_t n) {
	if (n > sv->count) n =sv->count;
	sv->count -= n;
}

void sv_trim_left(String_View *sv) {
	while (sv->count > 0 && isspace(sv->data[0])) {
		sv_chop_n_left(sv, 1);
	}
}

void sv_trim_right(String_View *sv) {
	while (sv->count > 0 && isspace(sv->data[sv->count-1])) {
		sv_chop_n_right(sv, 1);
	}
}

