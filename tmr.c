#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<sys/ioctl.h>

int main(int argc, char* argv[]){

	struct winsize w;
	ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);

	int width = (w.ws_col - 6) / 2;
	int height = w.ws_row / 2;
	
	int duration = atoi(argv[1]) * 60;
	
	for(int i = duration; i > 0; i--){

		printf("\033[2J\033[H");
		fflush(stdout);
		
		for(int i = 0; i < height; i++){
			putchar('\n');
		}
		
		for(int i = 0; i < width; i++){
			putchar(' ');
		}

		int seconds = i % 60;
		int minutes = (i - seconds) / 60; 

		printf("%dm %ds", minutes, seconds);
		fflush(stdout);

		sleep(1);
	}

	return 0;
}
