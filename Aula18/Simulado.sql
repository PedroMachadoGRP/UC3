Create table casa (
    id_casa int primary key,
    nome_casa varchar(80) not null
)


create table personagem (
    id_personagem int primary key,
    nome_personagem varchar(80) not null,
    sobrenome_personagem varchar(80) not null,
    data_nascimento varchar(80) not null,
	fk_casa int not null references casa (id_casa)
	
)

create table professor (
    salario numeric,
    fk_personagem int not null references personagem (id_personagem)
)

create table aluno(
    ano_escolar varchar(40),
    fk_personagem int not null references personagem (id_personagem)
)

create table materia (
    id_materia int primary key,
    nome_materia varchar(80) not null,
    fk_personagem int not null references personagem (id_personagem)
)

create table feitico (
    id_feitico SERIAL primary key,
    nome_feitico varchar(80) not null,
    fk_personagem int not null references personagem (id_personagem)
)


select * from personagem
select * from professor
select * from aluno
select * from materia
select * from feitico
select * from casa

insert into casa (id_casa,nome_casa)
values
(1,'Grifinoria'),
(2,'Sonserina'),
(3,'Corvinal'),
(4,'Lufa-Lufa')

insert into personagem(id_personagem,nome_personagem,sobrenome_personagem,data_nascimento,fk_casa)
values 
(1,'Harry','Potter','31 de julho de 1980',1),
(2,'Hermione','Granger','19 de setembro de 1979',1),
(3,'Ron','Weasley','1 de março de 1980',1),
(4,'Draco','Malfoy','5 de junho de 1980',2),
(5,'Neville','Longbottom','30 de julho de 1980',1),
(6,'Luna','Lovegood','13 de fevereiro de 1981',3),
(7,'Cedric','Diggory','1 de outubro de 1977',4),
(8,'Cho','Chang','18 de setembro de 1979',3),
(9,'Ginny','Weasley','11 de agosto de 1981',1),
(10,'Seamus','Finnigan','1 de setembro de 1979',1),
(11,'Minerva','McGonagall','4 de outubro de 1935',1),
(12,'Severus','Snape','9 de janeiro de 1960',2),
(13,'Filius','Flitwick','17 de outubro de 1935',3),
(14,'Pomona','Sprout','15 de março de 1939',4),
(15,'Remus','Lupin','10 de março de 1960',1)

insert into aluno (ano_escolar,fk_personagem)
values
(7,1),
(7,2),
(7,3),
(7,4),
(7,5),
(6,6),
(6,7),
(7,8),
(6,9),
(7,10)

insert into professor(salario,fk_personagem)
values
(14625,11),
(14625,12),
(14625,13),
(14625,14),
(14625,15)


insert into materia(id_materia,nome_materia,fk_personagem)
values
(1,'Transfiguração',11),
(2,'Poções',12),
(3,'Feitiços',13),
(4,'Herbologia',14),
(5,'Defesa contra artes das trevas',15)


insert into feitico(nome_feitico,fk_personagem)
values
()


select nome_personagem,nome_casa
from personagem
join casa
on personagem.fk_casa = casa.id_casa

select nome_personagem,nome_casa
from personagem
join casa
on personagem.fk_casa = casa.id_casa
where nome_casa = 'Grifinoria'

create or replace view view_personagens_grifinoria as
select NP.nome_personagem,NC.nome_casa,DA.data_nascimento
from personagem NP
join casa NC
on NP.fk_casa = NC.id_casa
join personagem DA
on DA.fk_casa = NC.id_casa

select * from view_personagens_grifinoria