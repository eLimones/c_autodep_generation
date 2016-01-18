#include <stdio.h>
#include "dsp.h"

int main(){
	int signal_a[3] = {1,2,3};
	int signal_b[3] = {1,-2,3};
	printf("correlation = %d\n", dsp_correlation(signal_a, signal_b, 3));
	return 0;
}
