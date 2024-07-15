-- Devem aparecer os livros com ID: 4,5,6,12 e 13!

SELECT 
    E.id_emprestimo as IDEmprestimo,
    L.titulo as TítuloLivro,
    M.nome AS Membro,
    E.data_emprestimo as DiaDoEmprestimo
FROM 
    EMPRESTIMOS E
JOIN 
    COPIAS C ON E.id_copia = C.id_copia
JOIN 
    LIVROS L ON C.id_livro = L.id_livro
JOIN 
    MEMBROS M ON E.id_membro = M.id_membro
WHERE 
    E.data_emprestimo BETWEEN '2024-02-01' AND '2024-03-01'
LIMIT 0, 50000;
