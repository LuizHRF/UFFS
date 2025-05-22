
f = lambda x: x**3 -2* x**2 -5

f_linha = lambda x: 3*x**2 - 4*x

while True:
    x = float(input("Digite o valor de x: "))
    print('Valor de f(x): ', f(x))
    print('Valor de f\'(x): ', f_linha(x))
    print("Divisaão de f(x) por f'(x): ", f(x)/f_linha(x))