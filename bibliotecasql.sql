/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
DROP DATABASE IF EXISTS `biblioteca`;
CREATE DATABASE IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE biblioteca;
DROP TABLE IF EXISTS `AUTORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTORES` (
  `id_autor` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `biografia` text,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `AUTORES` WRITE;
/*!40000 ALTER TABLE `AUTORES` DISABLE KEYS */;
INSERT INTO `AUTORES` VALUES (1,'J.K. Rowling','Autora da série Harry Potter'),(2,'George R.R. Martin','Autor da série As Crônicas de Gelo e Fogo'),(3,'J.R.R. Tolkien','Autor de O Senhor dos Anéis'),(4,'Agatha Christie','Famosa escritora de mistério'),(5,'Stephen King','Autor de romances de terror'),(6,'Jane Austen','Romancista clássica inglesa'),(7,'Mark Twain','Autor americano conhecido por As Aventuras de Tom Sawyer'),(8,'Ernest Hemingway','Autor de O Velho e o Mar'),(9,'F. Scott Fitzgerald','Autor de O Grande Gatsby'),(10,'Charles Dickens','Prolífico romancista vitoriano'),(11,'Leo Tolstoy','Autor russo de Guerra e Paz'),(12,'Gabriel Garcia Marquez','Autor de Cem Anos de Solidão'),(13,'Harper Lee','Autora de O Sol é para Todos'),(14,'Homero','Poeta épico grego antigo'),(15,'William Shakespeare','Dramaturgo e poeta inglês'),(16,'Luís de Camões','Poeta Português');
/*!40000 ALTER TABLE `AUTORES` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `CATEGORIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORIAS` (
  `id_categoria` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `CATEGORIAS` WRITE;
/*!40000 ALTER TABLE `CATEGORIAS` DISABLE KEYS */;
INSERT INTO `CATEGORIAS` VALUES (1,'Ficção'),(2,'Não Ficção'),(3,'Mistério'),(4,'Fantasia'),(5,'Ficção Científica'),(6,'Biografia'),(7,'História'),(8,'Romance'),(9,'Terror'),(10,'Autoajuda'),(11,'Infantil'),(12,'Juvenil'),(13,'Suspense'),(14,'Filosofia'),(15,'Poesia');
/*!40000 ALTER TABLE `CATEGORIAS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `COPIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COPIAS` (
  `id_copia` int NOT NULL AUTO_INCREMENT,
  `id_livro` int NOT NULL,
  `quantidade_em_stock` int NOT NULL,
  PRIMARY KEY (`id_copia`),
  KEY `id_livro` (`id_livro`),
  CONSTRAINT `COPIAS_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `LIVROS` (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `COPIAS` WRITE;
/*!40000 ALTER TABLE `COPIAS` DISABLE KEYS */;
INSERT INTO `COPIAS` VALUES (1,1,5),(2,2,3),(3,3,4),(4,4,2),(5,5,1),(6,6,6),(7,7,0),(8,8,3),(9,9,2),(10,10,0),(11,11,0),(12,12,0),(13,13,7),(14,14,2),(15,15,3);
/*!40000 ALTER TABLE `COPIAS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `COTAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COTAS` (
  `id_cota` int NOT NULL,
  `id_membro` int DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `pago` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_cota`),
  KEY `id_membro` (`id_membro`),
  CONSTRAINT `COTAS_ibfk_1` FOREIGN KEY (`id_membro`) REFERENCES `MEMBROS` (`id_membro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `COTAS` WRITE;
/*!40000 ALTER TABLE `COTAS` DISABLE KEYS */;
INSERT INTO `COTAS` VALUES (1,1,'2024-01-01',10.00,1),(2,2,'2024-01-15',12.00,1),(3,3,'2024-02-01',11.50,1),(4,4,'2024-02-15',10.00,0),(5,5,'2024-03-01',10.00,1),(6,6,'2024-03-15',12.00,1),(7,7,'2024-04-01',10.00,0),(8,8,'2024-04-15',10.00,1),(9,9,'2024-05-01',10.00,1),(10,10,'2024-05-15',12.00,1),(11,11,'2024-06-01',10.00,1),(12,12,'2024-06-15',10.00,0),(13,13,'2024-07-01',12.00,1),(14,14,'2024-07-15',10.00,1),(15,15,'2024-08-01',10.00,0);
/*!40000 ALTER TABLE `COTAS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `EDICOES_ESPECIAIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDICOES_ESPECIAIS` (
  `id_edicao_especial` int NOT NULL,
  `id_livro` int DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`id_edicao_especial`),
  KEY `id_livro` (`id_livro`),
  CONSTRAINT `EDICOES_ESPECIAIS_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `LIVROS` (`id_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `EDICOES_ESPECIAIS` WRITE;
/*!40000 ALTER TABLE `EDICOES_ESPECIAIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `EDICOES_ESPECIAIS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `EDITORAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDITORAS` (
  `id_editora` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `EDITORAS` WRITE;
/*!40000 ALTER TABLE `EDITORAS` DISABLE KEYS */;
INSERT INTO `EDITORAS` VALUES (1,'Companhia das Letras'),(2,'Editora Rocco'),(3,'Saraiva'),(4,'HarperCollins'),(5,'Globo Livros'),(6,'Editora Moderna'),(7,'Record'),(8,'Intrínseca'),(9,'Leya'),(10,'Sextante'),(11,'Novo Conceito'),(12,'Ediouro'),(13,'Alfaguara'),(14,'Planeta'),(15,'Zahar');
/*!40000 ALTER TABLE `EDITORAS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `EMPRESTIMOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPRESTIMOS` (
  `id_emprestimo` int NOT NULL,
  `id_membro` int DEFAULT NULL,
  `id_copia` int DEFAULT NULL,
  `data_emprestimo` date DEFAULT NULL,
  `data_devolucao_prevista` date DEFAULT NULL,
  `data_devolucao_real` date DEFAULT NULL,
  `multa` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_emprestimo`),
  KEY `id_membro` (`id_membro`),
  KEY `id_copia` (`id_copia`),
  CONSTRAINT `EMPRESTIMOS_ibfk_1` FOREIGN KEY (`id_membro`) REFERENCES `MEMBROS` (`id_membro`),
  CONSTRAINT `EMPRESTIMOS_ibfk_2` FOREIGN KEY (`id_copia`) REFERENCES `COPIAS` (`id_copia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `EMPRESTIMOS` WRITE;
/*!40000 ALTER TABLE `EMPRESTIMOS` DISABLE KEYS */;
INSERT INTO `EMPRESTIMOS` VALUES (1,1,1,'2024-01-05','2024-01-20',NULL,0.00),(2,2,2,'2024-01-10','2024-01-25',NULL,0.00),(3,3,3,'2024-01-15','2024-02-01',NULL,0.00),(4,4,4,'2024-02-05','2024-02-20',NULL,0.00),(5,5,5,'2024-02-15','2024-03-01',NULL,0.00),(6,6,6,'2024-03-01','2024-03-15',NULL,0.00),(7,7,8,'2024-03-10','2024-03-25',NULL,0.00),(8,8,9,'2024-04-01','2024-04-15',NULL,0.00),(9,9,10,'2024-04-05','2024-04-20',NULL,0.00),(10,10,11,'2024-05-01','2024-05-15',NULL,0.00),(11,1,2,'2024-01-05','2024-01-20',NULL,0.00),(12,4,8,'2024-02-05','2024-02-20',NULL,0.00),(13,4,10,'2024-02-05','2024-02-20',NULL,0.00);
/*!40000 ALTER TABLE `EMPRESTIMOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `check_copia_stock` BEFORE INSERT ON `EMPRESTIMOS` FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AtualizarQuantidadeEmStock` AFTER INSERT ON `EMPRESTIMOS` FOR EACH ROW BEGIN
    UPDATE COPIAS
    SET quantidade_em_stock = quantidade_em_stock - 1
    WHERE id_copia = NEW.id_copia;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ReverterQuantidadeEmEstoque` AFTER UPDATE ON `EMPRESTIMOS` FOR EACH ROW BEGIN
    IF NEW.data_devolucao_real IS NOT NULL THEN
        UPDATE COPIAS
        SET quantidade_em_stock = quantidade_em_stock + 1
        WHERE id_copia = NEW.id_copia;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
DROP TABLE IF EXISTS `FUNCIONARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FUNCIONARIOS` (
  `id_funcionario` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `posicao` varchar(100) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `FUNCIONARIOS` WRITE;
/*!40000 ALTER TABLE `FUNCIONARIOS` DISABLE KEYS */;
INSERT INTO `FUNCIONARIOS` VALUES (1,'João Almeida','Bibliotecário',1500.00),(2,'Maria Oliveira','Assistente',1200.00),(3,'Pedro Santos','Administrador',2000.00),(4,'Ana Costa','Catalogadora',1400.00),(5,'Carlos Lima','Recepcionista',1100.00),(6,'Beatriz Mendes','Atendente',1300.00),(7,'Rafael Nogueira','Técnico',1600.00),(8,'Carolina Ribeiro','Segurança',1250.00),(9,'Ricardo Fernandes','Conservador',1700.00),(10,'Sofia Gonçalves','Arquivista',1550.00),(11,'André Martins','Curador',1800.00),(12,'Mariana Sousa','Pesquisadora',1350.00),(13,'Tiago Rodrigues','Restaurador',1450.00),(14,'Juliana Farias','Bibliotecária',1500.00),(15,'Fernando Rocha','Gerente',2100.00);
/*!40000 ALTER TABLE `FUNCIONARIOS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `LIVROS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIVROS` (
  `id_livro` int NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `Autores_id_autor` int DEFAULT NULL,
  `Categorias_id_categoria` int DEFAULT NULL,
  `Editoras_id_editora` int DEFAULT NULL,
  `preço` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_livro`),
  KEY `Autores_id_autor` (`Autores_id_autor`),
  KEY `Categorias_id_categoria` (`Categorias_id_categoria`),
  KEY `Editoras_id_editora` (`Editoras_id_editora`),
  CONSTRAINT `LIVROS_ibfk_1` FOREIGN KEY (`Autores_id_autor`) REFERENCES `AUTORES` (`id_autor`),
  CONSTRAINT `LIVROS_ibfk_2` FOREIGN KEY (`Categorias_id_categoria`) REFERENCES `CATEGORIAS` (`id_categoria`),
  CONSTRAINT `LIVROS_ibfk_3` FOREIGN KEY (`Editoras_id_editora`) REFERENCES `EDITORAS` (`id_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `LIVROS` WRITE;
/*!40000 ALTER TABLE `LIVROS` DISABLE KEYS */;
INSERT INTO `LIVROS` VALUES (1,'Harry Potter e a Pedra Filosofal',1,4,2,20.00),(2,'A Guerra dos Tronos',2,4,1,25.00),(3,'A Sociedade do Anel',3,4,3,22.00),(4,'Assassinato no Expresso do Oriente',4,3,4,15.00),(5,'O Iluminado',5,9,5,18.00),(6,'Orgulho e Preconceito',6,8,6,10.00),(7,'As Aventuras de Tom Sawyer',7,11,7,12.00),(8,'O Velho e o Mar',8,13,8,14.00),(9,'O Grande Gatsby',9,1,9,16.00),(10,'Um Conto de Duas Cidades',10,7,10,20.00),(11,'Guerra e Paz',11,7,11,25.00),(12,'Cem Anos de Solidão',12,4,12,18.00),(13,'O Sol é para Todos',13,1,13,17.00),(14,'Ilíada',14,14,14,15.00),(15,'Hamlet',15,14,15,10.00),(16,'Os Lusíadas',16,11,15,10.00),(17,'Sonetos de Camões',16,11,15,10.00);
/*!40000 ALTER TABLE `LIVROS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `MEMBROS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEMBROS` (
  `id_membro` int NOT NULL,
  `nome` varchar(20) NOT NULL,
  `telefone` varchar(10) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_membro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `MEMBROS` WRITE;
/*!40000 ALTER TABLE `MEMBROS` DISABLE KEYS */;
INSERT INTO `MEMBROS` VALUES (1,'Ana Silva','912345678','ana.silva@gmail.com'),(2,'Bruno Souza','922345679','bruno.souza@yahoo.com'),(3,'Carla Mendes','932345680','carla.mendes@outlook.com'),(4,'Daniel Costa','912345681','daniel.costa@gmail.com'),(5,'Eduardo Lima','922345682','eduardo.lima@yahoo.com'),(6,'Fernanda Rocha','932345683','fernanda.rocha@outlook.com'),(7,'Gabriel Alves','912345684','gabriel.alves@gmail.com'),(8,'Helena Santos','922345685','helena.santos@yahoo.com'),(9,'Igor Nunes','932345686','igor.nunes@outlook.com'),(10,'Juliana Gomes','912345687','juliana.gomes@gmail.com'),(11,'Lucas Pereira','922345688','lucas.pereira@yahoo.com'),(12,'Mariana Barbosa','932345689','mariana.barbosa@outlook.com'),(13,'Nuno Fernandes','912345690','nuno.fernandes@gmail.com'),(14,'Olivia Martins','922345691','olivia.martins@yahoo.com'),(15,'Paulo Silva','932345692','paulo.silva@outlook.com');
/*!40000 ALTER TABLE `MEMBROS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `RESTRICAO_EM_LIVRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESTRICAO_EM_LIVRO` (
  `id_restricao_em_livro` int NOT NULL,
  `id_edicao_especial` int DEFAULT NULL,
  `tipo_restricao` varchar(10) DEFAULT NULL,
  `Funcionarios_id_funcionario` int DEFAULT NULL,
  PRIMARY KEY (`id_restricao_em_livro`),
  KEY `id_edicao_especial` (`id_edicao_especial`),
  KEY `Funcionarios_id_funcionario` (`Funcionarios_id_funcionario`),
  CONSTRAINT `RESTRICAO_EM_LIVRO_ibfk_1` FOREIGN KEY (`id_edicao_especial`) REFERENCES `EDICOES_ESPECIAIS` (`id_edicao_especial`),
  CONSTRAINT `RESTRICAO_EM_LIVRO_ibfk_2` FOREIGN KEY (`Funcionarios_id_funcionario`) REFERENCES `FUNCIONARIOS` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `RESTRICAO_EM_LIVRO` WRITE;
/*!40000 ALTER TABLE `RESTRICAO_EM_LIVRO` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESTRICAO_EM_LIVRO` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 DROP PROCEDURE IF EXISTS `atualizar_membro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `atualizar_membro`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calcular_total_emprestimos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `calcular_total_emprestimos`(
    IN p_data_inicio DATE,
    IN p_data_fim DATE,
    OUT p_total_emprestimos INT
)
BEGIN
    -- Calcula o total de empréstimos no período especificado
    SELECT COUNT(*) INTO p_total_emprestimos
    FROM EMPRESTIMOS
    WHERE data_emprestimo BETWEEN p_data_inicio AND p_data_fim;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_emprestimo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `registrar_emprestimo`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `relatorio_emprestimos_livros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `relatorio_emprestimos_livros`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
