import math 

def interpolar_lagrange(x_k, y):
    """
    Interpolação de Lagrange para um ponto específico.
    
    :param x: Lista de pontos x conhecidos.
    :param y: Lista de pontos y conhecidos correspondentes.
    
    :return: Função de interpolação de Lagrange.
    """
    if len(x_k) != len(y):
        raise ValueError("As listas x_k e y devem ter o mesmo tamanho.")
    
    def lagrange_func(x):
        n = len(x_k)
        polinomios_lagrange = []

        for k in range(n):
            def L_i(v):
                p = 1
                for j in range(n):
                    if j != k:
                        p *= (v - x_k[j]) / (x_k[k] - x_k[j])
                return p
            polinomios_lagrange.append(L_i(x)) 
        
        resultado = 0
        #print("y[k] * polinomios_lagrange[k] = r")
        for k in range(n):
            v = y[k] * polinomios_lagrange[k]
            resultado += v
            #print(f'{y[k]} * {polinomios_lagrange[k]} = {v}')
            #print("+")
        return resultado


    return lagrange_func


def interpolar_gregory_n(x_k, y):
    """
    Interpolação de Gregory-Newton para um ponto específico
    :param x: Lista de pontos x conhecidos.
    :param y: Lista de pontos y conhecidos correspondentes.

    :return: Valor interpolado no ponto x_interpolado.
    """

    if len(x_k) != len(y):
        raise ValueError("As listas x_k e y devem ter o mesmo tamanho.")
    n = len(x_k)
    def gregory_newton_func(x):
        
        # Criação da tabela de diferenças divididas
        tabela = [[0] * n for _ in range(n)]
        for i in range(n):
            tabela[i][0] = y[i]
        
        for j in range(1, n):
            for i in range(n - j):
                tabela[i][j] = (tabela[i + 1][j - 1] - tabela[i][j - 1]) / (x_k[i + j] - x_k[i])
        
        # Cálculo do valor interpolado
        resultado = tabela[0][0]
        produto = 1
        
        for j in range(1, n):
            produto *= (x - x_k[j - 1])
            resultado += tabela[0][j] * produto
        
        return resultado

    return gregory_newton_func

