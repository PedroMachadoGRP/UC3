select nome_item,id_personagem
from item, coletado
where item.id_item = coletado.id_item and id_personagem = 1

select nome_item,id_personagem
from coletado
inner join item
on coletado.id_item = item.id_item
where id_personagem = 1


select nome_cenario,id_personagem
from cenario,coletado
where cenario.id_cenario = coletado.id_cenario and id_personagem = 2

select nome_cenario,id_personagem
from coletado
inner join cenario
on coletado.id_cenario = cenario.id_cenario
where id_personagem = 2

select nome_item,id_personagem,id_cenario
from item,coletado
where item.id_item = coletado.id_item and id_personagem = 3 and id_cenario = 3

select nome_item,id_personagem,id_cenario
from coletado
inner join item
on item.id_item = coletado.id_item
where id_personagem = 3 and id_cenario = 3

select id_cenario, sum(valor_item) as Valor_Itens_Floresta
from item,coletado
where item.id_item = coletado.id_item and id_cenario = 1
group by id_cenario

select id_cenario, sum(valor_item) as Valor_Itens_Floresta
from coletado
inner join item
on item.id_item = coletado.id_item
where id_cenario = 1
group by id_cenario

