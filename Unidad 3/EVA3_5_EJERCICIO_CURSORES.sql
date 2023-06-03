use eva_3;


insert into personas(nombre, apeliido_pat, apellido_mat, fecha_nac) values('Andres', 'Tavares', 'Tena', '2002-09-25');
insert into personas(nombre, apeliido_pat, apellido_mat, fecha_nac) values('ElJefe', 'Maestro', '117', '2506-08-25');
insert into personas(nombre, apeliido_pat, apellido_mat, fecha_nac) values('Dania Denisse', 'Benavides', 'Figueroa','2002-04-16' );
insert into personas(nombre, apeliido_pat, apellido_mat, fecha_nac) values('Karen', 'Caro', 'Escudero', '2004-11-29');
insert into personas(nombre, apeliido_pat, apellido_mat, fecha_nac) values('Ana Cristina', 'Valenzuela', 'Ruiz', '2002-06-03');
insert into personas(nombre, apeliido_pat, apellido_mat, fecha_nac) values('Erick', 'Lozano', 'Duarte', '2002-01-30');
insert into personas(nombre, apeliido_pat, apellido_mat, fecha_nac) values('Dianelly', 'Amaya', 'Vega', '2002-05-04');
insert into personas(nombre, apeliido_pat, apellido_mat, fecha_nac) values('Gabriel Abelardo', 'Morales', 'Ochoa', '2002-11-27');
insert into personas(nombre, apeliido_pat, apellido_mat, fecha_nac) values('Andrea Yareli', 'Sandoval', 'Franco', '2002-01-25');
insert into personas(nombre, apeliido_pat, fecha_nac) values('Eduardo Aurelio', 'Chavez',  '1990-06-05');

delimiter :)
create function generar_rfc(nombre varchar(50), apellido_pat varchar(50), apellido_mat varchar(50), fecha_nac date)
returns int deterministic modifies sql data
begin
	declare num1 int;
    declare num2 int;
    declare resu int;
    
    declare numero3 int;
    select max(id) into num3 from personas;
    set num3 = num3+1;
    
    
    select year(fecha_nac) from persoans;
    
    
    select count(*) into num from personas;
	insert into personas(clave_rfc) 
	values(clave_rfc_p);
    select count(*) into num2 from actor;
    
    
    
end :) 
delimiter ;