
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