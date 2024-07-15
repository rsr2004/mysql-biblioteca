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

-- TESTE DO STORED PROCEDURE:
CALL registrar_emprestimo(1, 1, '2024-07-15', '2024-07-30', @mensagem);  -- DEVE REGISTAR O EMPRESTIMO!!
SELECT @mensagem;                                                        -- DEVE REGISTAR O EMRPESTIMO!!

CALL registrar_emprestimo(1, 7, '2024-07-15', '2024-07-30', @mensagem);  -- NÃO DEVE REGISTAR O EMPRESTIMO!!
SELECT @mensagem;                                                        -- NÃO DEVE REGISTAR O EMRPESTIMO!!