/**
 * @file Metodos_Ordenacao.c
 * @author Luiz_Faccio
 * @version 0.3
 * @date 2023-03-30
 *
 * @copyright Copyright (c) 2023
 *
 *
 * @brief Arquivo template para trabalho de Pesquisa e Ordenação.
 *
 *      Cada estudante deve implementar as funções conforme as assinaturas
 * abaixo e realizar as impressões dos vetores após a ordenação. Desta forma,
 * o(a) estudante deve implementar o trecho de código para impressão dos vetores
 * ordenados dentro da função `main` conforme o exemplo do Bubble Sort abaixo.
 *
 * Se necessário, declare e implemente funções auxiliares para realizar as
 * ordenações.
 *
 * Importante:Não altere as assinaturas dos métodos de ordenação!
 *
 * Caso o vetor não possa ser ordenado por algum método, imprima uma mensagem de
 * aviso e o vetor original.
 *
 * Atenção: Antes de entregar, conferir se dos dados de documentação no início
 * do arquivo estão preenchidos corretamente.
 *
 */
#include <stdio.h>
#include <stdbool.h>

void troca(int *x, int *y);
void copia(int *A, int *v, int size);
void bubbleSort(int *A, int size);
void selectionSort(int *A, int size);
void insertionSort(int *A, int size);
void mergeSort(int *A, int size);
// void quickSort(int *A, int size);
// void heapSort(int *A, int size);
// void countingSort(int *A, int size);
// void radixSort(int *A, int size);


int main(){

    int i;
    int vetor[] = {1, 22, -10, 38, 5, 7};
    int tamanhoVetor = (int)sizeof(vetor)/sizeof(int);

    printf("\nVetor original: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", vetor[i]);

    printf("\nVetor tamanho = %d\n", tamanhoVetor);

    /*// bubble sort
    int bubbleVec[tamanhoVetor];
    copia(vetor, bubbleVec, tamanhoVetor);
    bubbleSort(bubbleVec, tamanhoVetor);
    printf("\nBubble sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", bubbleVec[i]);
    printf("\n");

    // selection sort
    int selectionVec[tamanhoVetnBubbleor];
    copia(vetor, selectionVec, tamanhoVetor);
    selectionSort(selectionVec, tamanhoVetor);
    printf("\nSelection sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", selectionVec[i]);
    printf("\n");

    // insertion sort
    int insertionVec[tamanhoVetor];
    copia(vetor, insertionVec, tamanhoVetor);
    insertionSort(insertionVec, tamanhoVetor);
    printf("\nInsertion sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", insertionVec[i]);
    printf("\n");*/

    // merge sort
    int mergeVec[tamanhoVetor];
    copia(vetor, mergeVec, tamanhoVetor);
    mergeSort(mergeVec, tamanhoVetor);
    printf("\nMerge sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", mergeVec[i]);
    printf("\n");

    // quick sort

    // heap sort

    // counting sort

    // radix sort

    return 0;
}

void troca(int *x, int *y){
    int aux = *x;
    *x = *y;
    *y = aux;
}

void copia(int *A, int *V, int size){
    int i;
    for (i = 0 ; i < size ; i++)
        V[i] = A[i];
}

void bubbleSort(int *A, int size){
    bool flag;
    for(int i=size-1; i>0; i--){
        flag = false;

        for(int j=0; j<i; j++){

            if(A[j]>A[j+1]){
                troca(&A[j], &A[j+1]);
                flag = true;
            }

        }
        if(flag==false){
            return;
        }
    }
    return;
}

void selectionSort(int *A, int size){
    int *min;
    for(int i=0; i<size-1; i++){
        min = &A[i];
        for(int j=i+1; j<size; j++){
            if(A[j]<*min){
                min = &A[j];
            }
        }
        troca(&A[i], min);
    }
    
    return;
}

void insertionSort(int *A, int size){
    for(int i=1; i<size;i++){
        int p = A[i];
        int j = i;
        while(p<A[j-1]&&j>0){
            A[j] = A[j-1];
            j--;
        }
        A[j] = p;
    }   
    return;
}

void merge(int *A, int inicio, int fim){
    if(inicio<fim){
        int meio = (fim-inicio)/2;
        merge(A, inicio, meio);
        merge(A, meio+1, fim);
        intercala(A, inicio, fim);
    }
}

void intercala(int *A, int inicio, int fim){
    int meio = (fim-inicio)/2;
    int *aux = malloc(sizeof(int[fim-inicio+1]));
    int i = inicio, j =meio+1, k =0;

    while(i<=meio && j<=fim){
        if(A[i] <= A[j]){
            aux[k] = A[i];
            i++;
        }
        else{
            aux[k] = A[j];
            j++;
        }
        k++;
    }

    while(i<=meio){
        aux[k] = A[i];
        i++;
        k++;
    }

    while(j<=fim){
        aux[k] = A[j];
        j++;
        k++;
    }

    for(k=inicio; k<=fim; k++){
        A[k] = aux[k-inicio];
    }

    free(aux);
}


void mergeSort(int *A, int size){
    merge(A, 0, size-1);
}
