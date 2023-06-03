#Usamos la BD sakila
use sakila;


DELIMITER //
create procedure listaCorreos(inout correos varchar(5000))
begin

	declare correo varchar(50);
	#declaramos una variable para salir del ciclo
	declare terminar int default false;
    #Crea una variable cursor para hacer un select
	declare lista_clientes cursor for
		select email from customer limit 100;
	#Cuando termine, pone la variable terminal en true
	declare continue handler for NOT FOUND set terminar = true;
    
    
    #Usamos lista_clientes
    open lista_clientes;
    #Usa un loop para usar cada campo del email
    obten_correos: loop
		fetch lista_clientes into correo;
	if terminar then
		leave obten_correos;
    end if;
    set correos = concat(correo, ";", correos);
    end loop obten_correos;
    close lista_clientes;

end//
DELIMITER ;