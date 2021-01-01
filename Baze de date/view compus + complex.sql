create or replace view vw_compus as
select clasa, numar_parc, 
putere_motor, 
nume_propulsie, nume_producator, 
hala_id
from locomotiva l join producator p using (prod_id)
join propulsie pp using (propulsie_id) join hala h using (hala_id)
where anul_fabricatiei > 1975

update locomotiva
set putere_motor = 2101
where numar_parc = 768

update vw_compus
set putere_motor = 2100
where numar_parc = 768

select * from vw_compus where numar_parc=768
select * from locomotiva where numar_parc=768

create or replace view vw_complex as
select nume_operator, tip_operator, numar_angajati, count(loco_id)
as "Nr. de locomotive", count(distinct(prod_id)) as "Nr.prod. colaboratori"
from operator join tip_operator using (tipop_id)
join locomotiva using (op_id)
group by nume_operator, tip_operator, numar_angajati

select * from vw_complex
