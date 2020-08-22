/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CEDULA_CLI           VARCHAR(10)          not null,
   ID_HAB               INT4                 not null,
   NOMBRE_CLI           VARCHAR(50)          null,
   GENERO               VARCHAR(15)          null,
   DIRECCION            VARCHAR(50)          null,
   TELEFONO             INT4                 null,
   constraint PK_CLIENTE primary key (CEDULA_CLI)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CEDULA_CLI
);

/*==============================================================*/
/* Index: HABITACIONTIENECLIENTE_FK                             */
/*==============================================================*/
create  index HABITACIONTIENECLIENTE_FK on CLIENTE (
ID_HAB
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   CODIGO_FACT          INT4                 not null,
   CEDULA_CLI           VARCHAR(10)          not null,
   CODIGO_RES           INT4                 not null,
   FECHA_FACT           DATE                 null,
   TOTAL_FACT           INT4                 null,
   FORMA_PAGO           VARCHAR(30)          null,
   constraint PK_FACTURA primary key (CODIGO_FACT)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
CODIGO_FACT
);

/*==============================================================*/
/* Index: CLIENTETIENEFACTURA_FK                                */
/*==============================================================*/
create  index CLIENTETIENEFACTURA_FK on FACTURA (
CEDULA_CLI
);

/*==============================================================*/
/* Index: RESERVASDEFACTURAS_FK                                 */
/*==============================================================*/
create  index RESERVASDEFACTURAS_FK on FACTURA (
CODIGO_RES
);

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   ID_HAB               INT4                 not null,
   TIPO_HAB             VARCHAR(30)          null,
   PRECIO_HAB           INT4                 null,
   NUMERO_HAB           INT4                 null,
   constraint PK_HABITACION primary key (ID_HAB)
);

/*==============================================================*/
/* Index: HABITACION_PK                                         */
/*==============================================================*/
create unique index HABITACION_PK on HABITACION (
ID_HAB
);

/*==============================================================*/
/* Table: RESERVAS                                              */
/*==============================================================*/
create table RESERVAS (
   CODIGO_RES           INT4                 not null,
   CEDULA_CLI           VARCHAR(10)          not null,
   ID_HAB               INT4                 not null,
   FECHA_RES            DATE                 null,
   CANTIDAD_PERSONAS    INT4                 null,
   constraint PK_RESERVAS primary key (CODIGO_RES)
);

/*==============================================================*/
/* Index: RESERVAS_PK                                           */
/*==============================================================*/
create unique index RESERVAS_PK on RESERVAS (
CODIGO_RES
);

/*==============================================================*/
/* Index: CLIENTEHACERESERVAS_FK                                */
/*==============================================================*/
create  index CLIENTEHACERESERVAS_FK on RESERVAS (
CEDULA_CLI
);

/*==============================================================*/
/* Index: HABITACIONESRESERVADAS_FK                             */
/*==============================================================*/
create  index HABITACIONESRESERVADAS_FK on RESERVAS (
ID_HAB
);

alter table CLIENTE
   add constraint FK_CLIENTE_HABITACIO_HABITACI foreign key (ID_HAB)
      references HABITACION (ID_HAB)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_CLIENTETI_CLIENTE foreign key (CEDULA_CLI)
      references CLIENTE (CEDULA_CLI)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RESERVASD_RESERVAS foreign key (CODIGO_RES)
      references RESERVAS (CODIGO_RES)
      on delete restrict on update restrict;

alter table RESERVAS
   add constraint FK_RESERVAS_CLIENTEHA_CLIENTE foreign key (CEDULA_CLI)
      references CLIENTE (CEDULA_CLI)
      on delete restrict on update restrict;

alter table RESERVAS
   add constraint FK_RESERVAS_HABITACIO_HABITACI foreign key (ID_HAB)
      references HABITACION (ID_HAB)
      on delete restrict on update restrict;

