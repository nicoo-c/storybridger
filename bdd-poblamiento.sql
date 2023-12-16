-- POBLAMIENTO DE LA BASE DE DATOS


-- TABLAS BASE

-- TIPOS DE USUARIO
INSERT INTO TUSUARIO (TUSUARIO_NOM) 
VALUES ('Administrador'), ('Moderador'), ('Usuario'), ('Visitante');


-- TIPOS DE OBRA
INSERT INTO TOBRA (TOBRA_NOM)
VALUES ('Película'), ('Serie'), ('Juego'), ('Libro');


-- ESTADOS DE SUGERENCIA
INSERT INTO SUGE (SUGE_NOM)
VALUES ('Pendiente de revisión'), ('Aceptado'), ('Rechazado');


-- PLATAFORMAS
INSERT INTO PLATAFORMA (PLATAFORMA_NOM)
VALUES ('Playstation 5'), ('Nintedo Switch'), ('PC'), ('Playstation 4');


-- USUARIO (CREAR CON LOGIN)
INSERT INTO USUARIO (USUARIO_NOM, USUARIO_CORREO, USUARIO_CLAVE, USUARIO_FECHANAC, USUARIO_TIPO) 
VALUES ('jose', 'jose123@gmail.com', '$2y$10$C.FGGS5/lwJuksljmMsJJOWAhh9AoNiox6yXgtrUcIdSDJhDAnTWm', '28-02-1999', 1), 
('julio', 'julio123@gmail.com', '$2y$10$6LYzgYl8ChfxHQUSYpO7MuM4CIJkTFVaLaA//Bflcxm66XXDmZDBS', '30-06-1989', 1),
('cesar', 'cesar123@outlook.com', '$2y$10$91d85z.s85c6MUrVCa9nwO4hCuFFFRbGb3nrc1c1SXCZGMGB1T..q', '25-09-1995', 2),
('manuel', 'manuel123@yahoo.com', '$2y$10$sEnm3fbXwOpoqyG0fmHSQunrDxfONvnAQmtP.7errI8AJAnmxamKm', '22-04-1992', 2),
('miguel', 'miguel123@outlook.com', '$2y$10$K4Y5CnuftapaFCsI7bINB.2DuyOM7O9tvcCG0bJYvwCDt26SsmUxe', '14-04-1988', 3),
('pepe', 'elpepe13@outlook.com', '$2y$10$QJJcS53EJ8dmslXK2pymguBq8N8EUHgsXfmTAGz2D2qvaH72BTAYy', '19-09-1985', 3);


