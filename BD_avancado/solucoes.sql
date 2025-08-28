-- 1) Liste os nomes dos veículos e seus respectivos tipos (descrição do tipo)

SELECT v.nome, t.descricao
FROM veiculos v 
JOIN tipos_veiculos t
ON v.codtipo = t.codtipo

-- 2) Apresente o nome dos funcionários que fizeram locações no dia 17/02/2022

SELECT f.nome 
FROM funcionarios f 
JOIN locacoes l 
ON f.codf = l.codf 
WHERE l.inicio = '2022-02-17';

-- 3) Liste o nome, num_filhos, estado civil e descrição da habilitação de todos os clientes

SELECT c.nome, c.num_filhos, c.estado_civil, h.descricao
FROM clientes c 
JOIN habilitacoes h 
ON c.codh = h.codh

-- 4) Apresente os dados da locação (nome do barco, potencia, descrição do tipo, data inicio, data fim, nome do funcionário resposável) feito por João (68745120480)

SELECT t.descricao, COUNT(v.matricula)
FROM veiculos v 
JOIN tipos_veiculos t
ON v.codtipo = t.codtipo


-- 5) Apresente quantos veículos estão cadastrados para cada um dos tipos

SELECT h.tipo, COUNT(v.matricula)
FROM veiculos v 
JOIN veiculos_habilitacoes vh ON v.codtipo = vh.codtipo 
JOIN habilitacoes h ON vh.codh = h.codh 
GROUP BY h.tipo

--6) Considerando as habilitações, apresente quantos veículos estão cadastrados para cada uma das categorias de habilitação

SELECT nome 
SELECT v.matricula, v.nome, COUNT(l.codloc)
		FROM veiculos v JOIN 
		locacoes l ON v.matricula = l.matricula
		GROUP BY v.matricula
		
-- 7) Apresente o veículo mais e menos locado

-- 8) Qual o funcionário que mais participou de locações

-- 9) Em média quantos dias duram as locações?

-- 10) Considerando o tipo de embarcação, qual a média de dias que cada tipo de embarcação fica locada

-- 11) Para cada locação apresente o funcionário resposável, o nome do barco, o nome do cliente e o valor calculado da locação

		
		
		
		
		
