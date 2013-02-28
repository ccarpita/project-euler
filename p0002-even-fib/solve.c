/* Calculate sum of all fibonacci numbers
 * less than 4 million
 */

#include <stdio.h>

void main() {
    long int max = 4000000;
    long int sum = 0;
    long int left = 1;
    long int right = 2;
    long int ans = 0;
    while (left < 4000000) {
        if (right % 2 == 0) {
            sum += right;
        }
        ans = left + right;
        left = right;
        right = ans;
    }
    printf("sum: %i\n", sum);
}

