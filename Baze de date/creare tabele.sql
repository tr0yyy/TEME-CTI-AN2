CREATE TABLE propulsie
( propulsie_id integer primary key AUTOINCREMENT,
  nume_propulsie varchar(255) not null
 );
  
 CREATE TABLE rang
( rang_id integer primary key AUTOINCREMENT,
  nume_rang varchar(255) not null,
  regim_v2_indusi numeric(2) not null,
  regim_v1_indusi numeric(2) not null,
  viteza_maxima numeric(3) not null
)

CREATE TABLE tip_operator
(
  tipop_id integer primary key AUTOINCREMENT,
  tip_operator varchar(255) not null
)

CREATE TABLE operator
(
  op_id integer primary key AUTOINCREMENT,
  tipop_id numeric(10) not null,
  nume_operator varchar(255) not null,
  numar_angajati numeric(10) not null,
  anul_fondarii numeric(4) not null,
  constraint fk_op_tipop foreign key (tipop_id) references tip_operator(tipop_id)
);

CREATE TABLE hala
(
  hala_id integer primary key AUTOINCREMENT,
  locuri numeric(10) not null,
  suprafata numeric(10) not null,
  an_constructie numeric(4) not null
)

CREATE TABLE locatie
(
  locatie_id integer primary key AUTOINCREMENT,
  oras varchar(255) not null,
  regiune varchar(255) not null,
  tara varchar(255) not null
)

CREATE TABLE producator
(
  prod_id integer primary key AUTOINCREMENT,
  nume_producator varchar(255) not null,
  sediu varchar(255) not null,
  locatie_id numeric(10) not null,
  anul_fondarii numeric(10) not null,
  constraint fk_prod_loc foreign key (locatie_id) references locatie(locatie_id)
)

CREATE TABLE mecanic
(
  mecanic_id integer primary key AUTOINCREMENT,
  nume varchar(255) not null,
  prenume varchar(255) not null,
  data_angajarii date not null,
  salariu float(10) not null
)

CREATE TABLE locomotiva
(
  loco_id integer primary key AUTOINCREMENT,
  prod_id numeric(10) not null,
  propulsie_id numeric(10) not null,
  rang_id numeric(10) not null,
  op_id numeric(10) not null,
  hala_id numeric(10) not null,
  putere_motor numeric(10) not null,
  anul_fabricatiei numeric(10) not null,
  numar_parc numeric(10) not null,
  clasa numeric(3) not null,
  constraint fk_locomotiva_prod
  foreign key (prod_id) references producator(prod_id),
  constraint fk_locomotiva_propulsie
  foreign key (propulsie_id) references propulsie(propulsie_id),
  constraint fk_locomotiva_rang
  foreign key (rang_id)references rang(rang_id),
  constraint fk_locomotiva_operator
  foreign key (op_id) references operator(op_id),
  constraint fk_locomotiva_hala
  foreign key (hala_id) references hala(hala_id)
)

CREATE TABLE alocare
(
  id integer primary key AUTOINCREMENT,
  mecanic_id number(10,0) not null,
  loco_id number(10,0) not null,
  constraint fk_mecanic_aloc foreign key (mecanic_id) references mecanic(mecanic_id),
  constraint fk_loco_aloc foreign key (loco_id) references locomotiva(loco_id)
 )
