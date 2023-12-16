CREATE TABLE TUSUARIO (
    TUSUARIO_ID INT(1) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    TUSUARIO_NOM VARCHAR(15) NOT NULL
);

CREATE TABLE USUARIO (
    USUARIO_ID INT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    USUARIO_NOM VARCHAR(25) NOT NULL,
    USUARIO_CORREO VARCHAR(200) NOT NULL,
    USUARIO_CLAVE VARCHAR(255) NOT NULL,
    USUARIO_FECHANAC VARCHAR(10) NOT NULL,
    USUARIO_TIPO INT(1) NOT NULL,
    FOREIGN KEY (USUARIO_TIPO) REFERENCES TUSUARIO(TUSUARIO_ID)
);

CREATE TABLE TOBRA (
    TOBRA_ID INT(1) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    TOBRA_NOM VARCHAR(20) NOT NULL
);

CREATE TABLE OBRA (
    OBRA_ID INT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    OBRA_NOM VARCHAR(100) NOT NULL,
    OBRA_ANIO INT(2),
    OBRA_DESC VARCHAR(1000),
    OBRA_TIPO INT(1),
    OBRA_IMG VARCHAR(100),
    FOREIGN KEY (OBRA_TIPO) REFERENCES TOBRA(TOBRA_ID)
);

CREATE TABLE OBRAF (
	OBRAF_IDO INT(3) NOT NULL,
	OBRAF_IDU INT(3) NOT NULL,
	FOREIGN KEY (OBRAF_IDO) REFERENCES OBRA(OBRA_ID),
	FOREIGN KEY (OBRAF_IDU) REFERENCES USUARIO(USUARIO_ID),
	PRIMARY KEY(OBRAF_IDO, OBRAF_IDU)
);

CREATE TABLE CATEGORIA (
	CATEGORIA_ID INT(2) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	CATEGORIA_NOM VARCHAR(50) NOT NULL
);

CREATE TABLE CATEGORIAF (
	CATEGORIAF_IDC INT(2) NOT NULL,
	CATEGORIAF_IDU INT(3) NOT NULL,
	FOREIGN KEY (CATEGORIAF_IDC) REFERENCES CATEGORIA(CATEGORIA_ID),
	FOREIGN KEY (CATEGORIAF_IDU) REFERENCES USUARIO(USUARIO_ID),
	PRIMARY KEY(CATEGORIAF_IDC, CATEGORIAF_IDU)
);

CREATE TABLE CATOBRA (
	CATOBRA_IDO INT(3) NOT NULL,
	CATOBRA_IDC INT(2) NOT NULL,
	FOREIGN KEY (CATOBRA_IDO) REFERENCES OBRA(OBRA_ID),
	FOREIGN KEY (CATOBRA_IDC) REFERENCES CATEGORIA(CATEGORIA_ID),
	PRIMARY KEY(CATOBRA_IDO, CATOBRA_IDC)
);

CREATE TABLE PUNTUACION (
	PUNTUACION_ID INT(3) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PUNTUACION_IDU INT(3) NOT NULL,
	PUNTUACION_IDC INT(2) NOT NULL,
	PUNTUACION_IDO INT(3) NOT NULL,
	PUNTUACION_NOTA INT(1) NOT NULL,
	FOREIGN KEY (PUNTUACION_IDU) REFERENCES USUARIO(USUARIO_ID),
	FOREIGN KEY (PUNTUACION_IDC) REFERENCES CATEGORIA(CATEGORIA_ID),
	FOREIGN KEY (PUNTUACION_IDO) REFERENCES OBRA(OBRA_ID)
);

CREATE TABLE SERIE (
	SERIE_ID INT(3) PRIMARY KEY NOT NULL,
	SERIE_CAP INT(2),
	SERIE_TEMP INT(1),
	FOREIGN KEY (SERIE_ID) REFERENCES OBRA(OBRA_ID)
);

CREATE TABLE DIRECTOR (
	DIRECTOR_ID INT(2) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DIRECTOR_NOM VARCHAR(70) NOT NULL
);

CREATE TABLE SDIRECTOR (
	SDIRECTOR_IDD INT(2) NOT NULL,
	SDIRECTOR_IDS INT(3) NOT NULL,
	FOREIGN KEY (SDIRECTOR_IDD) REFERENCES DIRECTOR(DIRECTOR_ID),
	FOREIGN KEY (SDIRECTOR_IDS) REFERENCES SERIE(SERIE_ID),
	PRIMARY KEY(SDIRECTOR_IDD, SDIRECTOR_IDS)
);

CREATE TABLE LIBRO (
	LIBRO_ID INT(3) NOT NULL PRIMARY KEY,
	LIBRO_ISBN VARCHAR(15),
	FOREIGN KEY (LIBRO_ID) REFERENCES OBRA(OBRA_ID)
);