-- OBRA
INSERT INTO OBRA (OBRA_NOM, OBRA_ANIO, OBRA_DESC, OBRA_TIPO, OBRA_IMG) VALUES
('El extraño mundo de Jack', 1993, 'El Señor de Halloween, Jack Skellington, aburrido de hacer cada año lo mismo, descubre la Navidad en la Ciudad de la Navidad y queda fascinado, por lo que decide emplearse a fondo y mejorar dicha festividad. Con este fin, secuestra a Santa Claus y crea una versión de la Navidad totalmente opuesta a la que existe. Sólo su novia Sally es consciente del error que está cometiendo.', 1, 'IMG/1.jpg'),
('Dragon Ball Z', 1989, 'Continuando con la adaptación del manga, la serie narra la aventura de la vida adulta de Son Goku quien, con sus compañeros defiende la tierra contra varios villanos. Mientras que la serie original, Dragon Ball, narra la historia de la infancia hasta la adultez, Dragon Ball Z es la continuación de la vida adulta que lleva Goku, paralelamente narra la madurez de su hijo, Gohan. La separación entre las series es significativa, ya que en esta versión de la historia, la comicidad y el tono de aventuras que poseía la serie anterior, es relativamente dejada de lado para mostrar una historia con un toque más oscuro y serio.', 2, 'IMG/2.jpg'),
('La metamorfosis', 1912, '“La metamorfosis” narra de forma magistral la transformación de Gregorio Samsa de comerciante a un monstruoso insecto. Samsa primero cree que es un sueño, pero poco a poco va descubriendo que la pesadilla es real y su transformación en animal es un hecho que afecta a su trabajo y a su relación con su familia.', 4, 'IMG/3.jpg'),
('Better Call Saul', 2015, 'Better Call Saul sigue la transformación de Jimmy McGill (Bob Odenkirk), un ex estafador que intenta convertirse en un abogado respetable, a la personalidad del extravagante abogado penalista Saul Goodman (un juego de palabras con la frase \"[it]\'s all good, man!\"), seis años antes de aliarse con Walter White en Breaking Bad. Inspirado en su hermano mayor Chuck (Michael McKean), Jimmy McGill trabaja inicialmente como un paupérrimo abogado, instalado en la trastienda de un salón de belleza que utiliza como hogar y oficina. Su amiga, con la que mantiene una relación romántica, Kim Wexler (Rhea Seehorn), trabaja como abogada en el bufete Hamlin, Hamlin & McGill (HHM), donde ella y Jimmy coincidieron trabajando. Su desarrollo como abogado lo involucran en la práctica del derecho de personas mayores, hasta interacciones con el mundo criminal; a la vez debe enfrentar el menosprecio tanto del socio de Chuck, Howard Hamlin (Patrick Fabian) como de su propio hermano.', 2, 'IMG/4.jpg'),
('Mortal Kombat 1', 2023, 'Tras los eventos acontecidos en Mortal Kombat 11, Liu Kang ha logrado derrotar a Kronika y a Shang Tsung y finalmente, asciende como el nuevo Titán del Tiempo y guardián del Reloj de Arena y restaura la línea de tiempo con el fin de crear una \"Nueva Era\" donde los habitantes de los reinos puedan coexistir tomando sus propias decisiones. Luego de eones diseñando la Historia del Universo (y reconociendo que la búsqueda de un equilibrio entre el bien y el mal fue lo que condujo a Kronika a la locura), decide renunciar a su energía titánica para convertirse en el Dios del Fuego y Protector de la Tierra, dejando el cuidado del Reloj a un reformado Geras.', 3, 'IMG/5.jpg'),
('Red Dead Redemption 2', 2018, 'Estados Unidos, El final de la era del Salvaje Oeste ha comenzado y las fuerzas de la ley dan caza a las últimas bandas de forajidos. Los que no se rinden o sucumben, son asesinados. Tras un asalto fallido en el pueblo de Blackwater, Arthur Morgan y la pandilla de Van der Linde se ven forzados a huir. Con agentes federales y los mejores cazarrecompensas pisando sus talones, la pandilla deberá asaltar, robar y hacerse camino a través de una América despiadada para poder sobrevivir. Mientras crecen las divisiones que amenazan con el fin de la pandilla Arthur debe decidir entre sus propios ideales y su lealtad a la pandilla que lo crió.', 3, 'IMG/6.jpg'),
('El resplandor', 1980, 'La película relata la historia de Jack Torrance, un exprofesor que acepta un puesto como vigilante de invierno en un solitario hotel de alta montaña para ocuparse del mantenimiento. Al poco tiempo de haberse instalado allí junto con su esposa y su hijo, empieza a sufrir inquietantes trastornos de personalidad. Paulatinamente, debido a la incomunicación, al insomnio, a sus propios fantasmas interiores y, tal vez, a la influencia maléfica del lugar, se verá inmerso en una espiral de violencia contra ellos, que a su vez parecen víctimas de espantosos fenómenos sobrenaturales.', 1, 'IMG/7.jpg'),
('Choque de reyes', 1998, 'Choque de reyes continúa donde acabó Juego de tronos. El libro se plantea en un comienzo con el prólogo, en el cual se nos da a conocer más de cerca a personajes que van a ser determinantes para la historia de este libro, como Davos Seaworth, Melisandre y el propio Stannis Baratheon y también se plantea la cuestión del cometa rojo que es interpretado por todas las facciones que forman parte de la guerra civil la cual se ha extendido por Poniente y pasa a conocerse como la Guerra de los Cinco Reyes. Mientras, la Guardia de la Noche envía un grupo de reconocimiento al norte en la Gran Exploración de Mormont, más allá del muro. A su vez, en el lejano este, Daenerys Targaryen dirige a su khalasar para volver a los Siete Reinos para conquistarlos, pero en el camino se encuentra con tres personajes misteriosos.', 4, 'IMG/8.jpg');


