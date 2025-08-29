--============= EXECÍCIOS SQL ======================
-- Luiz Henrique Rigo Faccio
-- 2211100003
--==================================================

--==================================================
--=============== PARTE 1 ==========================
--==================================================

-- 1
UPDATE clientes SET nome = 'Joao' WHERE cpf = '68745120480';

--2
UPDATE clientes SET estado_civil = 'Divorciado' WHERE cpf = '23548754210';

--3
UPDATE veiculos SET comprimento = 18 WHERE matricula = 103;

--4
UPDATE veiculos SET vlDiaria = vlDiaria * 1.124;

--5
DELETE FROM funcionarios WHERE nome = 'Marquito';


--==================================================
--================ PARTE 2 ==========================
--==================================================


-- 1) Listar o nome e o estado civil e a data de nascimento de todos os clientes
SELECT nome, estado_civil, data_nasc FROM clientes;

--2) Listar o nome, idade e telefone de todos os funcionarios
SELECT nome, idade, telefone FROM funcionarios;	

-- 3) Liste as habilitações que necessitam que o usuário possua mais de 25 anos
SELECT descricao FROM habilitacoes WHERE idade_min > 25;

-- 4) Listar o nome dos veiculos que tem comprimento maior que 10 e com potencia superior a 120
SELECT nome FROM veiculos WHERE comprimento > 10 AND potMotor > 120;

-- 5) Listar o nome e o comprimento de todos os barcos cuja potencia fique entre 50 e 300
SELECT nome, comprimento FROM veiculos WHERE potMotor BETWEEN 50 AND 300;

-- 6) Busque a maior e a menor diária dentre os barcos
SELECT MAX(vlDiaria) AS maior_diaria, MIN(vlDiaria) AS menor_diaria
FROM veiculos

-- 7) Conte o número de locações que se iniciaram no dia ‘2021-12-29’
SELECT COUNT(*) FROM locacoes WHERE inicio = '2021-12-29';	

-- 8) Apresente a idade do funcionário mais novo, do funcionário mais velho e a média de idades de todos os funcionários
SELECT MIN(idade) AS idade_mais_novo, MAX(idade) AS idade_mais_velho, AVG(idade) AS media_idade
FROM funcionarios;

-- 9) Liste os estados civis cadastrados (sem repetir)
SELECT DISTINCT estado_civil FROM clientes;

-- 10) Liste os nomes de todas as pessoas cadastradas (funcionários + clientes)
SELECT nome FROM funcionarios
UNION
SELECT nome FROM clientes;


--=========================================================
--===================== PARTE 11 (?) ==========================
--============================================================


--1) Apresente quantos barcos foram locados por dia (considerando data inicial)
SELECT l.inicio, COUNT(*) AS total_locacoes
FROM locacoes l
GROUP BY l.inicio;

-- 2)Verifique quais o cpfs possuem mais de duas locações
SELECT cpf, COUNT(*) AS total_locacoes
FROM locacoes
GROUP BY cpf
HAVING COUNT(*) > 2;


--==================================================
--===================== PARTE 3 ==========================
--==================================================


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
WITH cte_ AS (SELECT v.matricula, count(l.codloc) AS total_locacoes
				FROM veiculos v JOIN 
				locacoes l ON v.matricula = l.matricula
				GROUP BY v.matricula)

SELECT v.nome, v.matricula, cte_.total_locacoes
FROM veiculos v
JOIN cte_ ON v.matricula = cte_.matricula
WHERE cte_.total_locacoes = (SELECT MAX(total_locacoes) FROM cte_)
   OR cte_.total_locacoes = (SELECT MIN(total_locacoes) FROM cte_)
ORDER BY cte_.total_locacoes DESC;

-- 8) Qual o funcionário que mais participou de locações
WITH cte_ AS (SELECT f.codF, count(l.codloc) AS total_locacoes
				FROM funcionarios f JOIN 
				locacoes l ON f.codF = l.codF
				GROUP BY f.codF)

SELECT f.nome, cte_.total_locacoes
FROM funcionarios f
JOIN cte_ ON f.codF = cte_.codF
WHERE cte_.total_locacoes = (SELECT MAX(total_locacoes) FROM cte_);

-- 9) Em média quantos dias duram as locações?
SELECT CAST(avg(duracao) AS DECIMAL(10,2)) AS Media_de_duracao_em_dias FROM
	(SELECT (fim - inicio) AS duracao
	FROM locacoes) sub;

-- 10) Considerando o tipo de embarcação, qual a média de dias que cada tipo de embarcação fica locada
WITH cte_avg AS (SELECT codloc, matricula, (fim - inicio) AS duracao
	FROM locacoes)

SELECT t.descricao, CAST(avg(cte_avg.duracao) AS DECIMAL(10,2)) AS Media_de_duracao_em_dias
FROM cte_avg
JOIN veiculos v ON cte_avg.matricula = v.matricula
JOIN tipos_veiculos t ON v.codtipo = t.codtipo
GROUP BY t.descricao;

