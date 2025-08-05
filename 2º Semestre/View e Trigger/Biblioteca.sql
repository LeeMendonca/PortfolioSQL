/* BIBLIOTECA */

-- Remove as tabelas se já existirem (em ordem correta para evitar problemas com FKs)
DROP TABLE IF EXISTS livros;
DROP TABLE IF EXISTS autores;
DROP TABLE IF EXISTS editoras;
DROP TABLE IF EXISTS livros_deletados;

-- --------------------------------------------------------------------------------------------------------

-- Criação da tabela autores
CREATE TABLE autores (
    id NUMERIC PRIMARY KEY,
    nome VARCHAR(255),
    nacionalidade VARCHAR(255),
    data_nascimento DATE -- formato yyyy/mm/dd
);

-- Criação da tabela editoras
CREATE TABLE editoras (
    id NUMERIC PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(255)
);

-- Criação da tabela livros
CREATE TABLE livros (
    id NUMERIC PRIMARY KEY,
    status VARCHAR(255), -- para o trigger
    titulo VARCHAR(255),
    ano_publicacao INT,
    genero VARCHAR(255),
    disponibilidade VARCHAR(50),
    id_autores NUMERIC,
    id_editoras NUMERIC,
    FOREIGN KEY (id_autores) REFERENCES autores(id),
    FOREIGN KEY (id_editoras) REFERENCES editoras(id)
);

-- Criação da tabela livros_deletados (para auditoria)
CREATE TABLE livros_deletados (
    id NUMERIC,
    status VARCHAR(255),
    titulo VARCHAR(255),
    ano_publicacao INT,
    genero VARCHAR(255),
    disponibilidade VARCHAR(50),
    id_autores NUMERIC,
    id_editoras NUMERIC
);

-- --------------------------------------------------------------------------------------------------------

-- Inserção de dados na tabela autores
INSERT INTO autores (id, nome, nacionalidade, data_nascimento)
VALUES
(1, 'Suzanne Collins', 'Americana', '1962-08-10'),
(2, 'Kiera Cass', 'Americana', '1981-05-19'),
(3, 'Jeff Kinney', 'Americana', '1971-02-19'),
(4, 'James Dashner', 'Americana', '1972-11-26'),
(5, 'Cressida Cowell', 'Britânica', '1966-04-15');

-- Inserção de dados na tabela editoras
INSERT INTO editoras (id, nome, endereco, telefone)
VALUES
(1, 'Scholastic', '557 Broadway, Nova York, EUA', '+1 212-343-6100'),
(2, 'HarperCollins', '195 Broadway, Nova York, EUA', '+1 212-207-7000'),
(3, 'Abril', 'Av. das Nações Unidas, SP, Brasil', '+55 11 3037-3000'),
(4, 'Vergara & Riba', 'Buenos Aires, Argentina', '+54 11 4372-8200'),
(5, 'Little, Brown Books', '1290 Avenue of the Americas, Nova York, EUA', '+1 212-364-1100');

-- Inserção de dados na tabela livros
INSERT INTO livros (id, status, titulo, ano_publicacao, genero, disponibilidade, id_autores, id_editoras)
VALUES
(1, 'Incluído', 'Jogos Vorazes', 2008, 'Distopia', 'Disponível', 1, 1),
(2, 'Incluído', 'A Seleção', 2012, 'Romance', 'Disponível', 2, 2),
(3, 'Incluído', 'Diário de Um Banana', 2007, 'Infantojuvenil', 'Emprestado', 3, 3),
(4, 'Incluído', 'Maze Runner: Correr ou Morrer', 2009, 'Ficção Científica', 'Disponível', 4, 4),
(5, 'Incluído', 'Como Treinar Seu Dragão', 2003, 'Fantasia', 'Emprestado', 5, 5);

-- --------------------------------------------------------------------------------------------------------

-- Criação da View
CREATE OR REPLACE VIEW visao AS

-- Select com União de Tabelas: titulo e gênero da tabela Livros, e nomes da tabela Autores
SELECT livros.titulo, livros.genero, autores.nome
FROM livros -- tabela que possui as FKs
JOIN autores ON
livros.id = autores.id;

-- Chamado da View
SELECT * FROM visao;

-- --------------------------------------------------------------------------------------------------------

-- Criação do Trigger
DELIMITER $$
CREATE TRIGGER gatilho AFTER DELETE ON livros
FOR EACH ROW
BEGIN
    -- Insere os dados do livro deletado na tabela livros_deletados
    -- Define o status como 'EXCLUÍDO'
    INSERT INTO livros_deletados (id, status, titulo, ano_publicacao, genero, disponibilidade, id_autores, id_editoras)
    VALUES (OLD.id, 'EXCLUÍDO', OLD.titulo, OLD.ano_publicacao, OLD.genero, OLD.disponibilidade, OLD.id_autores, OLD.id_editoras);
END $$
DELIMITER ;

-- Teste do Trigger: Deletar um Livro
DELETE FROM livros
WHERE livros.id = 3;

-- Verificação dos resultados
-- Tabela livros (o livro com id = 3 não deve mais aparecer)
SELECT * FROM livros;

-- Tabela livros_deletados (o livro com id = 3 deve aparecer aqui com status 'EXCLUÍDO')
SELECT * FROM livros_deletados;