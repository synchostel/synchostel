create or replace procedure synchostel.login(
    in rut varchar,
    in password varchar,
    out personas refcursor,
    out num_error varchar, 
    out mensaje_error varchar
) returns record as

$body$

begin
    numerror := 0;
    msjerror := ' ';
    begin
        open personas for

            select
                rut,
                nombre,
                email,
                password,
                telefono,
                telefono_2,
                direccion,
                admin,
                fecha_nacimiento,
                fecha_ingreso_hostal
            from 
                persona
            where
                persona.rut = rut and persona.password = password;

            exception
                when others then
                    numerror := sqlstate;
                    msjerror := '[carga_usuarios] error al cargar usuario(sql) ' ||sqlerrm;
                    return; 
    end;

end;
$body$
language 'plpgsql'