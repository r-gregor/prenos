#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *url;

int main(int argc, char **argv) {

	int x;
	if (!system(NULL)) {
		return -1;
	}


	char cmd[1024];
	char *ff_cmd = "/usr/bin/firefox";
	// char *url    = "https://stackoverflow.com/questions/308695/how-do-i-concatenate-const-literal-strings-in-c";


	if(argc != 2) {
		/*
		printf("[ERROR] no url as parameter\n");
		return -1;
		*/
		url = "https://stackoverflow.com/questions/308695/how-do-i-concatenate-const-literal-strings-in-c";
	} else {
		url = argv[1];
	}

	strcpy(cmd, "nohup ");
	strcat(cmd, ff_cmd);
	strcat(cmd, " ");
	strcat(cmd, url);
	// strcat(cmd, " >& /dev/null &");
	strcat(cmd, " > /dev/null 2>&1");



	printf("Command: %s\n", cmd);
	getchar();


	// x = system("/c/Users/gregor.redelonghi/majstaf_en/majprogs_en/FireFox_63.0.1/FirefoxPortable.exe https://www.google.com");
	x = system(cmd);

	return 0;
}
