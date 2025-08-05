create table Customers (
	id numeric primary key,
	nome varchar(50),
    street varchar(50),
    city varchar(25),
    state char(2),
    credit_limit decimal (10,2)    
);

insert into Customers (id, nome, street, city, state, credit_limit)
values 	(1, 'Pedro Augusto da Rocha', 'R. Pedro Carlos Hoffman', 'Porto Alegre', 'RS', 700.00),
		(2, 'Antonio Carlos Mamel', 'Av. Pinhieiros', 'Belo Horizonte', 'MG', 3500.50),
		(3, 'Luiza Augusta Mhor', 'R. Salto Grande', 'Niteroi', 'RJ', 4000.00),
		(4, 'Jane Ester', 'Av. 7 de Setembro', 'Erechim', 'RS', 800.00),
		(5, 'Marcos Antônio dos Santos', 'Av. Farrapos', 'Porto Alegre', 'RS', 4250.25);

select * from Customers;
select nome from Customers
where city = 'Porto Alegre';
