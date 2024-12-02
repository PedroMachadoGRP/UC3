create table cliente(
	id_cliente int primary key,
	nome_cliente varchar(80) not null,
	sobrenome_cliente varchar(80) not null
)

select * from cliente

create table produto(
	id_produto int primary key,
	nome_Produto varchar(30) not null,
	descricao text not null,
	preco numeric check (preco > 0) not null,
	qtde_estoque smallint default 0
)

create table pedido(
	id_pedido SERIAL primary key,
	fk_cliente int not null references  cliente (id_cliente),
	fk_Produto int not null,
	qtde smallint not null,
	foreign key (fk_produto) references produto(id_produto)
)

select *from pedido

insert into cliente (id_cliente,nome_cliente,sobrenome_cliente)
values (4,'Marcelo', 'Agusto'),(5,'Pedro','alexander')
,(6,'Neymar','Cristinao'),(7,'Neymar','Messi'),(8,'Osama','Binlada'),(9,'Felipe','Neto'),
(10,'Felipe','Jorge')

select nome_cliente from cliente

insert into produto(id_produto,nome_Produto,descricao,preco,qtde_estoque)
values(3,'Gato','Animal fofo',300.00,5),
(4,'Chave-Fenda','Conserta qualquer coisa',30.00,50),(5,'Livro do Felipe Neto','Livro de youtuber',30.00,90),
(6,'Cadeira gamer','Cadeira ante escoliose',600.00,3),(7,'Rezen_dog','Cachorro quente gamer',50.00,70),
(8,'Camisa esportiva','Camisa do Flamengo',50,100),(9,'Esteira','Objeto para corrida',700,5,10),(10'lapís de cor','Lapís para colorir',10,50)

select * from produto

insert into pedido (fk_cliente,fk_Produto,qtde)
values(1,2,1),(2,2,1),(3,4,5),(4,3,2),(5,6,1),(6,5,10),(7,8,1),(8,7,3),(9,10,20),(10,9,5)

select id_pedido from pedido


update produto set qtde = 12 where id_pedido = 1
update produto set qtde = 11 where id_pedido = 2
update produto set qtde = 45 where id_pedido = 3
update produto set qtde = 3 where id_pedido = 4
update produto set qtde = 2 where id_pedido = 5
update produto set qtde = 80 where id_pedido = 6
update produto set qtde = 0 where id_pedido = 7
update produto set qtde = 66 where id_pedido = 8
update produto set qtde = 30 where id_pedido = 9
update produto set qtde = 15 where id_pedido = 10

select distinct nome_cliente from cliente

alter table cliente add genero varchar(80)
alter table cliente add salario int
alter table cliente add CPF varchar(11)
select * from cliente


update cliente set genero = 'Masculino'
update cliente set genero = 'Feminino' where id_cliente  = 3
update cliente set salario = 1412

update cliente set cpf = '15814608056' where id_cliente = 1
update cliente set cpf = '41227105029' where id_cliente = 2
update cliente set cpf = '90950648086' where id_cliente = 3
update cliente set cpf = '10165186097' where id_cliente = 4
update cliente set cpf = '35809396020' where id_cliente = 5
update cliente set cpf = '71033432091' where id_cliente = 6
update cliente set cpf = '72295478065' where id_cliente = 7
update cliente set cpf = '56434611021' where id_cliente = 8
update cliente set cpf = '03737226059' where id_cliente = 9
update cliente set cpf = '69065856064' where id_cliente = 10

select * from cliente
select distinct nome_cliente from cliente
select nome_cliente, cpf from cliente
select nome_cliente, cpf from cliente where genero = 'Feminino'
select *from cliente order by genero = 'Feminino' desc
update cliente set salario = 5000 where id_cliente = 5
select * from cliente where salario < 3000