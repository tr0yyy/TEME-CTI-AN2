insert into propulsie values (1,'electric');
insert into propulsie values (2,'diesel-electric');
insert into propulsie values (3,'diesel-hidraulic');
insert into propulsie values (4,'aburi');

insert into rang values (1,'rapid',65,90,160);
insert into rang values (2,'personal',50,65,120);
insert into rang values (3,'marfa',40,50,100);

insert into tip_operator values (1,'de stat');
insert into tip_operator values (2,'privat');

insert into operator values (1,1,'CFR Calatori',12000,1998);
insert into operator values (2,1,'CFR Marfa',16220,1998);
insert into operator values (3,2,'Transferoviar Calatori',400,2011);
insert into operator values (4,2,'Regio Calatori',700,2004);
insert into operator values (5,2,'Grup Feroviar Roman',1500,2001);
insert into operator values (6,2,'Servtrans',650,2002);

insert into hala values (1,12,1400,1995);
insert into hala values (2,25,2925,1980);
insert into hala values (3,30,3510,1970);

insert into locatie values (1,'Craiova','Dolj','Romania');
insert into locatie values (2,'Bucuresti','Bucuresti-Ilfov','Romania');
insert into locatie values (3,'Pascani','Iasi','Romania');
insert into locatie values (4,'Munchen','Bavaria','Germania');
insert into locatie values (5,'Saint-Ouen','Paris','Franta');

insert into producator values (1,'Electroputere','Calea Bucuresti 80',1,1949);
insert into producator values (2,'Softronic','Calea Severinului 40',1,1999);
insert into producator values (3,'Electroputere VFU','Garii 18',3,1869);
insert into producator values (4,'Faur','Basarabia 256',2,1921);
insert into producator values (5,'Siemens','Wittelsbacherpl. 1',4,1989);
insert into producator values (6,'Alstom','Rue Albert Dhalenne 48',5,1989);

insert into mecanic values (1,'Popescu','Ionel',TO_DATE('27-01-1971','dd-mm-yyyy'),3774);
insert into mecanic values (2,'Kogalniceanu','Carol',TO_DATE('29-02-1972','dd-mm-yyyy'),3435);
insert into mecanic values (3,'Rebreanu','Marin',TO_DATE('25-08-1973','dd-mm-yyyy'),4093);
insert into mecanic values (4,'Zamfir','Nicolas',TO_DATE('10-04-1974','dd-mm-yyyy'),4152);
insert into mecanic values (5,'Hasdeu','Flaviu',TO_DATE('21-12-1974','dd-mm-yyyy'),3892);
insert into mecanic values (6,'Cantacuzino','Bogdan',TO_DATE('28-01-1975','dd-mm-yyyy'),3184);
insert into mecanic values (7,'Parasca','Mario',TO_DATE('14-11-1976','dd-mm-yyyy'),4612);
insert into mecanic values (8,'Ciora','Nandru',TO_DATE('20-12-1976','dd-mm-yyyy'),3382);
insert into mecanic values (9,'Vlaicu','Shaithis',TO_DATE('06-01-1979','dd-mm-yyyy'),4182);
insert into mecanic values (10,'Raducan','Adam',TO_DATE('23-03-1980','dd-mm-yyyy'),4947);
insert into mecanic values (11,'Marandici','Catarino',TO_DATE('15-01-1981','dd-mm-yyyy'),4145);
insert into mecanic values (12,'Filipescu','Dorin',TO_DATE('11-09-1981','dd-mm-yyyy'),4118);
insert into mecanic values (13,'Saguna','Flaviu',TO_DATE('29-06-1982','dd-mm-yyyy'),3744);
insert into mecanic values (14,'Stoica','Cezar',TO_DATE('07-07-1982','dd-mm-yyyy'),4818);
insert into mecanic values (15,'Ianculescu','Mazon',TO_DATE('22-03-1984','dd-mm-yyyy'),4167);
insert into mecanic values (16,'Celibidache','Ion',TO_DATE('15-07-1984','dd-mm-yyyy'),4763);
insert into mecanic values (17,'Enache','Viorel',TO_DATE('03-05-1985','dd-mm-yyyy'),4495);
insert into mecanic values (18,'Giurgiu','Costica',TO_DATE('05-06-1985','dd-mm-yyyy'),4790);
insert into mecanic values (19,'Caragiale','Valentin',TO_DATE('03-12-1986','dd-mm-yyyy'),3071);
insert into mecanic values (20,'Cazacu','Sorin',TO_DATE('03-01-1987','dd-mm-yyyy'),3239);
insert into mecanic values (21,'Moculescu','Liviu',TO_DATE('31-08-1987','dd-mm-yyyy'),4604);
insert into mecanic values (22,'Arcos','Neculai',TO_DATE('16-02-1988','dd-mm-yyyy'),4280);
insert into mecanic values (23,'Dinescu','Ionel',TO_DATE('22-01-1991','dd-mm-yyyy'),4215);
insert into mecanic values (24,'Raducanu','Cristofor',TO_DATE('14-08-1991','dd-mm-yyyy'),3779);
insert into mecanic values (25,'Hutopila','Laurentiu',TO_DATE('11-05-1992','dd-mm-yyyy'),4885);
insert into mecanic values (26,'Dinescu','Haralambie',TO_DATE('04-05-1981','dd-mm-yyyy'),3734);
insert into mecanic values (27,'Raducan','Teo',TO_DATE('07-08-1988','dd-mm-yyyy'),3636);
insert into mecanic values (28,'Stolojan','Vasile',TO_DATE('24-06-1975','dd-mm-yyyy'),3088);
insert into mecanic values (29,'Tavitian','Victor',TO_DATE('01-05-1992','dd-mm-yyyy'),3642);
insert into mecanic values (30,'Gilca','Luca',TO_DATE('30-08-1974','dd-mm-yyyy'),3004);

