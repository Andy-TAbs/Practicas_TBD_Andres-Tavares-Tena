delimiter &&
create function agregar_actor(first_name varchar(45), last_name varchar(45))
returns int deterministic modifies sql data
begin
	
	declare num int;
    declare num2 int;
    declare resu int;
    
    declare num3 int;
    select max(actor_id) into num3 from actor;
    set num3 = num3+1;
    
    select count(*) into num from actor;
	insert into actor(actor_id, first_name, last_name) 
	values(num3, first_name, last_name);
    select count(*) into num2 from actor;
    
    set resu = num2 - num;
	return resu;
end&&
delimiter ;

delimiter =)
create function factorial(num int)
returns int deterministic
begin
	declare resu int;
    set resu = 1;
    
	facto: loop
	set resu = resu * num;
    set num = num -1;
    if num = 1 then
		leave facto;
    end if;
	end loop facto;
    
    return resu;

end=)
delimiter ;