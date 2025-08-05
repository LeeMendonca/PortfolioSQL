/*O setor financeiro precisa de um relatório sobre os fornecedores dos produtos que vendemos.
Os relatórios contemplam todas as categorias, mas por algum motivo,
os fornecedores dos produtos cuja categoria é a executiva, não estão no relatório.
Seu trabalho é retornar os nomes dos produtos e dos fornecedores cujo código da categoria é 6.*/

CREATE TABLE providers (
	id numeric PRIMARY KEY,
    name varchar(255),
    street varchar(255),
    city varchar(255),
    state char(2)
);

CREATE TABLE categories (
	id numeric PRIMARY KEY,
    name varchar(255)
);

CREATE TABLE products (
	id numeric PRIMARY KEY,
    name varchar(255),
    amount numeric(10),
    price decimal(10,2),
    id_providers numeric,
    id_categories numeric,
    FOREIGN KEY (id_providers) REFERENCES providers(id),
    FOREIGN KEY (id_categories) REFERENCES categories(id)
);

INSERT INTO providers (id, name, street, city, state) 
VALUES
(1, 'Henrique', 'Av Brasil', 'Rio de Janeiro', 'RJ'),
(2, 'Marcelo Augusto', 'Rua Imigrantes', 'Belo Horizonte', 'MG'),
(3, 'Caroline Silva', 'Av São Paulo', 'Salvador', 'BA'),
(4, 'Guilherme Staff', 'Rua Central', 'Porto Alegre', 'RS'),
(5, 'Isabela Moraes', 'Av Juiz Grande', 'Curitiba', 'PR'),
(6, 'Francisco Accerr', 'Av Paulista', 'São Paulo', 'SP');

INSERT INTO categories (id, name) 
VALUES
(1, 'old stock'),
(2, 'new stock'),
(3, 'modern'),
(4, 'commercial'),
(5, 'recyclable'),
(6, 'executive'),
(7, 'superior'),
(8, 'wood'),
(9, 'super luxury'),
(10, 'vintage');

INSERT INTO products (id, name, amount, price, id_providers, id_categories)
VALUES
(1, 'Two-door wardrobe', 100, 80.00, 6, 8),
(2, 'Dining table', 1000, 560.00, 1, 9),
(3, 'Towel holder', 10000, 5.50, 5, 1),
(4, 'Computer desk', 350, 100.00, 4, 6),
(5, 'Chair', 3000, 210.64, 3, 6),
(6, 'Single bed', 750, 99.00, 1, 2);

/*O setor financeiro precisa de um relatório sobre os fornecedores dos produtos que vendemos.
Os relatórios contemplam todas as categorias, mas por algum motivo,
os fornecedores dos produtos cuja categoria é a executiva, não estão no relatório.
Seu trabalho é retornar os nomes dos produtos e dos fornecedores cujo código da categoria é 6.*/

SELECT
	products.name, providers.name 
FROM
	products -- tabela que armazena as FKs
JOIN
	providers ON products.id_providers = providers.id
    /* products.id_providers (FK de providers em products) e providers.id fazem referência à mesma chave */
WHERE
	products.id_categories=6; -- FK de categories em products