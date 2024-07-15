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
