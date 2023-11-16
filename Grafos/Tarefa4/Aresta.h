/*
 * Tarefa 4 - Desbravo Bros.
 *
 * GEN254 - Grafos - 2023/2
 *
 * Nome:      Luiz Faccio
 * Matricula: 2211100003
 */

#ifndef ARESTA_H

#define ARESTA_H

class Aresta {
public:
    const int v1;
    const int v2;
    const int peso;

    Aresta(int v1, int v2, int peso);
};

#endif /* ARESTA_H */