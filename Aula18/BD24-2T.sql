Create table cliente (
ID_cliente int primary key,
salario money not null
)

insert into cliente(ID_cliente,salario)
values
(1,1200)

select *from cliente
select * from historico_Salaria

create table historico_Salaria(
	ID_historico serial primary key,
	ID_cliente int references cliente (ID_cliente),
	Data_alteracao Date,
	salario money
)

create table produto(
	ID_Produto int primary key,
	nome_Produto varchar(80) not null,
	preco money
)

create table historico_preco(
	ID_historico_preco serial primary key,
	ID_produto int references produto (ID_produto),
	Data_alteracao_preco Date,
	preco money
)

Create or replace function atualizacao_Salario() returns
trigger as $$ begin
insert into historico_Salaria(ID_cliente,Data_alteracao,salario)
values (New.ID_cliente, NOW(),NEW.salario);
return null; end; $$LANGUAGE plpgsql;


Create or replace trigger trigger_salario
after insert or update ON cliente
for each row
execute function atualizacao_Salario()


insert into cliente(ID_cliente,salario)
values(3,6800),(4,7000),(5,1000)

update cliente set salario = 3000 where id_cliente = 1

create or replace function atualizacao_preco() returns
trigger as $$ begin
insert into historico_preco(ID_produto,Data_alteracao_preco,preco)
values (New.id_produto,NOW(),NEW.preco);
return null; end; $$LANGUAGE plpgsql;

create or replace trigger trigger_preco
after insert or update ON produto
for each row
execute function atualizacao_preco()
 
select * from produto
select * from historico_preco

insert into produto(ID_produto,nome_produto,preco)
values
(1,'RTX5090',20000),
(2,'Playstation 5',4000),
(3,'GTA 6', 600),
(4,'Big Mac',16.45),
(5,'Netflix',26.80)

update produto set preco = 3500 where id_produto = 2


