#include "Grafo.h"
#include <iostream>

using namespace std;

int main() {
    try {
        Grafo grafo(5);

        grafo.imprime_grafo();

    }
    catch (const exception &e) {
        cerr << "exception: " << e.what() << "\n";
    }

    return 0;
}
