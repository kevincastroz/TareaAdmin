/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     21/8/2020 3:10:47                            */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLIENTE') and o.name = 'FK_CLIENTE_HABITACIO_HABITACI')
alter table CLIENTE
   drop constraint FK_CLIENTE_HABITACIO_HABITACI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTURA') and o.name = 'FK_FACTURA_CLIENTETI_CLIENTE')
alter table FACTURA
   drop constraint FK_FACTURA_CLIENTETI_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FACTURA') and o.name = 'FK_FACTURA_RESERVASD_RESERVAS')
alter table FACTURA
   drop constraint FK_FACTURA_RESERVASD_RESERVAS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESERVAS') and o.name = 'FK_RESERVAS_CLIENTEHA_CLIENTE')
alter table RESERVAS
   drop constraint FK_RESERVAS_CLIENTEHA_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RESERVAS') and o.name = 'FK_RESERVAS_HABITACIO_HABITACI')
alter table RESERVAS
   drop constraint FK_RESERVAS_HABITACIO_HABITACI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLIENTE')
            and   name  = 'HABITACIONTIENECLIENTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLIENTE.HABITACIONTIENECLIENTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTURA')
            and   name  = 'RESERVASDEFACTURAS_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTURA.RESERVASDEFACTURAS_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('FACTURA')
            and   name  = 'CLIENTETIENEFACTURA_FK'
            and   indid > 0
            and   indid < 255)
   drop index FACTURA.CLIENTETIENEFACTURA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FACTURA')
            and   type = 'U')
   drop table FACTURA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HABITACION')
            and   type = 'U')
   drop table HABITACION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESERVAS')
            and   name  = 'HABITACIONESRESERVADAS_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESERVAS.HABITACIONESRESERVADAS_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESERVAS')
            and   name  = 'CLIENTEHACERESERVAS_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESERVAS.CLIENTEHACERESERVAS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RESERVAS')
            and   type = 'U')
   drop table RESERVAS
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CEDULA_CLI           varchar(10)          not null,
   ID_HAB               int                  not null,
   NOMBRE_CLI           varchar(50)          null,
   GENERO               varchar(15)          null,
   DIRECCION            varchar(50)          null,
   TELEFONO             int                  null,
   constraint PK_CLIENTE primary key (CEDULA_CLI)
)
go

/*==============================================================*/
/* Index: HABITACIONTIENECLIENTE_FK                             */
/*==============================================================*/
create index HABITACIONTIENECLIENTE_FK on CLIENTE (
ID_HAB ASC
)
go

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   CODIGO_FACT          int                  not null,
   CODIGO_RES           int                  not null,
   CEDULA_CLI           varchar(10)          not null,
   FECHA_FACT           datetime             null,
   TOTAL_FACT           int                  null,
   FORMA_PAGO           varchar(30)          null,
   constraint PK_FACTURA primary key (CODIGO_FACT)
)
go

/*==============================================================*/
/* Index: CLIENTETIENEFACTURA_FK                                */
/*==============================================================*/
create index CLIENTETIENEFACTURA_FK on FACTURA (
CEDULA_CLI ASC
)
go

/*==============================================================*/
/* Index: RESERVASDEFACTURAS_FK                                 */
/*==============================================================*/
create index RESERVASDEFACTURAS_FK on FACTURA (
CODIGO_RES ASC
)
go

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   ID_HAB               int                  not null,
   TIPO_HAB             varchar(30)          null,
   PRECIO_HAB           int                  null,
   NUMERO_HAB           int                  null,
   constraint PK_HABITACION primary key (ID_HAB)
)
go

/*==============================================================*/
/* Table: RESERVAS                                              */
/*==============================================================*/
create table RESERVAS (
   CODIGO_RES           int                  not null,
   ID_HAB               int                  not null,
   CEDULA_CLI           varchar(10)          not null,
   FECHA_RES            datetime             null,
   CANTIDAD_PERSONAS    int                  null,
   constraint PK_RESERVAS primary key (CODIGO_RES)
)
go

/*==============================================================*/
/* Index: CLIENTEHACERESERVAS_FK                                */
/*==============================================================*/
create index CLIENTEHACERESERVAS_FK on RESERVAS (
CEDULA_CLI ASC
)
go

/*==============================================================*/
/* Index: HABITACIONESRESERVADAS_FK                             */
/*==============================================================*/
create index HABITACIONESRESERVADAS_FK on RESERVAS (
ID_HAB ASC
)
go

alter table CLIENTE
   add constraint FK_CLIENTE_HABITACIO_HABITACI foreign key (ID_HAB)
      references HABITACION (ID_HAB)
go

alter table FACTURA
   add constraint FK_FACTURA_CLIENTETI_CLIENTE foreign key (CEDULA_CLI)
      references CLIENTE (CEDULA_CLI)
go

alter table FACTURA
   add constraint FK_FACTURA_RESERVASD_RESERVAS foreign key (CODIGO_RES)
      references RESERVAS (CODIGO_RES)
go

alter table RESERVAS
   add constraint FK_RESERVAS_CLIENTEHA_CLIENTE foreign key (CEDULA_CLI)
      references CLIENTE (CEDULA_CLI)
go

alter table RESERVAS
   add constraint FK_RESERVAS_HABITACIO_HABITACI foreign key (ID_HAB)
      references HABITACION (ID_HAB)
go

