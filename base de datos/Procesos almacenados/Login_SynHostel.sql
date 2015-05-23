create or replace procedure synhostel.login(
    in rut varchar,
    in password varchar,
    out out_id_perfil integer,
    out out_mail_persona varchar,
    out out_nombre varchar,
    out num_error varchar, 
    out mensaje_error varchar
) returns record as

$body$

    declare _id_perfil          integer;
    declare _mail               varchar(100);
    declare _nombre             varchar(100);
    
    begin
        num_error := 0;
        mensaje_error := ' ';

        select
            perfil.id_perfil,
            persona.mail,
            persona.nombre,
        into
            _id_perfil,
            _mail,
            _nombre,
        from
            usuario, persona
        where
            perfil.rut = rut and  persona.password = password;

        if found then
        out_id_perfil := _id_perfil;
        out_mail_persona := _mail;
        out_nombre := _nombre;
        return;

        else
        num_error := '1';
        mensaje_error := 'Datos de inicio de sesión inválidos.';
        end if;
    end;
$body$
language 'plpgsql'