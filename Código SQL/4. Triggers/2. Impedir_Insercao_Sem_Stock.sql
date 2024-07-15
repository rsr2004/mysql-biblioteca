DROP TRIGGER IF EXISTS check_copia_stock;

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

-- TESTE DEPOIS DE ATIVAR O TRIGGER:
DELETE FROM `biblioteca`.`EMPRESTIMOS` WHERE `id_emprestimo` = 14;
UPDATE `biblioteca`.`COPIAS` SET `quantidade_em_stock` = '0' WHERE (`id_copia` = '7');
UPDATE `biblioteca`.`COPIAS` SET `quantidade_em_stock` = '2' WHERE (`id_copia` = '8');
INSERT INTO EMPRESTIMOS (id_emprestimo, id_membro, id_copia, data_emprestimo, data_devolucao_prevista, data_devolucao_real, multa)
VALUES (14, 1, 7, '2024-07-10', '2024-07-25', NULL, 0.00);  -- DEVE DAR ERRO!
INSERT INTO EMPRESTIMOS (id_emprestimo, id_membro, id_copia, data_emprestimo, data_devolucao_prevista, data_devolucao_real, multa)
VALUES (14, 1, 8, '2024-07-10', '2024-07-25', NULL, 0.00);  -- DEVE CRIAR O REGISTO!!