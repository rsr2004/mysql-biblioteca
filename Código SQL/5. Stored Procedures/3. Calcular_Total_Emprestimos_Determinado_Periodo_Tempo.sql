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

-- TESTE DO STORED PROCEDURE:
CALL calcular_total_emprestimos('2024-01-01', '2024-03-31', @total_emprestimos);  -- DEVE DAR 10
SELECT @total_emprestimos;                                                        -- DEVE DAR 10

CALL calcular_total_emprestimos('2024-04-01', '2024-06-30', @total_emprestimos);  -- DEVE DAR 3
SELECT @total_emprestimos;                                                        -- DEVE DAR 3
