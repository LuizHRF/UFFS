#include "Grafo.h"
#include <iostream>

using namespace std;

int main() {
    try {
        Grafo grafo(5);

        grafo.imprime_grafo();

        Aresta e(3, 4);
        grafo.inserir_aresta(e);

        grafo.inserir_aresta(Aresta(4, 2));
        grafo.imprime_grafo();
        
    }
    catch (const exception &e) {
        cerr << "exception: " << e.what() << "\n";
    }

    return 0;
}
