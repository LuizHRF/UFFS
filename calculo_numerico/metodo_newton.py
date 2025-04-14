import math

def metodo_newton(p1: float, p2: float, f: any, df: any, v0: float, c = 0) -> float:
    """Método de newton para o zero de uma função

    Args:
        p1 (Float) : Precisão 1 (Entre xk e xk-1)
        p2 (Float): Precisao 2 (Entre f(xk) e 0)
        f (function): Função a ser avaliada 
        df (function): Derivada de f
        v0 (FLoat): Chute inicial
        c (Int): Iteração atual

    Returns:
        Float, Int: Primeiro valor de x a atingir alguma das precisões e o número de iterações
    """
    x = v0 - f(v0)/df(v0)
    if (abs((x-v0)) < p1 and (x-v0) != 0):
        #print(f"Retornando {x-v0} < {p1}: {x}")
        #print("Iteração: ", c)
        return x, c
    if (abs(f(x)) < p2):
        #print(f"Retornando f({x}): {f(x)}")
        #print("Iteração: ", c)
        return x, c
     
    return metodo_newton(p1, p2, f, df, x, c+1)
    

def metodo_secante(p1: float, p2: float, f: any, df: any, v0: float, v1: float, c = 0) -> float:
    """Método da secante para o zero de uma função

    Args:
        p1 (Float) : Precisão 1 (Entre xk e xk-1)
        p2 (Float): Precisao 2 (Entre f(xk) e 0)
        f (function): Função a ser avaliada 
        df (function): Derivada de f
        v0 (FLoat): Chute incial
        v1 (Float): Chute inicial 2
        c (Int): Iteração atual

    Returns:
        Float, Int: Primeiro valor de x a atingir alguma das precisões e o número de iterações
    """
    x = (v0*f(v1) - v1*f(v0))/(f(v1)-f(v0))
    if abs((x-v0)) < p1:
        #print(f"Retornando {x-v0} < {p1}: {x}")
        #print("Iteração: ", c)
        return x, c
    if (abs(f(x)) < p2):
        #print(f"Retornando f({x}): {f(x)}")
        #print("Iteração: ", c)
        return x, c
     
    return metodo_secante(p1, p2, f, df, v1, x, c+1)    
    
x, c = metodo_secante(
    0.0001, 
    0.0001, 
    lambda x: x**2 + x -6,
    lambda x: 2*x + 1,
    1.5,
    1.7
)
print("X: ", x)
print("Iteração: ", c)