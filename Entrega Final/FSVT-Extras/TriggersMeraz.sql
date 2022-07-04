-- Se agrega las nuevas tablas de eventos
	CREATE TABLE `bitacoraeventos` (
	  `usuarioID` int DEFAULT NULL,
	  `cambios_text` varchar(250) DEFAULT NULL,
	  `fecha_Cambio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
	) COMMENT='Se guardan los cambios realizados en el sistema de BD';
    
    CREATE TABLE `laboratorio_model`.`pacientes_logs` (
  `pacienteID` INT NOT NULL,
  `Accion_desc` VARCHAR(250) NULL,
  `fecha_log` DATETIME NULL)
COMMENT = 'Se guardan los eventos generados en la tabla pacientes';

-- Trigger para la tabla usuario
	DELIMITER $$
	create trigger au_usuarios
	after update
	on usuarios for each row
	begin
		insert into bitacoraeventos values (new.usuarioid,concat('Se modifico el registro: ', ' old nombre: ', old.nombre,' old apellido: ', old.apellidoPaterno, ' old pasword: ', old.password),current_timestamp());
	end$$
	DELIMITER ;

	-- Se actualiza y se guarda un log del movimiento con los cambios realizados en nombre, apellido y password
	 update usuarios
	 set nombre = 'Morena', password = 'CambioTrigger'
	 where usuarioid= 8;

	DELIMITER $$
	create trigger insert_usuarios
	before insert
	on usuarios for each row
	begin
		declare msg_error varchar(250);
		if(new.usuario = "") then
			set msg_error = 'El usuario no puede ser vacio';
			signal sqlstate '45000' set message_text = msg_error;
		elseif (new.password = "") then
			set msg_error = 'El password no puede ser vacio';
			signal sqlstate '45000' set message_text = msg_error;
		end if;
	end$$
	DELIMITER ;

	-- Se inserta un nuevoi dato agregando la condicion que el usuario y password no pueden ser vacios
	insert into laboratorio_model.usuarios(nombre, apellidoPaterno, fechaIngreso, usuario, password) values ('Nuevo', 'NuevoApellido', '2022-05-23', 'asdasd', '');

-- Trigger para la tabla Pacientes

	DELIMITER $$
	create trigger Insert_Pacientes
	after insert
	on pacienteslab for each row
	begin
		insert into pacientes_logs values (new.pacienteid,concat('Se agrego el paciente: ', new.pacienteid),current_timestamp());
	end$$
	DELIMITER ;

	-- Guarda el log de el paciente insertado
	INSERT INTO `laboratorio_model`.`pacienteslab` (`PacienteID`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `FechaRegistro`, `FechaNacimiento`, `Direccion`, `CiudadID`) VALUES ('12', 'Carlos', 'Andrade', 'Lopez', '2021-04-01', '1970-04-23', 'Burocratas 105', '1');

	DELIMITER $$
	create trigger delete_usuarios
	before Delete
	on pacienteslab for each row
	begin
		insert into pacientes_logs values (old.pacienteid,concat('Se elimino el paciente: ', old.pacienteid),current_timestamp());
	end$$
	DELIMITER ;

	-- -- Guarda el log de el paciente eliminado
	delete from pacienteslab where pacienteid = 11;