CREATE TABLE AUTOR (
	AUTOR_ID INT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	AUTOR_NOM VARCHAR(70) NOT NULL
);

CREATE TABLE LAUTOR (
	LAUTOR_IDA INT(3) NOT NULL,
	LAUTOR_IDL INT(3) NOT NULL,
	FOREIGN KEY (LAUTOR_IDA) REFERENCES AUTOR(AUTOR_ID),
	FOREIGN KEY (LAUTOR_IDL) REFERENCES LIBRO(LIBRO_ID),
	PRIMARY KEY(LAUTOR_IDA, LAUTOR_IDL)
);

CREATE TABLE PELICULA (
	PELICULA_ID INT(3) PRIMARY KEY NOT NULL,
	PELICULA_TIEMPO INT(2),
	FOREIGN KEY (PELICULA_ID) REFERENCES OBRA(OBRA_ID)
);

CREATE TABLE PDIRECTOR (
	PDIRECTOR_IDD INT(2) NOT NULL,
	PDIRECTOR_IDP INT(3) NOT NULL,
	FOREIGN KEY (PDIRECTOR_IDD) REFERENCES DIRECTOR(DIRECTOR_ID),
	FOREIGN KEY (PDIRECTOR_IDP) REFERENCES PELICULA(PELICULA_ID),
	PRIMARY KEY(PDIRECTOR_IDD, PDIRECTOR_IDP)
);

CREATE TABLE JUEGO (
	JUEGO_ID INT(3) NOT NULL PRIMARY KEY,
	JUEGO_DURACION INT(2),
	FOREIGN KEY (JUEGO_ID) REFERENCES OBRA(OBRA_ID)
);

CREATE TABLE DESARROLLADOR (
	DESARROLLADOR_ID INT(2) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	DESARROLLADOR_NOM VARCHAR(70) NOT NULL
);

CREATE TABLE JDESARROLLADOR (
	JDESARROLLADOR_IDD INT(2) NOT NULL,
	JDESARROLLADOR_IDJ INT(2) NOT NULL,
	FOREIGN KEY (JDESARROLLADOR_IDD) REFERENCES DESARROLLADOR(DESARROLLADOR_ID),
	FOREIGN KEY (JDESARROLLADOR_IDJ) REFERENCES JUEGO(JUEGO_ID),
	PRIMARY KEY(JDESARROLLADOR_IDD, JDESARROLLADOR_IDJ)
);

CREATE TABLE PLATAFORMA (
    PLATAFORMA_ID INT(1) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    PLATAFORMA_NOM VARCHAR(20) NOT NULL
);

CREATE TABLE JPLATAFORMA (
	JPLATAFORMA_IDJ INT(3) NOT NULL,
	JPLATAFORMA_IDP INT(1) NOT NULL,
	FOREIGN KEY (JPLATAFORMA_IDJ) REFERENCES JUEGO(JUEGO_ID),
	FOREIGN KEY (JPLATAFORMA_IDP) REFERENCES PLATAFORMA(PLATAFORMA_ID),
	PRIMARY KEY(JPLATAFORMA_IDJ, JPLATAFORMA_IDP)
);

CREATE TABLE SUGE (
	SUGE_ID INT(1) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	SUGE_NOM VARCHAR(25) NOT NULL
);

CREATE TABLE SUGOBRA (
	SUGOBRA_ID INT(2) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	SUGOBRA_IDU INT(3) NOT NULL,
	SUGOBRA_ESTADO INT(1) NOT NULL,
	SUGOBRA_NOM VARCHAR(100) NOT NULL,
	SUGOBRA_ANIO INT(2),
	SUGOBRA_DESC VARCHAR(600),
	SUGOBRA_TIPO INT(1) NOT NULL,
	FOREIGN KEY (SUGOBRA_IDU) REFERENCES USUARIO(USUARIO_ID),
	FOREIGN KEY (SUGOBRA_ESTADO) REFERENCES SUGE(SUGE_ID),
	FOREIGN KEY (SUGOBRA_TIPO) REFERENCES TOBRA(TOBRA_ID)
);

CREATE TABLE SUGPELICULA (
	SUGPELICULA_ID INT(2) PRIMARY KEY NOT NULL,
	SUGPELICULA_DURACION INT(2),
	SUPELICULA_DIRECTOR VARCHAR(70),
	FOREIGN KEY (SUGPELICULA_ID) REFERENCES SUGOBRA(SUGOBRA_ID)
);

CREATE TABLE SUGLIBRO (
	SUGLIBRO_ID INT(2) PRIMARY KEY NOT NULL,
	SUGLIBRO_AUTOR VARCHAR(70),
	SUGLIBRO_ISBN VARCHAR(15),
	FOREIGN KEY (SUGLIBRO_ID) REFERENCES SUGOBRA(SUGOBRA_ID)
);

