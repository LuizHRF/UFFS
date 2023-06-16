#include <stdio.h>
#include <string.h>

//ORDENAÇÃO EXTERNA INCLOMPLETA 

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
    
    FILE *fteste[3] = {fopen("Mem1.txt", "a"), fopen("Mem2.txt", "a"), fopen("Mem3.txt", "a")};
    
    int aux[5], i = 0;
    int c = 0;
    
    while(!feof(fp)){
        c = 0;
        
        for(int j=0; j<5; j++){
            fscanf(fp, "%d ", &aux[j]);
            c++;
            if(feof(fp)){break;}
        }
        
        if(feof(fp)){break;}
        
        insertionSort(aux, 5);
        
        fprintf(fteste[i], "%d %d %d %d %d ", aux[0], aux[1], aux[2], aux[3], aux[4]);
        
        i++;
        if(i==3){i=0;}
    }
    printf("valor de c: %d\n", c);
    for(int m=0; m<c; m++){
        printf("valor de aux antes da ord: %d\n", aux[m]);
    }
    insertionSort(aux, c);
    for(int m=0; m<c; m++){
        printf("valor de aux depois da ord: %d\n", aux[m]);
    }
    for(int m=0; m<c; m++){
        fprintf(fteste[i], " %d", aux[m]);
    }
    
    return 0;
}
