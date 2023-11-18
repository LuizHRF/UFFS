/*
 * Tarefa 4 - Desbravo Bros.
 *
 * GEN254 - Grafos - 2023/2
 *
 * Nome:      Luiz Faccio
 * Matricula: 2211100003
 */

#ifndef DIGRAFO_H

#define DIGRAFO_H

#include "Aresta.h"
#include <vector>
#include <list>
#include <utility>

class Digrafo {
public:
    Digrafo(int num_vertices);
    // ~Grafo(); // Se necessario
    int num_vertices();
    int num_arestas();

    void inserir_aresta(Aresta e);
    void remover_aresta(Aresta e);

    void print_matriz(); //Para fins de debug

    void max_vidas(int v);
    
    /*
        Idéia é primeiro inverter todos os pesos (*-1) e utilizar do algoritmo de bellman-ford.
        O algoritmo dirá se existe um ciclo de pesos negativos, o que significa que é possível adquirir 
    vidas infinitamente ou, se não houverem ciclos negativos, retornará os caminhos de peso mínimo até 
    todos os vértices.
        Dúvida: o módulo do peso do caminho cujo peso for menor entre todos os outros é SEGURAMENTE o
    maior número de vidas que pode ser adquirido (num caso em que não haja nenhum ciclo negativo)?
    */

   int bellman_ford(int s, std::vector<int>& dp);

private:
    int num_vertices_;
    int num_arestas_;
    std::vector<std::vector<std::pair<int, int>>> matriz_adj_;
};

#endif /* DIGRAFO_H */
