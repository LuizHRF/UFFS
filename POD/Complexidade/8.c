#include <stdio.h>

int main() {
    int A =150, C=110, count = 0;
    while(A!=C){
        A+=2;
        C+=3;
        count++;
    }
    printf("Anos nescessários: %d", count);
    return 0;
}
    
    
