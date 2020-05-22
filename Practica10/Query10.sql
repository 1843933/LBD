/*Practica 2*/
use PuntoDeVenta
create table Productos (
iProductosId int not null primary key,
vNombre varchar(30),
vMarca varchar(30),
fPrecio float,
iCantidad int
)
create index indx_Productos
	on Productos(vNombre desc)
ALTER TABLE Productos
ADD CONSTRAINT UC_Productos_vNombre UNIQUE(vNombre)

create table Proveedores (
iProveedorId int not null primary key,
iProducto int foreign key references Productos(iProductosId),
vNombre varchar(30),
vEmpresa varchar(30),
fCosto float
)

create table Puestos (
iPuestosId int not null primary key,
vDescripcion varchar(50),
fSueldo float
)

create table Empleados (
iEmpleadoId int not null primary key,
vNombre varchar(20),
vApPat varchar(20),
vApMat varchar(20),
vNomCompleto as (vNombre +' '+ vApPat +' '+ vApMat),
cTurno char(1),
iTelefono int,
dFechaNac datetime not null,
	Edad as DATEDIFF(year,dFechaNac, GETDATE()),
iPuesto int foreign key references Puestos(iPuestosId)
)

create index indx_dFechaNac
	on Empleados(dFechaNac desc)

ALTER TABLE  Proveedores
ADD CONSTRAINT UC_Proveedores_iProducto UNIQUE(iProducto)

create table Domicilio (
iDomicilioId int not null primary key,
vCalle varchar(30),
iNumero int,
vColonia varchar(30),
vCiudad varchar(30),
iCodPostal int
)

create table Sucursales(
iSucursalId int not null primary key,
iGerente int foreign key references Empleados(iEmpleadoId),
iDomiciolio int foreign key references Domicilio(iDomicilioId)
)
ALTER TABLE Sucursales
ADD CONSTRAINT UC_Sucursales_iGerente UNIQUE(iGerente)

create table tipoPago (
iTipoPagoId int not null primary key,
vDescripcion varchar(50)
)

create table Negocio (
iNegocioId int not null primary key,
iResponsable int foreign key references Empleados(iEmpleadoId),
iTelefono int,
iDomicilio int foreign key references Domicilio(iDomicilioId)
)

/*Practica 3*/


create table Ticket (
iTicketId int not null primary key,
dtFechaCompra datetime,
iNegocio int foreign key references Negocio(iNegocioId),
iEmpleado int foreign key references Empleados(iEmpleadoId)
)

create table TicketDetalle (
iTickDetalleId int not null primary key,
iTickRef int foreign key references Ticket(iTicketId),
iProducto int foreign key references Productos(iProductosId),
iCantidad int,
fPrecio float,
fTotal float
)

create table Inventario (
iInventarioId int not null primary key,
iSucursal int foreign key references Sucursales(iSucursalId),
iProducto int foreign key references Productos(iProductosId),
iCantidad int
)

create table Pedido (
iPedidoId int not null primary key,
iProveedor int foreign key references Proveedores(iProveedorId),
dtPedFecha datetime
)

create table PedidoDetalle (
iPedidoDetalleId int not null primary key,
iPedRef int foreign key references Pedido(iPedidoId),
vProdPedido varchar(50),
iCantidad int
)

