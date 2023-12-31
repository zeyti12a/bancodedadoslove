SELECT titulo FROM livros;
SELECT nome FROM autores WHERE nascimento < '1900-01-01';
SELECT titulo FROM livros WHERE autor_id = 1;
SELECT alunos.nome
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id
WHERE matriculas.curso = 'Engenharia de Software';
SELECT produto, SUM(receita) AS receita_total
FROM vendas
GROUP BY produto;
SELECT autores.nome, COUNT(livros.id) AS total_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome;
SELECT curso, COUNT(aluno_id) AS total_alunos
FROM matriculas
GROUP BY curso;
SELECT produto, AVG(receita) AS media_receita
FROM vendas
GROUP BY produto;
SELECT produto, SUM(receita) AS receita_total
FROM vendas
GROUP BY produto
HAVING receita_total > 10000.00;
SELECT autores.nome
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome
HAVING COUNT(livros.id) > 2;
SELECT livros.titulo, autores.nome AS autor
FROM livros
INNER JOIN autores ON livros.autor_id = autores.id;
SELECT alunos.nome, matriculas.curso
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id;
SELECT autores.nome, livros.titulo
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id;
SELECT cursos.curso, alunos.nome
FROM cursos
RIGHT JOIN matriculas ON cursos.curso = matriculas.curso
RIGHT JOIN alunos ON matriculas.aluno_id = alunos.id;
SELECT alunos.nome, matriculas.curso
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id;
SELECT autores.nome, COUNT(livros.id) AS total_livros_publicados
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome
ORDER BY total_livros_publicados DESC
LIMIT 1;
SELECT produto, SUM(receita) AS receita_total
FROM vendas
GROUP BY produto
ORDER BY receita_total ASC
LIMIT 1;
SELECT alunos.nome, COUNT(matriculas.id) AS total_matriculas
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.nome;
SELECT produto, COUNT(id) AS quantidade_de_transacoes
FROM vendas
GROUP BY produto
ORDER BY quantidade_de_transacoes DESC
LIMIT 1;

atividade 2 

DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN
    SELECT * FROM Autor;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    SELECT COUNT(Livro.Titulo) AS TotalLivros
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    DECLARE contador INT;
    
    SELECT COUNT(*) INTO contador
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
    
    IF contador > 0 THEN
        SELECT 'Existem livros nesta categoria.' AS Mensagem;
    ELSE
        SELECT 'Não existem livros nesta categoria.' AS Mensagem;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_LivrosAteAno(IN anoPublicacao INT)
BEGIN
    SELECT Titulo
    FROM Livro
    WHERE Ano_Publicacao <= anoPublicacao;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_TitulosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_AdicionarLivro(IN livroTitulo VARCHAR(255), IN editoraID INT, IN anoPublicacao INT, IN numeroPaginas INT, IN categoriaID INT)
BEGIN
    DECLARE livroExiste INT;
    
    SELECT COUNT(*) INTO livroExiste
    FROM Livro
    WHERE Titulo = livroTitulo;
    
    IF livroExiste = 0 THEN
        INSERT INTO Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        VALUES (livroTitulo, editoraID, anoPublicacao, numeroPaginas, categoriaID);
        SELECT 'Livro adicionado com sucesso.' AS Mensagem;
    ELSE
        SELECT 'Erro: O livro com este título já existe.' AS Mensagem;

DELIMITER //
CREATE PROCEDURE sp_AutorMaisAntigo()
BEGIN
    SELECT Nome, Sobrenome
    FROM Autor
    WHERE Data_Nascimento = (SELECT MIN(Data_Nascimento) FROM Autor);
END //
DELIMITER ;

    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN 

DELIMITER //
CREATE PROCEDURE sp_LivrosESeusAutores()
BEGIN
    SELECT Livro.Titulo, CONCAT(Autor.Nome, ' ', Autor.Sobrenome) AS Autor
    FROM Livro
    INNER JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID
    INNER JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID;
END //
DELIMITER ;
    
    SELECT * FROM Autor;
END //
DELIMITER ;

