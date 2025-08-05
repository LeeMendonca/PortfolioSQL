DROP DATABASE IF EXISTS empregados;
CREATE DATABASE empregados;
USE empregados;

-- 1. Tabelas auxiliares
CREATE TABLE sexo (
    cod_sexo CHAR(1) PRIMARY KEY,
    descricao VARCHAR(10)
);

INSERT INTO sexo (cod_sexo, descricao) VALUES
('M', 'Masculino'),
('F', 'Feminino');

CREATE TABLE estado_civil (
    cod_estado_civil CHAR(1) PRIMARY KEY,
    descricao VARCHAR(20)
);

INSERT INTO estado_civil (cod_estado_civil, descricao) VALUES
('C', 'Casado(a)'),
('S', 'Solteiro(a)');

-- 2. Tabela de departamentos
CREATE TABLE depts (
    cod_depto INT PRIMARY KEY,
    nome VARCHAR(50)
);

-- 3. Tabela de empregados
CREATE TABLE empregados (
    cod_empregado INT PRIMARY KEY,
    cod_depto INT,
    nome VARCHAR(50),
    dt_nascimento DATE,
    salario DECIMAL(10,2),
    cod_sexo CHAR(1),
    cod_est_civil CHAR(1),
    FOREIGN KEY (cod_depto) REFERENCES depts(cod_depto),
    FOREIGN KEY (cod_sexo) REFERENCES sexo(cod_sexo),
    FOREIGN KEY (cod_est_civil) REFERENCES estado_civil(cod_estado_civil)
);

-- 4. Tabela de dependentes
CREATE TABLE dependentes (
    cod_dependente INT PRIMARY KEY,
    cod_empregado INT,
    nome VARCHAR(50),
    dt_nascimento DATE,
    cod_sexo CHAR(1),
    FOREIGN KEY (cod_empregado) REFERENCES empregados(cod_empregado),
    FOREIGN KEY (cod_sexo) REFERENCES sexo(cod_sexo)
);

-- 5. Inserts de departamentos
INSERT INTO depts (cod_depto, nome) 
VALUES (1, 'Recursos Humanos'),
       (2, 'Financeiro'),
       (3, 'TI'),
       (4, 'Marketing'),
       (5, 'Operações');

-- 6. Inserts de empregados
INSERT INTO empregados (cod_empregado, cod_depto, nome, dt_nascimento, salario, cod_sexo, cod_est_civil) 
VALUES 
(101, 1, 'Ana Silva', '1985-04-12', 4500.00, 'F', 'C'),
(102, 2, 'Carlos Souza', '1978-11-23', 5200.50, 'M', 'C'),
(103, 3, 'Juliana Costa', '1990-06-30', 6100.00, 'F', 'S'),
(104, 4, 'Rafael Lima', '1982-02-17', 4800.75, 'M', 'C'),
(105, 5, 'Marina Duarte', '1995-09-05', 3900.20, 'F', 'S'),
(106, 2, 'João Pedro Barreto', '1987-05-22', 3780.45, 'M', 'C'),
(107, 4, 'Larissa Guimarães', '1994-03-19', 4925.60, 'F', 'S'),
(108, 3, 'Mateus Antunes', '1989-12-02', 7100.00, 'M', 'C'),
(109, 1, 'Cláudia Telles', '1991-07-14', 5090.10, 'F', 'C'),
(110, 5, 'Henrique Torres', '1996-01-08', 3890.00, 'M', 'S'),
(111, 3, 'Jéssica Martins', '1993-11-25', 4575.99, 'F', 'S'),
(112, 2, 'Bruno Vieira', '1984-06-30', 6050.80, 'M', 'C'),
(113, 5, 'Yasmin Pereira', '1998-09-10', 3600.00, 'F', 'S'),
(114, 1, 'Diego Costa', '1982-04-04', 6700.00, 'M', 'C'),
(115, 4, 'Renata Rocha', '1990-08-28', 4950.00, 'F', 'C'),
(116, 3, 'Alan Nogueira', '1997-02-17', 4250.00, 'M', 'S'),
(117, 2, 'Vanessa Lima', '1995-10-03', 5200.45, 'F', 'C'),
(118, 1, 'Thiago Almeida', '1980-03-22', 7800.99, 'M', 'C'),
(119, 5, 'Gabriela Fernandes', '1992-06-11', 4300.00, 'F', 'S'),
(120, 4, 'Leandro Castro', '1986-12-27', 6000.00, 'M', 'S'),
(121, 1, 'Aline Souza', '1999-01-15', 3750.00, 'F', 'S'),
(122, 2, 'Caio Farias', '1988-09-09', 5150.60, 'M', 'C'),
(123, 5, 'Paula Duarte', '1990-07-21', 3950.00, 'F', 'C'),
(124, 4, 'Rafael Mendes', '1994-11-03', 4800.00, 'M', 'S'),
(125, 3, 'Letícia Silva', '1985-08-06', 6550.10, 'F', 'C'),
(126, 1, 'Murilo Ramos', '1996-12-15', 4050.00, 'M', 'S'),
(127, 2, 'Tatiane Borges', '1991-02-02', 4650.70, 'F', 'C'),
(128, 5, 'Carlos Eduardo Meireles', '1983-05-25', 7200.00, 'M', 'C'),
(129, 4, 'Marina Lobo', '1997-06-29', 4400.00, 'F', 'S'),
(130, 3, 'Fernando Brito', '1989-10-18', 5800.00, 'M', 'C');

