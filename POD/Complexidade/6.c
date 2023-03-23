#include <stdio.h>

int main() {
    int op = 1, count = 0, counttot = 0;
    while(op>0){
        scanf("%d",&op);
        if(op==0){break;}
        if(op>=10&&op<=20){
            count++;
        }
        counttot++;
    }
    float total = ((float)count/counttot)*100;
    printf("Porcentagem final: %.2f\n", total);
    return 0;
}