-- 11) Para cada locação apresente o funcionário resposável, o nome do barco, o nome do cliente e o valor calculado da locação

SELECT f.nome AS funcionario, v.nome AS barco, c.nome AS cliente, CAST(((l.fim - l.inicio) * v.vlDiaria) AS DECIMAL(10, 2)) AS valor_locacao
FROM locacoes l
JOIN veiculos v ON l.matricula = v.matricula
JOIN funcionarios f ON l.codF = f.codF
JOIN clientes c ON l.cpf = c.cpf;


--==================================================
--================== PARTE 4 ==========================	
--==================================================


-- 1) Apresentar os clientes que já fizeram locações
SELECT c.cpf, c.nome 
FROM clientes c
WHERE EXISTS (SELECT 1 FROM locacoes l WHERE l.cpf = c.cpf);

-- 2) Liste todos os barcos que nunca foram locados
SELECT * 
FROM veiculos v
WHERE v.matricula <> ANY (SELECT DISTINCT matricula FROM locacoes);

-- 3) Buscar o nome e a descrição do barco mais caro e mais barato do catálogo
SELECT nome, modelo, vlDiaria
FROM veiculos v
WHERE v.vlDiaria = (SELECT max(vlDiaria) FROM veiculos LIMIT 1)
	OR V.vlDiaria = (SELECT min(vlDiaria) FROM veiculos LIMIT 1);

-- 4) Busca o valor do maior e menor locação no dia X
SELECT max(((l.fim - l.inicio) * v.vlDiaria)), min(((l.fim - l.inicio) * v.vlDiaria))
FROM locacoes l
JOIN veiculos v ON v.matricula = l.matricula
WHERE inicio = '2022-02-17';

-- 5) Buscar a habilitação que não possui nenhum cliente associado
-- INSERT INTO Habilitacoes (tipo, idade_min, descricao) VALUES ('Ninguem', 9, 'Ninguém possui esta habilitação');

SELECT *
FROM habilitacoes h
WHERE h.codH <> ALL (SELECT DISTINCT codh FROM clientes);

-- 6) Buscar os veículos que foram locados mais de uma vez no mesmo dia.
-- INSERT INTO Locacoes(codLoc, valor, inicio, fim, obs, matricula, codF, CPF) values (26 ,15200,  '2021/12/24', '2021/12/24', 'Locação para o Natal', 401, 03, '23548754210'), (27, 63000,  '2022/01/20', '2022/02/04', 'Locação para viagem média',  405, 03, '87542022642');

WITH cte_ AS (SELECT inicio, matricula, count(matricula)
				FROM locacoes
				GROUP BY inicio, matricula)
SELECT v.* 
FROM veiculos v
WHERE EXISTS (SELECT * FROM cte_ WHERE cte_.matricula = v.matricula AND cte_.count > 1);

-- 7) Buscar o nome, a potencia, e o comprimento dos barcos que nunca foram locados
SELECT nome, potMotor, comprimento 
FROM veiculos v
WHERE v.matricula <> ALL (SELECT matricula FROM locacoes);

-- 8) Utilizando EXISTS, liste os dados dos clientes que locaram barcos no dia 29/12/2021.

SELECT * 
FROM clientes c
WHERE EXISTS (SELECT * FROM locacoes WHERE inicio = '2021/12/29' AND cpf = c.cpf)

-- 9) Busque os dados dos barcos que foram locados por todos os clientes
-- INSERT INTO Locacoes(codLoc, valor, inicio, fim, obs, matricula, codF, CPF) values
-- (0028, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '52145784502'),
-- (0029, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '35420227840'),
-- (0030, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '89406159987'),
-- (0031, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '34568754210'),
-- (0032, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '25415420130'),
-- (0033, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '87542022642'),
-- (0034, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '35421578450'),
-- (0035, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '32154789605'),
-- (0036, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '32022487964'),
-- (0037, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '73154879460'),
-- (0038, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '23548754210'),
-- (0039, 1000, '2025/08/29', '2025/08/30', 'Locação teste para todos os clientes', 401, 1, '68745120480');

SELECT * FROM veiculos v
	WHERE NOT EXISTS (SELECT * FROM clientes c
		WHERE NOT EXISTS (SELECT * FROM locacoes l
				WHERE l.cpf = c.cpf AND l.matricula = v.matricula));

-- 10) Existe alguma habilitação que permite que o seu portador pilote qualquer barco

SELECT * FROM habilitacoes h
WHERE NOT EXISTS (SELECT * FROM veiculos v
                  WHERE NOT EXISTS (SELECT * FROM veiculos_habilitacoes vh
                                   WHERE vh.codTipo = v.codTipo AND vh.codH = h.codH));