CREATE TABLE SUGSERIE (
	SUGSERIE_ID INT(2) PRIMARY KEY NOT NULL,
	SUGESERIE_CAP INT(2),
	SUGSERIE_TEMP INT(1),
	SUGSERIE_DIRECTOR VARCHAR(70),
	FOREIGN KEY (SUGSERIE_ID) REFERENCES SUGOBRA(SUGOBRA_ID)
);

CREATE TABLE SUGJUEGO (
	SUGJUEGO_ID INT(2) PRIMARY KEY NOT NULL,
	SUGJUEGO_TIEMPO INT(2),
	SUGJUEGO_DESARROLLADOR VARCHAR(70),
	FOREIGN KEY (SUGJUEGO_ID) REFERENCES SUGOBRA(SUGOBRA_ID)
);

CREATE TABLE SUGCATOBRA (
	SUGCATOBRA_ID INT(2) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	SUGCATOBRA_IDU INT(3) NOT NULL,
	SUGCATOBRA_ESTADO INT(1) NOT NULL,
	SUGCATOBRA_IDC INT(2) NOT NULL,
	SUGCATOBRA_IDO INT(3) NOT NULL,
	FOREIGN KEY (SUGCATOBRA_IDU) REFERENCES USUARIO(USUARIO_ID),
	FOREIGN KEY (SUGCATOBRA_ESTADO) REFERENCES SUGE(SUGE_ID),
	FOREIGN KEY (SUGCATOBRA_IDC) REFERENCES CATEGORIA(CATEGORIA_ID),
	FOREIGN KEY (SUGCATOBRA_IDO) REFERENCES OBRA(OBRA_ID)
);

CREATE TABLE SUGCATEGORIA (
	SUGCATEGORIA_ID INT(2) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	SUGCATEGORIA_IDU INT(3) NOT NULL,
	SUGCATEGORIA_ESTADO INT(1) NOT NULL,
	SUGCATEGORIA_NOM VARCHAR(50) NOT NULL,
	FOREIGN KEY (SUGCATEGORIA_IDU) REFERENCES USUARIO(USUARIO_ID),
	FOREIGN KEY (SUGCATEGORIA_ESTADO) REFERENCES SUGE(SUGE_ID)
);

CREATE TABLE SUGAUTOR (
	SUGAUTOR_ID INT(2) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	SUGAUTOR_IDS INT(2) NOT NULL,
	SUGAUTOR_IDA INT(3),
	FOREIGN KEY (SUGAUTOR_IDS) REFERENCES SUGOBRA(SUGOBRA_ID),
	FOREIGN KEY (SUGAUTOR_IDA) REFERENCES AUTOR(AUTOR_ID)
);

CREATE TABLE SUGSDIRECTOR (
	SUGSDIRECTOR_ID INT(2) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	SUGSDIRECTOR_IDS INT(2) NOT NULL,
	SUGSDIRECTOR_IDD INT(2),
	FOREIGN KEY (SUGSDIRECTOR_IDS) REFERENCES SUGOBRA(SUGOBRA_ID),
	FOREIGN KEY (SUGSDIRECTOR_IDD) REFERENCES DIRECTOR(DIRECTOR_ID)
);

CREATE TABLE SUGPDIRECTOR (
	SUGPDIRECTOR_ID INT(2) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	SUGPDIRECTOR_IDP INT(2) NOT NULL,
	SUGPDIRECTOR_IDD INT(2),
	FOREIGN KEY (SUGPDIRECTOR_IDP) REFERENCES SUGOBRA(SUGOBRA_ID),
	FOREIGN KEY (SUGPDIRECTOR_IDD) REFERENCES DIRECTOR(DIRECTOR_ID)
);

CREATE TABLE SUGDESARROLLADOR (
	SUGDESARROLLADOR_ID INT(2) PRIMARY KEY NOT NULL,
	SUGDESARROLLADOR_IDJ INT(2) NOT NULL,
	SUGDESARROLLADOR_IDD INT(2),
	FOREIGN KEY (SUGDESARROLLADOR_IDJ) REFERENCES SUGOBRA(SUGOBRA_ID),
	FOREIGN KEY (SUGDESARROLLADOR_IDD) REFERENCES DESARROLLADOR(DESARROLLADOR_ID)
);

CREATE TABLE SUGJPLATAFORMA (
	SUGJPLATAFORMA_IDS INT(2) NOT NULL,
	SUGJPLATAFORMA_IDP INT(1) NOT NULL,
	FOREIGN KEY (SUGJPLATAFORMA_IDS) REFERENCES SUGOBRA(SUGOBRA_ID),
	FOREIGN KEY (SUGJPLATAFORMA_IDP) REFERENCES PLATAFORMA(PLATAFORMA_ID),
	PRIMARY KEY(SUGJPLATAFORMA_IDS, SUGJPLATAFORMA_IDP)
);
