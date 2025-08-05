-- Criação da tabela genres
CREATE TABLE genres (
    id numeric PRIMARY KEY,
    description varchar(255) NOT NULL
);

-- Criação da tabela movies com relação à genres
CREATE TABLE movies (
    id numeric PRIMARY KEY,
    name varchar(255) NOT NULL,
    id_genres numeric,
    FOREIGN KEY (id_genres) REFERENCES genres(id)
);

-- Inserção dos gêneros
INSERT INTO genres (id, description) VALUES
(1, 'Animation'),
(2, 'Horror'),
(3, 'Action'),
(4, 'Drama'),
(5, 'Comedy');

-- Inserção dos filmes
INSERT INTO movies (id, name, id_genres) VALUES
(1, 'Batman', 3),
(2, 'The Battle of the Dark River', 3),
(3, 'White Duck', 1),
(4, 'Breaking Barriers', 4),
(5, 'The Two Hours', 2);

/* Selecione o código e o nome dos filmes cuja descrição do gênero seja 'Action'. */

SELECT movies.id, movies.name FROM movies
JOIN genres ON movies.id_genres = genres.id
WHERE genres.description = 'Action';