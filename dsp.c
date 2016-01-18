#include "dsp.h"
#include "myMath.h"

int dsp_correlation(int* signal_a, int* signal_b, int signal_length){
	int accu = 0;
	int product;
	for(int k = 0; k < signal_length; k++){
		product = my_mult(signal_a[k],signal_b[k]);
		accu = my_add(product, accu);
	}
	return accu;
}
