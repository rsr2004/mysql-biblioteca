-- DEVE APARECER O ID 7, 16 e 17
SELECT 
    L.id_livro AS IDLivro,
    L.titulo AS TítuloLivro,
    C.id_categoria AS IDCategoria,
    C.nome AS NomeCategoria
FROM 
    LIVROS L
JOIN 
    CATEGORIAS C ON L.Categorias_id_categoria = C.id_categoria
WHERE 
    C.id_categoria = 11  -- ID da categoria que queremos!
ORDER BY 
    L.titulo;