/*Practica 6*/
insert into Puestos values(1,'Gerente',1575.89)
insert into Puestos values(2,'Responsable',1355.9)
insert into Puestos values(3,'Ayudante General',1150.50)
insert into Empleados values(1,'José ','Sanchéz','López', 'M',56424731,'1983/08/19',1)
insert into Empleados values(2,'Guadalupe','González','Salas', 'M',90369126,'1976/12/11',1)
insert into Empleados values(3,'Laura','Gomez','Estrada', 'M',94058124,'1990/03/12',1)
insert into Empleados values(4,'Erika','Mata','Guerra', 'M',56692334,'1994/05/23',1)
insert into Empleados values(5,'Valentín','Elizondo','Salas', 'M',17927054,'1967/02/12',1)
insert into Empleados values(6,'Fernando','Arellano','Flores', 'M',66616022,'1980/02/29',1)
insert into Empleados values(7,'María','Enriquez','Salinas', 'M',34220999,'1996/12/30',1)
insert into Empleados values(8,'Enrique','Fuentes','Huerta', 'M',23604406,'1985/09/12',1)
insert into Empleados values(9,'Osvaldo','Barrera','Chapa', 'M',02609260,'1989/12/13',1)
insert into Empleados values(10,'Antonia','Sada','Juarez', 'M',72156688,'2000/04/17',1)
insert into Empleados values(11,'Rosa','Melendez','Garza', 'M',44350786,'1998/12/3',1)
insert into Empleados values(12,'Eduardo','Cruz','Lomas', 'T',51532974,'2001/06/06',2)
insert into Empleados values(13,'Guillermo','Leyva','Torres', 'T',79973722,'1992/03/28',2)
insert into Empleados values(14,'Gabriel','Arredondo','Vargas', 'T',88252688,'1996/07/23',2)
insert into Empleados values(15,'Ramona','Llanas','Redondo', 'T',64161158,'1966/10/13',2)
insert into Empleados values(16,'Fernanda','Esparza','Aguirre','T',75376157,'1990/2/3',2)
insert into Empleados values(17,'Cinthya','Teniente','Lopez','T',86365896,'1987/08/1',2)
insert into Empleados values(18,'Jorge','Gaspar','Herrera','T',65389998,'1989/09/14',2)
insert into Empleados values(19,'Mariana','Zuñiga','Cortes','T',28300096,'1979/12/4',2)
insert into Empleados values(20,'Carla','Martinez','Mendoza','T',60791790,'1976/1/19',2)
insert into Empleados values(21,'Pablo','Torres','Alva','T',32940954,'1991/3/19',2)
insert into Empleados values(22,'Javier','Sosa','Nuñez','T',80564689,'1983/8/28',2)
insert into Empleados values(23,'Oscar','Guerrero','Lopez','N',90442194,'1984/7/29',3)
insert into Empleados values(24,'Elena','Oviedo','Mendez','N',90067879,'1993/10/21',3)
insert into Empleados values(25,'Carlos','Benavides','Vazquez','N',87600985,'1968/09/12',3)
insert into Empleados values(26,'Estela','Fernandez','Gonzalez','N',11834830,'1969/03/4',3)
insert into Empleados values(27,'Juanita','Garcia','Lomas','N',68735397,'1979/09/24',3)
insert into Empleados values(28,'Ivan','Mata','Hernandez','N',53038443,'1985/3/30',3)
insert into Empleados values(29,'Esteban','Gonzalez','Hinojosa','N',85215024,'1982/6/21',3)
insert into Empleados values(30,'Carmela','Ramos','Guevara','N',80619163,'1988/5/5',3)
insert into Empleados values(31,'Rosa','Martinez','Santos','N',38585645,'1984/12/23',3)
insert into Empleados values(32,'Sarah','Quintero','Rojas','N',97280149,'1992/6/22',3)
insert into Empleados values(33,'Raymundo','Luevano','Mora','N',77168218,'1989/07/23',3)
insert into Empleados values(34,'Omar','Salazar','Quiroz','M',83266342,'2000/12/26',3)
insert into Empleados values(35,'Dinah','Ibarra','Garcia','M',60281991,'1986/4/26',3)
insert into Empleados values(36,'Amy','Hernandez','Roll','M',67402753,'1996/08/25',3)
insert into Empleados values(37,'Edgar','Casarez','Siller','M',28647669,'1995/01/12',3)
insert into Empleados values(38,'Alan','Loyola','Cruz','M',60524406,'1982/09/29',3)
insert into Empleados values(39,'Monica','Almendarez','Polo','M',30754138,'1970/11/27',3)
insert into Empleados values(40,'Brenda','Castro','Flores','M',55632045,'1998/6/11',3)
insert into Empleados values(41,'Oswaldo','Rivera','Montes','M',69544957,'1986/5/20',3)
insert into Empleados values(42,'Claudio','Peña','Sanchez','M',86816362,'2000/7/12',3)
insert into Empleados values(43,'Nadia','Grimaldo','Fran','M',16365943,'1980/2/8',3)
insert into Empleados values(44,'Nora','Martinez','Esquivel','M',35458266,'1993/11/18',3)
insert into Productos values(1,'Coca-Cola 500ml','Coca-Cola',12.50,15)
insert into Productos values(2,'Saladitas','Gamesa',11.90,20)
insert into Productos values(3,'Rebanadas','Bimbo',5.50,30)
insert into Productos values(4,'Mayonesa','HELLMANS',22.90,10)
insert into Productos values(5,'Lysol','Brand',89.90,13)
insert into Productos values(6,'Froot Loops 25g ','Kelloggs ',7.49 ,28 )
insert into Productos values(7,'Chicharos ','Great Value',7.64 ,16 )
insert into Productos values(8,'Maple ','Great Value',13.99,8)
insert into Productos values(9,'Lechera 387g ','Nestle ', 19.89 ,21 )
insert into Productos values(10,'Caldo de Pollo','Knor',21.80 , 15)
insert into Productos values(11,'Galletas Polvorones','Gamesa ',13.46 ,20 )
insert into Productos values(12,'Jugo de Manzana ','Jumex ', 16.75,19 )
insert into Productos values(13,'Pizza Peperoni/FUD ','Sigma',24.58 ,23 )
insert into Proveedores values(1,1,Null,'Arca Continental',187.5)
insert into Proveedores values(2,7,Null,'Great Value',122.24)
insert into Proveedores values(3,8,Null,'Great Value',111.92)
insert into Proveedores values(4,2,Null,'Gamesa',238)
insert into Proveedores values(5,9,Null,'Nestle',417.69)
insert into Proveedores values(6,12,Null,'Jumex',318.25)
insert into Proveedores values(7,6,Null,'Kelloggs',209.72)
insert into Proveedores values(8,3,Null,'Bimbo',165)
insert into Proveedores values(9,5,Null,'Brand',1168.7)
insert into Proveedores values(10,4,Null,'Hellmans', 229)
insert into Proveedores values(11,10,Null,'Knor',327 )
insert into Proveedores values(12,13,Null,'Sigma', 565.34)
insert into Proveedores values(13,11,Null,'Gamesa',269.2 )
insert into Pedido  values(1,1,'2020/3/2')
insert into Pedido  values(2,2,'2020/3/2')
insert into Pedido  values(3,3,'2020/3/07')
insert into Pedido  values(4,4,'2020/3/9')
insert into Pedido  values(5,5,'2020/3/11')
insert into Pedido  values(6,6,'2020/2/13')
insert into Pedido  values(7,7,'2020/3/14')
insert into Pedido  values(8,8,'2020/3/19')
insert into Pedido  values(9,9,'2020/3/24')
insert into Pedido  values(10,10,'2020/3/24')
insert into Pedido  values(11,11,'2020/3/26')
insert into Pedido  values(12,12,'2020/3/29')
insert into Pedido  values(13,13,'2020/3/30')
insert into PedidoDetalle values(1,1,'Coca Cola 500ml',20)
insert into PedidoDetalle values(2,2,'Chicharos',10)
insert into PedidoDetalle values(3,3,'Mapple',18)
insert into PedidoDetalle values(4,4,'Saladitas',12)
insert into PedidoDetalle values(5,5,'Lechera',15)
insert into PedidoDetalle values(6,6,'Jugo de manzana',23)
insert into PedidoDetalle values(7,7,'Froot Loops',18)
insert into PedidoDetalle values(8,8,'Rebanadas',16)
insert into PedidoDetalle values(9,9,'Lysol',15)
insert into PedidoDetalle values(10,10,'Mayonesa',13)
insert into PedidoDetalle values(11,11,'Caldo de Pollo',24)
insert into PedidoDetalle values(12,12,'Pizza Peperoni/FUD',9)
insert into PedidoDetalle values(13,13,'Galletas Polvorones',6)
insert into Domicilio values (1,'Julián Villagrán',1102, 'Centro','Monterrey',64000)
insert into Domicilio values(2,'Vicente Guerrero', 900, 'Centro', 'Monterrey',64000)
insert into Domicilio values(3,'Alfonso Reyes',1581, 'Sarabia', 'Monterrey',64490)
insert into Domicilio values(4,'Francisco I. Madero', 508,'Centro','Monterrey', 64000)
insert into Domicilio values(5,'Coatlicue',291,'Fama II','Santa Catarina',66116)
insert into Domicilio values(6,'Ignacio Morones Prieto',789,'Nemesio García Naranjo','San Pedro Garza García',66239)
insert into Domicilio values(7,'Río Amazonas', 552, 'Del Valle','San Pedro Garza García',66220)
insert into Domicilio values(8,'Anillo Periferico',1606,'San Jeronimo','Monterrey', 64634)
insert into Domicilio values(9,'Vasconcelos Poniente', 725,'Del Valle','San Pedro Garza García',66220)
insert into Domicilio values(10, 'Las Puentes', 663, 'Paseo de las Puentes','San Nicolás de los Garza',66460)
insert into Domicilio values(11,'Cordillera de los Andes', 1230,'Hacienda de Santo Domingo', 'San Nicolás de los Garza',66449)
insert into Negocio values(1,12,71543726,1)
insert into Negocio values(2,13,30439386,2)
insert into Negocio values(3,14,15518486,3)
insert into Negocio values(4,15,14598364,4)
insert into Negocio values(5,16,52043817,5)
insert into Negocio values(6,17,41766754,6)
insert into Negocio values(7,18,94151815,7)
insert into Negocio values(8,19,44778588,8)
insert into Negocio values(9,20,43021979,9)
insert into Negocio values(10,21,10777698,10)
insert into Negocio values(11,22,98850746 ,11)
insert into Sucursales values(1,1,1)
insert into Sucursales values(2,2,2)
insert into Sucursales values(3,3,3)
insert into Sucursales values(4,4,4)
insert into Sucursales values(5,5,5)
insert into Sucursales values(6,6,6)
insert into Sucursales values(7,7,7)
insert into Sucursales values(8,8,8)
insert into Sucursales values(9,9,9)
insert into Sucursales values(10,10,10)
insert into Sucursales values(11,11,11)
insert into tipoPago values(1,'Efectivo')
insert into tipoPago values(2,'Tarjeta')
insert into tipoPago values(3,'Cupones/Descuentos')


