#include <stdio.h>

int main(){
    int val, count = 1;
    scanf("%d", &val);
    while(count!=(val+1)){
        printf("%d\n", count);
        if(count==(val/2)){
            printf("Metade\n");
        }
        count++;
    }
    return 0;
}
