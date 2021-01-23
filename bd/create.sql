drop table propulsie cascade constraints;
drop table rang cascade constraints;
drop table tip_operator cascade constraints;
drop table operator cascade constraints;
drop table hala cascade constraints;
drop table locatie cascade constraints;
drop table producator cascade constraints;
drop table mecanic cascade constraints;
drop table locomotiva cascade constraints;
drop table alocare cascade constraints;

CREATE TABLE propulsie
( propulsie_id number(1) CONSTRAINT pk_propulsie primary key,
  nume_propulsie varchar(255) not null
);

CREATE TABLE rang
( rang_id number(1) CONSTRAINT pk_rang primary key,
  nume_rang varchar(255) not null,
  regim_v1_indusi numeric(2) constraint check_regimv1 check (regim_v1_indusi > 0),
  regim_v2_indusi numeric(2) constraint check_regimv2 check (regim_v2_indusi > 0) ,
  viteza_maxima numeric(3) constraint check_vit_max check (viteza_maxima > 0)
);

CREATE TABLE tip_operator
(
  tipop_id number(1) CONSTRAINT pk_tipop primary key,
  tip_operator varchar(255) CONSTRAINT vf_nume_rang not null
);

CREATE TABLE operator
(
  op_id number(3) constraint pk_op_id primary key,
  tipop_id numeric(1) not null,
  nume_operator varchar(255) not null,
  numar_angajati numeric(8) not null,
  anul_fondarii numeric(4) not null,
  constraint fk_op_tipop foreign key (tipop_id) references tip_operator(tipop_id) on delete cascade
);

CREATE TABLE hala
(
  hala_id number(3) constraint pk_hala_id primary key,
  locuri numeric(4) constraint check_locuri check (locuri >= 0) ,
  suprafata numeric(4) constraint check_suprafata check (suprafata >= 0) ,
  an_constructie numeric(4) not null
);



CREATE TABLE locatie
(
  locatie_id number(3) constraint pk_loc_id primary key,
  oras varchar(255) not null,
  regiune varchar(255) not null,
  tara varchar(255) not null
);

CREATE TABLE producator
(
  prod_id number(3) constraint pk_prod_id primary key,
  nume_producator varchar(255) not null,
  sediu varchar(255) not null,
  locatie_id numeric(3) not null,
  anul_fondarii numeric(4) not null,
  constraint fk_prod_loc foreign key (locatie_id) references locatie(locatie_id) on delete cascade
);

CREATE TABLE mecanic
(
  mecanic_id number(3) constraint pk_mecanic_id primary key,
  nume varchar(255) not null,
  prenume varchar(255) not null,
  data_angajarii date not null,
  salariu float(10) not null,
  constraint check_salariu check (salariu>0)
);

CREATE TABLE locomotiva
(
  loco_id number(5) constraint pk_loco primary key,
  prod_id numeric(3) not null,
  propulsie_id numeric(1) not null,
  rang_id numeric(1) not null,
  op_id numeric(3) not null,
  hala_id numeric(3) not null, 
  putere_motor numeric(10) not null,
  constraint check_power check (putere_motor > 0),
  anul_fabricatiei numeric(4) not null,
  numar_parc numeric(4) not null,
  clasa numeric(3) not null,
  constraint fk_locomotiva_prod
  foreign key (prod_id) references producator(prod_id) on delete cascade,
  constraint fk_locomotiva_propulsie
  foreign key (propulsie_id) references propulsie(propulsie_id) on delete cascade,
  constraint fk_locomotiva_rang
  foreign key (rang_id)references rang(rang_id) on delete cascade,
  constraint fk_locomotiva_operator
  foreign key (op_id) references operator(op_id) on delete cascade,
  constraint fk_locomotiva_hala
  foreign key (hala_id) references hala(hala_id) on delete cascade
);

ALTER TABLE locomotiva
add constraint unique_clasa_parc unique(clasa,numar_parc);

CREATE TABLE alocare
(
  id number(3) constraint pk_aloc primary key,
  mecanic_id number(3) not null,
  loco_id number(5) not null,
  constraint fk_mecanic_aloc foreign key (mecanic_id) references mecanic(mecanic_id) on delete cascade,
  constraint fk_loco_aloc foreign key (loco_id) references locomotiva(loco_id) on delete cascade
);

commit;