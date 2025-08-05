CREATE TABLE Customers (
	ID NUMERIC PRIMARY KEY,
    Nome VARCHAR(50),
    Endereco VARCHAR(50),
    Cidade VARCHAR(25),
    Estado CHAR(2),
    Credito DECIMAL (10,2) -- Decimal, duas casas
);

DESCRIBE Customers;

INSERT INTO Customers (ID, Nome, Endereco, Cidade, Estado, Credito)
VALUES 	(1, 'Pedro Augusto da Rocha', 'R. Pedro Carlos Hoffman', 'Porto Alegre', 'RS', 700.00),
		(2, 'Antonio Carlos Mamel', 'Av. Pinhieiros', 'Belo Horizonte', 'MG', 3500.50),
		(3, 'Luiza Augusta Mhor', 'R. Salto Grande', 'Niteroi', 'RJ', 4000.00),
		(4, 'Jane Ester', 'Av. 7 de Setembro', 'Erechim', 'RS', 800.00),
		(5, 'Marcos Antônio dos Santos', 'Av. Farrapos', 'Porto Alegre', 'RS', 4250.25);

SELECT * from Customers;
SELECT Nome from Customers
WHERE Estado = 'RS';
