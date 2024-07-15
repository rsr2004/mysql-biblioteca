-- Os livros 7, 10, 11 e 12 não têm cópias por isso não devem aparecer!!

SELECT 
    L.id_livro as IDLivro,
    L.titulo as TítuloLivro,
    A.nome AS AutorLivro
FROM 
    LIVROS L
JOIN 
    AUTORES A ON L.Autores_id_autor = A.id_autor
JOIN 
    COPIAS C ON L.id_livro = C.id_livro
WHERE 
    C.quantidade_em_stock > 0;  -- Verifica se há cópias disponíveis
