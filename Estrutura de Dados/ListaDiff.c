#include <stdio.h>
#include <stdlib.h>

typedef struct Tlist{
    int valor;
    struct Tlist *next;
}List;

int isIn(List *l, int n){
    for(List *aux=l; aux!=NULL; aux = aux->next){
        if(aux->valor == n){

            return 1;
        }
    }
    return 0;
}

void printLista(List *l){
    
    for(List *aux = l; aux!=NULL;aux = aux->next){
        printf("%d\n", aux->valor);
    }
}

List* inserir(List *l, int n){
    List *aux = malloc(sizeof(List));
    aux->valor =n;
    aux->next = NULL;
    
    if(l==NULL){
        return aux;
    }else{
        for(List *aux2=l; aux2!=NULL; aux2 = aux2->next){
            if(aux2->next == NULL){
                aux2->next = aux;
                break;
            }
        }
        return l;
    }
}

List* getDiff(List *l1, List *l2){
    
    List *differenca = NULL;
    
    for(List *aux=l1; aux!=NULL; aux=aux->next){
        if(isIn(l2, aux->valor)){
            continue;
        }
        
        differenca = inserir(differenca, aux->valor);

    }
    return differenca;
}

int main()
{
    List *lista1=NULL;
    List *lista2=NULL;
    List *listaf = NULL;
    lista1 = inserir(lista1, 1);
    lista1 = inserir(lista1, 2);
    lista1 = inserir(lista1, 3);
    lista1 = inserir(lista1, 4);
    //printLista(lista1);
    
    lista2 = inserir(lista2, 1);
    lista2 = inserir(lista2, 2);
    lista2 = inserir(lista2, 5);
    lista2 = inserir(lista2, 6);
    //printLista(lista2);
    
    listaf = getDiff(lista1, lista2);
    printLista(listaf);
    
    return 0;
}
