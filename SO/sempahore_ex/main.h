//======================================================
// Atividade remota - Utilizando semáforos
// Luiz Henrique Rigo Faccio
// 2211100003
//------------------------------------------------------
// Compile com:
// gcc -o semaphore.exe main.h main.c
//
// Execute com:
// ./semaphore.exe
//
// Altere as threads e número máximo da variável através
// das variáveis N_THREADS e CEILING abaixo
//======================================================

#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>

#define N_THREADS 3
#define CEILING 16

int GLOBAL = 0;
sem_t sem[N_THREADS];
pthread_mutex_t critical_mutex = PTHREAD_MUTEX_INITIALIZER;

int main();
void *myThread(void *data);