update Puestos
set vDescripcion='Encargado'
where iPuestosId=1
update tipoPago
set vDescripcion='Tarjeta de Crédito'
where iTipoPagoId=1
update Proveedores
set vNombre='Jaime Gonzalez'
where iProveedorId=1
update Empleados
set cTurno='N'
where iEmpleadoId=40
update Empleados
set iTelefono=18384473
where iEmpleadoId=44

update Empleados
set cTurno='N', iPuesto=2
where iEmpleadoId=41
update Proveedores
set vNombre='Eduardo Perez', fCosto=132.35
where iProveedorId=2
update PedidoDetalle
set vProdPedido='Coca-Cola 500ml', iCantidad=30
where iPedidoDetalleId=1
update Empleados
set iTelefono=34578949, cTurno='M'
where iEmpleadoId=43
update Negocio
set iTelefono=22498583, iResponsable=41
where iNegocioId=1

delete from Empleados
where iEmpleadoId=43
delete from  Pedido
where iPedidoId=1
delete from PedidoDetalle
where iPedidoDetalleId=1
delete from tipoPago
where iTipoPagoId=3
delete from Empleados
where iTelefono=60524406


/*Practica 7*/

select iEmpleadoId, vNomCompleto,cTurno,iTelefono,Edad,iPuesto from Empleados where iPuesto=2
select iDomicilio,iTelefono,iResponsable from Negocio where iDomicilio>=5
select vCalle,vColonia, vCiudad, iCodPostal from Domicilio where vCiudad='San Pedro Garza García'
select iEmpleadoId,vNombre, vApPat, Edad from Empleados where Edad<25
select vCalle,iNumero,vColonia,vCiudad from Domicilio where iCodPostal=64000

