select count (qtde_estoque),nome_categoria
from produto
left join categoria
on produto.fk_categoria = categoria.id_Categoria
group by nome_Categoria

select nome_cliente,id_pedido
from pedido
right join cliente
on pedido.fk_cliente = cliente.id_cliente


select nome_produto,nome_categoria
from produto
cross join categoria
where nome_Categoria = 'brinquedo'


select id_pedido,fk_categoria 
from pedido
full outer join produto
on pedido.fk_produto = produto.id_Produto

