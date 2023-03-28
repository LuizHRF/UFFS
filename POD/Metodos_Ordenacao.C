/**
 * @file nome_do_arquivo.c
 * @author Nome_do_Aluno
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


int * bubbleSort(int *A, int size);
// int * selectionSort(int *A, int size);
// int * InsertionSort(int *A, int size);
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
    int *bubble = bubbleSort(vetor, tamanhoVetor);
    printf("\nBubble sort: ");
    for (i = 0 ; i < tamanhoVetor ; i++)
        printf("%d ", bubble[i]);
    printf("\n");

    // selection sort

    // insertion sort

    // merge sort

    // quick sort

    // heap sort

    // counting sort

    // radix sort

    return 0;
}

int * bubbleSort(int *A, int size){
   // implementação do Bubble
    return A;
}

