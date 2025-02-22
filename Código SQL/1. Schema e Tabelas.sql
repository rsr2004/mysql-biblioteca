DROP DATABASE IF EXISTS `biblioteca`;
CREATE DATABASE IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE biblioteca;

CREATE TABLE MEMBROS (
    id_membro INT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    telefone VARCHAR(10),
    email VARCHAR(200)
);

CREATE TABLE COTAS (
    id_cota INT PRIMARY KEY,
    id_membro INT,
    data_pagamento DATE,
    valor DECIMAL(10,2),
    pago TINYINT(1),
    FOREIGN KEY (id_membro) REFERENCES MEMBROS(id_membro)
);

CREATE TABLE AUTORES (
    id_autor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    biografia TEXT
);

CREATE TABLE CATEGORIAS (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE EDITORAS (
    id_editora INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE FUNCIONARIOS (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    posicao VARCHAR(100),
    salario DECIMAL(10, 2)
);

CREATE TABLE LIVROS (
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

CREATE TABLE EDICOES_ESPECIAIS (
    id_edicao_especial INT PRIMARY KEY,
    id_livro INT,
    descricao TEXT,
    FOREIGN KEY (id_livro) REFERENCES LIVROS(id_livro)
);

CREATE TABLE RESTRICAO_EM_LIVRO (
    id_restricao_em_livro INT PRIMARY KEY,
    id_edicao_especial INT,
    tipo_restricao VARCHAR(10),
    Funcionarios_id_funcionario INT,
    FOREIGN KEY (id_edicao_especial) REFERENCES EDICOES_ESPECIAIS(id_edicao_especial),
    FOREIGN KEY (Funcionarios_id_funcionario) REFERENCES FUNCIONARIOS(id_funcionario)
);

CREATE TABLE COPIAS (
    id_copia INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT NOT NULL,
    quantidade_em_stock INT NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES LIVROS(id_livro)
);

CREATE TABLE EMPRESTIMOS (
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