-- 7. Inserts de dependentes
INSERT INTO dependentes (cod_dependente, cod_empregado, nome, dt_nascimento, cod_sexo) 
VALUES 
(201, 101, 'Lucas Silva', '2010-08-14', 'M'),
(202, 102, 'Fernanda Souza', '2005-03-29', 'F'),
(203, 102, 'Pedro Souza', '2008-12-12', 'M'),
(204, 104, 'João Lima', '2012-05-10', 'M'),
(205, 101, 'Laura Silva', '2013-07-22', 'F'),
(206, 106, 'Lucas Barreto', '2011-04-10', 'M'),
(207, 107, 'Manuela Guimarães', '2014-07-19', 'F'),
(208, 108, 'João Antunes', '2009-12-01', 'M'),
(209, 109, 'Beatriz Telles', '2016-08-22', 'F'),
(210, 110, 'Ricardo Torres', '2012-01-05', 'M'),
(211, 111, 'Clara Martins', '2015-06-15', 'F'),
(212, 112, 'Pedro Vieira', '2010-10-30', 'M'),
(213, 113, 'Lívia Pereira', '2018-03-25', 'F'),
(214, 114, 'Miguel Costa', '2008-11-17', 'M'),
(215, 115, 'Ana Rocha', '2013-02-08', 'F'),
(216, 116, 'Bruno Nogueira', '2011-09-05', 'M'),
(217, 117, 'Isabela Lima', '2016-12-27', 'F'),
(218, 118, 'Cauã Almeida', '2007-06-03', 'M'),
(219, 119, 'Sofia Fernandes', '2019-04-14', 'F'),
(220, 120, 'Vinícius Castro', '2010-05-11', 'M');

-- 8. Procedures
DELIMITER //

CREATE PROCEDURE SalariosDepto(IN p_cod_depto INT)
BEGIN
    SELECT 
        SUM(salario) AS soma_salarios,
        AVG(salario) AS media_salarial,
        MAX(salario) AS maior_salario,
        MIN(salario) AS menor_salario
    FROM empregados
    WHERE cod_depto = p_cod_depto;
END;
//

CREATE PROCEDURE QtdePorSexoDepto(IN p_nome_depto VARCHAR(50))
BEGIN
    SELECT 
        e.cod_sexo,
        COUNT(*) AS quantidade
    FROM empregados e
    JOIN depts d ON e.cod_depto = d.cod_depto
    WHERE d.nome = p_nome_depto
    GROUP BY e.cod_sexo;
END;
//

CREATE PROCEDURE InserirDepartamento(IN p_cod_depto INT, IN p_nome VARCHAR(50))
BEGIN
    INSERT INTO depts (cod_depto, nome)
    VALUES (p_cod_depto, p_nome);
END;
//

CREATE PROCEDURE AumentoMulheres()
BEGIN
    UPDATE empregados
    SET salario = salario * 1.05
    WHERE cod_sexo = 'F';
END;
//

CREATE PROCEDURE AumentoHomens(IN p_percentual DECIMAL(5,2))
BEGIN
    UPDATE empregados
    SET salario = salario * (1 + (p_percentual / 100))
    WHERE cod_sexo = 'M';
END;
//

CREATE PROCEDURE EmpregadosAcimaMedia()
BEGIN
    SELECT *
    FROM empregados
    WHERE salario > (SELECT AVG(salario) FROM empregados);
END;
//

DELIMITER ;