select COUNT(iDomicilioId), vCiudad  from Domicilio where vCiudad='Monterrey'  Group by vCiudad
select COUNT(iEmpleadoId),vApPat from Empleados where vApPat='Hernandez' Group by vApPat
select COUNT(iEmpleadoId),cTurno from Empleados where cTurno='T' Group by cTurno
select COUNT(iProductosId),vMarca from Productos where vMarca='Gamesa' Group by vMarca 
select COUNT(iPedidoId),dtPedFecha from Pedido where dtPedFecha>'2020/3/20' Group by dtPedFecha

select COUNT(iDomicilioId),iCodPostal from Domicilio group by iCodPostal having COUNT(iDomicilioId)>2
select COUNT(iEmpleadoId),Edad from Empleados group by Edad having COUNT(iEmpleadoId)=3
select COUNT(iPedidoId), dtPedFecha from Pedido group by dtPedFecha having COUNT(iPedidoId)=2
select COUNT(iProductosId),iCantidad from Productos group by (iCantidad) having COUNT(iProductosId)<15
select COUNT(iSucursalId),iGerente from Sucursales  group by (iGerente) having COUNT(iSucursalId)=1


select tr.vNomCompleto as 'Nombre', p.vDescripcion as 'Puesto'
from Empleados as tr
INNER JOIN Puestos as p on tr.iPuesto = p.iPuestosId;

