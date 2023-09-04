/*
 * Tarefa 01 - Grafo - Listas de Adjacencia
 *
 * GEN254 - Grafos - 2023/2
 *
 * Nome:      LUIZ HENRIQUE RIGO FACCIO
 * Matricula: 2211100003
 */

#include "Grafo.h" 
#include <iostream>
using namespace std;

void info(Grafo g){
    std::cout << "Número de vertices e num de arestas: " << g.num_vertices() << " - " << g.num_arestas() << "\n";
}

int main() {

    int x, y, it;
    char op;

    cin >> x >> it;
    Grafo g = Grafo(x);

    while(it!=0){
        cin >> op;
        switch (op)
        {
        case 'I':

            cin >> x >> y;
            g.insere_aresta(Aresta(x, y));
            it--;
            break;

        case 'R':
            
            cin >> x >> y;
            g.remove_aresta(Aresta(x, y));
            it--;
            break;

        case 'E':

            cout << g.num_arestas() << "\n";
            it--;
            break;

        case 'Q':

            cin >> x;
            g.remove_vertice(x);
            it--;
            break;

        case 'N':

            cout << g.num_vertices() << "\n";
            it--;
            break;

        case 'P':  

            g.imprime();
            it--;
            break;

        default:
            it--;
            break;
        }


    }

    return 0;
}
