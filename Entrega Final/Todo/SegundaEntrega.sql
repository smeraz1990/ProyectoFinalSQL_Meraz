DROP DATABASE IF EXISTS laboratorio_model;
CREATE DATABASE `laboratorio_model`;

USE laboratorio_model;

CREATE TABLE `usuarios` (
  `UsuarioID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `ApellidoPaterno` varchar(50) NOT NULL,
  `FechaIngreso` date NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`UsuarioID`)
);

CREATE TABLE `pais` (
  `PaisID` int NOT NULL AUTO_INCREMENT,
  `Pais` varchar(50) NOT NULL,
  PRIMARY KEY (`PaisID`),
  UNIQUE KEY `PaisID_UNIQUE` (`PaisID`)
);


CREATE TABLE `estado` (
  `EstadoID` int NOT NULL AUTO_INCREMENT,
  `Estado` varchar(50) NOT NULL,
  `PaisID` int NOT NULL,
  PRIMARY KEY (`EstadoID`),
  UNIQUE KEY `EstadoID_UNIQUE` (`EstadoID`),
  KEY `fk_paisid_idx` (`PaisID`),
  CONSTRAINT `fk_paisid` FOREIGN KEY (`PaisID`) REFERENCES `pais` (`PaisID`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE `ciudad` (
  `CiudadID` int NOT NULL AUTO_INCREMENT,
  `Ciudad` varchar(50) NOT NULL,
  `EstadoID` int NOT NULL,
  PRIMARY KEY (`CiudadID`),
  KEY `fk_estadoid_ciudad_idx` (`EstadoID`),
  CONSTRAINT `fk_estadoid_ciudad` FOREIGN KEY (`EstadoID`) REFERENCES `estado` (`EstadoID`)
) COMMENT='Contiene Ciudades';

CREATE TABLE `pacienteslab` (
  `PacienteID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `ApellidoPaterno` varchar(50) NOT NULL,
  `ApellidoMaterno` varchar(50) NOT NULL,
  `FechaRegistro` date NOT NULL DEFAULT (curdate()),
  `FechaNacimiento` date NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `CiudadID` int NOT NULL,
  PRIMARY KEY (`PacienteID`),
  KEY `fk_ciudadID_paciente_idx` (`CiudadID`),
  CONSTRAINT `fk_ciudad_pacientes` FOREIGN KEY (`CiudadID`) REFERENCES `ciudad` (`CiudadID`)
);

CREATE TABLE `tipotomamuestra` (
  `TipoTomaMuestraID` int NOT NULL AUTO_INCREMENT,
  `TipoTomaMuestra` varchar(50) NOT NULL,
  PRIMARY KEY (`TipoTomaMuestraID`),
  UNIQUE KEY `TipoTomaMuestraID_UNIQUE` (`TipoTomaMuestraID`)
) COMMENT='Contiene Tipo de muesta\n';

CREATE TABLE `tiporesultados` (
  `TipoResultadoID` int NOT NULL AUTO_INCREMENT,
  `TipoResultado` varchar(50) NOT NULL,
  PRIMARY KEY (`TipoResultadoID`)
) COMMENT='Contiene los tipos de resultados posibles\n';

CREATE TABLE `solicitudestudio` (
  `SolicitudID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `PacienteID` int NOT NULL,
  `FechaSolicitud` date NOT NULL DEFAULT (curdate()),
  `FechaEntrega` date DEFAULT NULL,
  `SolicitudFinalizada` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`SolicitudID`),
  KEY `fk_usuarioid_usuario_idx` (`UsuarioID`),
  KEY `fk_pacienteid` (`PacienteID`),
  CONSTRAINT `fk_pacienteid` FOREIGN KEY (`PacienteID`) REFERENCES `pacienteslab` (`PacienteID`),
  CONSTRAINT `fk_usuarioid_usuario` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`)
);



