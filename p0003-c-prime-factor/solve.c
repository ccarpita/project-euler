#include <stdio.h>

/* determine the maximum prime factor of a large number */

void main() {
    
    long long int factor = 600851475143;
    long long int max = 0;
    long long int i = 1;
    long long int bound = factor;

    for (i = 2; i < bound; i++) {
        if (factor % i == 0 && is_prime(i)) {
            max = i;
            printf("found: %i\n", max);
            bound = 1 + bound / i;
        }
    }

    printf("max factor: %i\n", max);
}

int is_prime(int i) {
    int j = 2;
    int isp = 1;
    while (j < i) {
        if (i % j == 0) { 
            isp = 0;
            break; 
        }
        j++;
    } 
    return isp;
}
