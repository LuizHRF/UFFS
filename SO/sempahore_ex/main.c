#include "main.h"

int main(void) {
   pthread_t tids[N_THREADS];
   int i=0;

    for(int k= 0; k<N_THREADS; k++){
        if (k==0){
            sem_init(&sem[k], 0, 1);
        } else {
            sem_init(&sem[k], 0, 0);
        }
    }

    for(i=0; i<N_THREADS; i++) {
        int *j = malloc(sizeof(int));
        *j = i;

        int value;
        sem_getvalue(&sem[i], &value);

        //printf("Iniciando thread %d com semáforo valor: %d\n", i, value);

        pthread_create(&tids[i], NULL, myThread, (void *)j);
    }

   for(i=0; i<N_THREADS; i++) {
      pthread_join(tids[i], NULL);
   }
   return(1);
}

void *myThread(void *data){
    
   int id = *((int *) data);
   free((int *)data);

    while(1){

        int next = (id+1) % N_THREADS;
        sem_wait(&sem[id]);

        if (GLOBAL>=CEILING) {
            
            sem_post(&sem[next]);
            pthread_exit(NULL);

        } else {    

            GLOBAL++;
            printf("Thread %d definiu GLOBAL como %d\n",  id, GLOBAL);
            sem_post(&sem[next]);

        }
    }
    pthread_exit(NULL);
}