CREATE TABLE `estudios` (
  `EstudioID` int NOT NULL AUTO_INCREMENT,
  `NombreEstudio` varchar(100) NOT NULL,
  `TipoTomaMuestraID` int NOT NULL,
  `Activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`EstudioID`),
  KEY `fk_tipotomamiestraid_tipotoma_idx` (`TipoTomaMuestraID`),
  CONSTRAINT `fk_tipotomamiestraid_tipotoma` FOREIGN KEY (`TipoTomaMuestraID`) REFERENCES `tipotomamuestra` (`TipoTomaMuestraID`)
) COMMENT='Contiene los estudios que realiza el laboratorio';



CREATE TABLE `detallesolicitud` (
  `DetalleID` int NOT NULL AUTO_INCREMENT,
  `SolicitudID` int NOT NULL,
  `EstudioID` int NOT NULL,
  `TipoResultadoID` int NOT NULL,
  `Comentarios` varchar(300) DEFAULT NULL,
  `FechaResultado` date DEFAULT NULL,
  PRIMARY KEY (`DetalleID`),
  KEY `fk_estudioid_idx` (`EstudioID`),
  KEY `fk_solicitudid` (`SolicitudID`),
  KEY `fk_tipoResultado_idx` (`TipoResultadoID`),
  CONSTRAINT `fk_estudioid` FOREIGN KEY (`EstudioID`) REFERENCES `estudios` (`EstudioID`),
  CONSTRAINT `fk_solicitudid` FOREIGN KEY (`SolicitudID`) REFERENCES `solicitudestudio` (`SolicitudID`),
  CONSTRAINT `fk_tipoResultado` FOREIGN KEY (`TipoResultadoID`) REFERENCES `tiporesultados` (`TipoResultadoID`)
) COMMENT='Contiene el detalle de la solicitud con estudios';


-- Insert tabla usuarios
INSERT INTO `laboratorio_model`.`usuarios` (`Nombre`, `ApellidoPaterno`, `FechaIngreso`, `Usuario`, `Password`, `Activo`) VALUES ('Simon', 'Meraz', '2015-04-10', 'smeraz', 'sd1957080890', 1);
INSERT INTO `laboratorio_model`.`usuarios` (`Nombre`, `ApellidoPaterno`, `FechaIngreso`, `Usuario`, `Password`, `Activo`) VALUES ('Hector', 'Cruz', '2015-05-03', 'hcruz', '1!monedasy+G', 1);
INSERT INTO `laboratorio_model`.`usuarios` (`Nombre`, `ApellidoPaterno`, `FechaIngreso`, `Usuario`, `Password`, `Activo`) VALUES ('Carlos Alberto', 'Arroyo', '2018-06-5', 'carroyo', 'Abadol117', 1);
INSERT INTO `laboratorio_model`.`usuarios` (`Nombre`, `ApellidoPaterno`, `FechaIngreso`, `Usuario`, `Password`, `Activo`) VALUES ('Arturo', 'Nuñez', '2017-01-01', 'anunez', 'anunez04.', 1);
INSERT INTO `laboratorio_model`.`usuarios` (`Nombre`, `ApellidoPaterno`, `FechaIngreso`, `Usuario`, `Password`, `Activo`) VALUES ('Roberto', 'Arriaga', '2016-07-22', 'rarriaga', 'chupamilto81', 1);
INSERT INTO `laboratorio_model`.`usuarios` (`Nombre`, `ApellidoPaterno`, `FechaIngreso`, `Usuario`, `Password`, `Activo`) VALUES ('Iván de Jesús', 'López', '2020-07-09', 'ilopez.gk', 'r7b;R{{d{80SRDnS%2cI', 0);
INSERT INTO `laboratorio_model`.`usuarios` (`Nombre`, `ApellidoPaterno`, `FechaIngreso`, `Usuario`, `Password`, `Activo`) VALUES ('Karla', 'Rocha', '2021-09-30', 'krocha', 'frida1313', 1);
INSERT INTO `laboratorio_model`.`usuarios` (`Nombre`, `ApellidoPaterno`, `FechaIngreso`, `Usuario`, `Password`, `Activo`) VALUES ('Amira', 'De Luna', '2018-09-06', 'adeluna', '1013deluna', 1);
INSERT INTO `laboratorio_model`.`usuarios` (`Nombre`, `ApellidoPaterno`, `FechaIngreso`, `Usuario`, `Password`, `Activo`) VALUES ('Synertix', 'Contadores', '2021-09-05', 'uSynertix', '12345abcde', 0);
INSERT INTO `laboratorio_model`.`usuarios` (`Nombre`, `ApellidoPaterno`, `FechaIngreso`, `Usuario`, `Password`, `Activo`) VALUES ('Georgina', 'Esparza', '2020-05-16', 'gk.gina', '260octavio', 1);

-- Insert tabla pais
INSERT INTO `laboratorio_model`.`pais` (`PaisID`, `Pais`) VALUES ('1', 'México');
INSERT INTO `laboratorio_model`.`pais` (`PaisID`, `Pais`) VALUES ('2', 'Estados Unidos de América');
INSERT INTO `laboratorio_model`.`pais` (`PaisID`, `Pais`) VALUES ('3', 'Colombia');
INSERT INTO `laboratorio_model`.`pais` (`PaisID`, `Pais`) VALUES ('4', 'Portugal');
INSERT INTO `laboratorio_model`.`pais` (`PaisID`, `Pais`) VALUES ('5', 'España');
INSERT INTO `laboratorio_model`.`pais` (`PaisID`, `Pais`) VALUES ('6', 'Alemania');
INSERT INTO `laboratorio_model`.`pais` (`PaisID`, `Pais`) VALUES ('7', 'India');
INSERT INTO `laboratorio_model`.`pais` (`PaisID`, `Pais`) VALUES ('8', 'Austria');
INSERT INTO `laboratorio_model`.`pais` (`PaisID`, `Pais`) VALUES ('9', 'Australia');
INSERT INTO `laboratorio_model`.`pais` (`PaisID`, `Pais`) VALUES ('10', 'Nueva Zelanda');

-- tabla estado
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('1', 'Aguascalientes', '1');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('2', 'Baja California Norte', '1');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('3', 'Baja California Sur', '1');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('4', 'Campeche', '1');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('5', 'Chiapas', '1');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('6', 'Chihuahua', '1');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('7', 'Coahuila de Zaragoza', '1');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('8', 'Colima', '1');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('9', 'Ciudad de México', '1');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('10', 'Durango', '1');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('11', 'Alabama', '2');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('12', 'Alaska', '2');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('13', 'Arizona', '2');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('14', 'Arkansas', '2');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('15', 'California', '2');
INSERT INTO `laboratorio_model`.`estado` (`EstadoID`, `Estado`, `PaisID`) VALUES ('16', 'Colorado', '2');

-- Tabla ciudad
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('1', 'Aguascalientes', '1');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('2', 'No Registrado', '1');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('3', 'BENITO JUAREZ', '1');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('4', 'Ensenada', '2');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('5', 'Mexicali', '2');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('6', 'Playas de Rosarito', '2');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('7', 'Tecate', '2');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('8', 'Tijuana', '2');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('9', 'Comondú', '3');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('10', 'La Paz', '3');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('11', 'Loreto', '3');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('12', 'Los Cabos', '3');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('13', 'Mulegé', '3');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('14', 'Canatlán', '10');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('15', 'Canelas', '10');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('16', 'Coneto de Comonfort', '10');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('17', 'Cuencamé', '10');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('18', 'Durango', '10');
INSERT INTO `laboratorio_model`.`ciudad` (`CiudadID`, `Ciudad`, `EstadoID`) VALUES ('19', 'Nogales', '13');

-- Tabla Pacienteslab
INSERT INTO `laboratorio_model`.`pacienteslab` (`PacienteID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaRegistro`, `FechaNacimiento`, `Direccion`, `CiudadID`) VALUES ('1', 'Patricia', 'Lopez', 'Zamora', '2021-04-01', '1970-04-23', 'Burocratas 105', '1');
INSERT INTO `laboratorio_model`.`pacienteslab` (`PacienteID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaRegistro`, `FechaNacimiento`, `Direccion`, `CiudadID`) VALUES ('2', 'Carmen', 'Ibarra', 'Morte', '2021-05-01', '1980-04-23', 'teresa calcuta 504', '1');
INSERT INTO `laboratorio_model`.`pacienteslab` (`PacienteID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaRegistro`, `FechaNacimiento`, `Direccion`, `CiudadID`) VALUES ('3', 'Diana', 'Sanchez', 'Guereca', '2021-04-21', '1938-04-23', 'cerro de las mitras 2411', '4');
INSERT INTO `laboratorio_model`.`pacienteslab` (`PacienteID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaRegistro`, `FechaNacimiento`, `Direccion`, `CiudadID`) VALUES ('4', 'Roberto', 'Martinez', 'Martinez', '2022-01-01', '1990-04-23', 'valle del malpais 105', '4');
INSERT INTO `laboratorio_model`.`pacienteslab` (`PacienteID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaRegistro`, `FechaNacimiento`, `Direccion`, `CiudadID`) VALUES ('5', 'Carlos', 'Martinez', 'Lopez', '2020-09-15', '1990-04-23', 'valle del guadiana 150', '4');
INSERT INTO `laboratorio_model`.`pacienteslab` (`PacienteID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaRegistro`, `FechaNacimiento`, `Direccion`, `CiudadID`) VALUES ('6', 'Karina', 'Cereceres', 'Garcia', '2019-08-20', '1995-04-23', 'josefa jimenez 258', '15');
INSERT INTO `laboratorio_model`.`pacienteslab` (`PacienteID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaRegistro`, `FechaNacimiento`, `Direccion`, `CiudadID`) VALUES ('7', 'Gabriela', 'Cereceres', 'Garcia', '2022-10-19', '1998-04-23', 'Burocratas 111', '13');
INSERT INTO `laboratorio_model`.`pacienteslab` (`PacienteID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaRegistro`, `FechaNacimiento`, `Direccion`, `CiudadID`) VALUES ('8', 'Francisco', 'Ontiveros', 'Arreola', '2021-06-14', '1990-04-23', 'Burocratas 105', '13');
INSERT INTO `laboratorio_model`.`pacienteslab` (`PacienteID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaRegistro`, `FechaNacimiento`, `Direccion`, `CiudadID`) VALUES ('9', 'Maria', 'Eugenia', 'Mares', '2020-04-08', '2000-04-23', 'teresa calcuta 504', '6');
INSERT INTO `laboratorio_model`.`pacienteslab` (`PacienteID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaRegistro`, `FechaNacimiento`, `Direccion`, `CiudadID`) VALUES ('10', 'Ignacio', 'Orozco', 'Perez', '2020-07-13', '2002-04-23', 'cerro de las mitras 2411', '11');

-- Tabla Tipo Toma Muestra
INSERT INTO `laboratorio_model`.`tipotomamuestra` (`TipoTomaMuestraID`, `TipoTomaMuestra`) VALUES ('1', 'Sangre');
INSERT INTO `laboratorio_model`.`tipotomamuestra` (`TipoTomaMuestraID`, `TipoTomaMuestra`) VALUES ('2', 'Raspado nasofaríngeo');
INSERT INTO `laboratorio_model`.`tipotomamuestra` (`TipoTomaMuestraID`, `TipoTomaMuestra`) VALUES ('3', 'Saliva');
INSERT INTO `laboratorio_model`.`tipotomamuestra` (`TipoTomaMuestraID`, `TipoTomaMuestra`) VALUES ('4', 'Cabello');
INSERT INTO `laboratorio_model`.`tipotomamuestra` (`TipoTomaMuestraID`, `TipoTomaMuestra`) VALUES ('5', 'Orina en colector estéril');

-- Tipo Resultado
INSERT INTO `laboratorio_model`.`tiporesultados` (`TipoResultadoID`, `TipoResultado`) VALUES ('1', 'Positivo');
INSERT INTO `laboratorio_model`.`tiporesultados` (`TipoResultadoID`, `TipoResultado`) VALUES ('2', 'Negativo');
INSERT INTO `laboratorio_model`.`tiporesultados` (`TipoResultadoID`, `TipoResultado`) VALUES ('3', 'Repeticion');
INSERT INTO `laboratorio_model`.`tiporesultados` (`TipoResultadoID`, `TipoResultado`) VALUES ('4', 'Descartado');

-- Tabla Solicitud Estudio
INSERT INTO `laboratorio_model`.`solicitudestudio` (`SolicitudID`, `UsuarioID`, `PacienteID`) VALUES ('1', '1', '3');
INSERT INTO `laboratorio_model`.`solicitudestudio` (`SolicitudID`, `UsuarioID`, `PacienteID`, `FechaSolicitud`, `FechaEntrega`, `SolicitudFinalizada`) VALUES ('2', '1', '1', '2022-05-08', '2022-05-09', b'1');
INSERT INTO `laboratorio_model`.`solicitudestudio` (`SolicitudID`, `UsuarioID`, `PacienteID`, `FechaSolicitud`, `FechaEntrega`, `SolicitudFinalizada`) VALUES ('3', '5', '5', '2022-03-08', '2022-05-01', b'1');
INSERT INTO `laboratorio_model`.`solicitudestudio` (`SolicitudID`, `UsuarioID`, `PacienteID`, `FechaSolicitud`, `SolicitudFinalizada`) VALUES ('4', '8', '7', '2022-03-08', b'0');
INSERT INTO `laboratorio_model`.`solicitudestudio` (`SolicitudID`, `UsuarioID`, `PacienteID`, `FechaSolicitud`, `SolicitudFinalizada`) VALUES ('5', '9', '6', '2022-03-08', b'0');
INSERT INTO `laboratorio_model`.`solicitudestudio` (`SolicitudID`, `UsuarioID`, `PacienteID`, `FechaSolicitud`, `SolicitudFinalizada`) VALUES ('6', '3', '2', '2022-03-08', b'0');

-- Tabla Estudios
INSERT INTO `laboratorio_model`.`estudios` (`EstudioID`, `NombreEstudio`, `TipoTomaMuestraID`, `Activo`) VALUES ('1', 'Covid', '1', 1);
INSERT INTO `laboratorio_model`.`estudios` (`EstudioID`, `NombreEstudio`, `TipoTomaMuestraID`, `Activo`) VALUES ('2', 'Tamiz 76', '3', 1);
INSERT INTO `laboratorio_model`.`estudios` (`EstudioID`, `NombreEstudio`, `TipoTomaMuestraID`, `Activo`) VALUES ('3', 'Tamiz 69', '2', b'1');
INSERT INTO `laboratorio_model`.`estudios` (`EstudioID`, `NombreEstudio`, `TipoTomaMuestraID`, `Activo`) VALUES ('4', 'VIH', '1', b'1');
INSERT INTO `laboratorio_model`.`estudios` (`EstudioID`, `NombreEstudio`, `TipoTomaMuestraID`, `Activo`) VALUES ('5', 'Tamiz 61', '1', b'1');

-- Tabla Detalle Solicitud
INSERT INTO `laboratorio_model`.`detallesolicitud` (`DetalleID`, `SolicitudID`, `EstudioID`, `TipoResultadoID`, `Comentarios`) VALUES ('1', '1', '1', '1', 'PruebaComent');
INSERT INTO `laboratorio_model`.`detallesolicitud` (`DetalleID`, `SolicitudID`, `EstudioID`, `TipoResultadoID`) VALUES ('2', '1', '2', '1');
INSERT INTO `laboratorio_model`.`detallesolicitud` (`DetalleID`, `SolicitudID`, `EstudioID`, `TipoResultadoID`, `Comentarios`) VALUES ('3', '2', '2', '1', 'Prueba');
INSERT INTO `laboratorio_model`.`detallesolicitud` (`DetalleID`, `SolicitudID`, `EstudioID`, `TipoResultadoID`) VALUES ('4', '3', '3', '3');
INSERT INTO `laboratorio_model`.`detallesolicitud` (`DetalleID`, `SolicitudID`, `EstudioID`, `TipoResultadoID`) VALUES ('5', '2', '5', '2');
INSERT INTO `laboratorio_model`.`detallesolicitud` (`DetalleID`, `SolicitudID`, `EstudioID`, `TipoResultadoID`) VALUES ('6', '6', '1', '1');
INSERT INTO `laboratorio_model`.`detallesolicitud` (`DetalleID`, `SolicitudID`, `EstudioID`, `TipoResultadoID`, `FechaResultado`) VALUES ('7', '4', '2', '2', '2022-05-09');



use laboratorio_model;

delimiter ##
create function areaTriangulo (base float, altura float)
returns float
deterministic
BEGIN
	DECLARE resultadoarea float;
    set resultadoarea = ((base * altura) / 2);
    RETURN resultadoarea;
END##

select areaTriangulo (3,7)


delimiter ##
create function NumeroEstudiosPorUsuario (UsuarioID INT)
returns INT
reads sql data
BEGIN
	DECLARE NumeroEstudios INT;
    SELECT 
        COUNT(`detallesolicitud`.`DetalleID`) AS `numeroEstudiosRealizados` into NumeroEstudios
    FROM
        ((`solicitudestudio`
        JOIN `detallesolicitud` ON ((`solicitudestudio`.`SolicitudID` = `detallesolicitud`.`SolicitudID`)))
        JOIN `usuarios` ON ((`solicitudestudio`.`UsuarioID` = `usuarios`.`UsuarioID`)))
        where usuarios.usuarioID = UsuarioID
    GROUP BY `usuarios`.`Usuario`;
    RETURN NumeroEstudios;
END##

select NumeroEstudiosPorUsuario (1)



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

+use laboratorio_model;

delimiter //
create procedure Usuarios_Orden (columnorder varchar(100), orden int)
begin
	declare qry_select varchar(100);
    declare qry_order_by varchar(100);
    declare qry_to_execute varchar (200);
    
    set qry_select = 'Select * from laboratorio_model.usuarios';
    
    if orden = 1 then
		set qry_order_by = 'asc';
	else
        set qry_order_by = 'desc';
	end if;
    
	if columnorder = '' then
		select 'La columna no puede ser vacia';
	else
		select concat(qry_Select, ' order by ', columnorder, '  ', qry_order_by) into qry_to_execute;
        set @smtmt = qry_to_execute;
        
        prepare ejecutar from @smtmt;
        
        execute ejecutar;
        deallocate prepare ejecutar;
	end if;
end //



delimiter //
create procedure Usuarios_Insert (Nombre varchar(50), apellido varchar(50), fechaI date, usuario varchar(20), password varchar(20))
begin
	insert into laboratorio_model.usuarios(nombre, apellidoPaterno, fechaIngreso, usuario, password) values (nombre, apellido, fechaI, usuario, password);
    call Usuarios_Orden('usuarioid',2);
end //

-- Se manda una de las columnas de la tabla usuarios para ordenar la info y el tipo de ordenamiento 1=asc 2= desc
call Usuarios_Orden('usuarioid',2);

-- Se manda nombre,apellido,fecha de ingreso (yyyy-mm-dd), usuario, password, aqui mismo se manda llama el store anterior para mostrar los datos de manera desc
call Usuarios_Insert('Prueba', 'ApellidoPrueba', '2022-05-10', 'PruebaUsuario', 'pasprueba');











