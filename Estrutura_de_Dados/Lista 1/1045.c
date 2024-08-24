#include <stdio.h>

int main(){
    double arr[3], s, a, b, c;
    scanf("%lf %lf %lf", &arr[0], &arr[1], &arr[2]);
    for(int i=0; i<3; i++){
        for(int j = 0; j<2; j++){
            if(arr[i]>arr[j]){
                s = arr[i]; arr[i] = arr[j]; arr[j] = s;
            }
        }       
    }
    a = arr[0]; b = arr[1]; c = arr[2];
    //printf("%lf %lf %lf", a, b, c);
    if(a>=(b+c)){printf("NAO FORMA TRIANGULO\n");}else{
    if((a*a)==((b*b)+(c*c))){printf("TRIANGULO RETANGULO\n");}
    if((a*a)>((b*b)+(c*c))){printf("TRIANGULO OBTUSANGULO\n");}
    if((a*a)<((b*b)+(c*c))){printf("TRIANGULO ACUTANGULO\n");}
    if(a==b && b==c){printf("TRIANGULO EQUILATERO\n");}
    if((a==b&& b!=c)||(b==c&&c!=a)||(a==c&&c!=b)){printf("TRIANGULO ISOCELES\n");}}

    return 0;
}
