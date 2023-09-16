USE consultorio;

START TRANSACTION;

/* Eliminamos dos registros de nuestra tabla de obras sociales */
DELETE FROM pacientes WHERE paciente_id = '0M1N2O3P4Q';
DELETE FROM pacientes WHERE paciente_id = '1A23B4C5D6';

/* Dejamos establecida la posibilidad de recuperarlos con INSERT */
/* 
INSERT INTO pacientes (paciente_id, nombre_paciente, mail, telefono, edad) VALUES ('0M1N2O3P4Q', 'Valentina Gómez', 'valentina.gomez@gmail.com', '1160965527','24');
INSERT INTO pacientes (paciente_id, nombre_paciente, mail, telefono, edad) VALUES ('1A23B4C5D6', 'Juan Pérez', 'juan.perez@hotmail.com', '1134789654','32');
*/

SELECT * FROM pacientes ORDER BY nombre_paciente;

/* En caso de que no nos guste lo que vemos */
-- ROLLBACK

/* Si deseara insertar estos registros, realizo COMMIT */
-- COMMIT;







USE consultorio;

START TRANSACTION;

INSERT INTO obra_social (obra_social_id, nombre_obra_social, abreviacion) VALUES ('AAAAAAAAA1','OS1','Obra social de ejemplo 1');
INSERT INTO obra_social (obra_social_id, nombre_obra_social, abreviacion) VALUES ('AAAAAAAAA2','OS2','Obra social de ejemplo 2');
INSERT INTO obra_social (obra_social_id, nombre_obra_social, abreviacion) VALUES ('AAAAAAAAA3','OS3','Obra social de ejemplo 3');
INSERT INTO obra_social (obra_social_id, nombre_obra_social, abreviacion) VALUES ('AAAAAAAAA4','OS4','Obra social de ejemplo 4');

/* Genero el primer SAVEPOINT */
SAVEPOINT os4;

INSERT INTO obra_social (obra_social_id, nombre_obra_social, abreviacion) VALUES ('AAAAAAAAA5','OS5','Obra social de ejemplo 5');
INSERT INTO obra_social (obra_social_id, nombre_obra_social, abreviacion) VALUES ('AAAAAAAAA6','OS6','Obra social de ejemplo 6');
INSERT INTO obra_social (obra_social_id, nombre_obra_social, abreviacion) VALUES ('AAAAAAAAA7','OS7','Obra social de ejemplo 7');
INSERT INTO obra_social (obra_social_id, nombre_obra_social, abreviacion) VALUES ('AAAAAAAAA8','OS8','Obra social de ejemplo 8');

/* Genero el segundo SAVEPOINT */
SAVEPOINT os8;

/* Verifico si me convence */
SELECT * FROM obra_social;

/* No me gustaron las 4 últimas obras sociales, vuelvo a os4*/
ROLLBACK TO os4;

/* Verifico si me convence (otra vez) */
SELECT * FROM obra_social;

/* Si deseara insertar estos registros, realizo COMMIT */
-- COMMIT;

