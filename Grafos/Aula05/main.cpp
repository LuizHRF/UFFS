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

        //for(int i =0; i< grafo.num_vertices(); i++){
            std::vector<int> marcado;
            printf("Conexão entre 1 e %d: %d\n", 1, grafo.caminho(0, 1, marcado));
        //}

        grafo.imprime();
        
        //printf("É conexo = %d\n", grafo.conexo());
    }
    catch (const exception &e) {
        cerr << "exception: " << e.what() << "\n";
    }

    return 0;
}
