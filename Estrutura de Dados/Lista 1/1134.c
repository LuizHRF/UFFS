#include <stdio.h>

int main(){
    int x = 0, gas=0, alc=0, dis=0;
    while(1){
        scanf("%d", &x);
        if(x==1){alc+=1;}
        else if(x==2){gas+=1;}
        else if(x==3){dis+=1;}
        else if(x==4){break;}
        else {continue;}
    }
    printf("MUITO OBRIGADO\nAlcool: %d\nGasolina: %d\nDiesel: %d\n", alc, gas, dis);
    return 0;
}
