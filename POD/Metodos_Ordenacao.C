
/**
 * @file nome_do_arquivo.c
 * @author Luiz_Faccio
 * @version 0.1
 * @date 2023-03-28
 *
 * @copyright Copyright (c) 2023
 *
 *
 * @brief Arquivo template para trabalho de Pesquisa e Ordenação.
 *
 *      Cada estudante deve implementar as funções conforme as assinaturas
 * abaixo e realizar as impressões dos vetores após a ordenação. Após, o(a)
 * estudante deve implementar o trecho de código para impressão dos vetores
 * ordenados dentro da função `main` conforme o exemplo do Bubble Sort abaixo.
 *
 * Atenção: Antes de entregar, conferir se dos dados acima da documentação estão
 * preenchidos corretamente.
 *
 */
 
#include <stdio.h>
#include <stdbool.h>

void troca(int *x, int *y){
    int aux = *x;
    *x = *y;
    *y = aux;
}

//int * bubbleSort(int *A, int size);
int * bubbleSort(int *A, int size){
   
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
            return A;
        }
    }

    return A;
}

// int * selectionSort(int *A, int size);
int* selectionSort(int *A, int size){
    int *min;
    for(int i=0; i<size-1; i++){
        min = &A[i];
        for(int j=i+1; j<size-1; j++){
            if(A[j]<*min){
                min = &A[j];
            }
        }
        troca(&A[i], min);
    }
    
    return A;
}

// int * InsertionSort(int *A, int size);
int* InsertionSort(int *A, int size){
    for(int i=1; i<size;i++){
        int p = A[i];
        int j = i;
        while(p<A[j-1]&&j>0){
            A[j] = A[j-1];
            j--;
        }
        A[j] = p;
    }   
    return A;
}

// int * mergeSort(int *A, int size);
// int * quickSort(int *A, int size);
// int * heapSort(int *A, int size);
// int * countingSort(int *A, int size);
// int * radixSort(int *A, int size);


int main(){

    int i;
    int vetor[] = {1, 20, -10, 30, 5, 7};
    int tamanhoVetor = (int)sizeof(vetor)/sizeof(int);

    printf("Vetor tamanho = %d\n", tamanhoVetor);

    // bubble sort
    //int *bubble = bubbleSort(vetor, tamanhoVetor);
    //printf("\nBubble sort: ");
    //for (i = 0 ; i < tamanhoVetor ; i++)
    //     printf("%d ", bubble[i]);
    //printf("\n");
    


    // selection sort
    //int *selection = selectionSort(vetor, tamanhoVetor);
    //printf("\nSelection sort: ");
    //for (i = 0 ; i < tamanhoVetor ; i++)
    //    printf("%d ", selection[i]);
    //printf("\n");

    // insertion sort
    int *insertion = InsertionSort(vetor, tamanhoVetor);
    printf("\nSelection sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", insertion[i]);
    printf("\n");

    // merge sort

    // quick sort

    // heap sort

    // counting sort

    // radix sort

    return 0;
}

