-- 1. Atualizar o endereço da Editora Campus para ‘Av. ACM’ 
UPDATE editora SET endereco = 'Av. ACM' WHERE descricao = 'campus';

-- 2. Atualizar os preços dos livros em 10% 
UPDATE livro SET preco = preco + (preco * 0.1)

-- 3. Excluir a ‘Editora Teste’ 
DELETE FROM editora WHERE descricao = 'editora teste'

-- 4. Apresentar o nome e data de nascimento de todos os autores 
SELECT nome, data_nascimento FROM autor

-- 5. Apresentar o nome e a data de nascimento dos autores por ordem de nome. 
SELECT nome, data_nascimento FROM autor ORDER BY nome

-- 6. Apresentar o nome e a data de nascimento dos autores do sexo feminino 
-- ordenados pelo nome. 
SELECT nome, data_nascimento FROM autor AS a WHERE a.sexo = 'F' ORDER BY nome

-- 7. Apresentar o nome das editoras que não tem o endereço cadastrado. 
SELECT * FROM editora WHERE endereco IS NULL

-- 8. Apresentar o título do livro e o nome da sua editora 
SELECT l.titulo, e.descricao AS nome_editora FROM livro AS l INNER JOIN editora as e ON e.cod_editora = l.cod_editora

-- 9. Apresentar o título do livro e o nome da sua editora. Caso haja alguma 
-- editora sem livro publicado, informar os dados da editora com valores 
-- nulos para os livros. 
SELECT l.titulo, e.descricao AS nome_editora FROM editora AS e LEFT JOIN livro as l ON e.cod_editora = l.cod_editora

-- 10. Apresentar o título do livro e o nome dos seus autores 
SELECT l.titulo, a.nome AS nome_autor FROM livro AS l INNER JOIN livro_autor as la ON la.cod_livro = l.cod_livro INNER JOIN autor AS a ON la.cod_autor = a.cod_autor

-- 11. Apresentar o nome da editora e o nome dos autores que já publicaram 
-- algum livro na editora. 
SELECT e.descricao AS nome_editora, a.nome AS nome_autor FROM editora AS e INNER JOIN livro AS l ON e.cod_editora = l.cod_editora INNER JOIN livro_autor AS la ON la.cod_livro = l.cod_livro INNER JOIN autor AS a ON a.cod_autor = la.cod_autor; 

-- 12. Apresentar o título dos livros que começam a string ‘Banco’. 
SELECT l.titulo FROM livro AS l WHERE l.titulo LIKE 'banco%'

-- 13. Apresentar o título dos livros que tem a string ‘do’. 
SELECT l.titulo FROM livro AS l WHERE l.titulo LIKE '%do%'

-- 14. Apresentar o nome de cada livro e seu preço reajustado em 5% 
SELECT l.titulo, l.preco = l.preco + (l.preco * 0.05)

-- 15. Apresentar o nome dos autores que nasceram no mês de outubro 
SELECT a.nome FROM autor AS a WHERE EXTRACT(MONTH FROM a.data_nascimento) = 10

-- 16. Apresentar o número de livros do acervo
SELECT COUNT(*) AS quantidade_livros FROM livro

-- 17. Apresentar o número de autores do livro ‘Banco de Dados’
SELECT COUNT(*) AS quantidade_autores FROM livro AS l INNER JOIN livro_autor AS la ON la.cod_livro = l.cod_livro INNER JOIN autor AS a ON a.cod_autor = la.cod_autor WHERE l.titulo = 'banco de dados' 

-- 18. Apresentar o somatório dos preços dos livros do acervo 
SELECT SUM(preco) AS preco_livros FROM livro AS l

-- 19. Apresentar a média de preços dos livros da editora Campus 
SELECT AVG(preco) AS media_preco FROM livro AS l INNER JOIN editora AS e ON e.cod_editora = l.cod_editora WHERE e.descricao = 'campus'

-- 20. Apresentar o maior preço dentre todos os livros do acervo. 
SELECT MAX(preco) AS maior_preco FROM livro

-- 21. Apresentar a data de nascimento do autor mais velho 
SELECT MIN(data_nascimento) AS autor_mais_velho FROM autor

-- 22. Apresentar o número de livros por editora
SELECT COUNT(*) AS livros_editora, e.descricao AS nome_editora FROM livro AS l INNER JOIN editora AS e ON e.cod_editora = l.cod_editora GROUP BY e.descricao

-- 23. Apresentar o somatório e média de preço dos livros por editora 
SELECT SUM(preco) AS soma_preco, AVG(preco) AS media_preco, e.descricao AS nome_editora FROM livro AS l INNER JOIN editora AS e ON e.cod_editora = l.cod_editora GROUP BY e.descricao

-- 24. Apresentar o número de autores por livro, mas apenas dos livros que 
-- possuem mais de 1 autor 
SELECT l.titulo AS titulo_livro, COUNT(a.cod_autor) AS total_autores FROM livro AS l 
INNER JOIN livro_autor AS la ON l.cod_livro = la.cod_livro 
INNER JOIN autor AS a ON a.cod_autor = la.cod_autor 
GROUP BY l.titulo 
HAVING COUNT(a.cod_autor) > 1

-- 25. Apresentar a média de preços geral por editora, mas apenas as editoras que 
-- possuem média maior que R$ 80,00  
SELECT AVG(preco) AS media_preco, e.descricao AS nome_editora FROM livro AS l
INNER JOIN editora AS e ON e.cod_editora = l.cod_editora
GROUP BY e.descricao
HAVING AVG(preco) > 80

-- 26. Apresentar o nome dos autores que não são autores do livro Banco de 
-- Dados 
SELECT a.nome FROM autor AS a 
WHERE a.cod_autor NOT IN (
	SELECT la.cod_autor FROM livro AS l 
	INNER JOIN livro_autor AS la ON la.cod_livro = l.cod_livro
	WHERE l.titulo = 'banco de dados'
)

-- 27. Apresentar a quantidade de livros da editora Campus e Abril em colunas 
-- diferentes.
SELECT 
COUNT(CASE WHEN e.descricao = 'campus' THEN 1 END) as qtd_editora_campus,
COUNT(CASE WHEN e.descricao = 'abril' THEN 1 END) as qtd_editora_abril
FROM editora as e
INNER JOIN livro AS l ON l.cod_editora = e.cod_editora


-- Consultas gerais
Select * FROM editora
Select * FROM livro
Select * FROM autor