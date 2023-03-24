#include <stdio.h>

int calc(int x){
    if(x==1){
        return 1;
    }
    return x = x+calc(x-1);
}

int main(){
    int i, x;
    scanf("%d", &i);
    x = calc(i);
    printf("Valor final: %d\n", x);
    return 0;
}
