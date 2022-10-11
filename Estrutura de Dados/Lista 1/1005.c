#include <stdio.h>

int main(){
    double aw = 3.5, bw =7.5, a, b, media;
    scanf("%lf %lf", &a, &b);
    media = ((a*aw)+(b*bw))/(aw+bw);
    printf("MEDIA = %.5lf\n", media);
    return 0;
}
