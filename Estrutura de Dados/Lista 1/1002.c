#include <stdio.h>

int main(){
    double p = 3.14159;
    double r, a;
    scanf("%lf", &r);
    a = (r*r)*p;
    printf("A=%.4lf\n", a);
    return 0;
}
