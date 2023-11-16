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


int Digrafo::caminho(int v, int w, std::vector<int> marcado) {
    if (v == w) {
        //printf("%d-", v);
        return 1;
    }
    marcado[v] = 1;
    for (int u = 0; u < num_vertices_; u++){
        if (matriz_adj_[v][u] != 0){
            if (marcado[u] == 0){
                if (caminho(u, w, marcado)){
                    //printf("%d-", v);
                    return 1;
                }
            }
        }
    }
    return 0;
}

int Digrafo::num_arestas(){
    return num_arestas_;
}

int Digrafo::num_vertices(){
    return num_vertices_;
} 

void Digrafo::busca_larg(int v, std::vector<int> pai, std::vector<int>& dist) {

    std::queue<int> fila;
    std::vector<int> marcado(num_vertices_);

    marcado[v] = 1;
    pai[v] = -1;
    dist[v] = 0;
    fila.push(v);

    while(!fila.empty()){
        int w = fila.front();
        fila.pop();
        for (int u =0; u< num_vertices_; u++){
            if(matriz_adj_[w][u] !=0){
                if(marcado[u]==0){
                    marcado[u]=1;
                    pai[u] =w;
                    dist[u] = dist[w] +1;
                    fila.push(u);
                }
            }
        }
    }
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