
from metodos_numericos import *
import pandas as pd

def gerar_tabela(
        I: tuple[2], 
        f: any,
        e1: float,
        e2: float,
        fi: any,
        df: any,
        x0_MPF: float,
        x0_Newton: float,
        x0_x1_Secante: tuple[2]
        ) -> pd.DataFrame:
    """Gera uma tabela com os resultados dos métodos de bisseção, posição falsa, ponto fixo, Newton e secante.

    Args:
        I (tuple[2]): Intervalo (a, b) para o método da bisseção.
        f (any): Função a ser avaliada.
        e1 (float): Precisão 1 (Entre f(xk) e 0).
        e2 (float): Precisão 2 (Entre xk e xk-1).
        fi (any): Função de iteração para o método do ponto fixo.
        df (any): Derivada da função f.
        x0_MPF (float): Chute inicial para o método do ponto fixo.
        x0_Newton (float): Chute inicial para o método de Newton.
        x0_x1_Secante (float, float): Chutes iniciais para o método da secante.

    Returns:
        pd.DataFrame: DataFrame com os resultados dos métodos.
    """

    x, c = metodos_numericos.bisseccao(I, e2, f)
    bisseccao = pd.Series({
        'Dados Iniciais': f"I = ({I[0]}, {I[1]})",
        "Aproximação de X": x,
        "f(x)": f(x),
        "Iterações": c,
    })

    x, c = metodos_numericos.posicao_falsa(I, e1, e2, f)
    pos_falsa = pd.Series({
        'Dados Iniciais': f"I = ({I[0]}, {I[1]})",
        "Aproximação de X": x,
        "f(x)": f(x),
        "Iterações": c,
    })

    x, c = metodos_numericos.ponto_fixo(x0_MPF, e1, e2, f, fi)
    ponto_fixo = pd.Series({
        'Dados Iniciais': f"x0 = {x0_MPF}",
        "Aproximação de X": x,
        "f(x)": f(x),
        "Iterações": c,
    })

    x, c = metodos_numericos.metodo_newton(e1, e2, f, df, x0_Newton)
    newton = pd.Series({
        'Dados Iniciais': f"x0 = {x0_Newton}",
        "Aproximação de X": x,
        "f(x)": f(x),
        "Iterações": c,
    })

    x, c = metodos_numericos.metodo_secante(e1, e2, f, df, x0_x1_Secante[0], x0_x1_Secante[1])
    secante = pd.Series({
        'Dados Iniciais': f"x0 = {x0_x1_Secante[0]}, x1 = {x0_x1_Secante[1]}",
        "Aproximação de X": x,
        "f(x)": f(x),
        "Iterações": c,
    })

    return pd.DataFrame(
        [bisseccao, pos_falsa, ponto_fixo, newton, secante],
        index=["Bisseção", "Posição Falsa", "Ponto Fixo", "Newton", "Secante"]
    )