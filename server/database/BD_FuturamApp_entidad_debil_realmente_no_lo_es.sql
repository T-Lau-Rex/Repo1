CREATE DATABASE IF NOT EXISTS reporama;

USE reporama;

CREATE TABLE IF NOT EXISTS trabajadores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    contraseña VARCHAR(100) NOT NULL,
    foto_imagen VARCHAR(255)
);

INSERT INTO trabajadores (nombre_usuario, correo, contraseña) VALUES ("Jesus", "jesuskyman@hotmail.com", "123");


CREATE TABLE IF NOT EXISTS categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100) NOT NULL
);

INSERT INTO categorias (nombre_categoria) VALUES ("Independiente");


CREATE TABLE IF NOT EXISTS editoriales (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_editorial VARCHAR(100) NOT NULL
);

INSERT INTO editoriales (nombre_editorial) VALUES ("DC");


CREATE TABLE IF NOT EXISTS comic (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    volumen INT,
    id_categoria INT NOT NULL,
    id_editorial INT NOT NULL,
    estado ENUM('Disponible', 'Agotado', 'Descatalogado')
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id),
    CONSTRAINT fk_editorial FOREIGN KEY (id_editorial) REFERENCES editoriales(id)
);

INSERT INTO comic (titulo, volumen, id_categoria, id_editorial) VALUES ("Naruto", 1, 2, 2);


CREATE TABLE IF NOT EXISTS pedido (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_trabajador INT NOT NULL,
    fecha_pedido timestamp NOT NULL DEFAULT current_timestamp,
    estado ENUM('Pendiente', 'Realizado'),
    notas VARCHAR(255),
    CONSTRAINT fk_trabajador FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id)
);

CREATE TABLE IF NOT EXISTS comic_pedido (
    id_pedido INT NOT NULL,
    id_comic INT NOT NULL,
    cantidad INT NOT NULL,
    notas VARCHAR(255),
    CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id)
    CONSTRAINT fk_comic FOREIGN KEY (id_comic) REFERENCES comic(id),
);

DESCRIBE trabajadores;
SELECT * FROM trabajadores;

DESCRIBE categorias;
SELECT * FROM categorias;

DESCRIBE editoriales;
SELECT * FROM editoriales;

DESCRIBE comic;
SELECT * FROM comic;

DESCRIBE pedido;
SELECT * FROM pedido;
