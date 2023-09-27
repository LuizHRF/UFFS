/*
 * Tarefa 02 - Potenciais Comparsas
 *
 * GEN254 - Grafos - 2023/2
 *
 * Nome:      Luiz Faccio
 * Matricula: 2211100003
 */

#ifndef GRAFO_H

#define GRAFO_H

#include "Aresta.h"
#include <vector>
#include <list>

class Grafo {
public:
    Grafo(int num_vertices);
    // ~Grafo(); // Se necessario
    int num_vertices();
    int num_arestas();

    void inserir_aresta(Aresta e);
    void remover_aresta(Aresta e);

    void imprime();

    void busca_larg(int v, std::vector<int> pai, int dist[]);

    int caminho(int v, int w, std::vector<int> marcado);
    int conexo();

    void suspeitos(int n);

    void print_matriz();

private:
    int num_vertices_;
    int num_arestas_;
    std::vector<std::vector<int>> matriz_adj_;
};

#endif /* GRAFO_H */
