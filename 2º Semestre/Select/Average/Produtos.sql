/* Calcular e exibir o valor médio do preço dos produtos.
OBS: Mostrar o valor com dois números após o ponto. */

-- Criação da tabela products
CREATE TABLE products (
    id numeric PRIMARY KEY,
    name varchar(255) NOT NULL,
    amount numeric NOT NULL,
    price numeric(10,2) NOT NULL
);

-- Inserção dos dados dos produtos
INSERT INTO products (id, name, amount, price) VALUES
(1, 'Two-doors wardrobe', 100, 800.00),
(2, 'Dining table', 1000, 560.00),
(3, 'Towel holder', 10000, 25.50),
(4, 'Computer desk', 350, 320.50),
(5, 'Chair', 3000, 210.64),
(6, 'Single bed', 750, 460.00);

SELECT AVG(price) AS valor_medio FROM products;