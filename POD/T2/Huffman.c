#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Estrutura do Nó da árvore
typedef struct Node {
    char data;
    unsigned frequencia;
    struct Node* left, * right;
}Node;

int charDif(char palavra[]){  //Função para calcular quandos caracteres diferentes existem na palavra
    int k = 0;
    char a;
    for(int l=0; l<strlen(palavra); l++){
        a = palavra[l];
        for(int i = 0; i<strlen(palavra); i++){
            if(palavra[i]==a){
                for(int j=i; j<(strlen(palavra)); j++){
                    palavra[j] = palavra[j+1];
                }
                k++;
            }
        }
    }
    return k-1;
}

Node* criarfloresta(char palavra[]){ //Função para criar floresta ordenada com os caracteres da palavra
    int s = charDif(palavra);

}

int main() {
    char input[100];

    fgets(input, sizeof(input), stdin);
    input[strcspn(input, "\n")] = '\0';  // remove o caractere de nova linha

    Node *floresta[charDif(input)];

    return 0;
}
