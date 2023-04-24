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
#include <stdlib.h>

void troca(int *x, int *y);
void copia(int *A, int *v, int size);
void bubbleSort(int *A, int size);
void selectionSort(int *A, int size);
void insertionSort(int *A, int size);
void mergeSort(int *A, int size);
void quickSort(int *A, int size);
void heapSort(int *A, int size);
void countingSort(int *A, int size);
// void radixSort(int *A, int size);


int main(){

    int i;
    int vetor[] = { 22, 211, 38, 80, 212, 90, 99, 190, 0, -1, -2, -182727};
    int tamanhoVetor = (int)sizeof(vetor)/sizeof(int);

    printf("\nVetor original: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", vetor[i]);

    printf("\nVetor tamanho = %d\n", tamanhoVetor);

    // bubble sort
    int bubbleVec[tamanhoVetor];
    copia(vetor, bubbleVec, tamanhoVetor);
    bubbleSort(bubbleVec, tamanhoVetor);
    printf("\nBubble sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", bubbleVec[i]);
    printf("\n");

    //selection sort
    int selectionVec[tamanhoVetor];
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
    printf("\n");

    // merge sort
    int mergeVec[tamanhoVetor];
    copia(vetor, mergeVec, tamanhoVetor);
    mergeSort(mergeVec, tamanhoVetor);
    printf("\nMerge sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", mergeVec[i]);
    printf("\n");

    // quick sort
    int quickVec[tamanhoVetor];
    copia(vetor, quickVec, tamanhoVetor);
    quickSort(quickVec, tamanhoVetor);
    printf("\nQuick sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", quickVec[i]);
    printf("\n");

    // heap sort
    int heapVec[tamanhoVetor];
    copia(vetor, heapVec, tamanhoVetor);
    heapSort(heapVec, tamanhoVetor);
    printf("\nHeap sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", heapVec[i]);
    printf("\n");
    
    // counting sort
    int countVec[tamanhoVetor];
    copia(vetor, countVec, tamanhoVetor);
    countingSort(countVec, tamanhoVetor);
    printf("\nCounting sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", countVec[i]);
    printf("\n");

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

void intercala(int *A, int inicio, int fim){
    int meio = (fim+inicio)/2;
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

void merge(int *A, int inicio, int fim){
    if(inicio<fim){
        int meio = (fim+inicio)/2;
        merge(A, inicio, meio);
        merge(A, meio+1, fim);
        intercala(A, inicio, fim);
    }
}

void mergeSort(int *A, int size){
    merge(A, 0, size-1);
}

int particiona(int *A, int inicio, int fim){
    int p = fim;
    int k = inicio;
    for(int i = inicio; i<fim; i++){
        if(A[i]<=A[p]){
            troca(&A[i], &A[k]);
            k++;
        }
    }
    int aux = A[p];
    if(A[k]>A[p]){
        troca(&A[k], &A[p]);
    }
    for(int i=0; i<=p; i++){
        if(A[i]==aux){
            aux = i;
            break;
        }
    }
    return aux;
}

void quick(int *A, int inicio, int fim){
    if(inicio<fim){
        int p = particiona(A, inicio, fim);
        quick(A, inicio, p-1);
        quick(A, p+1, fim);
    }
}

void quickSort(int *A, int size){
    quick(A, 0, size-1);
}

void criaHeap(int A[], int i, int n){
    int maior = i;
    int left = (i*2)+1;
    int right = (i*2)+2;
    
    if(left<n&&A[left]>A[i]){
        maior = left;
    }
    if(right<n&&A[right]>A[maior]){
        maior = right;
    }
    
    if(maior!=i){
        troca(&A[i], &A[maior]);
        criaHeap(A, maior, n);
    }
}

void heapSort(int *A, int size){
    for(int k=(size/2)-1; k>=0; k--){
        criaHeap(A, k, size);   
    }
    
    for(int k = size-1; k>0; k--){
        troca(&A[0], &A[k]);
        criaHeap(A, 0, k);
    }
}

void countingSort(int *A, int size){
    int k = A[0];
    for(int j = 1; j<size; j++){
        if(A[j]>k){
            k = A[j];
        }
        if(A[j]<0){
            printf("\nNão é possível ordenar números negativos com counting sort:");
            return;
        }
    }
    int count[k+1];
    int aux[size];
    
    for(int i=0;i<=k; i++){
        count[i]=0;
    }
    
    for(int i=0; i<size; i++){
        count[A[i]]++;
    }
    
    for(int i = 1; i<=k; i++){
        count[i]+=count[i-1];
    }
    
    for(int i=size-1;i>=0;i--){
        count[A[i]] = count[A[i]]-1;
        aux[count[A[i]]] = A[i];
    }
    
    for(int i=0; i<size; i++){
        A[i] = aux[i];
    }
}
