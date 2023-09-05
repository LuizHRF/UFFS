#ifndef GRAFO_H

#define GRAFO_H

#include <vector>
#include "Aresta.h"

class Grafo {
public:
    Grafo(int num_vertices);

    int num_vertices();
    int num_arestas();

    void inserir_aresta(Aresta e);
    void remover_aresta(Aresta e);
    
    void imprime();

    int conexo();

    int caminho(int v, int w, std::vector<int> marcado);
private:
    int num_vertices_;
    int num_arestas_;
    std::vector<std::vector<int>> matriz_adj_;
};

#endif /* GRAFO_H */
