--=========================================
-- Solução do problema 'Primeiro e Último'
-- Luiz Faccio
-- Referência utilizada: https://neon.com/postgresql/postgresql-tutorial/postgresql-recursive-query
--=========================================

-- create table venda(id_venda int primary key
--                                   , valor numeric
--                                   , id_venda_anterior int
--                                   , constraint venda_anterior foreign key (id_venda_anterior) references venda(id_venda));                                    
                                 
-- INSERT INTO public.venda(id_venda, valor, id_venda_anterior)
-- VALUES(1, 1252.66, NULL)
--         , (2, 2011.32, NULL)
--         , (3, 2635.66, NULL)
--         , (4, 657.04, NULL)
--         , (5, 415.11, 4)
--         , (6, 155.26, NULL)
--         , (7, 459.09, NULL)
--         , (8, 1139.22, 1)
--         , (9, 1791.71, NULL)
--         , (10, 2209.06, 3)
--         , (11, 1000.42, 8)
--         , (12, 2225.76, NULL)
--         , (13, 374.43, 5)
--         , (14, 603.56, 7)
--         , (15, 1465.67, NULL)
--         , (16, 384.76, 6)
--         , (17, 1994.13, NULL)
--         , (18, 2661.65, NULL)
--         , (19, 1549.49, 14)
--         , (20, 957.35, NULL)
--         , (21, 201.24, 13)
--         , (22, 1528.42, 20)
--         , (23, 1419.39, 19)
--         , (24, 2683.78, 22)
--         , (25, 2232.0, 25);        

WITH RECURSIVE cte_ AS (
    SELECT id_venda, valor, 1 as count, id_venda as primeiro, valor as valor_inicial
    FROM venda
    WHERE id_venda_anterior IS NULL

    UNION ALL

    SELECT v.id_venda, v.valor as valor, c.count + 1, c.primeiro, c.valor_inicial
    FROM venda v
    INNER JOIN cte_ c ON c.id_venda= v.id_venda_anterior
),

aux AS ( -- Serve somente para identificar as túplas das últimas vendas, não consgui fazer isso no select principal
    SELECT max(id_venda) as id_venda FROM cte_
    GROUP BY primeiro
)

SELECT primeiro as primeira_venda, 
       c.id_venda as ultima_venda, 
       valor - valor_inicial as diferenca_valor,
       count as total_mudancas
FROM cte_ c JOIN aux a ON c.id_venda = a.id_venda
ORDER BY primeira_venda;

-- Tentativa anterior a cte AUX:
-- SELECT max(id_venda) as ultima_venda, 
--        primeiro as primeira_venda, 
--        (SELECT valor_inicial - valor FROM cte_ WHERE id_venda = (SELECT max(id_venda) FROM cte_ WHERE primeiro = c.primeiro)) as diferenca_valor,
--        max(count) as total_vendas
-- FROM cte_ c
-- GROUP BY primeiro;