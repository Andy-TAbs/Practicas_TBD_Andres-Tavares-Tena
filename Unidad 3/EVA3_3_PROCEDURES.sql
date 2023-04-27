delimiter :)
create procedure consultar_actores(in actorid int)
begin
	select * from actor
    where actor_id = actorid;
end:)
delimiter ; 

delimiter :)
create procedure cantidad_actores(out cant int)
begin
	select count(*) into cant from actor;
end:)
delimiter ; 

delimiter :)
create procedure agregar_actor(in fname varchar(50),in lname varchar(50))
begin
	declare actorid int;
    select ultimo_actor() into actorid;
    set actorid = actorid +1;
    
	insert into actor(actor_id, first_name, last_name)
    values(actorid, fname, lname);
end:)
delimiter ;

delimiter :)
create function ultimo_actor()
returns int deterministic reads sql data
begin
	declare actorid int;
    select max(actor_id) into actorid from actor;
    return actorid;
end:)
delimiter ; 

delimiter :)
create procedure borrar_actor(in actorid int)
begin
	delete from actor
    where actor_id = actorid;
end:)
delimiter ; 

delimiter :)
create procedure actualizar_actor(in actorid int,in fname varchar(50),in lname varchar(50))
begin
	update actor
    set first_name = fname,
    last_name = lname
    where actor_id = actorid;
end:)
delimiter ; 

delimiter //
create procedure contar_actor(out cant int)
begin
declare terminar int default false;
declare actorid int;
declare cant_actor cursor for select actor_id from actor;
declare continue handler for not found set terminar = true;

open cant_actor;
set cont_act =0;
	contar_a: loop
		fetch cant_actor into actorid;
		set cont_act = cont_act+1;
		if terminar then leave contar_A 
end loop
end//

delimiter ;

 