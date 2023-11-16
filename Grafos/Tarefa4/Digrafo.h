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

class Digrafo {
public:
    Digrafo(int num_vertices);
    // ~Grafo(); // Se necessario
    int num_vertices();
    int num_arestas();

    void inserir_aresta(Aresta e);
    void remover_aresta(Aresta e);

    void busca_larg(int v, std::vector<int> pai, std::vector<int>& dist);

    int caminho(int v, int w, std::vector<int> marcado);

    void print_matriz();

private:
    int num_vertices_;
    int num_arestas_;
    std::vector<std::vector<int>> matriz_adj_;
};

#endif /* DIGRAFO_H */
