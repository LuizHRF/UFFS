#include <stdio.h>
#include <string.h>


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


int main()
{
    FILE *fp = fopen("entrada.txt", "rw");
    
    FILE *fteste[3] = {fopen("Mem1.txt", "w"), fopen("Mem2.txt", "w"), fopen("Mem3.txt", "w")};
    
    int aux[5], i = 0;
    
    while(!feof(fp)){
        for(int j=0; j<5 && !feof(fp); j++){
            fscanf(fp, "%d", &aux[j]);
        }
        if(feof(fp)){break;}
        insertionSort(aux, 5);
        fprintf(fteste[i], "%d %d %d %d %d", aux[0], aux[1], aux[2], aux[3], aux[4]);
        i++;
        if(i==3){i=0;}
    }
    insertionSort(aux, i);
    for(int m=0; m<i; m++){
        fprintf(fteste[i], "%d", aux[m]);
    }
    
    return 0;
}
