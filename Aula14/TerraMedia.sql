create table personagem (
	id_personagem INT primary key,
	nome_personagem varchar(80) not null,
	idade_personagem INT not null

)

create table item (
	id_item INT primary key,
	nome_item varchar(80) not null,
	valor_item numeric not null
	
)

create table cenario (
	id_cenario INT primary key,
	nome_cenario varchar(80) not null
)

create table coletado(
	id_coletado SERIAL primary key,
	id_personagem INT not null references personagem (id_personagem),
	id_item INT not null references item (id_item),
	id_cenario INT not null references cenario (id_cenario)
)

insert into personagem (id_personagem,nome_personagem,idade_personagem)
values(1,'Aragorn',130),(2,'Legolas',2931),(3,'Gimli',62),(4,'Gandalf',2000),(5,'Isildur',234),(6,'Frodo',50),(7,'Durin',20)

insert into cenario (id_cenario,nome_cenario)
values(1,'Floresta de Lothlórien'),(2,'Montanhas de Moria'),
(3,'Campo de Batalha de Helm'),(4,'Valfenda'),(5,'Caradhras')

insert into item (id_item,nome_item,valor_item)
values(1,'Espada elfica',3340),(2,'Arco longo',2200),(3,'Machado de batalha',3000),(4,'Varinha magica',3000),(5,'O anel',9999999),(6,'Glamdring',5000)

insert into coletado(id_personagem,id_item,id_cenario)
values (1,1,1),(2,2,2),(3,3,3),(4,4,1),(1,3,3),(2,1,1),(6,5,3),(7,6,5)

select * from personagem
select *from cenario
select * from coletado
