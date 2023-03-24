#include <stdio.h>

int fact(int x){
    if(x==1){
        return 1;
    }
    return x = x*fact(x-1);
}

int main(){
    int i, x;
    scanf("%d", &i);
    x = fact(i);
    printf("Valor final: %d\n", x);
    return 0;
}
