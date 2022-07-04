USE `laboratorio_model`;
CREATE OR REPLACE VIEW `datosusuarios` AS 
select nombre + ' ' + ApellidoPaterno as Nombre, usuario, Password from usuarios;

CREATE  OR REPLACE VIEW `detalleestudiosporusuarios` AS
select SolicitudID , Usuario, FechaSolicitud from usuarios
inner join solicitudestudio on usuarios.UsuarioID = solicitudestudio.UsuarioID;

CREATE  OR REPLACE VIEW `pacientesestado` AS
select pacienteid, concat(nombre , ' ' , ApellidoPaterno , ' ' , ApellidoMaterno) as NomPaciente, direccion, pais.pais, estado.estado, ciudad.ciudad from pacienteslab
inner join ciudad on pacienteslab.CiudadID = ciudad.CiudadID
inner join estado on ciudad.EstadoID = estado.EstadoID
inner join pais on estado.PaisID = pais.PaisID;

CREATE  OR REPLACE VIEW `estudiosporusuario` AS
select Usuario, count(detallesolicitud.DetalleID) as numeroEstudiosRealizados from solicitudestudio
inner join detallesolicitud on solicitudestudio.SolicitudID = detallesolicitud.SolicitudID
inner join usuarios on solicitudestudio.UsuarioID = usuarios.UsuarioID
group by Usuario;


CREATE  OR REPLACE VIEW `detalleestudios` AS
select usuarios.Usuario, concat(p.Nombre, ' ' , p.ApellidoPaterno , ' ' , p.ApellidoMaterno) as NomPaciente , sol.FechaSolicitud, detsol.FechaResultado, sol.FechaEntrega
from usuarios
inner join solicitudestudio as sol on usuarios.UsuarioID = sol.UsuarioID
inner join detallesolicitud as detsol on sol.SolicitudID = detsol.SolicitudID
inner join pacienteslab as p on sol.PacienteID = p.PacienteID;