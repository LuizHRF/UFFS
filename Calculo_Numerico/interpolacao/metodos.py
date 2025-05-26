import math 

def interpolar_lagrange(x_k, y):
    """
    Interpolação de Lagrange para um ponto específico.
    
    :param x: Lista de pontos x conhecidos.
    :param y: Lista de pontos y conhecidos correspondentes.
    
    :return: Função de interpolação de Lagrange.
    """
    def lagrange_func(x):
        n = len(x)
        resultado = 0.0
        for i in range(n):
            termo = y[i]
            for j in range(n):
                if j != i:
                    termo *= (x_val - x[j]) / (x[i] - x[j])
            resultado += termo


    return lagrange_func


def interpolar_gregory_n(x, y):
    """
    Interpolação de Gregory-Newton para um ponto específico
    :param x: Lista de pontos x conhecidos.
    :param y: Lista de pontos y conhecidos correspondentes.

    :return: Valor interpolado no ponto x_interpolado.
    """

    return 0