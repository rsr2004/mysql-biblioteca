# Base de Dados | Biblioteca - Step by Step

## 1. O primeiro passo é criar a Base de Dados e as suas tabelas:

```
DROP DATABASE IF EXISTS `biblioteca`; -- Eliminar a base de dados "biblioteca" se já existir.
CREATE DATABASE IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */; -- Criar a base de dados "biblioteca" se não existir.
USE biblioteca; -- Entramos na base que queremos utilizar.

CREATE TABLE MEMBROS ( -- Criar a tabela "MEMBROS" com os seus campos:
    id_membro INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    telefone VARCHAR(10),
    email VARCHAR(200)
);

CREATE TABLE COTAS ( -- Criar a tabela "COTAS" com os seus campos:
    id_cota INT PRIMARY KEY,
    id_membro INT,
    data_pagamento DATE,
    valor DECIMAL(10,2),
    pago TINYINT(1),
    FOREIGN KEY (id_membro) REFERENCES MEMBROS(id_membro)
);

CREATE TABLE AUTORES ( -- Criar a tabela "AUTORES" com os seus campos:
    id_autor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    biografia TEXT
);

CREATE TABLE CATEGORIAS ( -- Criar a tabela "CATEGORIAS" com os seus campos:
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE EDITORAS ( -- Criar a tabela "EDITORAS" com os seus campos:
    id_editora INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE FUNCIONARIOS ( -- Criar a tabela "FUNCIONARIOS" com os seus campos:
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    posicao VARCHAR(100),
    salario DECIMAL(10, 2)
);

CREATE TABLE LIVROS ( -- Criar a tabela "LIVROS" com os seus campos:
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    Autores_id_autor INT,
    Categorias_id_categoria INT,
    Editoras_id_editora INT,
    preço DECIMAL(10, 2),
    FOREIGN KEY (Autores_id_autor) REFERENCES AUTORES(id_autor),
    FOREIGN KEY (Categorias_id_categoria) REFERENCES CATEGORIAS(id_categoria),
    FOREIGN KEY (Editoras_id_editora) REFERENCES EDITORAS(id_editora)
);

CREATE TABLE EDICOES_ESPECIAIS ( -- Criar a tabela "EDICOES_ESPECIAIS" com os seus campos:
    id_edicao_especial INT PRIMARY KEY,
    id_livro INT,
    descricao TEXT,
    FOREIGN KEY (id_livro) REFERENCES LIVROS(id_livro)
);

CREATE TABLE RESTRICAO_EM_LIVRO ( -- Criar a tabela "RESTRICAO_EM_LIVRO" com os seus campos:
    id_restricao_em_livro INT PRIMARY KEY,
    id_edicao_especial INT,
    tipo_restricao VARCHAR(10),
    Funcionarios_id_funcionario INT,
    FOREIGN KEY (id_edicao_especial) REFERENCES EDICOES_ESPECIAIS(id_edicao_especial),
    FOREIGN KEY (Funcionarios_id_funcionario) REFERENCES FUNCIONARIOS(id_funcionario)
);

CREATE TABLE COPIAS ( -- Criar a tabela "COPIAS" com os seus campos:
    id_copia INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT NOT NULL,
    quantidade_em_stock INT NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES LIVROS(id_livro)
);

CREATE TABLE EMPRESTIMOS ( -- Criar a tabela "EMPRESTIMOS" com os seus campos:
    id_emprestimo INT PRIMARY KEY,
    id_membro INT,
    id_copia INT,
    data_emprestimo DATE,
    data_devolucao_prevista DATE,
    data_devolucao_real DATE,
    multa DECIMAL(4,2),
    FOREIGN KEY (id_membro) REFERENCES MEMBROS(id_membro),
    FOREIGN KEY (id_copia) REFERENCES COPIAS(id_copia)
);
```

## 2. O segundo passo é inserir os dados nas tabelas anteriormente criadas:

```
INSERT INTO MEMBROS (id_membro, nome, telefone, email) VALUES -- Insere os dados na tabela "MEMBROS".
(1, 'Ana Silva', '912345678', 'ana.silva@gmail.com'),
(2, 'Bruno Souza', '922345679', 'bruno.souza@yahoo.com'),
(3, 'Carla Mendes', '932345680', 'carla.mendes@outlook.com'),
(4, 'Daniel Costa', '912345681', 'daniel.costa@gmail.com'),
(5, 'Eduardo Lima', '922345682', 'eduardo.lima@yahoo.com'),
(6, 'Fernanda Rocha', '932345683', 'fernanda.rocha@outlook.com'),
(7, 'Gabriel Alves', '912345684', 'gabriel.alves@gmail.com'),
(8, 'Helena Santos', '922345685', 'helena.santos@yahoo.com'),
(9, 'Igor Nunes', '932345686', 'igor.nunes@outlook.com'),
(10, 'Juliana Gomes', '912345687', 'juliana.gomes@gmail.com'),
(11, 'Lucas Pereira', '922345688', 'lucas.pereira@yahoo.com'),
(12, 'Mariana Barbosa', '932345689', 'mariana.barbosa@outlook.com'),
(13, 'Nuno Fernandes', '912345690', 'nuno.fernandes@gmail.com'),
(14, 'Olivia Martins', '922345691', 'olivia.martins@yahoo.com'),
(15, 'Paulo Silva', '932345692', 'paulo.silva@outlook.com');

INSERT INTO COTAS (id_cota, id_membro, data_pagamento, valor, pago) VALUES -- Insere os dados na tabela "COTAS".
(1, 1, '2024-01-01', 10.00, 1),
(2, 2, '2024-01-15', 12.00, 1),
(3, 3, '2024-02-01', 11.50, 1),
(4, 4, '2024-02-15', 10.00, 0),
(5, 5, '2024-03-01', 10.00, 1),
(6, 6, '2024-03-15', 12.00, 1),
(7, 7, '2024-04-01', 10.00, 0),
(8, 8, '2024-04-15', 10.00, 1),
(9, 9, '2024-05-01', 10.00, 1),
(10, 10, '2024-05-15', 12.00, 1),
(11, 11, '2024-06-01', 10.00, 1),
(12, 12, '2024-06-15', 10.00, 0),
(13, 13, '2024-07-01', 12.00, 1),
(14, 14, '2024-07-15', 10.00, 1),
(15, 15, '2024-08-01', 10.00, 0);

INSERT INTO AUTORES (id_autor, nome, biografia) VALUES -- Insere os dados na tabela "AUTORES".
(1, 'J.K. Rowling', 'Autora da série Harry Potter'),
(2, 'George R.R. Martin', 'Autor da série As Crônicas de Gelo e Fogo'),
(3, 'J.R.R. Tolkien', 'Autor de O Senhor dos Anéis'),
(4, 'Agatha Christie', 'Famosa escritora de mistério'),
(5, 'Stephen King', 'Autor de romances de terror'),
(6, 'Jane Austen', 'Romancista clássica inglesa'),
(7, 'Mark Twain', 'Autor americano conhecido por As Aventuras de Tom Sawyer'),
(8, 'Ernest Hemingway', 'Autor de O Velho e o Mar'),
(9, 'F. Scott Fitzgerald', 'Autor de O Grande Gatsby'),
(10, 'Charles Dickens', 'Prolífico romancista vitoriano'),
(11, 'Leo Tolstoy', 'Autor russo de Guerra e Paz'),
(12, 'Gabriel Garcia Marquez', 'Autor de Cem Anos de Solidão'),
(13, 'Harper Lee', 'Autora de O Sol é para Todos'),
(14, 'Homero', 'Poeta épico grego antigo'),
(15, 'William Shakespeare', 'Dramaturgo e poeta inglês'),
(16, 'Luís de Camões', 'Poeta Português');

INSERT INTO CATEGORIAS (id_categoria, nome) VALUES -- Insere os dados na tabela "CATEGORIAS".
(1, 'Ficção'),
(2, 'Não Ficção'),
(3, 'Mistério'),
(4, 'Fantasia'),
(5, 'Ficção Científica'),
(6, 'Biografia'),
(7, 'História'),
(8, 'Romance'),
(9, 'Terror'),
(10, 'Autoajuda'),
(11, 'Infantil'),
(12, 'Juvenil'),
(13, 'Suspense'),
(14, 'Filosofia'),
(15, 'Poesia');

INSERT INTO EDITORAS (id_editora, nome) VALUES -- Insere os dados na tabela "EDITORAS".
(1, 'Companhia das Letras'),
(2, 'Editora Rocco'),
(3, 'Saraiva'),
(4, 'HarperCollins'),
(5, 'Globo Livros'),
(6, 'Editora Moderna'),
(7, 'Record'),
(8, 'Intrínseca'),
(9, 'Leya'),
(10, 'Sextante'),
(11, 'Novo Conceito'),
(12, 'Ediouro'),
(13, 'Alfaguara'),
(14, 'Planeta'),
(15, 'Zahar');

INSERT INTO FUNCIONARIOS (id_funcionario, nome, posicao, salario) VALUES -- Insere os dados na tabela "FUNCIONARIOS".
(1, 'João Almeida', 'Bibliotecário', 1500.00),
(2, 'Maria Oliveira', 'Assistente', 1200.00),
(3, 'Pedro Santos', 'Administrador', 2000.00),
(4, 'Ana Costa', 'Catalogadora', 1400.00),
(5, 'Carlos Lima', 'Recepcionista', 1100.00),
(6, 'Beatriz Mendes', 'Atendente', 1300.00),
(7, 'Rafael Nogueira', 'Técnico', 1600.00),
(8, 'Carolina Ribeiro', 'Segurança', 1250.00),
(9, 'Ricardo Fernandes', 'Conservador', 1700.00),
(10, 'Sofia Gonçalves', 'Arquivista', 1550.00),
(11, 'André Martins', 'Curador', 1800.00),
(12, 'Mariana Sousa', 'Pesquisadora', 1350.00),
(13, 'Tiago Rodrigues', 'Restaurador', 1450.00),
(14, 'Juliana Farias', 'Bibliotecária', 1500.00),
(15, 'Fernando Rocha', 'Gerente', 2100.00);

INSERT INTO LIVROS (id_livro, titulo, Autores_id_autor, Categorias_id_categoria, Editoras_id_editora, preço) VALUES -- Insere os dados na tabela "LIVROS".
(1, 'Harry Potter e a Pedra Filosofal', 1, 4, 2, 20.00), 
(2, 'A Guerra dos Tronos', 2, 4, 1, 25.00), 
(3, 'A Sociedade do Anel', 3, 4, 3, 22.00), 
(4, 'Assassinato no Expresso do Oriente', 4, 3, 4, 15.00), 
(5, 'O Iluminado', 5, 9, 5, 18.00), 
(6, 'Orgulho e Preconceito', 6, 8, 6, 10.00), 
(7, 'As Aventuras de Tom Sawyer', 7, 11, 7, 12.00), 
(8, 'O Velho e o Mar', 8, 13, 8, 14.00), 
(9, 'O Grande Gatsby', 9, 1, 9, 16.00), 
(10, 'Um Conto de Duas Cidades', 10, 7, 10, 20.00), 
(11, 'Guerra e Paz', 11, 7, 11, 25.00), 
(12, 'Cem Anos de Solidão', 12, 4, 12, 18.00), 
(13, 'O Sol é para Todos', 13, 1, 13, 17.00), 
(14, 'Ilíada', 14, 14, 14, 15.00), 
(15, 'Hamlet', 15, 14, 15, 10.00),
(16, 'Os Lusíadas', 16, 11, 15, 10.00),
(17, 'Sonetos de Camões', 16, 11, 15, 10.00);

INSERT INTO COPIAS (id_copia, id_livro, quantidade_em_stock) VALUES -- Insere os dados na tabela "COPIAS".
(1, 1, 5),   -- 5 cópias de "Harry Potter e a Pedra Filosofal"
(2, 2, 3),   -- 3 cópias de "A Guerra dos Tronos"
(3, 3, 4),   -- 4 cópias de "A Sociedade do Anel"
(4, 4, 2),   -- 2 cópias de "Assassinato no Expresso do Oriente"
(5, 5, 1),   -- 1 cópia de "O Iluminado"
(6, 6, 6),   -- 6 cópias de "Orgulho e Preconceito"
(7, 7, 0),   -- 0 cópias de "As Aventuras de Tom Sawyer" (indisponível)
(8, 8, 3),   -- 2 cópias de "O Velho e o Mar"
(9, 9, 2),   -- 2 cópias de "O Grande Gatsby"
(10, 10, 0), -- 5 cópias de "Um Conto de Duas Cidades"
(11, 11, 0), -- 4 cópias de "Guerra e Paz"
(12, 12, 0), -- 1 cópia de "Cem Anos de Solidão"
(13, 13, 7), -- 7 cópias de "O Sol é para Todos"
(14, 14, 2), -- 2 cópias de "Ilíada"
(15, 15, 3); -- 3 cópias de "Hamlet"

INSERT INTO EMPRESTIMOS (id_emprestimo, id_membro, id_copia, data_emprestimo, data_devolucao_prevista, data_devolucao_real, multa) VALUES -- Insere os dados na tabela "EMPRESTIMOS".
(1, 1, 1, '2024-01-05', '2024-01-20', NULL, 0.00),  -- Emprestado a Ana Silva
(2, 2, 2, '2024-01-10', '2024-01-25', NULL, 0.00),  -- Emprestado a Bruno Souza
(3, 3, 3, '2024-01-15', '2024-02-01', NULL, 0.00),  -- Emprestado a Carla Mendes
(4, 4, 4, '2024-02-05', '2024-02-20', NULL, 0.00),  -- Emprestado a Daniel Costa
(5, 5, 5, '2024-02-15', '2024-03-01', NULL, 0.00),  -- Emprestado a Eduardo Lima
(6, 6, 6, '2024-03-01', '2024-03-15', NULL, 0.00),  -- Emprestado a Fernanda Rocha
(7, 7, 8, '2024-03-10', '2024-03-25', NULL, 0.00),  -- Emprestado a Gabriel Alves
(8, 8, 9, '2024-04-01', '2024-04-15', NULL, 0.00),  -- Emprestado a Helena Santos
(9, 9, 10, '2024-04-05', '2024-04-20', NULL, 0.00), -- Emprestado a Igor Nunes
(10, 10, 11, '2024-05-01', '2024-05-15', NULL, 0.00), -- Emprestado a Juliana Gomes
(11, 1, 2, '2024-01-05', '2024-01-20', NULL, 0.00),  -- Emprestado a Ana Silva
(12, 4, 8, '2024-02-05', '2024-02-20', NULL, 0.00),  -- Emprestado a Daniel Costa
(13, 4, 10, '2024-02-05', '2024-02-20', NULL, 0.00);  -- Emprestado a Daniel Costa
```

