create or replace view produtos_comprados as
select PE.id_pedido as pedido,CL.nome_cliente as cliente, PR.nome_produto as produto,PE.Qtde as quantidade,PE.qtde*PR.preco as fatura
from pedido PE
join produto PR
on PE.fk_produto = PR.id_produto
join cliente CL
on PE.fk_cliente = CL.id_cliente

select * from pedido

select * from produtos_comprados


create or replace view produtos_categorias as 
select PE.nome_produto as produto,CA.nome_categoria as categoria
from produto PE
left join categoria CA
on PE.fk_Categoria = Ca.id_Categoria

alter view produtos_categorias rename column nome_categoria to categoria

select *From produtos_Categorias

create or replace view Pedidos_Feitos as 
select PE.id_pedido as Pedido, CL.nome_cliente as clientes
from pedido PE
right join cliente CL
on PE.fk_Cliente = CL.id_Cliente

select * from Pedidos_Feitos

create or replace view Usuarios_Clientes as 
select CL.nome_cliente as usuarios,PE.id_pedido as pedido,PE.fk_produto as produtos
from cliente CL
inner join pedido PE
on PE.fk_Cliente = CL.id_Cliente

alter view Usuarios_Clientes rename column id_pedido to pedidos
alter view Usuarios_Clientes rename column fk_produto to produtos


select *from Usuarios_Clientes



create index on cliente(id_cliente)
create index on produto using hash(id_produto)
create index on pedidos (id_pedido)





