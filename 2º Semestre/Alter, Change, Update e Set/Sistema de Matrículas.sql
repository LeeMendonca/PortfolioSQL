-- PRIMEIRA ETAPA

DROP TABLE IF EXISTS alunos;

-- 1. Criar tabela alunos com idade INT
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    idade INT,
    status_matricula VARCHAR(20) CHECK (status_matricula IN ('Ativo', 'Pendente'))
);

-- 2. Inserir alunos de exemplo
INSERT INTO alunos (nome, idade, status_matricula) VALUES
('Letícia Ferreira', 21, 'Pendente'),
('Giovanna Antonieta', 20, 'Pendente'),
('Thiago Ramsés', 22, 'Pendente');

-- 3. Criar a PROCEDURE para fazer a matrícula
DELIMITER $$
CREATE PROCEDURE matricular_aluno(IN aluno_id INT)
BEGIN
    DECLARE idade_aluno INT;

    START TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Buscar a idade do aluno
    SELECT idade INTO idade_aluno FROM alunos WHERE id = aluno_id;

    -- Verificar idade e decidir
    IF idade_aluno >= 18 THEN
        UPDATE alunos SET status_matricula = 'Ativo' WHERE id = aluno_id;
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END$$
DELIMITER ;

CALL matricular_aluno(3);


-- SEGUNDA ETAPA: mudar "idade" para "data de nascimento"

-- 5. Alterar a tabela
ALTER TABLE alunos
CHANGE idade data_nascimento DATE;

-- 6. Atualizar os dados de nascimento corretamente
UPDATE alunos
SET data_nascimento = '2003-06-24' WHERE id = 1;
UPDATE alunos
SET data_nascimento = '2004-02-18' WHERE id = 2;
UPDATE alunos
SET data_nascimento = '2002-07-22' WHERE id = 3;

-- Conferir tabela final
SELECT * FROM alunos;
