/*A empresa fará um evento comemorativo dos 20 anos do mercado, e para isso faremos uma grande comemoração na cidade de Porto Alegre.
Convidamos também todos os nossos clientes que estão matriculados nesta cidade.
Seu trabalho é ter os nomes e endereços dos clientes que moram em ‘Porto Alegre’, para entregar os convites pessoalmente.*/

CREATE TABLE customers (
	id numeric PRIMARY KEY,
    name varchar(255),
    street varchar(255),
    city varchar(255),
    state char(2),
    credit_limit decimal(10,2)
);

INSERT INTO customers (id, name, street, city, state, credit_limit)
VALUES	(1, 'Pedro Augusto da Rocha', 'Rua Pedro Carlos Hoffman', 'Porto Alegre', 'RS', 700.00),
		(2, 'Antonio Carlos Mamel', 'Av. Pinheiros', 'Belo Horizonte', 'MG', 3500.50),
        (3, 'Luiza Augusta Mhor', 'Rua Salto Grande', 'Niteroi', 'RJ', 4000.00),
        (4, 'Jane Ester', 'Av 7 de setembro', 'Erechim', 'RS', 800.00),
        (5, 'Marcos Antônio dos Santos', 'Av Farrapos', 'Porto Alegre', 'RS', 4250.25);

SELECT name, street, city, state
FROM customers
WHERE city = 'Porto Alegre';
