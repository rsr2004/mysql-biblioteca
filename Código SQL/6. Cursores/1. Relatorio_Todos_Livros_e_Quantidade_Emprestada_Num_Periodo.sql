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

-- TESTE DO STORED PROCEDURE:
CALL relatorio_emprestimos_livros('2024-01-01', '2024-03-31');