select cTurno, COUNT(cTurno) as 'Empleados en turno'
FROM Empleados
GROUP BY cTurno;

SELECT suc.iSucursalId as 'Sucursal', dom.iDomicilioId as 'Domicilio'
FROM Domicilio as dom
INNER JOIN Sucursales as suc ON dom.iDomicilioId = suc.iDomiciolio;


SELECT vMarca, COUNT(vMarca) as 'Productos'
FROM Productos
GROUP BY vMarca;
			
select TOP 5 *from Empleados;
select TOP 3 *from Empleados where iPuesto=2;
select TOP 4 *from Domicilio where iCodPostal>66000
select TOP 10 *from Productos where iCantidad>20;
select TOP 3 *from Proveedores where iProveedorId<3;

/*Practica 8*/

select *from Negocio
select Empleados.vNomCompleto,Negocio.iResponsable
from Empleados
right join Negocio on Empleados.iEmpleadoId =Negocio.iResponsable
order by iNegocioId

select Negocio.iDomicilio, Domicilio.vCalle,Domicilio.iNumero,Domicilio.vColonia,Domicilio.vCiudad 
from Domicilio
right join Negocio on Negocio.iDomicilio=iDomicilioId
order by iCodPostal

select Productos.vNombre,Proveedores.vNombre,Proveedores.vEmpresa, Productos.iCantidad
from Productos
left join Proveedores on Proveedores.iProveedorId=Productos.iProductosId
order by iCantidad 

select Pedido.iProveedor,PedidoDetalle.vProdPedido,PedidoDetalle.iCantidad 
from Pedido
left join  PedidoDetalle on Pedido.iPedidoId=PedidoDetalle.iPedRef
 order by iCantidad

SELECT emp.vNomCompleto as 'Gerente', suc.iSucursalId as 'Sucursal'
FROM Empleados as emp
INNER JOIN Sucursales as suc ON emp.iEmpleadoId= suc.iSucursalId;

select p.vNombre as 'Producto',prov.vEmpresa as 'Empresa',p.iCantidad as 'Cantidad',p.fPrecio as 'Precio'
from Proveedores as prov
INNER JOIN Productos as p on p.iProductosId=prov.iProducto;

select  s.iSucursalId as 'Sucursal',p.vDescripcion as 'Puesto',p.fSueldo as 'Salario'
from Puestos as p
cross join Sucursales as s
where s.iSucursalId<3
order by iPuestosId

select n.iNegocioId as 'Negocio',e.vNomCompleto as 'Responsable', d.vCalle+', '+d.vColonia+', '+d.vCiudad as 'Domicilio'
from Domicilio as d, Empleados as e
cross join Negocio as n
where d.iDomicilioId=n.iDomicilio and  n.iResponsable=e.iEmpleadoId


select * into Almacen
from Productos
where iProductosId>0
select iNegocioId as 'Negocio', iResponsable as 'Encargado'
from Negocio	
where iResponsable in (select iEmpleadoId from Empleados where Edad>40) 

/*Practica 9*/


CREATE VIEW vista_Cantidad_Productos_Por_Marca AS
select  count(iProductosid) Cantidad , vMarca from Productos Group by vMarca
go
select *from vista_Cantidad_Productos_Por_Marca

CREATE VIEW vista_Cantidad_Empleados_Por_Turno AS
select  count(iEmpleadoid) iCantidadEmpleados , cTurno from Empleados Group by cTurno
go
select *from  vista_Cantidad_Empleados_Por_Turno

