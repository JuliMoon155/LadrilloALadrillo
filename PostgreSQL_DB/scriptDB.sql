CREATE DATABASE ladrillo_a_ladrillo
WITH
ENCODING = 'UTF8'
OWNER = admin

CREATE TABLE Notificaciones (
    ID_Notificaciones SERIAL PRIMARY KEY,
    Contenido VARCHAR(100) NOT NULL,
    Fecha_Generacion VARCHAR(100) NOT NULL,

    FK_ CedulaBen BIGINT not null,
    FK_ idEmpresa BIGINT not null,

    FOREIGN KEY (FK_ CedulaBen) REFERENCES Beneficiario(Cedula),
    FOREIGN KEY (FK_ idEmpresa) REFERENCES Empresa (ID_Empresa)
);

CREATE TABLE Empresa(
    ID_Empresa SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Contraseña VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE PublicacionDon (
    Id_Publicacion SERIAL PRIMARY KEY,
    Fecha_Publicacion DATE NOT NULL,
    Estado VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    Cantidad Disponible INTEGER NOT NULL,
    Fecha_Cierre DATE NOT NUlL,

    FK_ idEmpresa BIGINT not null,
    FOREIGN KEY (FK_ idEmpresa) REFERENCES Empresa (ID_Empresa)
);

--Antiguo nombre Material a Donar
CREATE TABLE Material_Donar (
    ID_Material SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Estado_Material VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    Imagen BYTEA,
    FK_ idPublicacionDon BIGINT not null,

    FOREIGN KEY (FK_ idPublicacionDon) REFERENCES PublicacionDon (Id_Publicacion)
);

CREATE TABLE Inscripcion (
    ID_Inscripcion SERIAL PRIMARY KEY,
    FK_ idPublicacionDon BIGINT not null,
    FK_ idSeguidor BIGINT not null,

    FOREIGN KEY (FK_ idPublicacionDon) REFERENCES PublicacionDon (Id_Publicacion),
    FOREIGN KEY (FK_ idSeguidor) REFERENCES Seguidor(ID_ Seguidor)
);

CREATE TABLE Seguidor(
    ID_Seguidor SERIAL PRIMARY KEY,
    FK_ idEmpresa BIGINT not null,
    FK_ CedulaBen BIGINT not null,

    FOREIGN KEY (FK_ CedulaBen) REFERENCES Beneficiario(Cedula),
    FOREIGN KEY (FK_ idEmpresa) REFERENCES Empresa (ID_Empresa)
);

CREATE TABLE DatosInsc (
    ID_Datos SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    celular VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) UNIQUE NOT NULL,
    FK_ idInscripcion BIGINT not null,

    FOREIGN KEY (FK_ idInscripcion) REFERENCES Inscripcion(ID_ Inscripcion)
);

CREATE TABLE Evento(
    ID_Evento SERIAL PRIMARY KEY,
    Fecha_Publicacion DATE NOT NULL,
    Fecha_Reunion DATE NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    FK_ idEmpresa BIGINT not null,

    FOREIGN KEY (FK_ idEmpresa) REFERENCES Empresa (ID_Empresa)
);

CREATE TABLE Detalle_Evento (
    ID_Detalle SERIAL PRIMARY KEY,
    FK_ CedulaBen BIGINT not null,
    FK_ idEvento BIGINT not null,

    FOREIGN KEY (FK_ CedulaBen) REFERENCES Beneficiario(Cedula),
    FOREIGN KEY (FK_ idEvento) REFERENCES Evento(ID_Evento)
);

CREATE TABLE Grupos (
    ID_Grupo SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Motivo VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    Tipo VARCHAR(100) NOT NULL
);

--Nombre anterior Miembros del Grupo
CREATE TABLE Miembros_Grupos (
    ID_Grupo SERIAL PRIMARY KEY,
    FK_ idEmpresa BIGINT not null,
    FK_ CedulaBen BIGINT not null,
    FK_ idGrupo BIGINT not null,

    FOREIGN KEY (FK_ idGrupo) REFERENCES Grupo (ID_Grupo),
    FOREIGN KEY (FK_ CedulaBen) REFERENCES Beneficiario(Cedula),
    FOREIGN KEY (FK_ idEmpresa) REFERENCES Empresa (ID_Empresa)
);


CREATE TABLE ContenidoBeneficiario(
  ID_ContenidoBen SERIAL PRIMARY KEY,
  Descripcion VARCHAR(250)
);

