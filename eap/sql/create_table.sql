SET FOREIGN_KEY_CHECKS = 0;
drop table if exists user;
drop table if exists firma_livrare;
drop table if exists local;
drop table if exists produs;
drop table if exists ingredient;
drop table if exists alocare;
drop table if exists comanda;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE user(
	username varchar(255) not null,
    nume varchar(255) not null,
    prenume varchar(255) not null,
    nr_telefon varchar(255) not null,
    adresa varchar(255) not null,
    primary key (username)
    );
    
CREATE TABLE firma_livrare(
	firma_livrare_id int not null AUTO_INCREMENT,
    denumire varchar(255) not null,
    primary key (firma_livrare_id),
    unique (denumire)
    );
    
CREATE TABLE local(
	local_id int not null AUTO_INCREMENT,
    denumire_local varchar(255) not null,
    adresa varchar(255) not null,
    oras varchar(255) not null,
    primary key (local_id),
    unique (denumire_local)
    );
    
CREATE TABLE produs(
	produs_id int not null AUTO_INCREMENT,
    local_id int,
    denumire_produs varchar(255) not null,
    pret float,
    primary key (produs_id),
    foreign key (local_id) references local(local_id)
    );
    
CREATE TABLE ingredient(
	ingredient_id int not null AUTO_INCREMENT,
    denumire_ingredient varchar(255) not null,
    primary key (ingredient_id),
    unique (denumire_ingredient)
    );

CREATE TABLE alocare(
	produs_id int not null,
    ingredient varchar(255) not null,
    cantitate float,
    primary key (produs_id, ingredient),
    foreign key (produs_id) references Produs(produs_id),
    foreign key (ingredient) references Ingredient(denumire_ingredient)
    );
    
CREATE TABLE comanda(
	comanda_id int not null AUTO_INCREMENT,
    username varchar(255) not null,
    denumire_local varchar(255) not null,
    firma_livrare varchar(255) not null,
    pret float not null,
    primary key (comanda_id),
    foreign key (username) references user(username),
    foreign key (denumire_local) references local(denumire_local),
    foreign key (firma_livrare) references firma_livrare(denumire)
);

CREATE TABLE lista_cumparaturi(
    id int not null AUTO_INCREMENT,
    comanda_id int not null,
    produs_id int not null,
    primary key (id),
    foreign key (comanda_id) references comanda(comanda_id),
    foreign key (produs_id) references produs(produs_id)
);

commit;
    