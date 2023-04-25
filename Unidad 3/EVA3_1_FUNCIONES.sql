create function regresa_uno()
returns int deterministic
return 1;

create function regresa_mensaje(cade, varchar(50))
returns varchar(100) deterministic
return concat("Hola Como estas", cade)

delimiter $$
create function contar_actor()
returns int deterministic reads sql data
begin
	declare cont int;
    select count(*) into cont from actor;
    return cont;
end$$
delimiter ;