CREATE TABLE TipoCont(
  ID_TipoCont SERIAL PRIMARY KEY,
  Nombre_TipoCont VARCHAR(100)
    FK_ idContenidoBen BIGINT not null,

    FOREIGN KEY (FK_ idContenidoBen) REFERENCES ContenidoBeneficiario(ID_ ContenidoBen)

);

CREATE TABLE Interaccion(
    ID_Interaccion SERIAL PRIMARY KEY
    FK_ CedulaBen BIGINT not null,
    FK_ idContenidoBen BIGINT not null,

    FOREIGN KEY (FK_ idContenidoBen) REFERENCES ContenidoBeneficiario(ID_ ContenidoBen),
    FOREIGN KEY (FK_ CedulaBen) REFERENCES Beneficiario(Cedula)
);

CREATE TABLE Tipo(
  ID_Tipo SERIAL PRIMARY KEY,
  Nombre_Tipo VARCHAR(100)
    FK_ idInteraccion BIGINT not null,

    FOREIGN KEY (FK_ idInteraccion) REFERENCES Interaccion(ID_ Interaccion )

);

CREATE TABLE Comentario(
  ID_Comentario SERIAL PRIMARY KEY,
  Contenido VARCHAR(250)
    FK_ idInteraccion BIGINT not null,

    FOREIGN KEY (FK_ idInteraccion) REFERENCES Interaccion(ID_ Interaccion )
);

CREATE TABLE Beneficiario(
  Cedula SERIAL PRIMARY KEY,
  Nombre VARCHAR(100),
  Apellido VARCHAR(100),
  Contraseña VARCHAR(100),
  Fecha_Nacimiento DATE

FK_ CedulaAmigo BIGINT not null,

FOREIGN KEY (FK_ CedulaAmigo) REFERENCES Beneficiario(Cedula)

);

CREATE TABLE Conversacion(
  ID_Conversacion SERIAL PRIMARY KEY
FK_ CedulaBen BIGINT not null,

FOREIGN KEY (FK_ CedulaBen) REFERENCES Beneficiario(Cedula)

);

CREATE TABLE Contenido(
  ID_Contenido SERIAL PRIMARY KEY
FK_ idTipoContenConver BIGINT not null,
FK_ idCoversacion BIGINT not null,
FOREIGN KEY (FK_ idTipoContenConver) REFERENCES Tipo_Contenido_Conversacion (ID_TipoCont_Conv),
FOREIGN KEY (FK_ idCoversacion) REFERENCES Conversacion(ID_Conversacion)
);

CREATE TABLE Tipo_Contenido_Conversacion(
  ID_TipoCont_Conv SERIAL PRIMARY KEY,
  NombreContenidoConv VARCHAR(100)
);

CREATE TABLE Amigo_Solicitud(
  ID_AmigoSolicitud SERIAL PRIMARY KEY,
  Tipo_Solicitud VARCHAR(100)
FK_ CedulaBen BIGINT not null,
FK_ idSolicitud BIGINT not null,

FOREIGN KEY (FK_ CedulaBen) REFERENCES Beneficiario(Cedula),
FOREIGN KEY (FK_ idSolicitud) REFERENCES Solicitud(ID_Solicitud)

);

CREATE TABLE Solicitud(
  ID_Solicitud SERIAL PRIMARY KEY,
  Estado_Solicitud VARCHAR(100)
);


CREATE TABLE Empleado(
  ID_Empleado SERIAL PRIMARY KEY,
  Cedula_Emp BIGINT,
  Nombre_Emp VARCHAR(100),
  Apellido_Emp VARCHAR(100),
  Telefono_Emp VARCHAR(100),
  Direccion_Emp VARCHAR(300),
  Correo_Emp VARCHAR(200)

);

CREATE TABLE Contrato(
  ID_Contrato SERIAL PRIMARY KEY,
  Fecha_Inicial_Con DATE,
  Fecha_Final_Con DATE,
  Estado_Con VARCHAR(50),
  Tipo_Con VARCHAR(100),
    FK_ idEmpleado BIGINT not null,
    FK_ idCargo BIGINT not null,

    FOREIGN KEY (FK_ idEmpleado) REFERENCES Empleado(ID_Empleado),
    FOREIGN KEY (FK_ idCargo) REFERENCES Cargo(ID_Cargo)
);

CREATE TABLE Cargo(
  ID_Cargo SERIAL PRIMARY KEY,
  Nombre_Cargo VARCHAR(100),
  Salario_Cargo VARCHAR(100)
);