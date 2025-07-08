create sequence seq_editora START 1; 

create table editora (
cod_editora int not null 
    default nextval ('seq_editora'),
descricao varchar (30) null,
endereco varchar (30) null,
constraint pk_editora 
    primary key (cod_editora)
);


create sequence seq_livro START 1;

create table livro (
cod_livro int not null 
      default nextval ('seq_livro'),
isbn varchar (20) null,
titulo varchar (45) null,
num_edicao int null,
preco float null,
cod_editora int not null,
constraint pk_livro 
    primary key (cod_livro),
constraint fk_livro_editora
    foreign key (cod_editora) 
       references editora (cod_editora)    
);


create sequence seq_autor START 1;

create table autor (
cod_autor int not null primary key 
     default nextval ('seq_autor'),
nome varchar (45) null,
sexo char (1) null,
data_nascimento date null
);

create table livro_autor (
cod_livro int not null,
cod_autor int not null,
constraint pk_livro_autor
   primary key (cod_livro, cod_autor),
constraint fk_livro_autor_livro
   foreign key (cod_livro)
      references livro (cod_livro),
constraint fk_livro_autor_autor
   foreign key (cod_autor)
     references autor (cod_autor)      
);


insert into editora 
         (descricao, endereco)
  values 
         ('campus', 'rua do timbó'),
         ('abril', null), 
         ('editora teste', null);

insert into livro
    (isbn, titulo, num_edicao, preco, cod_editora)
 values
    ('12345', 'banco de dados', 3, 70.00, 1),
    ('35790', 'sgbd', 1, 85.00, 2),
    ('98765', 'redes de computadores', 2, 80.00,2);

insert into autor 
   (nome, sexo, data_nascimento)
 values
   ('João', 'M', '1970/01/01'),
   ('Maria', 'F', '1974/05/17'),
   ('José', 'M', '1977/10/10'),
   ('Carla', 'F', '1964/12/08');

insert into livro_autor 
    (cod_livro, cod_autor)
 values (1, 1), (1,2), (2, 2), (2,4), (3,3);