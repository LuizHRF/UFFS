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
    
    def lagrange_func(x, contador: bool = False):
        """
        Função de interpolação de Lagrange para um ponto específico.
        :param x: Ponto onde se deseja calcular o valor interpolado.
        :param contador: Se True, imprime o número de operações realizadas durante a interpolação.
        :return: Valor interpolado no ponto x.
        """

        
        n = len(x_k)
        polinomios_lagrange = []
        counter = 0
        for k in range(n):
            def L_i(v, counter_ref=[counter]):
                p = 1
                for j in range(n):
                    if j != k:
                        p *= (v - x_k[j]) / (x_k[k] - x_k[j])
                        counter_ref[0] += 4
                return p
            polinomios_lagrange.append(L_i(x)) 
        
        resultado = 0
        #print("y[k] * polinomios_lagrange[k] = r")
        for k in range(n):
            v = y[k] * polinomios_lagrange[k]
            resultado += v
            counter += 2
            #print(f'{y[k]} * {polinomios_lagrange[k]} = {v}')
            #print("+")

        if contador:
            print(f"Número de operações realizadas: {counter}")
        return resultado

    return lagrange_func


def interpolar_newton(x_k, y):
    """
    Interpolação de Newton para um ponto específico
    :param x: Lista de pontos x conhecidos.
    :param y: Lista de pontos y conhecidos correspondentes.

    :return: Valor interpolado no ponto x_interpolado.
    """

    if len(x_k) != len(y):
        raise ValueError("As listas x_k e y devem ter o mesmo tamanho.")
    n = len(x_k)
    def newton_func(x, contador: bool = False):
        """
        Função de interpolação de Newton para um ponto específico.
        :param x: Ponto onde se deseja calcular o valor interpolado.
        :param contador: Se True, imprime o número de operações realizadas durante a interpolação.
        :return: Valor interpolado no ponto x.

        """
        counter = 0
        # Criação da tabela de diferenças divididas
        tabela = [[0] * n for _ in range(n)]

        for i in range(n):
            tabela[i][0] = y[i]
        
        for j in range(1, n):
            for i in range(n - j):
                tabela[i][j] = (tabela[i + 1][j - 1] - tabela[i][j - 1]) / (x_k[i + j] - x_k[i])
                counter += 3
        
        # Cálculo do valor interpolado
        resultado = tabela[0][0]
        produto = 1
        
        for j in range(1, n):
            produto *= (x - x_k[j - 1])
            resultado += tabela[0][j] * produto
            counter += 4
        
        if contador:
            print(f"Número de operações realizadas: {counter}")
        return resultado

    
    return newton_func


def interpolar_gregory_newton(x_k, y):
    """
    Interpolação de Gregory-Newton para um ponto específico.
    
    :param x_k: Lista de pontos x conhecidos.
    :param y: Lista de pontos y conhecidos correspondentes.
    
    :return: Função de interpolação de Gregory-Newton.
    """

    
    if len(x_k) != len(y):
        raise ValueError("As listas x_k e y devem ter o mesmo tamanho.")
    
    h = x_k[1] - x_k[0]
    for i in range(1, len(x_k)):
        if not math.isclose(x_k[i] - x_k[i - 1], h, rel_tol=1e-9, abs_tol=1e-12):
            raise ValueError("Os valores de x devem ter o mesmo espaçamento entre si.") 
    
    def gregory_newton_func(x, contador: bool):
        """
        Função de interpolação de Gregory-Newton para um ponto específico.

        :param x: Ponto onde se deseja calcular o valor interpolado.
        :param contador: Se True, imprime o número de operações realizadas durante a interpolação.

        :return: Valor interpolado no ponto x.
        """
        counter = 1
        n = len(x_k)
        tabela = [[0] * n for _ in range(n)]
        
        for i in range(n):
            tabela[i][0] = y[i]
        
        for j in range(1, n):
            for i in range(n - j):
                tabela[i][j] = (tabela[i + 1][j - 1] - tabela[i][j - 1])
                counter += 1
        
        resultado = tabela[0][0]
        produto = 1
        
        for j in range(1, n):
            produto *= (x - x_k[j - 1])
            resultado += (tabela[0][j]/ (math.factorial(j) * h**j)) * produto
            counter += 8

        if contador:
            print(f"Número de operações realizadas: {counter}")
        
        return resultado

    return gregory_newton_func
