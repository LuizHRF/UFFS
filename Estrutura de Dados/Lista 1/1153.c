#include <stdio.h>

int fact(int x){
    if(x==0){return 1;}
    x*=fact(x-1);
    return x;
}

int main(){
    int x;
    scanf("%d", &x);
    x = fact(x);
    printf("%d\n", x);
    return 0;
}
