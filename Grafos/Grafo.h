#ifndef GRAFO_H

#define GRAFO_H

#include<vector>
#include "Aresta.h"

class Grafo {
public:
    Grafo(int vert);
    
    void inserir_aresta(Aresta e);
    void remover_aresta(Aresta e);

    int getNum_arestas();
    int getNum_vertices();

    void imprime_grafo();
private:

    int num_vertices;
    int num_arestas;
    std::vector<std::vector<int>> matriz_adj;
};

#endif /* GRAFO_H */
