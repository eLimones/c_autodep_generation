#include <stdio.h>

int my_add(int a, int b){
	return a + b;
}

int my_mult(int a, int b){
	return a * b;
}

int dsp_correlation(int* signal_a, int* signal_b, int signal_length){
	int accu = 0;
	int product;
	for(int k = 0; k < signal_length; k++){
		product = my_mult(signal_a[k],signal_b[k]);
		accu = my_add(product, accu);
	}
	return accu;
}

int main(){
	int signal_a[3] = {1,2,3};
	int signal_b[3] = {1,-2,3};
	printf("correlation = %d\n", dsp_correlation(signal_a, signal_b, 3));
	return 0;
}
