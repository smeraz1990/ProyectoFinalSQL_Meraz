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

