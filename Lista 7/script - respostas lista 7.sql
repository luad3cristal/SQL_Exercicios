--a) Selecionar todas as informações 
--sobre todos os a utores (authors);

SELECT * FROM authors

--b) Selecionar o código, primeiro nome e
-- último nome
--de todos os autores (authors) em
--ordem alfabética pelo último nome 
--(au_lname);

SELECT au_id, au_fname, au_lname FROM authors 
ORDER BY au_lname

--c) Selecionar todas as informações 
--sobre todos os autores (authors) 
--da cidade "Oakland";

SELECT * FROM authors 
WHERE city = 'Oakland'

--d) Selecionar o código, título e preço 
--dos livros (titles) em ordem decrescente 
--de preço;

SELECT title_id, title, price FROM titles 
ORDER BY price DESC

--e) Selecionar o código, título e preço 
--dos livros (titles) cujo preço é 
--superior a $15;

SELECT title_id, title, price FROM titles 
WHERE price > 15
 
--f) Selecionar o código e título dos 
--livros (titles), primeiro e último 
--nome dos seus respectivos autores 
--(authors);

SELECT t.title_id, t.title, a.au_fname, a.au_lname FROM titles AS T
INNER JOIN titleauthor AS ta ON ta.title_id = t.title_id 
INNER JOIN authors AS a ON a.au_id = ta.au_id

--g) Selecionar o código e título 
--dos livros e quantidade de autores 
--de cada livro (titles);

SELECT t.title_id, t.title, COUNT(a.au_id) AS qtd_autor 
FROM titles AS t
INNER JOIN titleauthor AS ta ON ta.title_id = t.title_id 
INNER JOIN authors AS a ON a.au_id = ta.au_id
GROUP BY t.title_id, t.title

--h) Selecionar o código e título dos 
--livros (titles)que foram escritos por 
--mais de 2 autores;

SELECT t.title_id, t.title, COUNT(a.au_id) AS qtd_autor 
FROM titles AS t
INNER JOIN titleauthor AS ta ON ta.title_id = t.title_id 
INNER JOIN authors AS a ON a.au_id = ta.au_id
GROUP BY t.title_id
HAVING COUNT(a.au_id) > 2

--i) Selecionar o primeiro nome (fname), inicial do nome
-- do meio (minit) e o último nome (lname) dos 
-- empregados (employee);

SELECT fname, minit, lname FROM employee

--j) Selecionar o código e a descrição dos 
--cargos (jobs); 

SELECT job_id, job_desc FROM jobs

--k) Selecionar o primeiro nome, inicial do nome do 
-- meio, ultimo nome dos empregados (employee) 
--e a descrição do seu respectivo cargo (jobs);

SELECT e.fname, e.minit, e.lname, j.job_desc FROM employee AS e
INNER JOIN jobs AS j ON j.job_id = e.job_id

--l) Selecionar o código, nome e a cidade das editoras 
--(publishers), ordenado pelo nome;

SELECT pub_id, pub_name, city FROM publishers 
ORDER BY pub_name;

--m) Selecionar o código e título do livro (titles),
-- código e nome da respectiva editora(publishers);

SELECT t.title_id, t.title, p.pub_id, p.pub_name FROM titles AS t
INNER JOIN publishers AS p ON p.pub_id = t.pub_id;

--n) Selecionar o código e título do livro (titles),
--código e nome da respectiva editora
--(publishers), cuja editora se localiza na cidade de
--“Boston”;

SELECT t.title_id, t.title, p.pub_id, p.pub_name FROM titles AS t
INNER JOIN publishers AS p ON p.pub_id = t.pub_id
WHERE p.city = 'Boston'

--o) Selecionar o nome, endereço e cidade das lojas (
--stores) do estado "CA"; 

SELECT stor_name, stor_address, city FROM stores

--p) Selecionar código livro, titulo e a quantidade 
--total de livros vendidos, em ordem decrescente 
--da quantidade total de livros vendidos;

SELECT t.title_id, t.title, SUM(s.qty) AS qtd_vendas FROM titles AS t
INNER JOIN sales AS s ON s.title_id = t.title_id
GROUP BY t.title_id, s.qty
ORDER BY s.qty DESC

--q) Selecionar código livro, titulo do livro, código
-- e nome da loja (stores) e a quantidade
-- total de livros vendidos pela loja (nas diversa ven
--das realizadas), em ordem
---decrescente da quantidade de livros vendidos;

SELECT t.title_id, t.title, st.stor_id, st.stor_name, 
SUM(s.qty) AS qtd_vendas FROM titles AS t
INNER JOIN sales AS s ON s.title_id = t.title_id
INNER JOIN stores AS st ON st.stor_id = s.stor_id
GROUP BY t.title_id, t.title, st.stor_id, st.stor_name
ORDER BY qtd_vendas DESC;

--r) Selecionar o código e nome da loja (stores), e a
--sua respectiva média de livros vendidos;

SELECT st.stor_id, st.stor_name, ROUND(AVG(qty), 2) AS media_vendas
FROM stores AS st
INNER JOIN sales AS s ON s.stor_id = st.stor_id
GROUP BY st.stor_id, st.stor_name

--s) Selecionar os livros (titles) que nunca foram ve
-- ndidos;

SELECT t.* FROM titles AS t
LEFT JOIN sales AS s ON s.title_id = t.title_id
WHERE s.title_id IS NULL

--t) Selecionar as editoras (publishers) que não edit
--aram nenhum livro. 

SELECT p.* FROM publishers AS p
LEFT JOIN titles AS t ON t.pub_id = p.pub_id
WHERE t.pub_id IS NULL
