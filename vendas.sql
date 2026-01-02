CREATE TABLE vendas (
    id_venda SERIAL PRIMARY KEY,
    id_cliente INT,
    data_venda DATE,
    valor NUMERIC(10,2),
    categoria VARCHAR(50)
);

INSERT INTO vendas (id_cliente, data_venda, valor, categoria) VALUES
(1, '2024-01-05', 120.50, 'Eletrônicos'),
(2, '2024-01-10', 80.00, 'Roupas'),
(3, '2024-01-15', 250.00, 'Eletrônicos'),
(1, '2024-02-02', 60.00, 'Roupas'),
(4, '2024-02-10', 300.00, 'Móveis'),
(2, '2024-02-18', 90.00, 'Roupas'),
(3, '2024-03-01', 150.00, 'Eletrônicos'),
(5, '2024-03-05', 500.00, 'Móveis'),
(1, '2024-03-12', 70.00, 'Roupas'),
(4, '2024-03-20', 200.00, 'Eletrônicos');



-- análise mensal (utilizando group by e data)

SELECT
    DATE_TRUNC('month', data_venda) AS mes,
    COUNT(*) AS total_vendas,
    SUM(valor) AS faturamento_total,
    AVG(valor) AS ticket_medio
FROM vendas
GROUP BY DATE_TRUNC('month', data_venda)
ORDER BY mes;




SELECT
    categoria,
    COUNT(*) AS quantidade_vendas,
    SUM(valor) AS faturamento_total
FROM vendas
GROUP BY categoria
ORDER BY faturamento_total DESC;




SELECT
    id_venda,
    id_cliente,
    valor,
    categoria
FROM vendas
WHERE valor > (
    SELECT AVG(valor)
    FROM vendas
)
ORDER BY valor DESC;
