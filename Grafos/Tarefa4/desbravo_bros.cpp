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
using namespace std;


int main() {

    int x, y, p, it;

    cin >> x >> it;
    Digrafo g = Digrafo(x);

    while(it!=0){

        cin >> x >> y >>p;

        g.inserir_aresta(Aresta(x, y, p));

        it--;
    }

    g.print_matriz();

    return 0;
}
