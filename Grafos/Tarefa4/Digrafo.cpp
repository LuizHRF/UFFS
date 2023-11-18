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
#include <climits>
#include <utility>

using namespace std;

Digrafo::Digrafo(int num_vertices) {
    num_vertices_ = num_vertices;
    num_arestas_ = 0;
    matriz_adj_.resize(num_vertices);
    for (int i = 0; i < num_vertices; i++) {
        matriz_adj_[i].resize(num_vertices,std::make_pair (0,0));
    }
}

void Digrafo::inserir_aresta(Aresta e) {
    if(matriz_adj_[e.v1][e.v2].first == 0) {
        matriz_adj_[e.v1][e.v2].first = 1;
        matriz_adj_[e.v1][e.v2].second = -e.peso; //invertendo o peso
        //printf("Inserindo aresta (%d %d) p:%d\n",e.v1, e.v2, matriz_adj_[e.v1][e.v2].second);

        num_arestas_++;
    }
}

void Digrafo::remover_aresta(Aresta e) {
    if(matriz_adj_[e.v1][e.v2].first != 0) {
        matriz_adj_[e.v1][e.v2].first = 0;
        matriz_adj_[e.v1][e.v2].second = 0;
    
        num_arestas_--;
    }
}

void Digrafo::max_vidas(int v){

    //printf("Analisando vidas para %d\n", v);
    //print_matriz();

    std::vector<int> dp(num_vertices_);

    if(bellman_ford(v, dp) == 1){
        printf("%d: ilimitada\n", v);

    }else{

        for(int i=0; i<num_vertices_; i++){ //invertendo os pesos dos caminhos para seus valores normais
            dp[i] = -dp[i]; 
        }

        int maior_vida = dp[0];
        for(int i=1; i<num_vertices_; i++){
            if(dp[i] > maior_vida){
                maior_vida = dp[i];
            }
        }
        printf("%d: %d\n", v, maior_vida);

    }
}

int Digrafo::num_arestas(){
    return num_arestas_;
}

int Digrafo::num_vertices(){
    return num_vertices_;
} 


void Digrafo::print_matriz(){
    printf("Imprimindo matriz do grafo com os pesos: \n");
    for(int i=0; i<num_vertices_; i++){
        for(int j=0; j<num_vertices_; j++){
            
            printf("[%d]", matriz_adj_[i][j].second);
            
        }
        printf("\n");
    }
}

int Digrafo::bellman_ford(int s, std::vector<int>& dp){

    for(int i=0; i<num_vertices_; i++){
        dp[i] = INT_MAX;
    }
    dp[s] = 0;

    for(int k=0; k<num_vertices_; k++){

        for(int u=0; u<num_vertices_; u++){  //para cada aresta
            for(int v=0; v<num_vertices_; v++){

                if(matriz_adj_[u][v].first==1){ //se existir um vertice entre uv
                    
                    if(dp[u] != INT_MAX && dp[v] > dp[u] + matriz_adj_[u][v].second){  //verificando se é possível acessar u
                        dp[v] = dp[u] + matriz_adj_[u][v].second;                       //e na sequencia fazendo a relaxação de uv
                    }
                }
            }
        }
    }

    for(int u=0; u<num_vertices_; u++){     //Verificando se existem ciclos
        for(int v=0; v<num_vertices_; v++){     //de peso negativo

            if(matriz_adj_[u][v].first==1){ 
                if(dp[u] != INT_MAX && dp[v] > dp[u] + matriz_adj_[u][v].second){
                    return 1;
                }
            }
        }
    }
    return 0;

}