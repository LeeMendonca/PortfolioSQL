-- Criação da tabela categories
CREATE TABLE categories (
    id numeric PRIMARY KEY,
    name varchar(255) NOT NULL
);

-- Criação da tabela products com relação à categories
CREATE TABLE products (
    id numeric PRIMARY KEY,
    name varchar(255) NOT NULL,
    amount numeric NOT NULL,
    price numeric(10,2) NOT NULL,
    id_categories numeric,
    FOREIGN KEY (id_categories) REFERENCES categories(id)
);

-- Inserção dos dados nas categorias
INSERT INTO categories (id, name) VALUES
(1, 'wood'),
(2, 'luxury'),
(3, 'vintage'),
(4, 'modern'),
(5, 'super luxury');

-- Inserção dos produtos
INSERT INTO products (id, name, amount, price, id_categories) VALUES
(1, 'Two-doors wardrobe', 100, 800.00, 1),
(2, 'Dining table', 1000, 560.00, 3),
(3, 'Towel holder', 10000, 25.50, 4),
(4, 'Computer desk', 350, 320.50, 2),
(5, 'Chair', 3000, 210.64, 4),
(6, 'Single bed', 750, 460.00, 1);

/* Exiba o nome e a quantidade de produtos de cada categoria. */

SELECT categories.name AS categoria, SUM(products.amount) AS total_estoque
FROM products
JOIN categories ON products.id_categories = categories.id
GROUP BY categories.name
ORDER BY categories.name;