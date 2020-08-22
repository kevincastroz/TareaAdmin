/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   CEDULA_CLI           VARCHAR2(10)         not null,
   ID_HAB               INTEGER              not null,
   NOMBRE_CLI           VARCHAR2(50),
   GENERO               VARCHAR2(15),
   DIRECCION            VARCHAR2(50),
   TELEFONO             INTEGER,
   constraint PK_CLIENTE primary key (CEDULA_CLI)
);

/*==============================================================*/
/* Index: HABITACIONTIENECLIENTE_FK                             */
/*==============================================================*/
create index HABITACIONTIENECLIENTE_FK on CLIENTE (
   ID_HAB ASC
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA 
(
   CODIGO_FACT          INTEGER              not null,
   CEDULA_CLI           VARCHAR2(10)         not null,
   CODIGO_RES           INTEGER              not null,
   FECHA_FACT           DATE,
   TOTAL_FACT           INTEGER,
   FORMA_PAGO           VARCHAR2(30),
   constraint PK_FACTURA primary key (CODIGO_FACT)
);

/*==============================================================*/
/* Index: CLIENTETIENEFACTURA_FK                                */
/*==============================================================*/
create index CLIENTETIENEFACTURA_FK on FACTURA (
   CEDULA_CLI ASC
);

/*==============================================================*/
/* Index: RESERVASDEFACTURAS_FK                                 */
/*==============================================================*/
create index RESERVASDEFACTURAS_FK on FACTURA (
   CODIGO_RES ASC
);

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION 
(
   ID_HAB               INTEGER              not null,
   TIPO_HAB             VARCHAR2(30),
   PRECIO_HAB           INTEGER,
   NUMERO_HAB           INTEGER,
   constraint PK_HABITACION primary key (ID_HAB)
);

/*==============================================================*/
/* Table: RESERVAS                                              */
/*==============================================================*/
create table RESERVAS 
(
   CODIGO_RES           INTEGER              not null,
   CEDULA_CLI           VARCHAR2(10)         not null,
   ID_HAB               INTEGER              not null,
   FECHA_RES            DATE,
   CANTIDAD_PERSONAS    INTEGER,
   constraint PK_RESERVAS primary key (CODIGO_RES)
);

/*==============================================================*/
/* Index: CLIENTEHACERESERVAS_FK                                */
/*==============================================================*/
create index CLIENTEHACERESERVAS_FK on RESERVAS (
   CEDULA_CLI ASC
);

/*==============================================================*/
/* Index: HABITACIONESRESERVADAS_FK                             */
/*==============================================================*/
create index HABITACIONESRESERVADAS_FK on RESERVAS (
   ID_HAB ASC
);

alter table CLIENTE
   add constraint FK_CLIENTE_HABITACIO_HABITACI foreign key (ID_HAB)
      references HABITACION (ID_HAB);

alter table FACTURA
   add constraint FK_FACTURA_CLIENTETI_CLIENTE foreign key (CEDULA_CLI)
      references CLIENTE (CEDULA_CLI);

alter table FACTURA
   add constraint FK_FACTURA_RESERVASD_RESERVAS foreign key (CODIGO_RES)
      references RESERVAS (CODIGO_RES);

alter table RESERVAS
   add constraint FK_RESERVAS_CLIENTEHA_CLIENTE foreign key (CEDULA_CLI)
      references CLIENTE (CEDULA_CLI);

alter table RESERVAS
   add constraint FK_RESERVAS_HABITACIO_HABITACI foreign key (ID_HAB)
      references HABITACION (ID_HAB);

