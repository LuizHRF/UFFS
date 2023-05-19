#include <stdio.h>
#include <stdlib.h>


static char ok[] = "Operação bem sucedida\n";
static char nf[] = "Chave não encontrada\n";

typedef struct chave{
    int val;
    struct chave *proximo;
} Chave;


void iniciaTabela(Chave c[]){
    for(int i =0; i<13; i++){
        c[i].proximo = NULL;
    }
}

int hash(int a){
    return a%13;
}


void adicionaChave(int a, Chave t[]){
    
    Chave *aux = malloc(sizeof(Chave));
    aux->proximo = NULL;
    aux->val = a;
    
    if(t[hash(a)].proximo == NULL){
        t[hash(a)].proximo = aux;
        printf(ok);
        return;
    }
    else{
        for(Chave *i = t[hash(a)].proximo; i!= NULL; i = i->proximo){
            
            if(i->val == a){
                printf("Chave já inserida\n");
                return;
            }
            
            if(i->proximo == NULL){
                i->proximo = aux;
                printf(ok);
                return;
            }
        }
    }

    printf("Erro\n");
    return;
}

void *encontraChave(int a, Chave t[]){
    for(Chave *i = t[hash(a)].proximo; i != NULL; i = i->proximo){
        if(i->val == a){
            printf("Chave encontrada \n");
            return;
        }
    }
    printf(nf);
}

void removeChave(int a, Chave t[]){

    if(t[hash(a)].proximo->val == a){
        t[hash(a)].proximo = NULL;
        printf(ok);
        return;

    }else{

        for(Chave *i = t[hash(a)].proximo; i->proximo != NULL; i = i->proximo){
            if(i->proximo->val == a){
                i->proximo = NULL;
                printf(ok);
                return;
            }
        }
    }
}

int main(){
    
    Chave TabelaHash[13];
    iniciaTabela(TabelaHash);

    printf("Primeira chave:\n");
    adicionaChave(1, TabelaHash);
    printf("Segunda chave:\n");
    adicionaChave(14, TabelaHash);
    printf("Terceira chave:\n");
    adicionaChave(2, TabelaHash);
    printf("Quarta chave:\n");
    adicionaChave(2, TabelaHash);

    printf("Encontra 4:\n");
    encontraChave(4, TabelaHash);
    printf("Encontra 1:\n");
    encontraChave(1, TabelaHash);
    printf("Encontra 14:\n");
    encontraChave(14, TabelaHash);
    printf("Encontra 2:\n");
    encontraChave(2, TabelaHash);

}
