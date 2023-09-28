/*
 * Tarefa 02 - Potenciais Comparsas
 *
 * GEN254 - Grafos - 2023/2
 *
 * Nome:      Luiz Faccio
 * Matricula: 2211100003
 */

#include "Grafo.h" 
#include <iostream>
using namespace std;


int main() {

    int x, y, it;
    char op;

    cin >> x >> it;
    Grafo g = Grafo(x);

    while(it!=0){

        cin >> x >> y >> op;
        
        if(op == 'W' || op=='w'){
            g.inserir_aresta(Aresta(x,y));
        }

        it--;
    }

    cin >> it;
    while(it!=0){

        cin >> x;
        g.suspeitos(x);

        it--;
    }

    return 0;
}