## 3. Agora que já temos a base de dados criada e com dados inseridos, vamos executar umas consultas à base de dados:

### 3.1. Esta primeira consulta trata-se de verificar que livros têm cópias disponíveis e a que autor os mesmos pertencem.
```
-- Os livros 7, 10, 11 e 12 não têm cópias por isso não devem aparecer!!

SELECT 
    L.id_livro as IDLivro,
    L.titulo as TítuloLivro,
    A.nome AS AutorLivro
FROM 
    LIVROS L
JOIN 
    AUTORES A ON L.Autores_id_autor = A.id_autor
JOIN 
    COPIAS C ON L.id_livro = C.id_livro
WHERE 
    C.quantidade_em_stock > 0;  -- Verifica se há cópias disponíveis
```

### 3.2 Esta segunda consulta trata-se de verificar que empréstimos de livros foram realiados num determinado período de tempo.

```
-- Devem aparecer os livros com ID: 4,5,6,12 e 13!

SELECT 
    E.id_emprestimo as IDEmprestimo,
    L.titulo as TítuloLivro,
    M.nome AS Membro,
    E.data_emprestimo as DiaDoEmprestimo
FROM 
    EMPRESTIMOS E
JOIN 
    COPIAS C ON E.id_copia = C.id_copia
JOIN 
    LIVROS L ON C.id_livro = L.id_livro
JOIN 
    MEMBROS M ON E.id_membro = M.id_membro
WHERE 
    E.data_emprestimo BETWEEN '2024-02-01' AND '2024-03-01'
LIMIT 0, 50000;
```

