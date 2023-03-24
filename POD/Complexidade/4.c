#include <stdio.h>

int main(){
    char op = 'o';
    int v1, v2, r;
    
    while(op!='@'){
    printf("Digite a operação: ");
    scanf(" %c", &op);
    if(op=='@'){break;}
    printf("Digite os valores: ");
    scanf("%d %d",&v1, &v2);

    switch (op)
    {
    case '*':
        r = v1*v2;
        printf("Resultado: %d\n", r);
        break;
    
    case '/':
        r=v1/v2;
        printf("Resultado: %d\n", r);
        break;

    case '+':
        r = v1+v2;
        printf("Resultado: %d\n", r);
        break;
    
    case '-':
        r=v1-v2;
        printf("Resultado: %d\n", r);
        break;
    
    case '@':
        break;
    default:
        printf("Valor inválido\n");
        break;
    }
    }
    
}
