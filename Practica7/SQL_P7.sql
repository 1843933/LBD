use PuntoDeVenta
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

select*from Sucursales 
use PuntoDeVenta
select tr.vNomCompleto as 'Nombre', p.vDescripcion as 'Puesto'
from Empleados as tr
INNER JOIN Puestos as p on tr.iPuesto = p.iPuestosId;

select cTurno, COUNT(cTurno) as 'Empleados en turno'
FROM Empleados
GROUP BY cTurno;

SELECT suc.iSucursalId as 'Sucursal', dom.iDomicilioId as 'Domicilio'
FROM Domicilio as dom
INNER JOIN Sucursales as suc ON dom.iDomicilioId = suc.iDomiciolio;


SELECT iPuesto, COUNT(iPuesto) as 'Cantidad Trabajadores'
FROM Empleados
GROUP BY iPuesto;

SELECT vMarca, COUNT(vMarca) as 'Productos'
FROM Productos
GROUP BY vMarca;

select TOP 5 *from Empleados;
select TOP 3 *from Empleados where iPuesto=2;
select TOP 4 *from Domicilio where iCodPostal>66000
select TOP 10 *from Productos where iCantidad>20;
select TOP 3 *from Proveedores where iProveedorId<3;