/*
 * fname: start-ff.c
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *url;

int main(int argc, char **argv) {

	// int x;
	/* check if shell is available */
	if (!system(NULL)) {
		return -1;
	}


	char cmd[1024];
	char *ff_cmd = "/usr/bin/firefox";

	if(argc != 2) {
		/*
		printf("[ERROR] no url as parameter\n");
		return -1;
		*/

		/* TEST */
		url = "https://stackoverflow.com/questions/308695/how-do-i-concatenate-const-literal-strings-in-c";
	} else {
		url = argv[1];
	}

	/*
	 * construct command string:
	 * (nohup [command] &) > /dev/null 2>&1
	 */
	strcpy(cmd, "(nohup ");
	strcat(cmd, ff_cmd);
	strcat(cmd, " ");
	strcat(cmd, url);
	strcat(cmd, " &) > /dev/null 2>&1");

	/* TEST */
	printf("Command: %s\n", cmd);
	getchar();

	system(cmd);

	return 0;
}

