select *from pedido
select *from cliente
select * from produto

select nome_cliente,qtde
from cliente,pedido
where cliente.id_cliente = pedido.fk_cliente and qtde > 2


select nome_cliente,id_pedido
from cliente, pedido
where cliente.id_cliente = pedido.fk_cliente

select nome_produto,qtde
from produto,pedido
where produto.id_produto = pedido.fk_produto

select nome_cliente,id_pedido
from cliente,pedido
where cliente.id_cliente = pedido.fk_cliente and qtde > 2

select sum(preco * qtde) as 
from cliente,produto,pedido
where cliente.id_cliente = pedido.fk_cliente and produto.id_produto = pedido.fk_produto

select id_pedido,produto.nome_produto,pedido.qtde
from pedido
inner join produto
on pedido.fk_produto = produto.id_produto
