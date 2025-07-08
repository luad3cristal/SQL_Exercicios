-- Excluir a tabela de junção primeiro por causa das foreign keys
DROP TABLE IF EXISTS livro_autor;
DROP TABLE IF EXISTS livro;
DROP TABLE IF EXISTS autor;
DROP TABLE IF EXISTS editora;

-- Excluir as sequências
DROP SEQUENCE IF EXISTS seq_editora;
DROP SEQUENCE IF EXISTS seq_livro;
DROP SEQUENCE IF EXISTS seq_autor;
