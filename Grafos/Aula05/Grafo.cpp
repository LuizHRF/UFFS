#include "Grafo.h"
#include <iostream>

using namespace std;

Grafo::Grafo(int num_vertices) {
    num_vertices_ = num_vertices;
    num_arestas_ = 0;
    matriz_adj_.resize(num_vertices);
    for (int i = 0; i < num_vertices; i++) {
        matriz_adj_[i].resize(num_vertices, 0);
    }
}

void Grafo::inserir_aresta(Aresta e) {
    if(matriz_adj_[e.v1][e.v2] == 0) {
        matriz_adj_[e.v1][e.v2] = 1;
        matriz_adj_[e.v2][e.v1] = 1;
    
        num_arestas_++;
    }
}

void Grafo::remover_aresta(Aresta e) {
    if(matriz_adj_[e.v1][e.v2] != 0) {
        matriz_adj_[e.v1][e.v2] = 0;
        matriz_adj_[e.v2][e.v1] = 0;
    
        num_arestas_--;
    }
}

void Grafo::imprime() {
    for (int i = 0; i < num_vertices_; i++) {
        cout << i << ":";
        for (int j = 0; j < num_vertices_; j++){
            if (matriz_adj_[i][j] != 0) {
                cout << " " << j;
            }
        }
        cout << "\n";
    }

    cout << "\n";
}

int Grafo::conexo(){
    int flag = 1;
    for(int i=0; i<num_vertices_; i++){
        for(int j=i+1; i<num_vertices_; i++){
            
            std::vector<int> marcado(num_vertices_);
            marcado.assign(num_vertices_, 0);

            if (caminho(i, j, marcado) == 0){
                return flag = 0;
            }
        }
    }

    return flag;
}

int Grafo::caminho(int v, int w, std::vector<int> marcado) {
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