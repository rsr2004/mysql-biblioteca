DROP TRIGGER IF EXISTS AtualizarQuantidadeEmStock
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



-- ############################################################ EXTRA ############################################################ --
DROP TRIGGER IF EXISTS ReverterQuantidadeEmEstoque

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

-- TESTE DEPOIS DE ATIVAR O TRIGGER:

UPDATE `biblioteca`.`EMPRESTIMOS`
SET `data_devolucao_real` = '2024-07-20'
WHERE `id_emprestimo` = 14;
select quantidade_em_stock as CopiasDepoisDaDevolucao from COPIAS where id_copia = 1
