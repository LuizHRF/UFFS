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

int Grafo::conexo(){ //funcionando

    int flag = 1;
    
    std::vector<int> marcado(num_vertices_);
    busca_prof(0, marcado);

    for(int i=0; i<num_vertices_; i++){
        //printf("Marcado[%d] : %d\n", i, marcado[i]);
        if(marcado[i] != 1){
            flag = 0;
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

void Grafo::busca_prof(int v, std::vector<int> &marcado) { //funcionando

    marcado[v] = 1;

    for (int u = 0; u < num_vertices_; u++){

        if (matriz_adj_[v][u] != 0){

            if (marcado[u] == 0){

                busca_prof(u, marcado);
            }
        }
    }
}

int Grafo::busca_prof_ciclo(int v, std::vector<int> &marcado, int anterior) { 

    marcado[v] = 1;

    for (int u = 0; u < num_vertices_; u++){

        if (matriz_adj_[v][u] != 0){

            if (marcado[u] == 0){
                return busca_prof_ciclo(u, marcado, v);
                return 0;

            }else if(u != anterior){
                return 1;
            }
        }
    }

    return 0;
}

int Grafo::num_vertices(){
    return num_vertices_;
}
