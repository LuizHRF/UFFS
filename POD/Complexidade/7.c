#include <stdio.h>

int main() {
    int filhos= 0, count = 0, tempf =0;
    float sal= 0, temp = 0;
    while(temp>=0){
        printf("Digite o seu salário: \n");
        scanf("%f", &temp);
        if(temp<0){break;}
        sal = sal +temp;
        printf("Digite o número de filhos: ");
        scanf("%d", &tempf);
        filhos = filhos + tempf;
        count++;
    }
    float ms = sal/count, mf = filhos/count;
    printf("Média Salário: %.2lf\nMédia de filhos: %.0lf\n", ms, mf);
    return 0;
}
    
    