insert into locomotiva values (1,1,1,1,1,1,5100,1968,4,41);
insert into locomotiva values (2,1,1,2,1,1,5100,1971,106,41);
insert into locomotiva values (3,1,1,1,1,1,5100,1973,387,41);
insert into locomotiva values (4,2,1,1,1,1,5400,2010,538,477);
insert into locomotiva values (5,2,1,1,1,2,5400,2009,613,477);
insert into locomotiva values (6,2,1,1,1,2,5400,2011,871,477);
insert into locomotiva values (7,1,1,3,2,2,5100,1979,603,40);
insert into locomotiva values (8,1,1,3,2,2,5100,1980,342,40);
insert into locomotiva values (9,1,1,3,2,2,5100,1982,170,41);
insert into locomotiva values (10,1,1,3,5,3,5100,1984,54,40);
insert into locomotiva values (11,1,1,3,5,3,5100,1980,52,40);
insert into locomotiva values (12,1,1,3,5,3,5100,1978,604,41);
insert into locomotiva values (13,1,1,3,5,3,5100,1974,2,40);
insert into locomotiva values (14,1,1,3,5,3,5100,1968,176,41);
insert into locomotiva values (15,2,1,1,1,3,5100,2009,498,477);
insert into locomotiva values (16,1,2,2,2,1,2100,1976,423,62);
insert into locomotiva values (17,1,2,2,6,1,2100,1980,741,62);
insert into locomotiva values (18,1,2,2,6,1,2100,1977,768,62);
insert into locomotiva values (19,4,2,2,1,1,444,1946,905,77);
insert into locomotiva values (20,4,2,2,1,2,444,1950,917,77);
insert into locomotiva values (21,4,2,2,1,2,444,1952,781,78);
insert into locomotiva values (22,5,2,1,1,2,1800,1991,2001,96);
insert into locomotiva values (23,5,2,1,1,2,1800,2000,2010,96);
insert into locomotiva values (24,5,2,1,1,2,1800,2001,2018,96);
insert into locomotiva values (25,6,2,2,4,3,2000,1975,337,97);
insert into locomotiva values (26,6,2,1,4,3,2000,1968,502,97);
insert into locomotiva values (27,6,2,1,4,3,2000,1969,507,97);
insert into locomotiva values (28,1,3,3,1,3,1100,1965,136,82);
insert into locomotiva values (29,1,3,3,1,3,1100,1970,260,82);
insert into locomotiva values (30,1,3,3,1,3,1100,1968,338,82);

insert into alocare values (1,30,1);
insert into alocare values (2,29,2);
insert into alocare values (3,28,3);
insert into alocare values (4,27,4);
insert into alocare values (5,26,5);
insert into alocare values (6,25,6);
insert into alocare values (7,24,7);
insert into alocare values (8,23,8);
insert into alocare values (9,22,9);
insert into alocare values (10,21,10);
insert into alocare values (11,20,11);
insert into alocare values (12,19,12);
insert into alocare values (13,18,13);
insert into alocare values (14,17,14);
insert into alocare values (15,16,15);
insert into alocare values (16,15,16);
insert into alocare values (17,14,17);
insert into alocare values (18,13,18);
insert into alocare values (19,12,19);
insert into alocare values (20,11,20);
insert into alocare values (21,10,21);
insert into alocare values (22,9,22);
insert into alocare values (23,8,23);
insert into alocare values (24,7,24);
insert into alocare values (25,6,25);
insert into alocare values (26,5,26);
insert into alocare values (27,4,27);
insert into alocare values (28,3,28);
insert into alocare values (29,2,29);
insert into alocare values (30,1,30);


commit


