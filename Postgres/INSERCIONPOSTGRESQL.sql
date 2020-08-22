INSERT INTO HABITACION(id_hab, tipo_hab, precio_hab, numero_hab) VALUES
(1,'INDIVIDUAL',5.00,10),
(2,'DOBLE',10.00,20),
(3,'TRIPLE',15.00,30),
(4,'QUAD',20.00,40);

select * from HABITACION

INSERT INTO CLIENTE(cedula_cli, id_hab, nombre_cli, genero, direccion, telefono) VALUES 
('1350718480',2,'KEVIN CASTRO','MASCULINO','Barrio 4 de Noviembre',0984996202),
('1355848495',1,'ALLISON ZULETA','FEMENINO','Barrio Costa Azul',0959889338),
('1321387232',4,'ALEX ARCENTALES','MASCULINO','Barrio La Aurora',0973673728),
('1392338723',3,'POCHO ZAMBRANO','MASCULINO','Barrio Jocay',0943473843);

select * from CLIENTE

INSERT INTO RESERVAS(codigo_res, cedula_cli, id_hab, fecha_res, cantidad_personas) VALUES
(123,'1350718480',2,'2019-08-12',2),
(456,'1355848495',1,'2019-08-21',1),
(678,'1321387232',4,'2019-09-15',4),
(912,'1392338723',3,'2019-10-30',3);

select * from RESERVAS

INSERT INTO FACTURA(codigo_fact, cedula_cli, codigo_res, fecha_fact, total_fact, forma_pago) VALUES
(908,'1350718480',123,'2019-08-12',10.00,'Efectivo'),
(909,'1355848495',456,'2019-08-21',5.00,'Efectivo'),
(910,'1321387232',678,'2019-09-15',20.00,'Efectivo'),
(911,'1392338723',912,'2019-10-30',15.00,'Tarjeta de Credito');

select * from FACTURA