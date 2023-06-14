#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

// Estrutura do Nó da árvore
typedef struct Node {
    char data;
    unsigned frequencia;
    struct Node* left, * right;
}Node;

int charDif(char entrada[], int s){  //Função para calcular quandos caracteres diferentes existem na palavra
    int k = 0;
    char a;
    char palavra[s];
    strcpy(palavra, entrada); //copia a palavra original pois o metodo vai retirando letra por letra
    
    for(int l=0; l<s; l++){
        a = palavra[0]; //Analiza smp a primira letra da palavra->
        if(a=='\0'){break;}
        k++;
        
        for(int i = 0; i<(int)strlen(palavra); i++){
            
            if(palavra[i]==a){ //->Compara com as outras letras e se for igual->
                
                for(int j=i; j<(int)strlen(palavra); j++){
                    palavra[j] = palavra[j+1]; //->Puxa todos os caracteres para trás (removendo aquele caractere)
                }
                i--;
            }
        }
    }
    return k;
}

void criarfloresta(Node *floresta[], char palavra[], int carac){ //Função para criar floresta ordenada com os caracteres da palavra

    char a;
    int count = 0;
    
    for(int k=0; k<=carac; k++){
        a=palavra[0]; //Analiza smp a primeira letra, seguindo a logica da contagem de caracteres diferentes
        count = 0;
        Node *aux = malloc(sizeof(Node)); // Aloca memoria para um novo nodo da floresta;
        aux->data = a;
        aux->left = NULL;
        aux->right = NULL;
        
        for(int i=0; i<(int)strlen(palavra); i++){
            
            if(palavra[i]==a){
                
                for(int m=i; m<(int)strlen(palavra);m++){
                    palavra[m] = palavra[m+1];    //Remove carcatere à caractere adicionando ele à um nodo na floresta
                }                               //Se o caractere for repetido, apenas aumenta a frequencia;
                i--;
                count++;
            }
        }
        aux->frequencia = count;
        floresta[k] = aux;
    }
}

void troca(Node *x, Node *y){
    
    
    Node aux = *x;
    *x = *y;
    *y = aux;
}

void bubbleSortFloresta(Node *A[], int size){ //Função para ordenar em ordem crescente os nodos da floresta
    bool flag;
    for(int i=size-1; i>0; i--){
        flag = false;

        for(int j=0; j<i; j++){
            if(A[j]->frequencia > A[j+1]->frequencia){
                troca(A[j], A[j+1]);
                flag = true;
            }
        }
        if(flag==false){
            return;
        }
    }
    return;
}

Node *unirFloresta(Node *floresta[], int size){
    
    if(size!=1){

        Node *aux = malloc(sizeof(Node)); 
        aux->frequencia = floresta[0]->frequencia + floresta[1]->frequencia; 
        aux->left = floresta[0];
        aux->right = floresta[1];

        floresta[1] = aux;

            for(int i=0;i<size-1; i++){
                floresta[i] = floresta[i+1];
            }
            floresta[size] = NULL;

        bubbleSortFloresta(floresta, size-1); 
        return unirFloresta(floresta, size-1);

    }else{
        return floresta[0];
    }
    printf("Deu erro na união\n");
    return NULL;
}

void printhuff(Node *huffman){
    if(huffman == NULL){
        return;
    }else{
        printhuff(huffman->right);
        printf("Caractere: %c | Frequência: %d\n", huffman->data, huffman->frequencia);
        printhuff(huffman->left);
    }
}

void Codificar_Huffman(char input[]){
    int caracteres_diferentes = charDif(input, (int)strlen(input));

    printf("Palavra: %s, Caracteres diferentes: %d\n", input, caracteres_diferentes);

    printf("Criando floresta\n");
    Node *floresta[caracteres_diferentes];
    criarfloresta(floresta, input, caracteres_diferentes);

    printf("Imprimindo\n");
    for(int i=0; i<caracteres_diferentes; i++){
        printf("Letra %c | Frequência: %d\n", floresta[i]->data, floresta[i]->frequencia);
    }
    printf("AGORA ORDENADO: \n");
    bubbleSortFloresta(floresta, caracteres_diferentes);
    for(int i=0; i<caracteres_diferentes; i++){
        printf("Letra %c | Frequência: %d\n", floresta[i]->data, floresta[i]->frequencia);
    }

    Node *Huffman = unirFloresta(floresta, caracteres_diferentes);
    printhuff(Huffman);
}

int main() {
    char input[100];

    fgets(input, sizeof(input), stdin);
    input[strcspn(input, "\n")] = '\0';  // remove o caractere de nova linha

    Codificar_Huffman(input);
    
    return 0;
}