### 3.3. Esta terceira consulta trata-se de verificar que membros realizaram mais do que um empréstimo.

```
-- Devem aparecer o ID 4 e 1 com 3 copias e 2 copias respetivamente!!

SELECT 
    M.id_membro AS IDMembro,
    M.nome AS NomeMembro,
    COUNT(E.id_emprestimo) AS TotalEmprestimos
FROM 
    MEMBROS M
JOIN 
    EMPRESTIMOS E ON M.id_membro = E.id_membro
GROUP BY 
    M.id_membro, M.nome
HAVING 
    COUNT(E.id_emprestimo) > 1
ORDER BY 
    COUNT(E.id_emprestimo) DESC;
```

### 3.4. Esta quarta e última consulta trata-se de listar os livros de uma determinada categoria.

```
-- DEVE APARECER O ID 7, 16 e 17
SELECT 
    L.id_livro AS IDLivro,
    L.titulo AS TítuloLivro,
    C.id_categoria AS IDCategoria,
    C.nome AS NomeCategoria
FROM 
    LIVROS L
JOIN 
    CATEGORIAS C ON L.Categorias_id_categoria = C.id_categoria
WHERE 
    C.id_categoria = 11  -- ID da categoria que queremos!
ORDER BY 
    L.titulo;
```

## 4. O quarto passo é inserir na base de dados os triggers:

