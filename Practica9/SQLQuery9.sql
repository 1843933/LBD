
    /*Practica 9 */
use PuntoDeVenta
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