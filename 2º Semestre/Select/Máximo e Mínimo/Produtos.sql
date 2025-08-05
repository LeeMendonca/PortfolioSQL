/* Exiba somente o maior e o menor preço da tabela produtos. */ 

CREATE TABLE products (
    id numeric PRIMARY KEY,
    name varchar(255),
    amount numeric,
    price decimal(10, 2)
);

INSERT INTO products (id, name, amount, price) VALUES
(1, 'Two-doors wardrobe', 100, 800),
(2, 'Dining table', 1000, 560),
(3, 'Towel holder', 10000, 25.50),
(4, 'Computer desk', 350, 320.50),
(5, 'Chair', 3000, 210.64),
(6, 'Single bed', 750, 460);

SELECT MAX(price) as maior_preco, MIN(price) as menor_preco
FROM products;
