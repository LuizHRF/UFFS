#include <stdio.h>
#include <stdbool.h>


void troca(int *x, int *y){
    int aux = *x;
    *x = *y;
    *y = aux;
}

int* bubblesort(int v[], int len){
    
    bool flag;

    for(int i=len-1; i>0; i--){
        flag = false;

        for(int j=0; j<i; j++){

            if(v[j]>v[j+1]){
                troca(&v[j], &v[j+1]);
                flag = true;
            }

        }

        if(flag==false){
            return v;
        }
    }
    return v;
}

int main(){
    int v[] = {7, 10, -5, 8, 20, 100, 0};
    int len = sizeof(v)/sizeof(int);

    int *bubble = bubblesort(v, len);

    for(int i=0; i<len; i++){
        printf("%d ", bubble[i]);
    }
    printf("\n");

    return 0;
}
