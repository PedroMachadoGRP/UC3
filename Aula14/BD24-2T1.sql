select nome_cliente as nome, sobrenome_cliente as sobrenome 
from cliente
select count(*) as numero_cliente from cliente
where genero = 'Feminino'

select count(*) as numero_cliente from cliente
where salario > 1000


select count(nome_produto) from produto
select count(*) from pedido where fk_cliente = 2
select count(*) from pedido where fk_produto = 1
select count (distinct fk_cliente) from pedido 


select avg(salario) from cliente where genero = 'Masculino'
select *from pedido

select avg(preco) from produto
select avg(qtde) from pedido
select avg(fk_cliente) from pedido
select fk_cliente, count (*) as num_pedido from pedido group by 


select sum (salario) as salario_total  from cliente

select sum(salario / 3) from cliente

select avg (salario) from cliente group by genero


select count (nome_cliente) from cliente group by genero

select sum (preco * 0.90) from produto
select sum (preco) from produto
		