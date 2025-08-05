-- Criação da tabela prices
CREATE TABLE prices (
    id numeric PRIMARY KEY,
    categorie varchar(255) NOT NULL,
    value numeric(10,2) NOT NULL
);

-- Criação da tabela movies com relação à prices
CREATE TABLE movies (
    id numeric PRIMARY KEY,
    name varchar(255) NOT NULL,
    id_prices numeric,
    FOREIGN KEY (id_prices) REFERENCES prices(id)
);

-- Inserção das categorias de preços
INSERT INTO prices (id, categorie, value) VALUES
(1, 'Releases', 3.50),
(2, 'Bronze Seal', 2.00),
(3, 'Silver Seal', 2.50),
(4, 'Gold Seal', 3.00),
(5, 'Promotion', 1.50);

-- Inserção dos filmes
INSERT INTO movies (id, name, id_prices) VALUES
(1, 'Batman', 3),
(2, 'The Battle of the Dark River', 3),
(3, 'White Duck', 5),
(4, 'Breaking Barriers', 4),
(5, 'The Two Hours', 2);

/* Selecionar o ID e o nome dos filmes cujo preço for menor que 2.00. */
SELECT movies.id, movies.name FROM movies
JOIN prices ON movies.id_prices = prices.id
WHERE prices.value < 2.00;