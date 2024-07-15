INSERT INTO MEMBROS (id_membro, nome, telefone, email) VALUES
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

INSERT INTO COTAS (id_cota, id_membro, data_pagamento, valor, pago) VALUES
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

INSERT INTO AUTORES (id_autor, nome, biografia) VALUES
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

INSERT INTO CATEGORIAS (id_categoria, nome) VALUES
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

INSERT INTO EDITORAS (id_editora, nome) VALUES
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

INSERT INTO FUNCIONARIOS (id_funcionario, nome, posicao, salario) VALUES
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

INSERT INTO LIVROS (id_livro, titulo, Autores_id_autor, Categorias_id_categoria, Editoras_id_editora, preço) VALUES
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

INSERT INTO COPIAS (id_copia, id_livro, quantidade_em_stock) VALUES
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

INSERT INTO EMPRESTIMOS (id_emprestimo, id_membro, id_copia, data_emprestimo, data_devolucao_prevista, data_devolucao_real, multa) VALUES
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