### 4.1. Este primeiro trigger atualiza a quantidade de stock dos livros consoante a realização de um empréstimo.

```
DELIMITER //

CREATE TRIGGER AtualizarQuantidadeEmStock
AFTER INSERT ON EMPRESTIMOS
FOR EACH ROW
BEGIN
    UPDATE COPIAS
    SET quantidade_em_stock = quantidade_em_stock - 1
    WHERE id_copia = NEW.id_copia;
END;
//

DELIMITER ;
```

### 4.2. Este segundo trigger volta a atualizar a quantidade de stock dos livros quando o mesmo for devolvido.

```
DELIMITER //

CREATE TRIGGER ReverterQuantidadeEmEstoque
AFTER UPDATE ON EMPRESTIMOS
FOR EACH ROW
BEGIN
    IF NEW.data_devolucao_real IS NOT NULL THEN
        UPDATE COPIAS
        SET quantidade_em_stock = quantidade_em_stock + 1
        WHERE id_copia = NEW.id_copia;
    END IF;
END;
//

DELIMITER ;
```

#### Para verificar a funcionalidade destes triggers iremos executar o seguinte código:

```
-- TESTE DEPOIS DE ATIVAR O TRIGGER:
select quantidade_em_stock as CopiasOriginais from COPIAS where id_livro = 1;

DELETE FROM `biblioteca`.`EMPRESTIMOS`
WHERE `id_emprestimo` = 14;

INSERT INTO `biblioteca`.`EMPRESTIMOS` (`id_emprestimo`, `id_membro`, `id_copia`, `data_emprestimo`, `data_devolucao_prevista`, `data_devolucao_real`, `multa`) VALUES
(14,
1,
1,
'2024-07-15',
'2024-07-25',
NULL,
0.00);
select quantidade_em_stock as CopiasAntesDaDevolucao from COPIAS where id_livro = 1;
UPDATE `biblioteca`.`EMPRESTIMOS`
SET `data_devolucao_real` = '2024-07-20'
WHERE `id_emprestimo` = 14;
select quantidade_em_stock as CopiasDepoisDaDevolucao from COPIAS where id_copia = 1
```

### 4.3. Este terceiro trigger impede a inserção de um empréstimo se não houver stock de livros.

```
DELIMITER //

CREATE TRIGGER check_copia_stock
BEFORE INSERT ON EMPRESTIMOS
FOR EACH ROW
BEGIN
    DECLARE stock INT;

    -- Verifica a quantidade em estoque da cópia
    SELECT quantidade_em_stock INTO stock
    FROM COPIAS
    WHERE id_copia = NEW.id_copia;

    -- Se não houver cópias em estoque, impede a inserção
    IF stock <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não há cópias disponíveis desse livro para empréstimo!';
    END IF;
END; //

DELIMITER ;
```

#### Para verificar a funcionalidade deste trigger iremos executar o seguinte código:

```
-- TESTE DEPOIS DE ATIVAR O TRIGGER:
DELETE FROM `biblioteca`.`EMPRESTIMOS` WHERE `id_emprestimo` = 14;
UPDATE `biblioteca`.`COPIAS` SET `quantidade_em_stock` = '0' WHERE (`id_copia` = '7');
UPDATE `biblioteca`.`COPIAS` SET `quantidade_em_stock` = '2' WHERE (`id_copia` = '8');
INSERT INTO EMPRESTIMOS (id_emprestimo, id_membro, id_copia, data_emprestimo, data_devolucao_prevista, data_devolucao_real, multa)
VALUES (14, 1, 7, '2024-07-10', '2024-07-25', NULL, 0.00);  -- DEVE DAR ERRO!
INSERT INTO EMPRESTIMOS (id_emprestimo, id_membro, id_copia, data_emprestimo, data_devolucao_prevista, data_devolucao_real, multa)
VALUES (14, 1, 8, '2024-07-10', '2024-07-25', NULL, 0.00);  -- DEVE CRIAR O REGISTO!!
```

