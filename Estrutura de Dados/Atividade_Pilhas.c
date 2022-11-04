#include <stdio.h>
#include <stdlib.h>

typedef struct elem{
    char cha;
    struct elem *proximo;
}Elem;

typedef struct pilha{
    Elem *topo;
}Pilha;

int main(){
    Pilha *pilha = malloc(sizeof(Pilha));
    pilha->topo = NULL;
    printf("teste");
    char c;
    
    printf("Digite 's' para finalizar as inserções");
    while(c!='s'){
    
    scanf("%c",&c);
    if(c=='('||c=='{'||c=='['){
        Elem *aux = malloc(sizeof(Elem));
        aux->cha = c;
        aux->proximo = pilha->topo;
        pilha->topo=aux;
    }
    else if(c==')' && pilha->topo->cha=='('){
        Elem *aux;
        aux= pilha->topo;
        pilha->topo=pilha->topo->proximo;
        free(aux);
    }
    
    else if(c=='}' && pilha->topo->cha =='{'){
        Elem *aux;
        aux= pilha->topo;
        pilha->topo=pilha->topo->proximo;
        free(aux);
    }
    else if(c==']' && pilha->topo->cha =='['){
        Elem *aux;
        aux= pilha->topo;
        pilha->topo=pilha->topo->proximo;
        free(aux);
    }
    }
    if(pilha->topo==NULL){
        printf("Sucesso");
    }else{printf("Falha");
    }
    return 0;

}
