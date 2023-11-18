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


int main() {

    int x, y, p, it;

    std::cin >> x >> it;
    Digrafo g = Digrafo(x);

    while(it!=0){

        std::cin >> x >> y >>p;

        g.inserir_aresta(Aresta(x, y, p));

        it--;
    }

    std::cin >> it;

    while(it){

        std::cin >> x;

        g.max_vidas(x);

        it--;
    }

    return 0;
}