## 5. O quinto passo é inserir na base de dados os Stored Procedures:

### 5.1. Este primeiro Stored Procedure serve para registar um novo empréstimo.

```
DELIMITER //

CREATE PROCEDURE registrar_emprestimo(
    IN p_id_membro INT,
    IN p_id_copia INT,
    IN p_data_emprestimo DATE,
    IN p_data_devolucao_prevista DATE,
    OUT p_mensagem VARCHAR(255)
)
BEGIN
    DECLARE v_quantidade_em_stock INT;

    -- Verifica a quantidade em stock da cópia
    SELECT quantidade_em_stock INTO v_quantidade_em_stock
    FROM COPIAS
    WHERE id_copia = p_id_copia;

    -- Se não houver cópias em stock, define uma mensagem de erro
    IF v_quantidade_em_stock <= 0 THEN
        SET p_mensagem = 'Não há cópias disponíveis para empréstimo!';
    ELSE
        -- Insere o novo empréstimo
        INSERT INTO EMPRESTIMOS (id_membro, id_copia, data_emprestimo, data_devolucao_prevista, data_devolucao_real, multa)
        VALUES (p_id_membro, p_id_copia, p_data_emprestimo, p_data_devolucao_prevista, NULL, 0.00);

        -- Atualiza a quantidade em stock
        UPDATE COPIAS
        SET quantidade_em_stock = quantidade_em_stock - 1
        WHERE id_copia = p_id_copia;

        -- Define uma mensagem de sucesso
        SET p_mensagem = 'Empréstimo registrado com sucesso!';
    END IF;
END; //

DELIMITER ;
```

#### Para verificar a funcionalidade deste Stored Procedure iremos executar o seguinte código:

```
-- TESTE DO STORED PROCEDURE:
CALL registrar_emprestimo(1, 1, '2024-07-15', '2024-07-30', @mensagem);  -- DEVE REGISTAR O EMPRESTIMO!!
SELECT @mensagem;                                                        -- DEVE REGISTAR O EMRPESTIMO!!

CALL registrar_emprestimo(1, 7, '2024-07-15', '2024-07-30', @mensagem);  -- NÃO DEVE REGISTAR O EMPRESTIMO!!
SELECT @mensagem;                                                        -- NÃO DEVE REGISTAR O EMRPESTIMO!!
```

### 5.2. Este segundo Stored Procedure serve para atualizar os dados de um membro da biblioteca.

```
DELIMITER //

CREATE PROCEDURE atualizar_membro(
    IN p_id_membro INT,
    IN p_nome VARCHAR(20),
    IN p_telefone VARCHAR(10),
    IN p_email VARCHAR(200),
    OUT p_mensagem VARCHAR(255)
)
BEGIN
    -- Verifica se o membro existe
    IF EXISTS (SELECT 1 FROM MEMBROS WHERE id_membro = p_id_membro) THEN
        -- Atualiza os dados do membro
        UPDATE MEMBROS
        SET nome = p_nome,
            telefone = p_telefone,
            email = p_email
        WHERE id_membro = p_id_membro;

        -- Define uma mensagem de sucesso
        SET p_mensagem = 'Dados do membro atualizados com sucesso!';
    ELSE
        -- Define uma mensagem de erro
        SET p_mensagem = 'Membro não encontrado!';
    END IF;
END; //

DELIMITER ;
```

#### Para verificar a funcionalidade deste Stored Procedure iremos executar o seguinte código:

```
-- TESTE DO STORED PROCEDURE:
CALL atualizar_membro(1, 'Ana Maria Silva', '912345679', 'ana.maria.silva@gmail.com', @mensagem); -- DEVE ALTERAR OS DADOS
SELECT @mensagem;                                                                                 -- DEVE ALTERAR OS DADOS

CALL atualizar_membro(100, 'Nome Inexistente', '0000000000', 'inexistente@email.com', @mensagem); -- NÃO DEVE ALTERAR OS DADOS
SELECT @mensagem;                                                                                 -- NÃO DEVE ALTERAR OS DADOS
```

