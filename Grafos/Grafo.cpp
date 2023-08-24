#include "Grafo.h"
#include "Aresta.h"
#include <iostream>

using namespace std;

Grafo::Grafo(int num_vertices) {
    num_vertices = num_vertices;
    num_arestas = 0;

    matriz_adj.resize(num_vertices);

    for(int i=0; i<num_vertices; i++){
        matriz_adj[i].resize(num_vertices, 0);
    }
}

void Grafo::inserir_aresta(Aresta e){
    
    if(matriz_adj[e.v1][e.v2] == 0){
        matriz_adj[e.v1][e.v2] = 1;
        matriz_adj[e.v2][e.v1] = 1;

        num_arestas++;
    }
}

void Grafo::remover_aresta(Aresta e){
    if(matriz_adj[e.v1][e.v2] == 1){
        matriz_adj[e.v1][e.v2] = 0;
        matriz_adj[e.v2][e.v1] = 0;

        num_arestas--;
    }

}

void Grafo::imprime_grafo(){
    for(int i=0; i<num_vertices; i++){
        cout << i + ": ";
        for(int j=0; j<num_vertices; j++){
            if (matriz_adj[i][j] == 1){
                cout << j + " ";
            }
        }
        cout << "\n";
    }
    
}

int Grafo::getNum_arestas(){
    return num_arestas;
}

int Grafo::getNum_vertices(){
    return num_vertices;
}