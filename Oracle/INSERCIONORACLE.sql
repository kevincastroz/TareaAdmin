INSERT INTO HABITACION VALUES(1,'INDIVIDUAL',5.00,10);
INSERT INTO HABITACION VALUES(2,'DOBLE',10.00,20);
INSERT INTO HABITACION VALUES(3,'TRIPLE',15.00,30);
INSERT INTO HABITACION VALUES(4,'QUAD',20.00,40);

select * from HABITACION

INSERT INTO CLIENTE VALUES('1350718480',2,'KEVIN CASTRO','MASCULINO','Barrio 4 de Noviembre',0984996202);
INSERT INTO CLIENTE VALUES('1355848495',1,'ALLISON ZULETA','FEMENINO','Barrio Costa Azul',0959889338);
INSERT INTO CLIENTE VALUES('1321387232',4,'ALEX ARCENTALES','MASCULINO','Barrio La Aurora',0973673728);
INSERT INTO CLIENTE VALUES('1392338723',3,'POCHO ZAMBRANO','MASCULINO','Barrio Jocay',0943473843);

select * from CLIENTE


INSERT INTO RESERVAS VALUES(123,'1350718480',2,'12-08-19',2);
INSERT INTO RESERVAS VALUES(456,'1355848495',1,'21-08-19',1);
INSERT INTO RESERVAS VALUES(678,'1321387232',4,'15-09-19',4);
INSERT INTO RESERVAS VALUES(912,'1392338723',3,'30-10-19',3);

select * from RESERVAS

INSERT INTO FACTURA VALUES(908,'1350718480',123,'12-08-19',10.00,'Efectivo');
INSERT INTO FACTURA VALUES(909,'1355848495',456,'21-08-19',5.00,'Efectivo');
INSERT INTO FACTURA VALUES(910,'1321387232',678,'15-09-19',20.00,'Efectivo');
INSERT INTO FACTURA VALUES(911,'1392338723',912,'30-10-19',15.00,'Tarjeta de Credito');

select * from FACTURA