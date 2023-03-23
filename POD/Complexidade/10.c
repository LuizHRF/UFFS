#include <stdio.h>

int main() {
    int count, x = 1;
    double medias = 0, mediaaluno = 0, temp;
    while(x!=0){
      printf("Digite a matrícula: \n");
      scanf("%d", &x);
      if(x==0){break;}
      mediaaluno = 0;
      for(int i = 1; i<11; i++){
        printf("Digite a %dª nota: \n", i);
        scanf("%lf", &temp);
        mediaaluno +=temp;
      }
      mediaaluno = mediaaluno/10;
      printf("Matrícula: %d |Média: %.2lf\n", x, mediaaluno);
      medias+=mediaaluno;
      count++;
    }
    medias = medias/count;
    printf("Média da turma: %.2lf\n", medias);
    return 0;
}
