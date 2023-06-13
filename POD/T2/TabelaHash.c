/**
 * @file TabelaHash.c
 * @author Luiz_Faccio
 * @version 0.1
 * @date 2023-06-13
 *
 * @copyright Copyright (c) 2023
 *
 * @brief Arquivo template para Questão 02 do trabalho de Pesquisa e Ordenação T2.
 *
 *      Implemente uma tabela hash contendo 13 posições. O índice das chaves
 *  deve ser gerado utilizando a fórmula k mod M, onde k é a chave e M a
 *  quantidade de chaves. Resolva as colisões utilizando uma Lista Encadeada.
 *  Inclua operações de inserção, remoção e busca da chave nesta tabela hash,
 *  informando se a chave foi encontrada ou não.  Atenção: os elementos da
 *  lista encadeada não precisam estar ordenados/em ordem.
 *
 *      Utilize os vetores comentados no código para realizar seus testes.
 *
 * Atenção: Antes de entregar, conferir se dos dados de documentação no início
 * do arquivo estão preenchidos corretamente.
 *
 */

#include <stdio.h>
#include <stdlib.h>


static char ok[] = "Operação bem sucedida";
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

void adicionaVetor(int a[], Chave t[], int s){
    for(int i = 0; i<s; i++){
        adicionaChave(a[i], t);
        printf(" : chave [%d]\n", a[i]);
    }
}

void adicionaChave(int a, Chave t[]){
    
    Chave *aux = malloc(sizeof(Chave));
    aux->proximo = NULL;
    aux->val = a;
    
    if(t[hash(a)].proximo == NULL){
        t[hash(a)].proximo = aux;
        printf(ok, "\n");
        return;
    }
    else{
        for(Chave *i = t[hash(a)].proximo; i!= NULL; i = i->proximo){
            
            if(i->val == a){
                printf("Chave já inserida");
                return;
            }
            
            if(i->proximo == NULL){
                i->proximo = aux;
                printf(ok, "\n");
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
        printf(ok, "\n");
        return;

    }else{

        for(Chave *i = t[hash(a)].proximo; i->proximo != NULL; i = i->proximo){
            if(i->proximo->val == a){
                i->proximo = NULL;
                printf(ok, "\n");
                return;
            }
        }
    }
}

int main(){
    
    Chave TabelaHash[13];
    iniciaTabela(TabelaHash);

    int vet[] = {1, 14, 2, 2};

    adicionaVetor(vet, TabelaHash, 4);

    printf("Encontra 4:\n");
    encontraChave(4, TabelaHash);
    printf("Encontra 1:\n");
    encontraChave(1, TabelaHash);
    printf("Encontra 14:\n");
    encontraChave(14, TabelaHash);
    printf("Encontra 2:\n");
    encontraChave(2, TabelaHash);

}
