use eva_3;
create trigger mensaje after insert on personas
for each row
set @mensaje = 'PERSONA INSERTADA CON EXITO!!';

use eva_3;
create table auditoria_per(id_perso int, nombre_per varchar(50), ap_pat_per varchar(50), 
ap_mat_per varchar(50), fecha_nac_per date, rfc varchar(20));


delimiter :)
create trigger datos_previos_update_per after update on personas
for each row
begin
	insert into auditoria_per
    values(
		OLD.id,
        OLD.nombre,
        OLD.apeliido_pat,
        OLD.apellido_mat,
        OLD.fecha_nac,
        OLD.clave_rfc);
end :)



delimiter ;

use eva_3;
delimiter :)
create trigger calcular_id before update on actor
for each row
begin
	declare nuevo_id int;
    declare calcular_id int;

	select ultimo_actor_id() into nuevo_id;
    if nuevo_id = null then
		set calcular_id = 1;
        else
        set calcular_id = nueco_id +1;
        end if;
        set new.actor_id = calcular_id;
		
end :)
delimiter ;