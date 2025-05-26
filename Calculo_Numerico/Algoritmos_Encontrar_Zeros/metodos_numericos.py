import math

def bisseccao(I : tuple[2], e2 : float, f: any, c: int = 0) -> float:
    """Método da bisseção para o zero de uma função

    Args:
        I (float, float) : Tupla do intervalo (a, b)
        e2 (Float): Precisao (Entre a e b)
        f (function): Função a ser avaliada 
        c (Int): Iteração atual = 0

    Returns:
        Float, Int: Primeiro valor de x a atingir alguma das precisões e o número de iterações

    """

    a,b = I
    
    if f(a) * f(b) > 0:
        print("Intervalo inválido")
        return None
    if (b - a) < e2:
        return ((a+b)/2), c
    
    m = f(a)
    x = (a + b) / 2

    # print(f"Para x{c}: f({x}) = {f(x)}")

    if(m * f(x) > 0):
        return bisseccao((x, b), e2, f, c+1)
    else:
        return bisseccao((a, x), e2, f, c+1)

def ponto_fixo(x0: float, e1: float, e2: float, f: any, fi: any, c: int = 0) -> float:

    """Método do ponto fixo para o zero de uma função

    Args:
        x0 (Float): Chute inicial
        e1 (Float): Precisão 1 (Entre f(xk) e 0)
        e2 (Float): Precisão 2 (Entre xk e xk-1)
        f (function): Função a ser avaliada 
        fi (function): Função de iteração
        c (Int): Iteração atual

        
    Returns:
        Float, Int: Primeiro valor de x a atingir alguma das precisões e o número de iterações
    """
    
    try:
        if (abs(f(x0)) < e1):
            return x0, c
        
        x1 = fi(x0)

        if (abs(f(x1)) < e1 or abs(x1 - x0) < e2):
            return x1, c
        else:
            # print(f"Para x{c}: f({x1}) = {f(x1)}")
            return ponto_fixo(x1, e1, e2, f, fi, c+1)
        
    except Exception as e:
        print(f"Erro: {e}")
        return None
    
def posicao_falsa(I : tuple[2], e1: float, e2: float, f: any, c: int = 0) -> float:
    """Método da posição falsa para o zero de uma função

    Args:
        I (float, float): Tupla do intervalo (a, b)
        e1 (Float): Precisão 1 (Entre f(xk) e 0)
        e2 (Float): Precisao 2 (Entre a e b)
        f (function): Função a ser avaliada 
        c (Int): Iteração atual = 0

    Returns:
        Float, Int: Primeiro valor de x a atingir alguma das precisões e o número de iterações

    """
    a,b = I
    
    if f(a) * f(b) > 0:
        print("Intervalo inválido")
        return None
    
    if (b - a) < e2:
        return ((a+b)/2), c
    
    if (abs(f(a)) < e1):
        return a, c
    if (abs(f(b)) < e1):
        return b, c
    
    m = f(a)

    x = (a*f(b) - b*m)/(f(b) - m)

    # print(f"Iteração {c}: x = {x}") 
    # print(f"\tf(x) = {f(x)}")

    if (abs(f(x)) < e1):
        return x, c
    if (m * f(x) < 0):
        return posicao_falsa((a,x), e1, e2, f, c+1)
    else:
        return posicao_falsa((x,b), e1, e2, f, c+1)

def metodo_newton(e1: float, e2: float, f: any, df: any, v0: float, c = 0) -> float:
    """Método de newton para o zero de uma função

    Args:
        e1 (Float) : Precisão 1 (Entre f(xk) e 0)
        e1 (Float): Precisao 2 (Entre xk e xk-1)
        f (function): Função a ser avaliada 
        df (function): Derivada de f
        v0 (FLoat): Chute inicial
        c (Int): Iteração atual

    Returns:
        Float, Int: Primeiro valor de x a atingir alguma das precisões e o número de iterações
    """
    x = v0 - f(v0)/df(v0)
    if (abs((x-v0)) < e2 and (x-v0) != 0):
        #print(f"Retornando {x-v0} < {p1}: {x}")
        #print("Iteração: ", c)
        return x, c
    if (abs(f(x)) < e1):
        #print(f"Retornando f({x}): {f(x)}")
        #print("Iteração: ", c)
        return x, c
     
    return metodo_newton(e1, e2, f, df, x, c+1)
    
def metodo_secante(e1: float, e2: float, f: any, df: any, v0: float, v1: float, c = 0) -> float:
    """Método da secante para o zero de uma função

    Args:
        e1 (Float) : Precisão 1 (Entre f(xk) e 0)
        e2 (Float): Precisao 2 (Entre xk e xk-1)
        f (function): Função a ser avaliada 
        df (function): Derivada de f
        v0 (FLoat): Chute incial
        v1 (Float): Chute inicial 2
        c (Int): Iteração atual

    Returns:
        Float, Int: Primeiro valor de x a atingir alguma das precisões e o número de iterações
    """
    x = (v0*f(v1) - v1*f(v0))/(f(v1)-f(v0))
    if abs((x-v0)) < e2:
        #print(f"Retornando {x-v0} < {p1}: {x}")
        #print("Iteração: ", c)
        return x, c
    if (abs(f(x)) < e1):
        #print(f"Retornando f({x}): {f(x)}")
        #print("Iteração: ", c)
        return x, c
     
    return metodo_secante(e1, e2, f, df, v1, x, c+1)    

def main():
    print("TESTE DE MÉTODOS")

    x, c = metodo_secante(
        0.0001, 
        0.0001, 
        lambda x: x**2 + x -6,
        lambda x: 2*x + 1,
        1.5,
        1.7
    )
    print("X da secante:", x)
    print("Iteração:", c)

    x, c = metodo_newton(
        0.0001, 
        0.0001, 
        lambda x: x**2 + x -6,
        lambda x: 2*x + 1,
        1.5
    )
    print("X do newton:", x)
    print("Iteração:", c)

    x, c = bisseccao(
        (1, 2), 
        0.01, 
        lambda x: x * math.log(x) -1, 
    )
    print("X da bissecção:", x)
    print("Iteração:", c)

    x, c = ponto_fixo(
        1, 
        0.001, 
        0.001, 
        lambda x: x**2 + x - 6, 
        lambda x: math.sqrt(6-x)
    )
    print("X do ponto fixo:", x)
    print("Iteração:", c)
    
    x, c = posicao_falsa(
        (0, 1 ), 
        0.001, 
        0.001, 
        lambda x: x**3 - 9*x + 3
    )
    print("X da posição falsa:", x)
    print("Iteração:", c)

if __name__ == "__main__": main()