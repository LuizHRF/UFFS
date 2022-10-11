#include <stdio.h>

int main(){
    int c1, c2, q1, q2;
    double p1, p2, total;
    scanf("%d %d %lf %d %d %lf", &c1, &q1, &p1, &c2, &q2, &p2);
    total =(q1*p1)+(q2*p2);
    printf("VALOR A PAGAR: R$ %.2lf\n", total);
    return 0;
}
