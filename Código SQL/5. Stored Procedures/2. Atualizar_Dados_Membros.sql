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

-- TESTE DO STORED PROCEDURE:
CALL atualizar_membro(1, 'Ana Maria Silva', '912345679', 'ana.maria.silva@gmail.com', @mensagem); -- DEVE ALTERAR OS DADOS
SELECT @mensagem;                                                                                 -- DEVE ALTERAR OS DADOS

CALL atualizar_membro(100, 'Nome Inexistente', '0000000000', 'inexistente@email.com', @mensagem); -- NÃO DEVE ALTERAR OS DADOS
SELECT @mensagem;                                                                                 -- NÃO DEVE ALTERAR OS DADOS
