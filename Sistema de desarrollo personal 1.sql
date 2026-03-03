-- TABLA USUARIO
CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INTEGER
);

-- TABLA RENDIMIENTO GENERAL
CREATE TABLE rendimiento (
    id_rendimiento SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuario(id_usuario),
    fecha DATE NOT NULL,
    productividad_general INTEGER CHECK (productividad_general BETWEEN 1 AND 10)
);

-- TABLA ACADÉMICA
CREATE TABLE academica (
    id_academica SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuario(id_usuario),
    fecha DATE NOT NULL,
    horas_estudio INTEGER,
    tareas_completadas INTEGER,
    concentracion INTEGER CHECK (concentracion BETWEEN 1 AND 10),
    rendimiento INTEGER CHECK (rendimiento BETWEEN 1 AND 10)
);

-- TABLA SUEÑO
CREATE TABLE sueno (
    id_sueno SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuario(id_usuario),
    fecha DATE NOT NULL,
    horas_dormidas DECIMAL(4,2),
    calidad INTEGER CHECK (calidad BETWEEN 1 AND 10)
);

-- TABLA ESTRÉS
CREATE TABLE estres (
    id_estres SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuario(id_usuario),
    fecha DATE NOT NULL,
    nivel_estres INTEGER CHECK (nivel_estres BETWEEN 1 AND 10),
    estado_animo VARCHAR(50),
    energia INTEGER CHECK (energia BETWEEN 1 AND 10)
);

-- TABLA ACTIVIDAD FÍSICA
CREATE TABLE actividad_fisica (
    id_actividad SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuario(id_usuario),
    fecha DATE NOT NULL,
    tipo VARCHAR(100),
    duracion_minutos INTEGER,
    intensidad INTEGER CHECK (intensidad BETWEEN 1 AND 10)
);

-- TABLA ALIMENTACIÓN
CREATE TABLE alimentacion (
    id_alimentacion SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuario(id_usuario),
    fecha DATE NOT NULL,
    calidad INTEGER CHECK (calidad BETWEEN 1 AND 10),
    comidas INTEGER,
    agua_litros DECIMAL(3,1)
);

-- TABLA ENTRETENIMIENTO
CREATE TABLE entretenimiento (
    id_entretenimiento SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuario(id_usuario),
    fecha DATE NOT NULL,
    horas DECIMAL(3,1),
    tipo VARCHAR(100)
);

-- TABLA INTERACCIÓN SOCIAL
CREATE TABLE interaccion_social (
    id_interaccion SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuario(id_usuario),
    fecha DATE NOT NULL,
    tiempo_horas DECIMAL(3,1),
    calidad INTEGER CHECK (calidad BETWEEN 1 AND 10)
);

-- TABLA FINANZAS
CREATE TABLE finanzas (
    id_finanzas SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuario(id_usuario),
    fecha DATE NOT NULL,
    ingresos DECIMAL(10,2),
    gastos DECIMAL(10,2),
    ahorro DECIMAL(10,2)
)