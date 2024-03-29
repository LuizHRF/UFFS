#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct aviao{
    int id;
    char nome[20];
    struct aviao *proximo;
}Aviao;

typedef struct fila{
    Aviao *primeiro;
    Aviao *ultimo;
}Fila;

void inicializafila(Fila *f){
    f->primeiro = NULL;
    f->ultimo = NULL;
}

void listarfila(Fila *f){
    if(f->primeiro == NULL){printf("Sem aviões na fila\n");}else{
    Aviao *aux = f->primeiro;
    int count = 1;
    printf("Aviões na fila:\n");
    while(aux!=NULL){
        printf("%dº Avião - Id: %d - Nome: %s\n", count, aux->id, aux->nome);
        count+=1;
        aux = aux->proximo;
    }}
}

void adicionaraviao(Fila *f, int id, char nome[]){
    
    Aviao *aux = malloc(sizeof(Aviao));
    aux->id = id;
    strcpy(aux->nome, nome);
    aux->proximo = NULL;
    
    if(f->primeiro==NULL){
        f->primeiro = aux;
        f->ultimo = aux;
    }else{
        f->ultimo->proximo = aux;
        f->ultimo = aux;
    }
}

void decolar(Fila *f){
    Aviao *aux = f->primeiro;
    if(f->primeiro == NULL){printf("Sem aviões na fila\n");}else{
    if(f->primeiro == f->ultimo){
        f->primeiro = NULL;
        f->ultimo == NULL;
        printf("||Ultimo avião da fila decolou!  Avião id: %d\tNome: %s||\n",aux->id, aux->nome);}
    else{
    f->primeiro = f->primeiro->proximo;
    printf("||Avião decolou!  Avião id: %d\tNome: %s||\n",aux->id, aux->nome);
    }
    free(aux);
}}
    

void numeroavioes(Fila *f){
    int count = 1;
    if (f->primeiro ==NULL){count = 0;}
    else{
    Aviao *aux = f->primeiro;
    while(aux->proximo !=NULL){
        count+=1;
        aux=aux->proximo;
    }}
    printf("Há %d aviões na fila\n", count);
}

void infoprimeiro(Fila *f){
    if(f->primeiro == NULL){printf("Sem aviões na fila\n");}else{
    printf("Primeiro Avião - ID:%d - Nome:%s\n", f->primeiro->id, f->primeiro->nome);
}}

int main(){
    Fila pista;
    inicializafila(&pista);
    int x, id; char nome[20];
    printf("Digite\n[0] - Para encerrar o programa\n[1] - Adicionar avião na fila\n[2] - Listar número de aviões na fila\n[3] - Autorizar a decolagem do primeiro avião da fila\n[4] - Listar aviões na fila\n[5] - Ver informações do primeiro avião na fila\n");
    while(x!=0){
        scanf("%d", &x);
        switch(x){
            case 1:
            printf("Digite o id do avião: ");scanf("%d", &id);
            printf("Digite o nome do avião: ");scanf("%s", nome);
            adicionaraviao(&pista, id, nome);
            break;
        case 2:
        numeroavioes(&pista);break;
        
        case 3:
        decolar(&pista);break;
        
        case 4:
        listarfila(&pista);break;
        
        case 5:
        infoprimeiro(&pista); break;
        
        case 0:
        break;
        
        default:
        printf("INVÁLIDO\n");break;
        }
    }
}
