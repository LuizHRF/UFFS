/*
 * Tarefa 4 - Desbravo Bros.
 *
 * GEN254 - Grafos - 2023/2
 *
 * Nome:      Luiz Faccio
 * Matricula: 2211100003
 */
#include "Digrafo.h"
#include <iostream>
#include <queue>

using namespace std;

Digrafo::Digrafo(int num_vertices) {
    num_vertices_ = num_vertices;
    num_arestas_ = 0;
    matriz_adj_.resize(num_vertices);
    for (int i = 0; i < num_vertices; i++) {
        matriz_adj_[i].resize(num_vertices, 0);
    }
}

void Digrafo::inserir_aresta(Aresta e) {
    if(matriz_adj_[e.v1][e.v2] == 0) {
        matriz_adj_[e.v1][e.v2] = 1;
    
        num_arestas_++;
    }
}

void Digrafo::remover_aresta(Aresta e) {
    if(matriz_adj_[e.v1][e.v2] != 0) {
        matriz_adj_[e.v1][e.v2] = 0;
    
        num_arestas_--;
    }
}

int Digrafo::max_vidas(int v){
    
}

int Digrafo::num_arestas(){
    return num_arestas_;
}

int Digrafo::num_vertices(){
    return num_vertices_;
} 


void Digrafo::print_matriz(){
    for(int i=0; i<num_vertices_; i++){
        for(int j=0; j<num_vertices_; j++){
            if(1){
                printf("[%d]", matriz_adj_[i][j]);
            }else{
                printf("   ");
            }
        }
        printf("\n");
    }
}