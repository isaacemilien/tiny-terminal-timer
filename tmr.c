#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>

int main(int argc, char* argv[]){

	int duration = atoi(argv[1]) * 60;
	
	for(int i = duration; i > 0; i--){
		printf("\033[2J\033[H");
		fflush(stdout);
		
		int seconds = i % 60;
		int minutes = (i - seconds) / 60; 

		printf("%dm %ds", minutes, seconds);
		fflush(stdout);

		sleep(1);
	}

	return 0;
}
