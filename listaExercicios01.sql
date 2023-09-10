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

