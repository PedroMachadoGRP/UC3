/*
Pista 1- O assassinato aconteceu no em 01/15/2018 em sql city
*/

/* Descobrindo o caso*/

select * from crime_scene_report
where date = 20180115 

/*pista 2- Imagens de segurança mostram que havia 2 testemunhas. A primeira testemunha mora na última casa na "Northwestern Dr". A segunda testemunha, chamada Annabel, mora em algum lugar na "Franklin Ave".*/

/* localização primeira testemunha*/
select * from person
where address_street_name = "Northwestern Dr"
order by address_number

/*
primeira testemunha =
id = 14887	
nome = Morty Schapiro
license_id = 118009
address_number	= 4919	
address_street_name = 	Northwestern Dr	
ssn = 111564949*/

/* intrevista com a primeira testemunha*/
select name,transcript
from person
join interview
on person.id = interview.person_id
where id = 14887


/*intrevista : 

Ouvi um tiro e então vi um homem correndo para fora. Ele tinha uma sacola "Get Fit Now Gym". O número de membro na sacola começava com "48Z". Somente membros Gold têm essas sacolas. O homem entrou em um carro com uma placa que incluía "H42W".
*/


/*Descobringo a segunda testemunha*/
select * from person where address_street_name = "Franklin Ave"

/*
segunda testemunha = 
id = 16371		
nome = Annabel Miller	
license_id = 490173
address_number	= 103	
address_street_name = 	Franklin Ave	
ssn = 318771143
*/

/*intrevista com a primeira testemunha*/
select name,transcript
from person
join interview
on person.id = interview.person_id
where id = 16371



/* Descobrir quais pessoas tem a assinatura da academia como gold*/
select * from get_Fit_now_member
where membership_status = 'gold'


/*
suspeitos : Joe Germuska e Jeremy Bowers
*/

/*
suspeito 1 = não tem licença para dirigir
*/


/* Descobrindo qual dos suspeitos tem a placa do carro igual a dada pela testenhuma*/
select name,plate_number
from person
join drivers_license
on person.license_id = drivers_license.id
where name = "Jeremy Bowers"


/*
suspeito 2 = tem a placa de carro igual dada pela testemunha
*/

/*
suspeito 2 =

id = 67318			
nome = Jeremy Bowers	
license_id = 423327	
address_number	= 530	
address_street_name = 	Washington Pl, Apt 3A		
ssn = 871539279
*/


/*select name,transcript*/
from person
join interview
on person.id = interview.person_id
where id = 67318

/*intrevista : 

Fui contratado por uma mulher com muito dinheiro. Não sei o nome dela, mas sei que ela tem cerca de 5'5" (65") ou 5'7" (67"). Ela tem cabelo ruivo e dirige um Tesla Model S. Sei que ela foi ao SQL Symphony Concert 3 vezes em dezembro de 2017.*/

/*Procurando a tercira suspeita pela licensa de motorista e por onde ela foi*/

select * 
from person
join drivers_license
on person.license_id = drivers_license.id
join facebook_event_checkin
on person.id = facebook_event_checkin.person_id
where car_make = "Tesla" and car_model = "Model S" and  hair_color = "red" and gender = "female"


/*
culpado/a = Miranda Priestly
*/