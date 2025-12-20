#include<stdio.h>
#include<unistd.h>

int main(int argc, char* argv[]){

	int time = *argv[1] - '0';
	
	for(int i = time; i > 0; i--){
		printf("%ds\n", i);
		sleep(1);
	}

	return 0;
}
