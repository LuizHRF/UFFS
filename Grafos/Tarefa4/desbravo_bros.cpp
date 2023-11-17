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

// código para usar ins e outs:
// ./desbravo_bros <aquivo.in> arquivo.out
// da pra selecionar amboas arquivos .out e escolher a opção comparar com o botão direito

int main() {

    int x, y, p, it;

    std::cin >> x >> it;
    Digrafo g = Digrafo(x);

    while(it!=0){

        std::cin >> x >> y >>p;

        g.inserir_aresta(Aresta(x, y, p));

        it--;
    }

    g.print_matriz();

    return 0;
}