CREATE VIEW vista_Cantidad_Domicilios_Por_Cuidad AS
select  count(iDomicilioid) iCantidadDomicilios , vCiudad from Domicilio Group by vCiudad
go
select *from  vista_Cantidad_Domicilios_Por_Cuidad

CREATE VIEW vista_Cantidad_Empleados_Por_Puesto AS
select  count(iEmpleadoid) iCantidadEmpleados , iPuesto from Empleados Group by iPuesto
go
select *from  vista_Cantidad_Empleados_Por_Puesto

CREATE VIEW vista_Cantidad_Pedidos_Por_Fecha AS
select  count(iPedidoid) iCantidadPedidos , dtPedFecha from Pedido Group by dtPedfecha
go
select *from  vista_Cantidad_Pedidos_Por_Fecha

/*Practica 10*/
CREATE PROCEDURE Productos_Por_marca @vMarca nvarchar(30)
AS
SELECT * FROM vista_Cantidad_Productos_Por_Marca WHERE vMarca = @vMarca
go
EXEC Productos_Por_marca @vMarca = 'Bimbo';

CREATE PROCEDURE Empleados_Por_Turno @cTurno nvarchar(30)
AS
SELECT * FROM vista_Cantidad_Empleados_Por_Turno WHERE cTurno = @cTurno
GO
EXEC Empleados_Por_Turno @cTurno = 'm';

CREATE PROCEDURE Domicilios_Por_Cuidad @vCiudad nvarchar(30)
AS
SELECT * FROM vista_Cantidad_Domicilios_Por_Cuidad WHERE vCiudad = @vCiudad
GO
EXEC Domicilios_Por_Cuidad @vCiudad = 'Monterrey';

CREATE PROCEDURE Empleados_Por_Puestos @iPuesto nvarchar(30)
AS
SELECT * FROM vista_Cantidad_Empleados_Por_Puesto WHERE iPuesto = @iPuesto
GO
EXEC Empleados_Por_Puestos @iPuesto = '1';

CREATE PROCEDURE Pedidos_Por_Fecha @dtPedFecha datetime
AS
SELECT * FROM vista_Cantidad_Pedidos_Por_Fecha WHERE dtPedFecha  = @dtPedFecha 
GO
EXEC Pedidos_Por_Fecha @dtPedFecha = '2020-02-13 00:00:00.000';

Create  function  SalarioTotalEmpleadosPorPuesto(@iPuestoid int) returns int
as
begin
declare @Salario int
select @Salario = (SUM(fSueldo)/count(iEmpleadoId)) from Puestos RIGHT JOIN Empleados ON Puestos.iPuestosid = Empleados.iPuesto 
where iPuesto=@iPuestoid
return @Salario
end 

select vDescripcion, dbo.SalarioTotalEmpleadosPorPuesto(1) as salarioTotal from Puestos where iPuestosid = 1

Create  function  SalarioTotalEmpleadosPorPuestos(@iPuestoid int) returns int
as
begin
declare @Salario int
select @Salario = SUM(fSueldo) from Puestos RIGHT JOIN Empleados ON Puestos.iPuestosid = Empleados.iPuesto 
where iPuesto=@iPuestoid
return @Salario
end 

select vDescripcion, dbo.SalarioTotalEmpleadosPorPuestos(1) as salarioTotal from Puestos where iPuestosid = 1

Create function  DomicilioMismoCP(@iCodPostal int) returns int
as 
begin
declare @CODPOS int
select @CODPOS= count(iDomicilioId) from Domicilio 
where iCodPostal=64000
return @CODPOS
end

select vCiudad, dbo.DomicilioMismoCP(1) as CodigoPostal from Domicilio where iCodPostal=64000 group by vCiudad

create trigger TR_Domicilio_Insert_Aviso
on Domicilio
for insert
as 
print 'Se Insertaron datos en la Tabla Domicilio';

create trigger TR_Empleado_Insert
on Empleados
after insert
as 
print 'Se Insertaron datos en la Tabla Empleado';

create trigger TR_Pedido_Insert
on Pedido
instead of insert
as 
print 'Se Insertaron datos en la Tabla Pedido';

insert into Empleados values(45,'Delia','Garza','Walker', 'M',89238124,'1980/11/12',1)
