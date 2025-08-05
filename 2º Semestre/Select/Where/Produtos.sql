/*O setor financeiro da empresa precisa de um relatório que mostre o código e o nome dos produtos cujo preço são menores que 10
ou maiores que 100.*/

CREATE TABLE products (
	id numeric PRIMARY KEY,
    name varchar(255),
    amount numeric(10),
    price decimal(10,2)
);

INSERT INTO products (id, name, amount, price)
VALUES 	(1, 'Two-door wardrobe', 100, 80.00),
		(2, 'Dining table', 1000, 560.00),
        (3, 'Towel holder', 10000, 5.50),
        (4, 'Computer desk', 350, 100.00),
        (5, 'Chair', 3000, 210.64),
        (6, 'Single bed', 750, 99.00);

SELECT id, name FROM products
WHERE price<10.00 OR price>100.00;