-- OBRAF (DEPENDE DE OBRA Y USUARIO)
INSERT INTO OBRAF
VALUES (1, 2), (1, 1), (2, 3), (2, 5), (3, 4), (4, 3), (5, 5), (6, 1), (6, 3);


-- CATEGORIA
INSERT INTO CATEGORIA (CATEGORIA_NOM)
VALUES ('Viaje espacial'), ('Distopía futuristas'), ('Amor prohibido'), ('Final tragicómico'), ('Comedia Absurda'), ('Exploración de lugares exóticos'), ('Drama familiar'), ('Catarsis emocional');


-- CATEGORIAF (CATEGORIA Y USUARIO)
INSERT INTO CATEGORIAF
VALUES (1, 2), (1, 1), (2, 3), (2, 5), (3, 4), (4, 3), (5, 5), (6, 1), (6, 3);


-- CATOBRA (CATEGORIA Y OBRA)
INSERT INTO CATOBRA
VALUES (1, 3), (1, 7), (2, 1), (2, 2), (3, 8), (3, 2), (5, 6), (5, 5), (6, 7), (6, 3);


-- PUNTUACION (USUARIO, OBRA Y CATEGORIA)
INSERT INTO PUNTUACION (PUNTUACION_IDU, PUNTUACION_IDC, PUNTUACION_IDO, PUNTUACION_NOTA)
VALUES (5, 1, 3, 9), (5, 1, 7, 8), (6, 2, 2, 5), (6, 3, 8, 7);


-- SERIE (OBRA)
INSERT INTO SERIE
VALUES (2, 291, 8), (4, 63, 6);


-- DIRECTOR 
INSERT INTO DIRECTOR (DIRECTOR_NOM)
VALUES ('Henry Selick'), ('Stanley Kubrick'), ('Kimitoshi Chioka'), ('Morio Hatano'), ('Vince Gilligan');


-- SDIRECTOR (SERIE Y DIRECTOR)
INSERT INTO SDIRECTOR
VALUES (3, 2), (4, 4);


-- LIBRO (OBRA)
INSERT INTO LIBRO (LIBRO_ID, LIBRO_ISBN)
VALUES (3, '9783966376815'), (8, '9781984821157');


-- AUTOR
INSERT INTO AUTOR (AUTOR_NOM)
VALUES ('Franz Kafka'), ('George R.R. Martin');


-- -- LAUTOR
INSERT INTO LAUTOR
VALUES (1, 3), (2, 8);


-- PELICULA (OBRA)
INSERT INTO PELICULA
VALUES (1, 73), (7, 115);

-- PDIRECTOR (PELICULA Y DIRECTOR)
INSERT INTO PDIRECTOR
VALUES (2, 7), (1, 1);


-- JUEGO (OBRA)
INSERT INTO JUEGO
VALUES (5, 6), (6, 175);


-- DESARROLLADOR (JUEGO)
INSERT INTO DESARROLLADOR (DESARROLLADOR_NOM)
VALUES ('Rockstar Games'), ('NetherRealm Studios');


-- JDESARROLLADOR (JUEGO Y DESARROLLADOR)
INSERT INTO JDESARROLLADOR
VALUES (1, 6), (2, 5);



-- JPLATAFORMA (PLATAFORMA Y JUEGO)
INSERT INTO JPLATAFORMA
VALUES (5, 1), (5, 2), (6, 3), (6, 4);
