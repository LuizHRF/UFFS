#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct funcionario {
    int id;
    char nome[31];
    double salario;
    struct funcionario *proximo;
}; 
typedef struct funcionario Funcionario;

Funcionario *insereNodoInicio(Funcionario *primeiro, int id, char nome[], double salario) {
    Funcionario *aux = malloc (sizeof (Funcionario));
  (*aux).id = id;
  strcpy ((*aux).nome, nome);
  (*aux).salario = salario;
  (*aux).proximo = primeiro;
  primeiro = aux;
  return primeiro;
}

Funcionario *insereNodoFim(Funcionario *primeiro, int id, char nome[], double salario) {
  Funcionario *aux = malloc (sizeof (Funcionario));
  (*aux).id = id;
  strcpy ((*aux).nome, nome);
  (*aux).salario = salario;
  (*aux).proximo = primeiro;
  (*aux).proximo = NULL;
  Funcionario *auxi;
  if(primeiro == NULL){primeiro = aux;}else{ 
  auxi = primeiro;
  while((*auxi).proximo != NULL){auxi = (*auxi).proximo;} 
  (*auxi).proximo = aux;
  }
  return primeiro; //teste
}

Funcionario *deletaNodo(Funcionario *primeiro, int idDelete) {
    Funcionario *aux, *ant;
    if((*primeiro).id == idDelete){aux=primeiro;primeiro=(*aux).proximo;free(aux);return primeiro;} 
    for(aux=primeiro; aux!=NULL; aux = (*aux).proximo){
        if((*aux).id == idDelete){
            (*ant).proximo = (*aux).proximo;
            free(aux);
            return primeiro;
        }
        ant = aux;
    }
}

void imprimeLista(Funcionario *primeiro) {
    Funcionario *aux;
    if(primeiro == NULL){printf("Nada na Lista\n");}
    for(aux=primeiro; aux!=NULL; aux = (*aux).proximo){
      printf("ID: %d\t||Nome: %s\t||Salário: R$%.2lf\n", (*aux).id, (*aux).nome, (*aux).salario);
}}

void imprimeAoContrario(Funcionario *aux) {
    if(aux == NULL){return;}
    imprimeAoContrario((*aux).proximo);
    printf("ID: %d\t||Nome: %s\t||Salário: R$%.2lf\n", (*aux).id, (*aux).nome, (*aux).salario);
}

int contaNodos(Funcionario *primeiro) {
    int count = 0;
    Funcionario *aux = primeiro;
    while(aux!=NULL){
        count+=1;
        aux = (*aux).proximo;
    }
    return count;
}

Funcionario* destroiLista(Funcionario *primeiro) {  //REMOVE INFORMAÇÕES MAS A LISTA AINDA EXISTE
    Funcionario *aux;
    while(primeiro!=NULL){
        aux = primeiro;
        primeiro = (*primeiro).proximo;
        free(aux);
    }
    return primeiro;
}

int main() {
    //Criando lista vazia
    Funcionario *primeiro = NULL;

    int tid;
    double salario;
    char nome[30];

    int x = 1, idDel;
    while(x!=0){
    printf("[1] - Adicionar funcionário no início da lista\n[2] - Adicionar funcionário no fim da lista\n[3] - Imprimir lista\n[4] - Imprimir ao contrário\n[5] - Remover pelo ID\n[6] - Destruir lista\n[7] - Conta nodos\n[0] - Ecerrar\n");
    scanf("%d", &x);
    
    if(x==1){ //Nodo no início
        printf("Digite o ID, Nome e Salário do funcinário\n"); scanf("%d %s %lf", &tid, nome, &salario);
        primeiro = insereNodoInicio(primeiro, tid, nome, salario);}  
    
    else if (x==2){ //Nodo no final
         printf("Digite o ID, Nome e Salário do funcinário\n"); scanf("%d %s %lf", &tid, nome, &salario);
        primeiro = insereNodoFim(primeiro, tid, nome, salario);}  

    else if(x==3){imprimeLista(primeiro);}  //Imprimir lista

    else if(x==4){imprimeAoContrario(primeiro);}

    else if(x==5){ //Deletar pelo ID
        printf("Id para excluir\n");scanf("%d", &idDel);
        primeiro = deletaNodo(primeiro, idDel);
    }  
    
    else if(x==7){printf("Nodos totais: %d\n", contaNodos(primeiro));}  //Contar nodos

    else if(x==6){primeiro = destroiLista(primeiro);}
    }
    return 0;
}
