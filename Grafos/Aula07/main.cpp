#include <iostream>
#include "Grafo.h"
#include "Aresta.h"

using namespace std;

int main() {
    try {
        Grafo grafo(5);

        grafo.inserir_aresta(Aresta(4,3));
        grafo.inserir_aresta(Aresta(0,1));
        grafo.inserir_aresta(Aresta(1,2));
        grafo.inserir_aresta(Aresta(2,3));
        //grafo.inserir_aresta(Aresta(4,0));

        grafo.imprime();
        
        std::vector<int> marcado(grafo.num_vertices());

        printf("É ciclico = %d\n", grafo.busca_prof_ciclo(0, marcado, -1));
    }
    catch (const exception &e) {
        cerr << "exception: " << e.what() << "\n";
    }

    return 0;
}
