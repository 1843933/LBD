Use PuntoDeVenta

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

select * into Inventario
from Productos
where iProductosId>0


select iNegocioId as 'Negocio', iResponsable as 'Encargado'
from Negocio	
where iResponsable in (select iEmpleadoId from Empleados where Edad>40) 