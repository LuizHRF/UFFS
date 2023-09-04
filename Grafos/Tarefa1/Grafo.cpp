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

Grafo::Grafo(int num_vertices) {
    num_vertices_ = num_vertices;
    num_arestas_ = 0;
    lista_adj_.resize(num_vertices);
}

void Grafo::insere_aresta(Aresta e){
    
    int v1 = 1;

    //cout << "Aresta A inserir: " << e.v1 << " e " << e.v2 << "\n";
    list<int>::iterator it;
    for(it = lista_adj_[e.v1].begin(); it != lista_adj_[e.v1].end(); ++it){
        if(*it == e.v2){
            v1 = 0;
        }
    }

    if(v1 && e.v1 != e.v2){
        lista_adj_[e.v1].push_front(e.v2);
        lista_adj_[e.v2].push_front(e.v1);

        num_arestas_++;
    }
    
}

void Grafo::remove_aresta(Aresta e) {
    
    int verificador = 0;

    list<int>::iterator it;
    for(it = lista_adj_[e.v1].begin(); it != lista_adj_[e.v1].end(); ++it){
        if(*it == e.v2){
            verificador = 1;
        }
    }

    if(verificador == 1){
        lista_adj_[e.v1].remove(e.v2);
        lista_adj_[e.v2].remove(e.v1);

        num_arestas_--;
    }

}

void Grafo::imprime() {

    for (int i = 0; i < num_vertices_; i++) {
        cout << i << ":";

        list<int>::iterator it;
        for(it = lista_adj_[i].begin(); it != lista_adj_[i].end(); ++it){
            cout << " " << *it;
        }
        cout << "\n";
    }

    cout << "\n";
}

void Grafo::remove_vertice(int v){  //DIMINIR O CONTADOR DE ARESTAS QUANDO UM VERTICE É REMOVIDO

    if(v<num_vertices_ && v>=0){

        list<int>::iterator it;
        for(int i =0; i<num_vertices_; i++){

            if(lista_adj_.size() != 0){

                if (lista_adj_[i].size() == 1 || lista_adj_[i].size() == 2){
                    if (lista_adj_[i].front() == v || lista_adj_[i].back() == v){
                        lista_adj_[i].remove(v); 
                    }
                    if (lista_adj_[i].back() > v){
                        lista_adj_[i].back()--;
                    }
                }else{

                    
                    for(it = lista_adj_[i].begin(); it != lista_adj_[i].end(); ++it){
                        if(*it == v){
                            lista_adj_[i].remove(v);
                        }
                        if(*it > v){
                            *it--;
                        }
                    }
                } 
            }      

        }

        

        for(int j=v; j< num_vertices_ - 1 ; j++){
            lista_adj_[j] = lista_adj_[j+1];
        }

        lista_adj_.pop_back();

        num_vertices_--;
    }
}

int Grafo::num_arestas(){
    return num_arestas_;
}

int Grafo::num_vertices(){
    return num_vertices_;
}