-- Criação da tabela customers
CREATE TABLE customers (
    id numeric PRIMARY KEY,
    name varchar(255) NOT NULL,
    street varchar(255) NOT NULL,
    city varchar(255) NOT NULL
);

-- Criação da tabela rentals
CREATE TABLE rentals (
    id numeric PRIMARY KEY,
    rentals_date date NOT NULL,
    id_customers numeric,
    FOREIGN KEY (id_customers) REFERENCES customers(id)
);

-- Inserção dos clientes
INSERT INTO customers (id, name, street, city) VALUES
(1, 'Giovanna G. Oliveira', 'Rua Mato Grosso', 'Canoas'),
(2, 'Kauã Azevedo Ribeiro', 'Travessa Ibiá', 'Uberlândia'),
(3, 'Rebeca Barbosa Santos', 'Rua Observatório Meteorológico', 'Salvador'),
(4, 'Sarah Carvalho Correia', 'Rua Antônio Carlos da Silva', 'Apucarana'),
(5, 'João Almeida Lima', 'Rua Rio Taiuva', 'Ponta Grossa'),
(6, 'Diogo Melo Dias', 'Rua Duzentos e Cinquenta', 'Várzea Grande');

-- Inserção dos aluguéis
INSERT INTO rentals (id, rentals_date, id_customers) VALUES
(1, '2016-09-10', 3),
(2, '2016-02-09', 1),
(3, '2016-02-08', 4),
(4, '2016-02-09', 2),
(5, '2016-02-03', 6),
(6, '2016-04-04', 4);

/* Selecionar o nome dos clientes e a data de locação, das locações
realizadas no mês de setembro de 2016. */

SELECT customers.name, rentals.rentals_date FROM rentals
JOIN customers ON rentals.id_customers = customers.id
WHERE rentals_date >= '2016-09-01' AND rentals_date <= '2016-09-30'
ORDER BY rentals.rentals_date;