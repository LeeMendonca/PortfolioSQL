/* Faça uma consulta que retorne todas as cidades dos fornecedores, mas em
ordem alfabética. OBS: Você não deve mostrar cidades repetidas. */

CREATE TABLE providers (
    id numeric PRIMARY KEY,
    name varchar(255),
    street varchar(255),
    city varchar(255),
    state char(2)
);

-- Inserção dos dados dos fornecedores
INSERT INTO providers (id, name, street, city, state) VALUES
(1, 'Henrique', 'Av Brasil', 'Rio de Janeiro', 'RJ'),
(2, 'Marcelo Augusto', 'Rua Imigrantes', 'Belo Horizonte', 'MG'),
(3, 'Caroline Silva', 'Av São Paulo', 'Salvador', 'BA'),
(4, 'Guilerme Staff', 'Rua Central', 'Porto Alegre', 'RS'),
(5, 'Isabela Moraes', 'Av Juiz Grande', 'Curitiba', 'PR'),
(6, 'Francisco Accerr', 'Av Paulista', 'São Paulo', 'SP');

SELECT DISTINCT city FROM providers
ORDER BY city;