### 5.3. Este terceiro Stored Procedure serve para calcular o total de empréstimos realizados durante um determinado período.

```
DELIMITER //

CREATE PROCEDURE calcular_total_emprestimos(
    IN p_data_inicio DATE,
    IN p_data_fim DATE,
    OUT p_total_emprestimos INT
)
BEGIN
    -- Calcula o total de empréstimos no período especificado
    SELECT COUNT(*) INTO p_total_emprestimos
    FROM EMPRESTIMOS
    WHERE data_emprestimo BETWEEN p_data_inicio AND p_data_fim;
END; //

DELIMITER ;
```

#### Para verificar a funcionalidade deste Stored Procedure iremos executar o seguinte código:

```
-- TESTE DO STORED PROCEDURE:
CALL calcular_total_emprestimos('2024-01-01', '2024-03-31', @total_emprestimos);  -- DEVE DAR 10
SELECT @total_emprestimos;                                                        -- DEVE DAR 10

CALL calcular_total_emprestimos('2024-04-01', '2024-06-30', @total_emprestimos);  -- DEVE DAR 3
SELECT @total_emprestimos;                                                        -- DEVE DAR 3
```

## 6. O sexto passo é inserir na base de dados um Cursor:

### 6.1. Este cursor fornece um relatório de todos os livros e quantidade de vezes que foi emprestado durante um determinado período.

```
DELIMITER //

CREATE PROCEDURE relatorio_emprestimos_livros(
    IN p_data_inicio DATE,
    IN p_data_fim DATE
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id_livro INT;
    DECLARE v_titulo VARCHAR(200);
    DECLARE v_quantidade_emprestada INT;
    
    -- Declara um cursor para iterar sobre todos os livros
    DECLARE cursor_livros CURSOR FOR
    SELECT id_livro, titulo FROM LIVROS;
    
    -- Declara um handler para o fim do cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Cria uma tabela temporária para armazenar os resultados do relatório
    CREATE TEMPORARY TABLE IF NOT EXISTS RelatorioEmprestimos (
        id_livro INT,
        titulo VARCHAR(200),
        quantidade_emprestada INT
    );
    
    -- Abre o cursor
    OPEN cursor_livros;
    
    -- Loop para iterar sobre todos os livros
    read_loop: LOOP
        FETCH cursor_livros INTO v_id_livro, v_titulo;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Conta o número de empréstimos para o livro atual no período especificado
        SELECT COUNT(*) INTO v_quantidade_emprestada
        FROM EMPRESTIMOS e
        JOIN COPIAS c ON e.id_copia = c.id_copia
        WHERE c.id_livro = v_id_livro AND e.data_emprestimo BETWEEN p_data_inicio AND p_data_fim;
        
        -- Insere o resultado na tabela temporária
        INSERT INTO RelatorioEmprestimos (id_livro, titulo, quantidade_emprestada)
        VALUES (v_id_livro, v_titulo, v_quantidade_emprestada);
    END LOOP;
    
    -- Fecha o cursor
    CLOSE cursor_livros;
    
    -- Seleciona os resultados do relatório
    SELECT * FROM RelatorioEmprestimos;
    
    -- Remove a tabela temporária
    DROP TEMPORARY TABLE IF EXISTS RelatorioEmprestimos;
END; //

DELIMITER ;
```

#### Para verificar a funcionalidade deste Cursor iremos executar o seguinte código:

```
-- TESTE DO STORED PROCEDURE:
CALL relatorio_emprestimos_livros('2024-01-01', '2024-03-31');
```

## Conclusão

A base de dados "biblioteca" foi projetada para gerenciar eficientemente as operações e informações relacionadas a uma biblioteca típica. A estrutura e funcionalidades desenvolvidas visam facilitar o controle de livros, membros, empréstimos e devoluções, garantindo integridade e desempenho no gerenciamento dos dados. Com tabelas bem estruturadas, procedimentos armazenados (stored procedures), consultas (queries), cursores (cursors) e triggers, ela proporciona uma base sólida para operações eficientes e confiáveis.
