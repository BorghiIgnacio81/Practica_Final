-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2023 a las 05:36:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--
CREATE DATABASE IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `biblioteca`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `editarLibro` (IN `pIdLibro` INT, IN `pTitulo` VARCHAR(100), IN `pIdAutor` VARCHAR(100), IN `pIdEditorial` VARCHAR(100), IN `pUbicacionFisica` VARCHAR(45), IN `pLugarEdicion` VARCHAR(45), IN `pAnio` INT, IN `pSerie` TINYINT, IN `pObservaciones` VARCHAR(100), IN `pIdMateria` VARCHAR(100))   BEGIN
    DECLARE autorId INT;
    DECLARE editorialId INT;
    DECLARE materiaId INT;

    -- Obtener el ID del autor (si ya existe)
    SELECT idAutor INTO autorId
    FROM autores A
    WHERE CONCAT(A.apellido, ', ', A.nombre) like pIdAutor
    LIMIT 1;

    -- Insertar en la tabla autores si el autor no existe
    IF autorId IS NULL THEN
        INSERT INTO autores (apellido, nombre)
        VALUES (SUBSTRING_INDEX(pIdAutor, ',', 1), SUBSTRING_INDEX(pIdAutor, ',', -1));

        SET autorId = LAST_INSERT_ID(); -- Obtener el ID del autor insertado
    END IF;

    -- Obtener el ID de la editorial (si ya existe)
    SELECT idEditorial INTO editorialId
    FROM editoriales E
    WHERE E.editorial like pIdEditorial
    LIMIT 1;

    -- Insertar en la tabla editoriales si la editorial no existe
    IF editorialId IS NULL THEN
        INSERT INTO editoriales (editorial)
        VALUES (pIdEditorial);

        SET editorialId = LAST_INSERT_ID(); -- Obtener el ID de la editorial insertada
    END IF;

    -- Obtener el ID de la materia (si ya existe)
    SELECT idMateria INTO materiaId
    FROM Materias M
    WHERE M.materia like pIdMateria
    LIMIT 1;

    -- Insertar en la tabla materias si la materia no existe
    IF materiaId IS NULL THEN
        INSERT INTO Materias (materia)
        VALUES (pIdMateria);

        SET materiaId = LAST_INSERT_ID(); -- Obtener el ID de la materia insertada
    END IF;

    -- Actualizar la tabla libros
    UPDATE libros 
    SET 
        titulo = pTitulo, 
        idAutor = autorId, 
        idEditorial = editorialId, 
        ubicacionFisica = pUbicacionFisica, 
        lugarEdicion = pLugarEdicion, 
        anio = pAnio, 
        serie = pSerie, 
        observaciones = pObservaciones, 
        idMateria = materiaId,
        activo = 1
    WHERE idLibro = pIdLibro;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editarUsuario` (IN `pIdUsuario` INT, IN `pNombre` VARCHAR(100), IN `pApellido` VARCHAR(100), IN `pDni` INT, IN `pFechaNac` DATE, IN `pTelefono` INT, IN `pTipoUsuario` INT, IN `pEmail` VARCHAR(200), IN `pDireccion` VARCHAR(150))   BEGIN
    UPDATE usuarios 
    SET 
        nombre = pNombre, 
        apellido = pApellido, 
        dni = pDni, 
        fechaNac = pFechaNac,        
        email = pEmail,
        direccion = pDireccion,
        telefono = pTelefono,
        tipoUsuario = pTipoUsuario
    WHERE idUsuarios = pIdUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarLibro` (IN `pIdLibro` INT)   DELETE FROM libros 
WHERE idLibro = pIdLibro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarUsuario` (IN `pIdUsuario` INT)   DELETE FROM Usuarios 
WHERE idUsuarios = pIdUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarLibro` (IN `pTitulo` VARCHAR(100), IN `pIdAutor` VARCHAR(100), IN `pIdEditorial` VARCHAR(100), IN `pUbicacionFisica` VARCHAR(45), IN `pLugarEdicion` VARCHAR(45), IN `pAnio` INT, IN `pSerie` TINYINT, IN `pObservaciones` VARCHAR(100), IN `pIdMateria` VARCHAR(100))   BEGIN
    DECLARE autorId INT;
    DECLARE editorialId INT;
    DECLARE materiaId INT;

    -- Obtener el ID del autor (si ya existe)
    SELECT idAutor INTO autorId
    FROM autores A
    WHERE CONCAT(A.apellido, ', ', A.nombre) = pIdAutor
    LIMIT 1;

    -- Insertar en la tabla autores si el autor no existe
    IF autorId IS NULL THEN
        INSERT INTO autores (apellido, nombre)
        VALUES (SUBSTRING_INDEX(pIdAutor, ',', 1), SUBSTRING_INDEX(pIdAutor, ',', -1));

        SET autorId = LAST_INSERT_ID(); -- Obtener el ID del autor insertado
    END IF;

    -- Obtener el ID de la editorial (si ya existe)
    SELECT idEditorial INTO editorialId
    FROM editoriales E
    WHERE E.editorial = pIdEditorial
    LIMIT 1;

    -- Insertar en la tabla editoriales si la editorial no existe
    IF editorialId IS NULL THEN
        INSERT INTO editoriales (editorial)
        VALUES (pIdEditorial);

        SET editorialId = LAST_INSERT_ID(); -- Obtener el ID de la editorial insertada
    END IF;

    -- Obtener el ID de la materia (si ya existe)
    SELECT idMateria INTO materiaId
    FROM Materias M
    WHERE M.materia = pIdMateria
    LIMIT 1;

    -- Insertar en la tabla materias si la materia no existe
    IF materiaId IS NULL THEN
        INSERT INTO Materias (materia)
        VALUES (pIdMateria);

        SET materiaId = LAST_INSERT_ID(); -- Obtener el ID de la materia insertada
    END IF;

    -- Insertar datos en la tabla libros
    INSERT INTO libros (
        titulo, 
        idAutor, 
        idEditorial, 
        ubicacionFisica, 
        lugarEdicion, 
        anio, 
        serie, 
        observaciones, 
        idMateria,
        activo
    ) VALUES (
        pTitulo, 
        autorId, 
        editorialId, 
        pUbicacionFisica, 
        pLugarEdicion, 
        pAnio, 
        pSerie, 
        pObservaciones, 
        materiaId,
        1 -- Assuming 'activo' should be set to 1 for new entries
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario` (IN `pNombre` VARCHAR(100), IN `pApellido` VARCHAR(100), IN `pDni` INT, IN `pFechaNac` DATE, IN `pTelefono` INT, IN `pEmail` VARCHAR(200), IN `pDireccion` VARCHAR(150))   BEGIN
    INSERT INTO usuarios (
        nombre, 
        apellido, 
        dni, 
        fechaNac, 
        telefono, 
        tipoUsuario, 
        penalidad, 
        email,
        direccion
    ) VALUES (
        pNombre, 
        pApellido, 
        pDni, 
        pFechaNac, 
        pTelefono, 
        3, 
        0, 
        pEmail,
        pDireccion
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `librosXactivo` (IN `pActivo` INT)   select idLibro, titulo, concat('', a.apellido, ', ', a.nombre) as 'autor', ubicacionFisica, E.editorial, M.materia, lugarEdicion, anio, serie, observaciones from libros L JOIN autores A ON L.idAutor = A.idAutor JOIN editoriales E ON E.idEditorial = L.idEditorial JOIN materias M on M.idMateria = L.idMateria where activo = pActivo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `librosXtitulo` (IN `pTitulo` VARCHAR(200))   select idLibro, titulo, concat('', a.apellido, ', ', a.nombre) as 'autor', ubicacionFisica, E.editorial, M.materia, lugarEdicion, anio, serie, observaciones from libros L JOIN autores A ON L.idAutor = A.idAutor JOIN editoriales E ON E.idEditorial = L.idEditorial JOIN materias M on M.idMateria = L.idMateria where Titulo like concat('%', pTitulo, '%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `preUsuarios` ()   SELECT idUsuarios as idUsuario, nombre, apellido, dni, direccion, telefono, email, TIMESTAMPDIFF(YEAR, fechaNac, CURDATE()) AS Edad
from usuarios
WHERE tipoUsuario = 4$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuarioXparam` (IN `pUsuario` VARCHAR(200))   SELECT idUsuarios as idUsuario, nombre, apellido, dni, direccion, telefono, email, TIMESTAMPDIFF(YEAR, fechaNac, CURDATE()) AS Edad 
FROM usuarios 
WHERE Nombre LIKE concat('%', pUsuario, '%') OR Apellido LIKE concat('%', pUsuario, '%') OR DNI like concat ('%',pUsuario, '%')$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `idAutor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` VALUES
(1, 'Juan', 'Perezz', 'Argentina', '1990-02-15'),
(2, 'Ana', 'Gomez', 'Mejico', '1988-07-22'),
(3, 'Carlos', 'Martinez', 'España', '1995-03-10'),
(4, 'Laura', 'Lopez', 'Chile', '1987-11-05'),
(5, 'Marta', 'Rodriguez', 'Peru', '1992-09-18'),
(6, 'Pedro', 'Hernandez', 'Colombia', '1998-04-30'),
(7, 'Sofia', 'Fernandez', 'Argentina', '1989-06-14'),
(8, 'Andres', 'Garcia', 'Uruguay', '1993-12-25'),
(9, 'Isabella', 'Diaz', 'Mejico', '1997-08-03'),
(10, 'Lucas', 'Vargas', 'España', '1994-10-09'),
(11, 'Elena', 'Torres', 'Argentina', '1996-05-15'),
(12, 'Diego', 'Silva', 'Chile', '1991-01-08'),
(13, 'Valentina', 'Rojas', 'Peru', '1986-03-21'),
(14, 'Miguel', 'Pacheco', 'Colombia', '1999-07-14'),
(15, 'Julia', 'Sanchez', 'Argentina', '1997-09-29'),
(16, 'Alejandro', 'Mendoza', 'Uruguay', '1990-11-12'),
(17, 'Camila', 'Gutierrez', 'Mejico', '1988-04-05'),
(18, 'Matias', 'Ramirez', 'España', '1996-06-27'),
(19, 'Natalia', 'Reyes', 'Peru', '1993-08-18'),
(20, 'Fernando', 'Guerrero', 'Argentina', '1991-10-31'),
(21, 'Carmen', 'Ortega', 'Colombia', '1987-12-04'),
(22, 'Joaquin', 'Vega', 'Argentina', '1998-02-07'),
(23, 'Martina', 'Rivas', 'Chile', '1992-04-09'),
(24, 'Sebastian', 'Cruz', 'Mejico', '1994-09-13'),
(25, 'Valeria', 'Flores', 'España', '1989-01-17'),
(26, 'Luis', 'Romero', 'Uruguay', '1995-03-20'),
(27, 'Alicia', 'Santos', 'Argentina', '1997-07-23'),
(28, 'Daniel', 'Moreno', 'Peru', '1993-11-26'),
(29, 'Mariano', 'Castro', 'Colombia', '1991-01-29'),
(30, 'Carolina', 'Jimenez', 'Argentina', '1988-05-02'),
(31, 'Gonzalo', 'Molina', 'España', '1999-07-06'),
(32, 'Sara', 'Navarro', 'Chile', '1996-09-09'),
(33, 'Emilio', 'Lara', 'Mejico', '1994-12-12'),
(34, 'Patricia', 'Ramos', 'Uruguay', '1990-02-14'),
(35, 'Ricardo', 'Velasco', 'Argentina', '1987-04-17'),
(36, 'Lorena', 'Castillo', 'Peru', '1992-06-20'),
(37, 'Javier', 'Peralta', 'Colombia', '1998-08-23'),
(38, 'Adriana', 'Guzman', 'España', '1997-10-26'),
(39, 'Federico', 'Ruiz', 'Argentina', '1985-03-01'),
(40, 'Luna', 'Vidal', 'España', '1986-09-14'),
(41, 'Max', 'Galindo', 'Mejico', '1984-12-30'),
(42, 'Miguel', 'Cervantes Saavedra', 'Español', '1547-09-29'),
(43, 'Carlos', 'Ruiz Zafran', 'Español', '1964-09-25'),
(44, 'George', 'Orwell', 'Britanico', '1903-06-25'),
(45, 'Gabriel Garcia', 'Marquez', 'Colombiano', '1927-03-06'),
(46, 'Harper', 'Lee', 'Estadounidense', '1926-04-28'),
(47, 'Fyodor', 'Dostoevsky', 'Ruso', '1821-11-11'),
(48, 'Suzanne', 'Collins', 'Estadounidense', '1962-08-10'),
(49, 'J.R.R.', 'Tolkien', 'Britanico', '1892-01-03'),
(50, 'Dan', 'Brown', 'Estadounidense', '1964-06-22'),
(51, 'J.K.', 'Rowling', 'Britanica', '1965-07-31'),
(52, 'Stephenie', 'Meyer', 'Estadounidense', '1973-12-24'),
(53, 'Franz', 'Kafka', 'AustroHungaro', '1883-07-03'),
(54, 'Emily', 'Bronte', 'Britanica', '1818-07-30'),
(55, 'F. Scott', 'Fitzgerald', 'Estadounidense', '1896-09-24'),
(56, 'Jack', 'Kerouac', 'Estadounidense', '1922-03-12'),
(57, 'Rebecca', 'Solnit', 'Estadounidense', '1961-06-24'),
(58, 'Ken', 'Follett', 'Britanico', '1949-06-05'),
(59, 'Patrick', 'Sadskind', 'Aleman', '1949-03-26'),
(60, 'Herman', 'Melville', 'Estadounidense', '1819-08-01'),
(61, 'Roald', 'Dahl', 'Britanico', '1916-09-13'),
(62, 'Victor', 'Hugo', 'Frances', '1802-02-26'),
(63, 'Miguel de', 'Cervantes Saavedra', 'Español', '1547-09-29'),
(64, 'Fernando de', 'Rojas', 'Español', '1470-04-04'),
(65, 'Paula', 'Hawkins', 'Britanica', '1972-08-26'),
(66, 'James', 'Dashner', 'Estadounidense', '1972-11-26'),
(67, 'Cormac', 'McCarthy', 'Estadounidense', '1933-07-20'),
(68, 'Cassandra', 'Clare', 'Estadounidense', '1973-07-27'),
(69, 'Patrick', 'Sadskind', 'Aleman', '1949-03-26'),
(70, 'Herman', 'Melville', 'Estadounidense', '1819-08-01'),
(71, 'Roald', 'Dahl', 'Britanico', '1916-09-13'),
(72, 'Victor', 'Hugo', 'Frances', '1802-02-26'),
(73, 'Miguel de', 'Cervantes Saavedra', 'Español', '1547-09-29'),
(74, 'Fernando de', 'Rojas', 'Español', '1470-04-04'),
(75, 'Paula', 'Hawkins', 'Britanica', '1972-08-26'),
(76, 'James', 'Dashner', 'Estadounidense', '1972-11-26'),
(77, 'Cormac', 'McCarthy', 'Estadounidense', '1933-07-20'),
(78, 'Patrick', 'Sadskind', 'Aleman', '1949-03-26'),
(79, 'Herman', 'Melville', 'Estadounidense', '1819-08-01'),
(80, 'Roald', 'Dahl', 'Britanico', '1916-09-13'),
(81, 'Victor', 'Hugo', 'Frances', '1802-02-26'),
(82, 'Miguel de', 'Cervantes Saavedra', 'Español', '1547-09-29'),
(83, 'Fernando de', 'Rojas', 'Español', '1470-04-04'),
(84, 'Arthur Conan', 'Doyle', 'Britanico', '1859-05-22'),
(85, 'Stephen', 'King', 'Estadounidense', '1947-09-21'),
(86, 'Bram', 'Stoker', 'Irlandes', '1847-11-08'),
(87, 'Homero', 'Desconocido', 'Griego', '0000-00-00'),
(88, 'Anthony', 'Burgess', 'Britanico', '1917-02-25'),
(89, 'Fyodor', 'Dostoevsky', 'Ruso', '1821-11-11'),
(90, 'F. Scott', 'Fitzgerald', 'Estadounidense', '1896-09-24'),
(91, 'Juan', 'Perezz', 'Argentina', '1990-02-15'),
(92, 'Ana', 'Gomez', 'Mejico', '1988-07-22'),
(93, 'Carlos', 'Martinez', 'España', '1995-03-10'),
(94, 'Laura', 'Lopez', 'Chile', '1987-11-05'),
(95, 'Marta', 'Rodriguez', 'Peru', '1992-09-18'),
(96, 'Pedro', 'Hernandez', 'Colombia', '1998-04-30'),
(97, 'Sofia', 'Fernandez', 'Argentina', '1989-06-14'),
(98, 'Andres', 'Garcia', 'Uruguay', '1993-12-25'),
(99, 'Isabella', 'Diaz', 'Mejico', '1997-08-03'),
(100, 'Lucas', 'Vargas', 'España', '1994-10-09'),
(101, 'Elena', 'Torres', 'Argentina', '1996-05-15'),
(102, 'Diego', 'Silva', 'Chile', '1991-01-08'),
(103, 'Valentina', 'Rojas', 'Peru', '1986-03-21'),
(104, 'Miguel', 'Pacheco', 'Colombia', '1999-07-14'),
(105, 'Julia', 'Sanchez', 'Argentina', '1997-09-29'),
(106, 'Alejandro', 'Mendoza', 'Uruguay', '1990-11-12'),
(107, 'Camila', 'Gutierrez', 'Mejico', '1988-04-05'),
(108, 'Matias', 'Ramirez', 'España', '1996-06-27'),
(109, 'Natalia', 'Reyes', 'Peru', '1993-08-18'),
(110, 'Fernando', 'Guerrero', 'Argentina', '1991-10-31'),
(111, 'Carmen', 'Ortega', 'Colombia', '1987-12-04'),
(112, 'Joaquin', 'Vega', 'Argentina', '1998-02-07'),
(113, 'Martina', 'Rivas', 'Chile', '1992-04-09'),
(114, 'Sebastian', 'Cruz', 'Mejico', '1994-09-13'),
(115, 'Valeria', 'Flores', 'España', '1989-01-17'),
(116, 'Luis', 'Romero', 'Uruguay', '1995-03-20'),
(117, 'Alicia', 'Santos', 'Argentina', '1997-07-23'),
(118, 'Daniel', 'Moreno', 'Peru', '1993-11-26'),
(119, 'Mariano', 'Castro', 'Colombia', '1991-01-29'),
(120, 'Carolina', 'Jimenez', 'Argentina', '1988-05-02'),
(121, 'Gonzalo', 'Molina', 'España', '1999-07-06'),
(122, 'Sara', 'Navarro', 'Chile', '1996-09-09'),
(123, 'Emilio', 'Lara', 'Mejico', '1994-12-12'),
(124, 'Patricia', 'Ramos', 'Uruguay', '1990-02-14'),
(125, 'Ricardo', 'Velasco', 'Argentina', '1987-04-17'),
(126, 'Lorena', 'Castillo', 'Peru', '1992-06-20'),
(127, 'Javier', 'Peralta', 'Colombia', '1998-08-23'),
(128, 'Adriana', 'Guzman', 'España', '1997-10-26'),
(129, 'Federico', 'Ruiz', 'Argentina', '1985-03-01'),
(130, 'Luna', 'Vidal', 'España', '1986-09-14'),
(131, 'Max', 'Galindo', 'Mejico', '1984-12-30'),
(132, 'Miguel', 'Cervantes Saavedra', 'Español', '1547-09-29'),
(133, 'Carlos', 'Ruiz Zafran', 'Español', '1964-09-25'),
(134, 'George', 'Orwell', 'Britanico', '1903-06-25'),
(135, 'Gabriel Garcia', 'Marquez', 'Colombiano', '1927-03-06'),
(136, 'Harper', 'Lee', 'Estadounidense', '1926-04-28'),
(137, 'Fyodor', 'Dostoevsky', 'Ruso', '1821-11-11'),
(138, 'Suzanne', 'Collins', 'Estadounidense', '1962-08-10'),
(139, 'J.R.R.', 'Tolkien', 'Britanico', '1892-01-03'),
(140, 'Dan', 'Brown', 'Estadounidense', '1964-06-22'),
(141, 'J.K.', 'Rowling', 'Britanica', '1965-07-31'),
(142, 'Stephenie', 'Meyer', 'Estadounidense', '1973-12-24'),
(143, 'Franz', 'Kafka', 'AustroHungaro', '1883-07-03'),
(144, 'Emily', 'Bronte', 'Britanica', '1818-07-30'),
(145, 'F. Scott', 'Fitzgerald', 'Estadounidense', '1896-09-24'),
(146, 'Jack', 'Kerouac', 'Estadounidense', '1922-03-12'),
(147, 'Rebecca', 'Solnit', 'Estadounidense', '1961-06-24'),
(148, 'Ken', 'Follett', 'Britanico', '1949-06-05'),
(149, 'Patrick', 'Sadskind', 'Aleman', '1949-03-26'),
(150, 'Herman', 'Melville', 'Estadounidense', '1819-08-01'),
(151, 'Roald', 'Dahl', 'Britanico', '1916-09-13'),
(152, 'Victor', 'Hugo', 'Frances', '1802-02-26'),
(153, 'Miguel de', 'Cervantes Saavedra', 'Español', '1547-09-29'),
(154, 'Fernando de', 'Rojas', 'Español', '1470-04-04'),
(155, 'Paula', 'Hawkins', 'Britanica', '1972-08-26'),
(156, 'James', 'Dashner', 'Estadounidense', '1972-11-26'),
(157, 'Cormac', 'McCarthy', 'Estadounidense', '1933-07-20'),
(158, 'Cassandra', 'Clare', 'Estadounidense', '1973-07-27'),
(159, 'Patrick', 'Sadskind', 'Aleman', '1949-03-26'),
(160, 'Herman', 'Melville', 'Estadounidense', '1819-08-01'),
(161, 'Roald', 'Dahl', 'Britanico', '1916-09-13'),
(162, 'Victor', 'Hugo', 'Frances', '1802-02-26'),
(163, 'Miguel de', 'Cervantes Saavedra', 'Español', '1547-09-29'),
(164, 'Fernando de', 'Rojas', 'Español', '1470-04-04'),
(165, 'Paula', 'Hawkins', 'Britanica', '1972-08-26'),
(166, 'James', 'Dashner', 'Estadounidense', '1972-11-26'),
(167, 'Cormac', 'McCarthy', 'Estadounidense', '1933-07-20'),
(168, 'Patrick', 'Sadskind', 'Aleman', '1949-03-26'),
(169, 'Herman', 'Melville', 'Estadounidense', '1819-08-01'),
(170, 'Roald', 'Dahl', 'Britanico', '1916-09-13'),
(171, 'Victor', 'Hugo', 'Frances', '1802-02-26'),
(172, 'Miguel de', 'Cervantes Saavedra', 'Español', '1547-09-29'),
(173, 'Fernando de', 'Rojas', 'Español', '1470-04-04'),
(174, 'Arthur Conan', 'Doyle', 'Britanico', '1859-05-22'),
(175, 'Stephen', 'King', 'Estadounidense', '1947-09-21'),
(176, 'Bram', 'Stoker', 'Irlandes', '1847-11-08'),
(177, 'Homero', 'Desconocido', 'Griego', '0000-00-00'),
(178, 'Anthony', 'Burgess', 'Britanico', '1917-02-25'),
(179, 'Fyodor', 'Dostoevsky', 'Ruso', '1821-11-11'),
(180, 'F. Scott', 'Fitzgerald', 'Estadounidense', '1896-09-24'),
(181, ' Joe', 'Smith', NULL, NULL),
(182, 'J.R. Rolon', 'J.R. Rolon', NULL, NULL),
(183, ' Rolon', 'J.R.', NULL, NULL),
(184, ' Julio', 'Ronin', NULL, NULL),
(185, ' Julio', 'Murgenson', NULL, NULL),
(186, ' J.K.', 'Rowlon', NULL, NULL),
(187, '1', '1', NULL, NULL),
(188, '1', '1', NULL, NULL),
(189, '1', '1', NULL, NULL),
(190, '0', '0', NULL, NULL),
(191, '0', '0', NULL, NULL),
(192, '', '', NULL, NULL),
(193, ' Clara', 'Gomez', NULL, NULL),
(194, '0', '0', NULL, NULL),
(195, '0', '0', NULL, NULL),
(196, '0', '0', NULL, NULL),
(197, ' J.K', 'Rowling', NULL, NULL),
(198, ' Jota ka', 'Rwlons', NULL, NULL),
(199, '  Jota ka', 'RowlinGGG', NULL, NULL),
(200, '   Jota ka', 'RowlinG', NULL, NULL),
(201, 'Matias', 'Matias', NULL, NULL),
(202, NULL, NULL, NULL, NULL),
(203, NULL, NULL, NULL, NULL),
(204, ' Juan', 'Echanove', NULL, NULL),
(205, '1', '1', NULL, NULL),
(206, NULL, NULL, NULL, NULL),
(207, NULL, NULL, NULL, NULL),
(208, NULL, NULL, NULL, NULL),
(209, NULL, NULL, NULL, NULL),
(210, NULL, NULL, NULL, NULL),
(211, NULL, NULL, NULL, NULL),
(212, NULL, NULL, NULL, NULL),
(213, NULL, NULL, NULL, NULL),
(214, NULL, NULL, NULL, NULL),
(215, NULL, NULL, NULL, NULL),
(216, NULL, NULL, NULL, NULL),
(217, NULL, NULL, NULL, NULL),
(218, NULL, NULL, NULL, NULL),
(219, ' Alejandro 	', 'Mendoza', NULL, NULL),
(220, NULL, NULL, NULL, NULL),
(221, NULL, NULL, NULL, NULL),
(222, ' Julio', 'Julio', NULL, NULL),
(223, NULL, NULL, NULL, NULL),
(224, NULL, NULL, NULL, NULL),
(225, NULL, NULL, NULL, NULL),
(226, ' Julio', 'Julio', NULL, NULL),
(227, ' Julio', 'Julio', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `idEditorial` int(11) NOT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `fundacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` VALUES
(1, 'Ediciones Secundaria', 'Argentina', '1990-05-15'),
(2, 'Libros Educativos S.A.', 'Argentina', '1985-07-22'),
(3, 'Editorial Estudiantil', 'Argentina', '1998-03-10'),
(4, 'Libros para el Futuro', 'Uruguay', '1995-11-05'),
(5, 'Editorial Aprendiz', 'Argentina', '2001-09-18'),
(6, 'Publicaciones Educativas', 'Argentina', '1999-04-30'),
(7, 'Libros Academicos', 'Argentina', '2003-06-14'),
(8, 'Editorial Pedagogica', 'Paraguay', '2007-12-25'),
(9, 'Libros y Mas', 'Argentina', '2006-08-03'),
(10, 'Editorial Educativa Integral', 'Argentina', '2005-10-09'),
(11, 'Ediciones Secundaria', 'Argentina', '1990-05-15'),
(12, 'Libros Educativos S.A.', 'Argentina', '1985-07-22'),
(13, 'Editorial Estudiantil', 'Argentina', '1998-03-10'),
(14, 'Libros para el Futuro', 'Uruguay', '1995-11-05'),
(15, 'Editorial Aprendiz', 'Argentina', '2001-09-18'),
(16, 'Publicaciones Educativas', 'Argentina', '1999-04-30'),
(17, 'Libros Academicos', 'Argentina', '2003-06-14'),
(18, 'Editorial Pedagogica', 'Paraguay', '2007-12-25'),
(19, 'Libros y Mas', 'Argentina', '2006-08-03'),
(20, 'Editorial Educativa Integral', 'Argentina', '2005-10-09'),
(21, 'INVENTO', NULL, NULL),
(22, 'Jalapeña', NULL, NULL),
(23, 'Atalaya', NULL, NULL),
(24, 'Anagrama', NULL, NULL),
(25, '1', NULL, NULL),
(26, '0', NULL, NULL),
(27, '4', NULL, NULL),
(28, NULL, NULL, NULL),
(29, NULL, NULL, NULL),
(30, NULL, NULL, NULL),
(31, NULL, NULL, NULL),
(32, NULL, NULL, NULL),
(33, NULL, NULL, NULL),
(34, NULL, NULL, NULL),
(35, NULL, NULL, NULL),
(36, NULL, NULL, NULL),
(37, NULL, NULL, NULL),
(38, NULL, NULL, NULL),
(39, NULL, NULL, NULL),
(40, NULL, NULL, NULL),
(41, NULL, NULL, NULL),
(42, NULL, NULL, NULL),
(43, NULL, NULL, NULL),
(44, NULL, NULL, NULL),
(45, 'Juliana', NULL, NULL),
(46, NULL, NULL, NULL),
(47, NULL, NULL, NULL),
(48, NULL, NULL, NULL),
(49, 'Anagrama lo flipa', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `idLibro` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `idAutor` int(11) DEFAULT NULL,
  `idEditorial` int(11) NOT NULL,
  `ubicacionFisica` varchar(45) DEFAULT NULL,
  `lugarEdicion` varchar(45) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `serie` tinyint(4) DEFAULT NULL COMMENT 'si(1)\r\nno(0)\r\n',
  `observaciones` varchar(100) DEFAULT NULL,
  `idMateria` int(11) NOT NULL,
  `activo` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` VALUES
(1, 'Matematicas Avanzadas', 1, 1, 'A1', 'Buenos Aires-Argentina', 2022, 0, 'Buen estado, reciente', 1, 1),
(2, 'Historia Universal', 4, 3, 'D4', 'Ciudad de Mejico-Mejico', 2019, 0, 'Algunas paginas sueltas', 5, 2),
(3, 'Ciencias Naturales para Jovenes', 2, 2, 'B2', 'Bogota-Colombia', 2020, 0, 'En buen estado', 2, 3),
(4, 'Literatura Clasica', 5, 5, 'F6', 'Madrid-España', 2005, 0, 'Antiguo, pero bien conservado', 4, 4),
(5, 'Geografia Mundial', 3, 4, 'C3', 'Lima-Peru', 2010, 0, 'Con marcas de uso', 6, 5),
(6, 'Arte Y Creatividad', 6, 6, 'A42', 'ACA', 1111, 1, '1', 7, 1),
(7, 'Musica para Adolescentes', 7, 8, 'E8', 'Montevideo-Uruguay', 2015, 0, 'En excelente estado', 9, 7),
(8, 'La Odisea del Espacio', 10, 9, 'D5', 'Barcelona-España', 1970, 1, 'Parte de una serie Clasica', 10, 8),
(9, 'Quimica para Principiantes', 12, 10, 'C2', 'Santiago-Chile', 2023, 0, 'Nuevo, nunca usado', 12, 9),
(10, 'Fisica Avanzada', 11, 7, 'B1', 'Buenos Aires-Argentina', 2018, 0, 'Con anotaciones', 13, 10),
(11, 'Ingles Intermedio', 16, 9, 'F2', 'Londres-Reino Unido', 2019, 0, 'Buen estado, incluye CD', 16, 11),
(12, 'Programacion para Niños', 20, 7, 'E3', 'San Francisco-EE. UU.', 2022, 0, 'Novedad en tecnologia', 16, 12),
(13, 'Educacion Civica', 18, 5, 'A5', 'Buenos Aires-Argentina', 2015, 0, 'Con notas del propietario anterior', 18, 13),
(14, 'Religion y Valores', 19, 6, 'C7', 'Ciudad de Mejico-Mejico', 2020, 0, 'Buen estado, con ilustraciones', 19, 14),
(15, 'Economia Basica', 23, 10, 'B6', 'Madrid-España', 2018, 0, 'Con ejemplos practicos', 20, 15),
(16, 'Historias de Ciencia Ficcion', 31, 4, 'D1', 'Buenos Aires-Argentina', 1987, 1, 'Parte de una serie', 5, 16),
(17, 'Aventuras en la Selva', 28, 3, 'A8', 'Manaus-Brasil', 2019, 0, 'Libro de tapa dura', 8, 17),
(18, 'DDDDDDDDDDDDDDDD', 1, 1, 'FUA', '1', 1, 1, '1', 1, 1),
(19, 'FenÃ³menos Naturales', 32, 1, 'E4', 'Santiago-Chile', 2020, 0, 'Ilustraciones a color', 2, 19),
(20, 'Sociedad y Cultura', 40, 8, 'C8', 'Buenos Aires-Argentina', 2017, 0, 'Libro de consulta', 5, 20),
(21, 'Historias del Mundo Antiguo', 37, 10, 'D6', 'Atenas-Grecia', 1995, 1, 'Parte de una serie', 5, 21),
(22, 'Misterios del Universo', 35, 7, 'B4', 'Houston-EE. UU.', 2022, 0, 'Con fotografÃ­as de la NASA', 1, 22),
(23, 'Pintura y Creatividad', 36, 9, 'A3', 'ParÃ­s-Francia', 2016, 0, 'GuÃ­a de arte', 7, 23),
(24, 'Musica Clasica para Niños', 33, 4, 'E2', 'Viena-Austria', 2018, 0, 'Incluye CD de Musica', 9, 24),
(25, 'El Espacio y los Planetas', 38, 3, 'C1', 'Buenos Aires-Argentina', 2019, 0, 'Libro de divulgaciÃ³n cientÃ­fica', 2, 25),
(26, 'Etica en la Sociedad Moderna', 34, 5, 'F5', 'Madrid-España', 2020, 0, 'Discute dilemas morales', 17, 26),
(27, 'Quimica Divertida', 26, 6, 'D8', 'Bogota-Colombia', 2021, 0, 'Experimentos para Niños', 12, 27),
(28, 'Fisica para Curiosos', 24, 8, 'A2', 'Buenos Aires-Argentina', 2017, 0, 'Con ejemplos practicos', 13, 28),
(29, 'Historias de Viajes', 30, 10, 'B3', 'Roma-Italia', 2019, 1, 'Parte de una serie', 5, 29),
(30, 'Aventuras en el Espacio', 29, 7, 'E6', 'Houston-EE. UU.', 2023, 0, 'Con ilustraciones de astronautas', 1, 30),
(31, 'Matematicas para Todos', 25, 9, 'C5', 'Buenos Aires-Argentina', 2020, 0, 'Incluye ejercicios resueltos', 1, 31),
(32, 'Historias de Ã‰poca', 21, 4, 'F3', 'Londres-Reino Unido', 2018, 1, 'Parte de una serie', 5, 32),
(33, 'Cuentos de Ciencia Ficcion', 39, 3, 'D7', 'Buenos Aires-Argentina', 1992, 1, 'ClÃ¡sicos de la ciencia Ficcion', 10, 33),
(34, 'Arte y Creatividad en la Historia', 22, 2, 'A4', 'ParÃ­s-Francia', 2015, 0, 'Ilustraciones de obras famosas', 5, 34),
(35, 'Musica para Jovenes Talentos', 20, 1, 'E7', 'Viena-Austria', 2021, 0, 'Partituras y consejos para mÃºsicos Jovenes', 9, 35),
(36, 'El Universo en ImÃ¡genes', 17, 10, 'B7', 'Houston-EE. UU.', 2020, 0, 'FotografÃ­as astronÃ³micas', 1, 36),
(37, 'Economia para Principiantes', 15, 7, 'D2', 'Buenos Aires-Argentina', 2019, 0, 'Introduccion a la Economia', 20, 37),
(38, 'El Arte de la NegociaciÃ³n', 13, 6, 'A1', 'Nueva York-EE. UU.', 2020, 0, 'Estrategias comerciales', 19, 38),
(39, 'Religion en el Mundo Moderno', 14, 5, 'C4', 'Roma-Italia', 2018, 0, 'Comparativa de religiones', 19, 39),
(40, 'Historia de las Civilizaciones', 12, 4, 'F1', 'Atenas-Grecia', 2021, 0, 'Resumen histÃ³rico', 5, 40),
(41, 'Aventuras en el OcÃ©ano', 11, 3, 'E5', 'Santiago-Chile', 2019, 1, 'Parte de una serie', 5, 41),
(42, 'Astronomia para Niños', 9, 2, 'B8', 'Buenos Aires-Argentina', 2020, 0, 'Descubre las estrellas', 2, 42),
(43, 'Los Grandes ClÃ¡sicos Literarios', 8, 1, 'C6', 'Madrid-España', 2017, 0, 'AntologÃ­a literaria', 3, 43),
(44, 'Geografia de Aventuras', 7, 10, 'A6', 'Buenos Aires-Argentina', 2019, 1, 'Parte de una serie', 6, 44),
(45, 'Ciencia y tecnologia del Futuro', 6, 9, 'D4', 'San Francisco-EE. UU.', 2022, 0, 'Predicciones tecnolÃ³gicas', 17, 45),
(46, 'Misterios del Pasado', 5, 8, 'F4', 'Mejico D.F.-Mejico', 2016, 1, 'Parte de una serie', 4, 46),
(47, 'Lengua y Literatura Clasica', 4, 7, 'E1', 'Roma-Italia', 2018, 0, 'Textos clÃ¡sicos', 4, 47),
(48, 'El Universo en NÃºmeros', 3, 6, 'B5', 'Madrid-España', 2020, 0, 'Matematicas y cosmologÃ­a', 1, 48),
(49, 'Arte y Pintura Moderna', 2, 5, 'C3', 'Nueva York-EE. UU.', 2019, 0, 'Movimientos artÃ­sticos contemporÃ¡neos', 7, 49),
(50, 'Musica en la Cultura Mundial', 1, 4, 'A3', 'Londres-Reino Unido', 2021, 0, 'Diversidad musical global', 9, 50),
(51, 'Matematicas para Principiantes', 1, 1, 'A1', 'Buenos Aires-Argentina', 2022, 0, 'Nuevo', 1, 56),
(52, 'Historia del Siglo XX', 2, 2, 'B2', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 5, 57),
(53, 'Bilogia Avanzada', 3, 3, 'C3', 'Cordoba-Argentina', 2019, 0, 'Como nuevo', 3, 58),
(54, 'Quimica para Jovenes CientÃ­ficos', 4, 4, 'D4', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 12, 59),
(55, 'Literatura Universal', 5, 5, 'E5', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 4, 60),
(56, 'Geografia Mundial', 6, 6, 'F6', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 6, 61),
(57, 'Fisica Cuantica', 7, 7, 'A7', 'Rosario-Argentina', 2017, 0, 'En buen estado', 7, 62),
(58, 'Arte Moderno', 8, 8, 'B8', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 8, 63),
(59, 'InformÃ¡tica Basica', 9, 9, 'C9', 'Buenos Aires-Argentina', 2022, 0, 'Nuevo', 9, 64),
(60, 'Musica Clasica', 10, 10, 'D10', 'Cordoba-Argentina', 2020, 0, 'En excelente estado', 9, 65),
(61, 'Historia del Arte', 11, 1, 'E1', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 5, 66),
(62, 'Ciencias Sociales', 12, 2, 'F2', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 12, 67),
(63, 'Calculo Avanzado', 13, 3, 'A3', 'Rosario-Argentina', 2022, 0, 'Nuevo', 13, 68),
(64, 'FiloSofia contemporanea', 14, 4, 'B4', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 14, 69),
(65, 'Psicologia del Desarrollo 2', 203, 29, 'C5', 'Buenos Aires-Argentina', 2019, 1, 'Como nuevo', 48, 1),
(66, 'Ingles Intermedio', 16, 6, 'D6', 'Cordoba-Argentina', 2021, 1, 'Parte de una serie', 16, 71),
(67, 'Historia Antigua', 17, 7, 'E7', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 5, 72),
(68, 'Algebra Lineal', 18, 8, 'F8', 'Buenos Aires-Argentina', 2022, 0, 'Nuevo', 1, 73),
(69, 'Educacion Fisica y Salud', 19, 9, 'A9', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 19, 74),
(70, 'tecnologia del Futuro', 20, 10, 'B10', 'Cordoba-Argentina', 2021, 1, 'Parte de una serie', 20, 75),
(71, 'Astronomia Avanzada', 21, 1, 'A1', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 1, 76),
(72, 'Historia de America Latina', 22, 2, 'B2', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 5, 77),
(73, 'Ecologia y Medio Ambiente', 23, 3, 'C3', 'Cordoba-Argentina', 2018, 0, 'En buen estado', 3, 78),
(74, 'Robotica para Niños', 24, 4, 'D4', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 4, 79),
(75, 'Historia de la Musica', 25, 5, 'E5', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 9, 80),
(76, 'Geologia Avanzada', 26, 6, 'F6', 'Buenos Aires-Argentina', 2022, 0, 'Nuevo', 6, 26),
(77, 'Introduccion a la Robotica', 27, 7, 'A7', 'Rosario-Argentina', 2021, 1, 'Parte de una serie', 7, 27),
(78, 'Ciencias PolÃ­ticas', 28, 8, 'B8', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 8, 28),
(79, 'Programacion para Principiantes', 29, 9, 'C9', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 16, 29),
(80, 'Dibujo ArtÃ­stico', 30, 10, 'D10', 'Cordoba-Argentina', 2022, 0, 'Nuevo', 10, 30),
(81, 'Historia de la Ciencia', 31, 1, 'E1', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 5, 31),
(82, 'Matematicas Aplicadas', 32, 2, 'F2', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 12, 32),
(83, 'Literatura Infantil', 33, 3, 'A3', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 4, 33),
(84, 'Historia del Mundo Antiguo', 34, 4, 'B4', 'Rosario-Argentina', 2020, 0, 'En excelente estado', 5, 34),
(85, 'Ingles Avanzado', 35, 5, 'C5', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 15, 35),
(86, 'Geografia de Argentina', 36, 6, 'D6', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 6, 36),
(87, 'Fisica para Curiosos', 37, 7, 'E7', 'Cordoba-Argentina', 2022, 0, 'Nuevo', 17, 37),
(88, 'Arte ContemporÃ¡neo', 38, 8, 'F8', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 18, 38),
(89, 'InformÃ¡tica Creativa', 39, 9, 'A9', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 19, 39),
(90, 'Musica Popular', 40, 10, 'B10', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 9, 40),
(91, 'Historia de la FiloSofia', 1, 1, 'A1', 'Rosario-Argentina', 2022, 0, 'Nuevo', 5, 41),
(92, 'SociologÃ­a contemporanea', 2, 2, 'B2', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 2, 42),
(93, 'Algebra y GeometrÃ­a', 3, 3, 'C3', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 1, 43),
(94, 'Historia del Cine', 4, 4, 'D4', 'Cordoba-Argentina', 2018, 0, 'En buen estado', 5, 44),
(95, 'BiografÃ­as de CientÃ­ficos', 5, 5, 'E5', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 5, 45),
(96, 'Medicina Preventiva', 6, 6, 'F6', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 6, 46),
(97, 'Astronomia Basica', 7, 7, 'A7', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 7, 47),
(98, 'Introduccion a la Psicologia', 8, 8, 'B8', 'Cordoba-Argentina', 2022, 0, 'Nuevo', 8, 48),
(99, 'Ciencias de la ComunicaciÃ³n', 9, 9, 'C9', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 3, 49),
(100, 'Robotica Avanzada', 10, 10, 'D10', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 10, 50),
(101, 'Geografia del Mundo', 11, 1, 'E1', 'Rosario-Argentina', 2019, 0, 'Como nuevo', 6, 51),
(102, 'Fisica Moderna', 12, 2, 'F2', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 12, 52),
(103, 'Introduccion a la FiloSofia', 13, 3, 'A3', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 13, 53),
(104, 'Historia del Arte ContemporÃ¡neo', 14, 4, 'B4', 'Cordoba-Argentina', 2018, 0, 'En buen estado', 5, 54),
(105, 'Programacion Avanzada', 15, 5, 'C5', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 16, 55),
(106, 'La Sombra del Viento', 43, 1, 'A1', 'Buenos Aires-Argentina', 2005, 0, 'En buen estado', 11, 81),
(107, '1984', 44, 2, 'B2', 'Buenos Aires-Argentina', 1949, 0, 'ClÃ¡sico', 10, 82),
(108, 'Cien Años de Soledad', 45, 3, 'C3', 'Buenos Aires-Argentina', 1967, 0, 'ClÃ¡sico', 11, 1),
(109, 'Matar un RuiseÃ±or', 46, 4, 'D4', 'Buenos Aires-Argentina', 1960, 0, 'ClÃ¡sico', 11, 84),
(110, 'Don Quijote de la Mancha', 42, 5, 'E5', 'Buenos Aires-Argentina', 1605, 1, 'Parte de una serie', 11, 85),
(111, 'Crimen y Castigo', 47, 6, 'F6', 'Buenos Aires-Argentina', 1866, 0, 'ClÃ¡sico', 11, 86),
(112, 'Los Juegos del Hambre', 48, 7, 'A7', 'Rosario-Argentina', 2008, 1, 'Parte de una serie', 10, 87),
(113, 'El SeÃ±or de los Anillos', 49, 8, 'B8', 'Buenos Aires-Argentina', 1954, 1, 'Parte de una serie', 11, 88),
(114, 'El CÃ³digo Da Vinci', 50, 9, 'C9', 'Buenos Aires-Argentina', 2003, 0, 'En buen estado', 11, 89),
(115, 'Harry Potter y la Piedra Filosofal', 51, 10, 'D10', 'Cordoba-Argentina', 1997, 1, 'Parte de una serie - Faltan las ultimas 4 hojas', 11, 1),
(116, 'CrepÃºsculo', 52, 1, 'A1', 'Buenos Aires-Argentina', 2005, 1, 'Parte de una serie', 11, 91),
(117, 'Juego de Tronos', 27, 2, 'B2', 'Buenos Aires-Argentina', 1996, 1, 'Parte de una serie', 11, 92),
(118, 'La Chica del Tren', 65, 3, 'C3', 'Cordoba-Argentina', 2015, 0, 'En buen estado', 11, 93),
(119, 'Maze Runner', 66, 4, 'D4', 'Buenos Aires-Argentina', 2009, 1, 'Parte de una serie', 10, 94),
(120, 'La Carretera', 67, 5, 'E5', 'Buenos Aires-Argentina', 2006, 0, 'Como nuevo', 11, 95),
(121, 'Cazadores de Sombras', 68, 6, 'F6', 'Buenos Aires-Argentina', 2007, 1, 'Parte de una serie', 11, 96),
(122, 'Los Pilares de la Tierra', 58, 7, 'A7', 'Rosario-Argentina', 1989, 1, 'Parte de una serie', 11, 97),
(123, 'El Perfume', 33, 9, 'B8', 'Buenos Aires-Argentina', 1985, 0, 'En buen estado', 11, 98),
(124, 'El Laberinto de los EspÃ­ritus', 43, 9, 'C9', 'Buenos Aires-Argentina', 2016, 1, 'Parte de una serie', 11, 99),
(125, 'Moby Dick', 35, 10, 'D10', 'Cordoba-Argentina', 1851, 0, 'ClÃ¡sico', 11, 100),
(126, 'El Amor en los Tiempos del CÃ³lera', 45, 1, 'A1', 'Buenos Aires-Argentina', 1985, 0, 'En buen estado', 11, 101),
(127, 'La Metamorfosis', 53, 2, 'B2', 'Buenos Aires-Argentina', 1915, 0, 'ClÃ¡sico', 11, 102),
(128, 'Cumbres Borrascosas', 54, 3, 'C3', 'Buenos Aires-Argentina', 1847, 0, 'ClÃ¡sico', 11, 103),
(129, 'CrÃ³nica de una Muerte Anunciada', 45, 4, 'D4', 'Buenos Aires-Argentina', 1981, 0, 'En buen estado', 11, 104),
(130, 'El Gran Gatsby', 55, 5, 'E5', 'Buenos Aires-Argentina', 1925, 0, 'ClÃ¡sico', 11, 105),
(131, 'En el Camino', 56, 6, 'F6', 'Buenos Aires-Argentina', 1957, 0, 'ClÃ¡sico', 11, 106),
(132, 'Los Juegos del Hambre: En Llamas', 48, 7, 'A7', 'Rosario-Argentina', 2009, 1, 'Parte de una serie', 11, 107),
(133, 'El Retrato de Dorian Gray', 8, 8, 'B8', 'Buenos Aires-Argentina', 1890, 0, 'ClÃ¡sico', 11, 108),
(134, 'Los Hombres Me Explican Cosas', 9, 9, 'C9', 'Buenos Aires-Argentina', 2014, 0, 'En buen estado', 11, 109),
(135, 'Harry Potter y la Camara Secreta', 200, 24, NULL, 'Cordoba-Argentina', 1998, 1, 'Parte de una serie', 46, 1),
(136, 'El CÃ³digo Da Vinci', 11, 1, 'A1', 'Buenos Aires-Argentina', 2003, 0, 'En buen estado', 11, 111),
(137, 'Las Ventajas de Ser Invisible', 12, 2, 'B2', 'Buenos Aires-Argentina', 1999, 0, 'En buen estado', 10, 112),
(138, 'El Hobbit', 49, 3, 'C3', 'Buenos Aires-Argentina', 1937, 1, 'Parte de una serie', 11, 113),
(139, 'Las Cenizas de Angela', 14, 4, 'D4', 'Cordoba-Argentina', 1996, 0, 'En buen estado', 11, 114),
(140, 'Sinsajo', 15, 5, 'E5', 'Buenos Aires-Argentina', 2010, 1, 'Parte de una serie', 10, 115),
(141, 'La Carretera', 16, 6, 'F6', 'Buenos Aires-Argentina', 2006, 0, 'Como nuevo', 11, 116),
(142, 'El JardÃ­n de las Bestias', 17, 7, 'A7', 'Rosario-Argentina', 2011, 0, 'En buen estado', 11, 117),
(143, 'Las Mil y Una Noches', 18, 8, 'B8', 'Buenos Aires-Argentina', 800, 1, 'Parte de una serie', 11, 118),
(144, 'Rayuela', 19, 9, 'C9', 'Buenos Aires-Argentina', 1963, 0, 'ClÃ¡sico', 11, 119),
(145, 'Ficciones', 20, 10, 'D10', 'Cordoba-Argentina', 1944, 0, 'ClÃ¡sico', 10, 120),
(146, 'La Odisea', 1, 1, 'A1', 'Atenas-Grecia', 700, 1, 'Parte de una serie', 11, 121),
(147, 'DrÃ¡cula', 2, 2, 'B2', 'Bucarest-Rumania', 1897, 0, 'ClÃ¡sico', 11, 122),
(148, 'La Iliada', 3, 3, 'C3', 'Troya-TurquÃ­a', 800, 1, 'Parte de una serie', 11, 123),
(149, 'La Naranja MecÃ¡nica', 4, 4, 'D4', 'Londres-Reino Unido', 1962, 0, 'En buen estado', 10, 124),
(150, 'Crimen y Castigo', 5, 5, 'E5', 'San Petersburgo-Rusia', 1866, 0, 'ClÃ¡sico', 11, 125),
(151, 'El Gran Gatsby', 6, 6, 'F6', 'Nueva York-EE. UU.', 1925, 0, 'ClÃ¡sico', 8, 126),
(152, 'El Retrato de Dorian Gray', 7, 7, 'A7', 'Londres-Reino Unido', 1890, 0, 'ClÃ¡sico', 11, 127),
(153, 'Los Juegos del Hambre: Sinsajo', 8, 8, 'B8', 'Rosario-Argentina', 2010, 1, 'Parte de una serie', 10, 127),
(154, 'Las Aventuras de Sherlock Holmes', 9, 9, 'C9', 'Londres-Reino Unido', 1892, 1, 'Parte de una serie', 11, 127),
(155, 'It', 10, 10, 'D10', 'Derry-EE. UU.', 1986, 1, 'Parte de una serie', 11, 127),
(156, 'Don Quijote de la Mancha', 42, 1, 'A1', 'Madrid-España', 1605, 1, 'Parte de una serie', 11, 127),
(157, 'La Celestina', 12, 2, 'B2', 'Salamanca-España', 1499, 0, 'ClÃ¡sico', 11, 127),
(158, 'Los Miserables', 13, 3, 'C3', 'ParÃ­s-Francia', 1862, 0, 'ClÃ¡sico', 11, 127),
(159, 'Las Brujas', 14, 4, 'D4', 'Oslo-Noruega', 1983, 0, 'En buen estado', 11, 127),
(160, 'La Metamorfosis', 15, 5, 'E5', 'Praga-RepÃºblica Checa', 1915, 0, 'ClÃ¡sico', 11, 127),
(161, 'Algebra 1', 13, 1, 'A1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(162, 'Algebra 2', 13, 1, 'B1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(163, 'Algebra 3', 13, 1, 'C1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(164, 'GeometrÃ­a 1', 13, 1, 'D1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(165, 'GeometrÃ­a 2', 13, 1, 'E1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(166, 'TrigonometrÃ­a 1', 13, 1, 'F1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(167, 'TrigonometrÃ­a 2', 13, 1, 'A2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(168, 'Calculo 1', 13, 1, 'B2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(169, 'Calculo 2', 13, 1, 'C2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(170, 'Calculo 3', 13, 1, 'D2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(171, 'Fisica 1', 14, 1, 'E2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 7, 127),
(172, 'Fisica 2', 14, 1, 'F2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 7, 127),
(173, 'Fisica 3', 14, 1, 'A3', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 7, 127),
(174, 'Quimica 1', 15, 1, 'B3', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 12, 127),
(175, 'Quimica 2', 15, 1, 'C3', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 12, 127),
(176, 'Bilogia 1', 16, 1, 'D3', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(177, 'Bilogia 2', 16, 1, 'E3', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(178, 'Historia 1', 17, 1, 'F3', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 5, 127),
(179, 'Historia 2', 17, 1, 'A4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 5, 127),
(180, 'Geografia 3', 18, 1, 'B4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 6, 127),
(181, 'Literatura 1', 19, 1, 'C4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 4, 127),
(182, 'Literatura 2', 19, 1, 'D4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 4, 127),
(183, 'Literatura 3', 19, 1, 'E4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 4, 127),
(184, 'Ingles 1', 20, 1, 'F4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 16, 127),
(185, 'Ingles 2', 20, 1, 'A5', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 16, 127),
(186, 'Ingles 3', 20, 1, 'B5', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 16, 127),
(187, 'Arte 1', 21, 1, 'C5', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 18, 127),
(188, 'Arte 2', 21, 1, 'D5', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 18, 127),
(189, 'Arte 3', 21, 1, 'E5', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 18, 127),
(191, 'Educacion Fisica 2', 22, 1, 'A6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(192, 'Educacion Fisica 3', 22, 1, 'B6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(193, 'Musica 1', 23, 1, 'C6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 9, 127),
(194, 'Musica 2', 23, 1, 'D6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 9, 127),
(195, 'Musica 3', 23, 1, 'E6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 9, 127),
(196, 'InformÃ¡tica 1', 24, 1, 'F6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 19, 127),
(197, 'InformÃ¡tica 2', 24, 1, 'A7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 19, 127),
(198, 'InformÃ¡tica 3', 24, 1, 'B7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 19, 127),
(199, 'Psicologia 1', 25, 1, 'C7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(200, 'Psicologia 2', 25, 1, 'D7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(201, 'Psicologia 3', 25, 1, 'E7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(202, 'ComunicaciÃ³n 1', 26, 1, 'F7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(203, 'ComunicaciÃ³n 2', 26, 1, 'A8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(204, 'ComunicaciÃ³n 3', 26, 1, 'B8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(205, 'Robotica 1', 27, 1, 'C8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 10, 127),
(206, 'Robotica 2', 27, 1, 'D8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 10, 127),
(207, 'Robotica 3', 27, 1, 'E8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 10, 127),
(208, 'Geografia 4', 28, 1, 'F8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 6, 127),
(209, 'Historia 3', 29, 1, 'A9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 5, 127),
(210, 'Literatura 4', 30, 1, 'B9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 4, 127),
(211, 'Ingles 4', 31, 1, 'C9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 16, 127),
(212, 'Educacion Fisica 4', 32, 1, 'D9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(213, 'Musica 4', 33, 1, 'E9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 9, 127),
(214, 'InformÃ¡tica 4', 34, 1, 'F9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 19, 127),
(215, 'Psicologia 4', 35, 1, 'A10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(216, 'ComunicaciÃ³n 4', 36, 1, 'B10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(217, 'Robotica 4', 37, 1, 'C10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 10, 127),
(218, 'Geografia 5', 38, 1, 'D10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 6, 127),
(219, 'Historia 4', 39, 1, 'E10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 5, 127),
(220, 'Literatura 5', 40, 1, 'F10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 4, 127),
(221, 'Ingles 5', 13, 1, 'A11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 16, 127),
(222, 'Educacion Fisica 5', 14, 1, 'B11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(223, 'Musica 5', 15, 1, 'C11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 9, 127),
(224, 'InformÃ¡tica 5', 16, 1, 'D11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 19, 127),
(225, 'Psicologia 5', 17, 1, 'E11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(226, 'ComunicaciÃ³n 5', 18, 1, 'F11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(227, 'Matematicas Avanzadas', 1, 1, 'A1', 'Buenos Aires-Argentina', 2022, 0, 'Buen estado, reciente', 1, 1),
(228, 'Historia Universal', 4, 3, 'D4', 'Ciudad de Mejico-Mejico', 2019, 0, 'Algunas paginas sueltas', 5, 2),
(229, 'Ciencias Naturales para Jovenes', 2, 2, 'B2', 'Bogota-Colombia', 2020, 0, 'En buen estado', 2, 3),
(230, 'Literatura Clasica', 5, 5, 'F6', 'Madrid-España', 2005, 0, 'Antiguo, pero bien conservado', 4, 4),
(231, 'Geografia Mundial', 3, 4, 'C3', 'Lima-Peru', 2010, 0, 'Con marcas de uso', 6, 5),
(232, 'Arte y Creatividad', 6, 6, 'A7', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 7, 6),
(233, 'Musica para Adolescentes', 7, 8, 'E8', 'Montevideo-Uruguay', 2015, 0, 'En excelente estado', 9, 7),
(234, 'La Odisea del Espacio', 10, 9, 'D5', 'Barcelona-España', 1970, 1, 'Parte de una serie Clasica', 10, 8),
(235, 'Quimica para Principiantes', 12, 10, 'C2', 'Santiago-Chile', 2023, 0, 'Nuevo, nunca usado', 12, 9),
(236, 'Fisica Avanzada', 11, 7, 'B1', 'Buenos Aires-Argentina', 2018, 0, 'Con anotaciones', 13, 10),
(237, 'Ingles Intermedio', 16, 9, 'F2', 'Londres-Reino Unido', 2019, 0, 'Buen estado, incluye CD', 16, 11),
(238, 'Programacion para Niños', 20, 7, 'E3', 'San Francisco-EE. UU.', 2022, 0, 'Novedad en tecnologia', 16, 12),
(239, 'Educacion Civica', 18, 5, 'A5', 'Buenos Aires-Argentina', 2015, 0, 'Con notas del propietario anterior', 18, 13),
(240, 'Religion y Valores', 19, 6, 'C7', 'Ciudad de Mejico-Mejico', 2020, 0, 'Buen estado, con ilustraciones', 19, 14),
(241, 'Economia Basica', 23, 10, 'B6', 'Madrid-España', 2018, 0, 'Con ejemplos practicos', 20, 15),
(242, 'Historias de Ciencia Ficcion', 31, 4, 'D1', 'Buenos Aires-Argentina', 1987, 1, 'Parte de una serie', 5, 16),
(243, 'Aventuras en la Selva', 28, 3, 'A8', 'Manaus-Brasil', 2019, 0, 'Libro de tapa dura', 8, 17),
(244, 'Lengua y Literatura Moderna', 27, 2, 'F8', 'Buenos Aires-Argentina', 2021, 0, 'Incluye poesia contemporanea', 4, 18),
(245, 'FenÃ³menos Naturales', 32, 1, 'E4', 'Santiago-Chile', 2020, 0, 'Ilustraciones a color', 2, 19),
(246, 'Sociedad y Cultura', 40, 8, 'C8', 'Buenos Aires-Argentina', 2017, 0, 'Libro de consulta', 5, 20),
(247, 'Historias del Mundo Antiguo', 37, 10, 'D6', 'Atenas-Grecia', 1995, 1, 'Parte de una serie', 5, 21),
(248, 'Misterios del Universo', 35, 7, 'B4', 'Houston-EE. UU.', 2022, 0, 'Con fotografÃ­as de la NASA', 1, 22),
(249, 'Pintura y Creatividad', 36, 9, 'A3', 'ParÃ­s-Francia', 2016, 0, 'GuÃ­a de arte', 7, 23),
(250, 'Musica Clasica para Niños', 33, 4, 'E2', 'Viena-Austria', 2018, 0, 'Incluye CD de Musica', 9, 24),
(251, 'El Espacio y los Planetas', 38, 3, 'C1', 'Buenos Aires-Argentina', 2019, 0, 'Libro de divulgaciÃ³n cientÃ­fica', 2, 25),
(252, 'Etica en la Sociedad Moderna', 34, 5, 'F5', 'Madrid-España', 2020, 0, 'Discute dilemas morales', 17, 26),
(253, 'Quimica Divertida', 26, 6, 'D8', 'Bogota-Colombia', 2021, 0, 'Experimentos para Niños', 12, 27),
(254, 'Fisica para Curiosos', 24, 8, 'A2', 'Buenos Aires-Argentina', 2017, 0, 'Con ejemplos practicos', 13, 28),
(255, 'Historias de Viajes', 30, 10, 'B3', 'Roma-Italia', 2019, 1, 'Parte de una serie', 5, 29),
(256, 'Aventuras en el Espacio', 29, 7, 'E6', 'Houston-EE. UU.', 2023, 0, 'Con ilustraciones de astronautas', 1, 30),
(257, 'Matematicas para Todos', 25, 9, 'C5', 'Buenos Aires-Argentina', 2020, 0, 'Incluye ejercicios resueltos', 1, 31),
(258, 'Historias de Ã‰poca', 21, 4, 'F3', 'Londres-Reino Unido', 2018, 1, 'Parte de una serie', 5, 32),
(259, 'Cuentos de Ciencia Ficcion', 39, 3, 'D7', 'Buenos Aires-Argentina', 1992, 1, 'ClÃ¡sicos de la ciencia Ficcion', 10, 33),
(260, 'Arte y Creatividad en la Historia', 22, 2, 'A4', 'ParÃ­s-Francia', 2015, 0, 'Ilustraciones de obras famosas', 5, 34),
(261, 'Musica para Jovenes Talentos', 20, 1, 'E7', 'Viena-Austria', 2021, 0, 'Partituras y consejos para mÃºsicos Jovenes', 9, 35),
(262, 'El Universo en ImÃ¡genes', 17, 10, 'B7', 'Houston-EE. UU.', 2020, 0, 'FotografÃ­as astronÃ³micas', 1, 36),
(263, 'Economia para Principiantes', 15, 7, 'D2', 'Buenos Aires-Argentina', 2019, 0, 'Introduccion a la Economia', 20, 37),
(264, 'El Arte de la NegociaciÃ³n', 13, 6, 'A1', 'Nueva York-EE. UU.', 2020, 0, 'Estrategias comerciales', 19, 38),
(265, 'Religion en el Mundo Moderno', 14, 5, 'C4', 'Roma-Italia', 2018, 0, 'Comparativa de religiones', 19, 39),
(266, 'Historia de las Civilizaciones', 12, 4, 'F1', 'Atenas-Grecia', 2021, 0, 'Resumen histÃ³rico', 5, 40),
(267, 'Aventuras en el OcÃ©ano', 11, 3, 'E5', 'Santiago-Chile', 2019, 1, 'Parte de una serie', 5, 41),
(268, 'Astronomia para Niños', 9, 2, 'B8', 'Buenos Aires-Argentina', 2020, 0, 'Descubre las estrellas', 2, 42),
(269, 'Los Grandes ClÃ¡sicos Literarios', 8, 1, 'C6', 'Madrid-España', 2017, 0, 'AntologÃ­a literaria', 3, 43),
(270, 'Geografia de Aventuras', 7, 10, 'A6', 'Buenos Aires-Argentina', 2019, 1, 'Parte de una serie', 6, 44),
(271, 'Ciencia y tecnologia del Futuro', 6, 9, 'D4', 'San Francisco-EE. UU.', 2022, 0, 'Predicciones tecnolÃ³gicas', 17, 45),
(272, 'Misterios del Pasado', 5, 8, 'F4', 'Mejico D.F.-Mejico', 2016, 1, 'Parte de una serie', 4, 46),
(273, 'Lengua y Literatura Clasica', 4, 7, 'E1', 'Roma-Italia', 2018, 0, 'Textos clÃ¡sicos', 4, 47),
(274, 'El Universo en NÃºmeros', 3, 6, 'B5', 'Madrid-España', 2020, 0, 'Matematicas y cosmologÃ­a', 1, 48),
(275, 'Arte y Pintura Moderna', 2, 5, 'C3', 'Nueva York-EE. UU.', 2019, 0, 'Movimientos artÃ­sticos contemporÃ¡neos', 7, 49),
(276, 'Musica en la Cultura Mundial', 1, 4, 'A3', 'Londres-Reino Unido', 2021, 0, 'Diversidad musical global', 9, 50),
(277, 'Matematicas para Principiantes', 1, 1, 'A1', 'Buenos Aires-Argentina', 2022, 0, 'Nuevo', 1, 56),
(278, 'Historia del Siglo XX', 2, 2, 'B2', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 5, 57),
(279, 'Bilogia Avanzada', 3, 3, 'C3', 'Cordoba-Argentina', 2019, 0, 'Como nuevo', 3, 58),
(280, 'Quimica para Jovenes CientÃ­ficos', 4, 4, 'D4', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 12, 59),
(281, 'Literatura Universal', 5, 5, 'E5', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 4, 60),
(282, 'Geografia Mundial', 6, 6, 'F6', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 6, 61),
(283, 'Fisica Cuantica', 7, 7, 'A7', 'Rosario-Argentina', 2017, 0, 'En buen estado', 7, 62),
(284, 'Arte Moderno', 8, 8, 'B8', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 8, 63),
(285, 'InformÃ¡tica Basica', 9, 9, 'C9', 'Buenos Aires-Argentina', 2022, 0, 'Nuevo', 9, 64),
(286, 'Musica Clasica', 10, 10, 'D10', 'Cordoba-Argentina', 2020, 0, 'En excelente estado', 9, 65),
(287, 'Historia del Arte', 11, 1, 'E1', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 5, 66),
(288, 'Ciencias Sociales', 12, 2, 'F2', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 12, 67),
(289, 'Calculo Avanzado', 13, 3, 'A3', 'Rosario-Argentina', 2022, 0, 'Nuevo', 13, 68),
(290, 'FiloSofia contemporanea', 14, 4, 'B4', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 14, 69),
(291, 'Psicologia del Desarrollo', 15, 5, 'C5', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 15, 70),
(292, 'Ingles Intermedio', 16, 6, 'D6', 'Cordoba-Argentina', 2021, 1, 'Parte de una serie', 16, 71),
(293, 'Historia Antigua', 17, 7, 'E7', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 5, 72),
(294, 'Algebra Lineal', 18, 8, 'F8', 'Buenos Aires-Argentina', 2022, 0, 'Nuevo', 1, 73),
(295, 'Educacion Fisica y Salud', 19, 9, 'A9', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 19, 74),
(296, 'tecnologia del Futuro', 20, 10, 'B10', 'Cordoba-Argentina', 2021, 1, 'Parte de una serie', 20, 75),
(297, 'Astronomia Avanzada', 21, 1, 'A1', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 1, 76),
(298, 'Historia de America Latina', 22, 2, 'B2', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 5, 77),
(299, 'Ecologia y Medio Ambiente', 23, 3, 'C3', 'Cordoba-Argentina', 2018, 0, 'En buen estado', 3, 78),
(300, 'Robotica para Niños', 24, 4, 'D4', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 4, 79),
(301, 'Historia de la Musica', 25, 5, 'E5', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 9, 80),
(302, 'Geologia Avanzada', 26, 6, 'F6', 'Buenos Aires-Argentina', 2022, 0, 'Nuevo', 6, 26),
(303, 'Introduccion a la Robotica', 27, 7, 'A7', 'Rosario-Argentina', 2021, 1, 'Parte de una serie', 7, 27),
(304, 'Ciencias PolÃ­ticas', 28, 8, 'B8', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 8, 28),
(305, 'Programacion para Principiantes', 29, 9, 'C9', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 16, 29),
(306, 'Dibujo ArtÃ­stico', 30, 10, 'D10', 'Cordoba-Argentina', 2022, 0, 'Nuevo', 10, 30),
(307, 'Historia de la Ciencia', 31, 1, 'E1', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 5, 31),
(308, 'Matematicas Aplicadas', 32, 2, 'F2', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 12, 32),
(309, 'Literatura Infantil', 33, 3, 'A3', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 4, 33),
(310, 'Historia del Mundo Antiguo', 34, 4, 'B4', 'Rosario-Argentina', 2020, 0, 'En excelente estado', 5, 34),
(311, 'Ingles Avanzado', 35, 5, 'C5', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 15, 35),
(312, 'Geografia de Argentina', 36, 6, 'D6', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 6, 36),
(313, 'Fisica para Curiosos', 37, 7, 'E7', 'Cordoba-Argentina', 2022, 0, 'Nuevo', 17, 37),
(314, 'Arte ContemporÃ¡neo', 38, 8, 'F8', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 18, 38),
(315, 'InformÃ¡tica Creativa', 39, 9, 'A9', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 19, 39),
(316, 'Musica Popular', 40, 10, 'B10', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 9, 40),
(317, 'Historia de la FiloSofia', 1, 1, 'A1', 'Rosario-Argentina', 2022, 0, 'Nuevo', 5, 41),
(318, 'SociologÃ­a contemporanea', 2, 2, 'B2', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 2, 42),
(319, 'Algebra y GeometrÃ­a', 3, 3, 'C3', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 1, 43),
(320, 'Historia del Cine', 4, 4, 'D4', 'Cordoba-Argentina', 2018, 0, 'En buen estado', 5, 44),
(321, 'BiografÃ­as de CientÃ­ficos', 5, 5, 'E5', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 5, 45),
(322, 'Medicina Preventiva', 6, 6, 'F6', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 6, 46),
(323, 'Astronomia Basica', 7, 7, 'A7', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 7, 47),
(324, 'Introduccion a la Psicologia', 8, 8, 'B8', 'Cordoba-Argentina', 2022, 0, 'Nuevo', 8, 48),
(325, 'Ciencias de la ComunicaciÃ³n', 9, 9, 'C9', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 3, 49),
(326, 'Robotica Avanzada', 10, 10, 'D10', 'Buenos Aires-Argentina', 2018, 0, 'En buen estado', 10, 50),
(327, 'Geografia del Mundo', 11, 1, 'E1', 'Rosario-Argentina', 2019, 0, 'Como nuevo', 6, 51),
(328, 'Fisica Moderna', 12, 2, 'F2', 'Buenos Aires-Argentina', 2020, 0, 'En excelente estado', 12, 52),
(329, 'Introduccion a la FiloSofia', 13, 3, 'A3', 'Buenos Aires-Argentina', 2021, 1, 'Parte de una serie', 13, 53),
(330, 'Historia del Arte ContemporÃ¡neo', 14, 4, 'B4', 'Cordoba-Argentina', 2018, 0, 'En buen estado', 5, 54),
(331, 'Programacion Avanzada', 15, 5, 'C5', 'Buenos Aires-Argentina', 2019, 0, 'Como nuevo', 16, 55),
(332, 'La Sombra del Viento', 43, 1, 'A1', 'Buenos Aires-Argentina', 2005, 0, 'En buen estado', 11, 81),
(333, '1984', 44, 2, 'B2', 'Buenos Aires-Argentina', 1949, 0, 'ClÃ¡sico', 10, 82),
(334, 'Cien Años de Soledad', 45, 3, 'C3', 'Buenos Aires-Argentina', 1967, 0, 'ClÃ¡sico', 11, 1),
(335, 'Matar un RuiseÃ±or', 46, 4, 'D4', 'Buenos Aires-Argentina', 1960, 0, 'ClÃ¡sico', 11, 84),
(336, 'Don Quijote de la Mancha', 42, 5, 'E5', 'Buenos Aires-Argentina', 1605, 1, 'Parte de una serie', 11, 85),
(337, 'Crimen y Castigo', 47, 6, 'F6', 'Buenos Aires-Argentina', 1866, 0, 'ClÃ¡sico', 11, 86),
(338, 'Los Juegos del Hambre', 48, 7, 'A7', 'Rosario-Argentina', 2008, 1, 'Parte de una serie', 10, 87),
(339, 'El SeÃ±or de los Anillos', 49, 8, 'B8', 'Buenos Aires-Argentina', 1954, 1, 'Parte de una serie', 11, 88),
(340, 'El CÃ³digo Da Vinci', 50, 9, 'C9', 'Buenos Aires-Argentina', 2003, 0, 'En buen estado', 11, 89),
(341, 'Harry Potter y la Piedra Filosofal', 51, 10, 'D10', 'Cordoba-Argentina', 1997, 1, 'Parte de una serie', 11, 90),
(342, 'CrepÃºsculo', 52, 1, 'A1', 'Buenos Aires-Argentina', 2005, 1, 'Parte de una serie', 11, 91),
(343, 'Juego de Tronos', 27, 2, 'B2', 'Buenos Aires-Argentina', 1996, 1, 'Parte de una serie', 11, 92),
(344, 'La Chica del Tren', 65, 3, 'C3', 'Cordoba-Argentina', 2015, 0, 'En buen estado', 11, 93),
(345, 'Maze Runner', 66, 4, 'D4', 'Buenos Aires-Argentina', 2009, 1, 'Parte de una serie', 10, 94),
(346, 'La Carretera', 67, 5, 'E5', 'Buenos Aires-Argentina', 2006, 0, 'Como nuevo', 11, 95),
(347, 'Cazadores de Sombras', 68, 6, 'F6', 'Buenos Aires-Argentina', 2007, 1, 'Parte de una serie', 11, 96),
(348, 'Los Pilares de la Tierra', 58, 7, 'A7', 'Rosario-Argentina', 1989, 1, 'Parte de una serie', 11, 97),
(349, 'El Perfume', 33, 9, 'B8', 'Buenos Aires-Argentina', 1985, 0, 'En buen estado', 11, 98),
(350, 'El Laberinto de los EspÃ­ritus', 43, 9, 'C9', 'Buenos Aires-Argentina', 2016, 1, 'Parte de una serie', 11, 99),
(351, 'Moby Dick', 35, 10, 'D10', 'Cordoba-Argentina', 1851, 0, 'ClÃ¡sico', 11, 100),
(352, 'El Amor en los Tiempos del CÃ³lera', 45, 1, 'A1', 'Buenos Aires-Argentina', 1985, 0, 'En buen estado', 11, 101),
(353, 'La Metamorfosis', 53, 2, 'B2', 'Buenos Aires-Argentina', 1915, 0, 'ClÃ¡sico', 11, 102),
(354, 'Cumbres Borrascosas', 54, 3, 'C3', 'Buenos Aires-Argentina', 1847, 0, 'ClÃ¡sico', 11, 103),
(355, 'CrÃ³nica de una Muerte Anunciada', 45, 4, 'D4', 'Buenos Aires-Argentina', 1981, 0, 'En buen estado', 11, 104),
(356, 'El Gran Gatsby', 55, 5, 'E5', 'Buenos Aires-Argentina', 1925, 0, 'ClÃ¡sico', 11, 105),
(357, 'En el Camino', 56, 6, 'F6', 'Buenos Aires-Argentina', 1957, 0, 'ClÃ¡sico', 11, 106),
(358, 'Los Juegos del Hambre: En Llamas', 48, 7, 'A7', 'Rosario-Argentina', 2009, 1, 'Parte de una serie', 11, 107),
(359, 'El Retrato de Dorian Gray', 8, 8, 'B8', 'Buenos Aires-Argentina', 1890, 0, 'ClÃ¡sico', 11, 108),
(360, 'Los Hombres Me Explican Cosas', 9, 9, 'C9', 'Buenos Aires-Argentina', 2014, 0, 'En buen estado', 11, 109),
(361, 'Harry Potter y la Camara Secreta', 197, 24, NULL, 'Cordoba-Argentina', 1998, 1, 'Parte de una serie', 11, 1),
(362, 'El CÃ³digo Da Vinci', 11, 1, 'A1', 'Buenos Aires-Argentina', 2003, 0, 'En buen estado', 11, 111),
(363, 'Las Ventajas de Ser Invisible', 12, 2, 'B2', 'Buenos Aires-Argentina', 1999, 0, 'En buen estado', 10, 112),
(364, 'El Hobbit', 49, 3, 'C3', 'Buenos Aires-Argentina', 1937, 1, 'Parte de una serie', 11, 113),
(365, 'Las Cenizas de Angela', 14, 4, 'D4', 'Cordoba-Argentina', 1996, 0, 'En buen estado', 11, 114),
(366, 'Sinsajo', 15, 5, 'E5', 'Buenos Aires-Argentina', 2010, 1, 'Parte de una serie', 10, 115),
(367, 'La Carretera', 16, 6, 'F6', 'Buenos Aires-Argentina', 2006, 0, 'Como nuevo', 11, 116),
(368, 'El JardÃ­n de las Bestias', 17, 7, 'A7', 'Rosario-Argentina', 2011, 0, 'En buen estado', 11, 117),
(369, 'Las Mil y Una Noches', 18, 8, 'B8', 'Buenos Aires-Argentina', 800, 1, 'Parte de una serie', 11, 118),
(370, 'Rayuela', 19, 9, 'C9', 'Buenos Aires-Argentina', 1963, 0, 'ClÃ¡sico', 11, 119),
(371, 'Ficciones', 20, 10, 'D10', 'Cordoba-Argentina', 1944, 0, 'ClÃ¡sico', 10, 120),
(372, 'La Odisea', 1, 1, 'A1', 'Atenas-Grecia', 700, 1, 'Parte de una serie', 11, 121),
(373, 'DrÃ¡cula', 2, 2, 'B2', 'Bucarest-Rumania', 1897, 0, 'ClÃ¡sico', 11, 122),
(374, 'La Iliada', 3, 3, 'C3', 'Troya-TurquÃ­a', 800, 1, 'Parte de una serie', 11, 123),
(375, 'La Naranja MecÃ¡nica', 4, 4, 'D4', 'Londres-Reino Unido', 1962, 0, 'En buen estado', 10, 124),
(376, 'Crimen y Castigo', 5, 5, 'E5', 'San Petersburgo-Rusia', 1866, 0, 'ClÃ¡sico', 11, 125),
(377, 'El Gran Gatsby', 6, 6, 'F6', 'Nueva York-EE. UU.', 1925, 0, 'ClÃ¡sico', 8, 126),
(378, 'El Retrato de Dorian Gray', 7, 7, 'A7', 'Londres-Reino Unido', 1890, 0, 'ClÃ¡sico', 11, 127),
(379, 'Los Juegos del Hambre: Sinsajo', 8, 8, 'B8', 'Rosario-Argentina', 2010, 1, 'Parte de una serie', 10, 127),
(380, 'Las Aventuras de Sherlock Holmes', 9, 9, 'C9', 'Londres-Reino Unido', 1892, 1, 'Parte de una serie', 11, 127),
(381, 'It', 10, 10, 'D10', 'Derry-EE. UU.', 1986, 1, 'Parte de una serie', 11, 127),
(382, 'Don Quijote de la Mancha', 42, 1, 'A1', 'Madrid-España', 1605, 1, 'Parte de una serie', 11, 127),
(383, 'La Celestina', 12, 2, 'B2', 'Salamanca-España', 1499, 0, 'ClÃ¡sico', 11, 127),
(384, 'Los Miserables', 13, 3, 'C3', 'ParÃ­s-Francia', 1862, 0, 'ClÃ¡sico', 11, 127),
(385, 'Las Brujas', 14, 4, 'D4', 'Oslo-Noruega', 1983, 0, 'En buen estado', 11, 127),
(386, 'La Metamorfosis', 15, 5, 'E5', 'Praga-RepÃºblica Checa', 1915, 0, 'ClÃ¡sico', 11, 127),
(387, 'Algebra 1', 13, 1, 'A1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(388, 'Algebra 2', 13, 1, 'B1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(389, 'Algebra 3', 13, 1, 'C1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(390, 'GeometrÃ­a 1', 13, 1, 'D1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(391, 'GeometrÃ­a 2', 13, 1, 'E1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(392, 'TrigonometrÃ­a 1', 13, 1, 'F1', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(393, 'TrigonometrÃ­a 2', 13, 1, 'A2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(394, 'Calculo 1', 13, 1, 'B2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(395, 'Calculo 2', 13, 1, 'C2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(396, 'Calculo 3', 13, 1, 'D2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 1, 127),
(397, 'Fisica 1', 14, 1, 'E2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 7, 127),
(398, 'Fisica 2', 14, 1, 'F2', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 7, 127),
(399, 'EDITAREDITAR', 1, 1, 'EDITAREDITAR', '1', 1, 1, 'EDITAREDITAREDITAREDITAR', 1, 127),
(400, 'Quimica 1', 15, 1, 'B3', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 12, 127),
(401, 'Quimica 2', 15, 1, 'C3', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 12, 127),
(402, 'Bilogia 1', 16, 1, 'D3', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(403, 'Bilogia 2', 16, 1, 'E3', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(404, 'Historia 1', 17, 1, 'F3', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 5, 127),
(405, 'Historia 2', 17, 1, 'A4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 5, 127),
(406, 'Geografia 3', 18, 1, 'B4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 6, 127),
(407, 'Literatura 1', 19, 1, 'C4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 4, 127),
(408, 'Literatura 2', 19, 1, 'D4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 4, 127),
(409, 'Literatura 3', 19, 1, 'E4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 4, 127),
(410, 'Ingles 1', 20, 1, 'F4', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 16, 127),
(411, 'Ingles 2', 20, 1, 'A5', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 16, 127),
(412, 'Ingles 3', 20, 1, 'B5', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 16, 127),
(413, 'Arte 1', 21, 1, 'C5', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 18, 127),
(414, 'Arte 2', 21, 1, 'D5', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 18, 127),
(415, 'Arte 3', 21, 1, 'E5', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 18, 127),
(416, 'Educacion Fisica 1', 22, 1, 'F5', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(417, 'Educacion Fisica 2', 22, 1, 'A6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(418, 'Educacion Fisica 3', 22, 1, 'B6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(419, 'Musica 1', 23, 1, 'C6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 9, 127),
(420, 'Musica 2', 23, 1, 'D6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 9, 127),
(421, 'Musica 3', 23, 1, 'E6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 9, 127),
(422, 'InformÃ¡tica 1', 24, 1, 'F6', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 19, 127),
(423, 'InformÃ¡tica 2', 24, 1, 'A7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 19, 127),
(424, 'InformÃ¡tica 3', 24, 1, 'B7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 19, 127),
(425, 'Psicologia 1', 25, 1, 'C7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(426, 'Psicologia 2', 25, 1, 'D7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(427, 'Psicologia 3', 25, 1, 'E7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(428, 'ComunicaciÃ³n 1', 26, 1, 'F7', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(429, 'ComunicaciÃ³n 2', 26, 1, 'A8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(430, 'ComunicaciÃ³n 3', 26, 1, 'B8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(431, 'Robotica 1', 27, 1, 'C8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 10, 127),
(432, 'Robotica 2', 27, 1, 'D8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 10, 127),
(433, 'Robotica 3', 27, 1, 'E8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 10, 127),
(434, 'Geografia 4', 28, 1, 'F8', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 6, 127),
(435, 'Historia 3', 29, 1, 'A9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 5, 127),
(436, 'Literatura 4', 30, 1, 'B9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 4, 127),
(437, 'Ingles 4', 31, 1, 'C9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 16, 127),
(438, 'Educacion Fisica 4', 32, 1, 'D9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(439, 'Musica 4', 33, 1, 'E9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 9, 127),
(440, 'InformÃ¡tica 4', 34, 1, 'F9', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 19, 127),
(441, 'Psicologia 4', 35, 1, 'A10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(442, 'ComunicaciÃ³n 4', 36, 1, 'B10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(443, 'Robotica 4', 37, 1, 'C10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 10, 127),
(444, 'Geografia 5', 38, 1, 'D10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 6, 127),
(445, 'Historia 4', 39, 1, 'E10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 5, 127),
(446, 'Literatura 5', 40, 1, 'F10', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 4, 127),
(447, 'Ingles 5', 13, 1, 'A11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 16, 127),
(448, 'Educacion Fisica 5', 14, 1, 'B11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(449, 'Musica 5', 15, 1, 'C11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 9, 127),
(450, 'InformÃ¡tica 5', 16, 1, 'D11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 19, 127),
(451, 'Psicologia 5', 17, 1, 'E11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 8, 127),
(452, 'ComunicaciÃ³n 5', 18, 1, 'F11', 'Buenos Aires-Argentina', 2023, 1, 'Parte de una serie', 3, 127),
(467, 'Harry el Sucio', 193, 24, 'A44', 'Argentina', 2021, 0, 'Paginas rayadas', 11, 1),
(472, 'Yo Claudio', 204, 24, 'A44', 'Argentina', 2011, 1, 'Roma', 5, 1),
(475, 'Julio Julio Julio', 222, 49, 'A44', 'Argentina', 2000, 0, 'Buen estado', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_reservas`
--

CREATE TABLE `libros_reservas` (
  `idLibro` int(11) NOT NULL,
  `idReserva` int(11) NOT NULL,
  `libros_Reservas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `libros_reservas`
--

INSERT INTO `libros_reservas` VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(1, 1, 26),
(2, 2, 27),
(3, 3, 28),
(4, 4, 29),
(5, 5, 30),
(6, 6, 31),
(7, 7, 32),
(8, 8, 33),
(9, 9, 34),
(10, 10, 35),
(11, 11, 36),
(12, 12, 37),
(13, 13, 38),
(14, 14, 39),
(15, 15, 40),
(16, 16, 41),
(17, 17, 42),
(18, 18, 43),
(19, 19, 44),
(20, 20, 45),
(21, 21, 46),
(22, 22, 47),
(23, 23, 48),
(24, 24, 49),
(25, 25, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `idLogin` int(11) NOT NULL,
  `nombre_usuario` varchar(250) NOT NULL,
  `contraseÃ±a` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` VALUES
(1, 'Juan', '1'),
(1, 'Juan', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `idMateria` int(11) NOT NULL,
  `materia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` VALUES
(1, 'Matematicas'),
(2, 'Ciencias Naturales'),
(3, 'Ciencias Sociales'),
(4, 'Lengua y Literatura'),
(5, 'Historia'),
(6, 'Geografia'),
(7, 'Educacion Fisica'),
(8, 'Arte'),
(9, 'Musica'),
(10, 'Ciencia Ficcion'),
(11, 'Novelas'),
(12, 'Quimica'),
(13, 'Fisica'),
(14, 'Bilogia'),
(15, 'Ingles'),
(16, 'tecnologia'),
(17, 'Etica y Ciudadania'),
(18, 'Educacion Civica'),
(19, 'Religion'),
(20, 'Economia'),
(21, 'Varios'),
(22, 'Matematicas'),
(23, 'Ciencias Naturales'),
(24, 'Ciencias Sociales'),
(25, 'Lengua y Literatura'),
(26, 'Historia'),
(27, 'Geografia'),
(28, 'Educacion Fisica'),
(29, 'Arte'),
(30, 'Musica'),
(31, 'Ciencia Ficcion'),
(32, 'Novelas'),
(33, 'Quimica'),
(34, 'Fisica'),
(35, 'Bilogia'),
(36, 'Ingles'),
(37, 'tecnologia'),
(38, 'Etica y Ciudadania'),
(39, 'Educacion Civica'),
(40, 'Religion'),
(41, 'Economia'),
(42, 'Fantasia'),
(43, '1'),
(44, '0'),
(45, ''),
(46, 'novela'),
(47, NULL),
(48, NULL),
(49, NULL),
(50, 'GoieG'),
(51, NULL),
(52, NULL),
(53, NULL),
(54, NULL),
(55, NULL),
(56, NULL),
(57, NULL),
(58, NULL),
(59, NULL),
(64, 'Calistenia'),
(65, NULL),
(66, NULL),
(67, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `idPrestamo` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `fechaVencimiento` datetime DEFAULT NULL,
  `fechaDevolucion` datetime DEFAULT NULL,
  `idUsuarios` int(11) NOT NULL,
  `tipoPrestamos` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` VALUES
(1, '2023-09-15 00:00:00', '2023-09-22 00:00:00', '2023-09-20 00:00:00', 25, 0),
(2, '2023-09-16 00:00:00', '2023-09-23 00:00:00', '2023-09-21 00:00:00', 32, 1),
(3, '2023-09-17 00:00:00', '2023-09-24 00:00:00', '2023-09-23 00:00:00', 45, 0),
(4, '2023-09-18 00:00:00', '2023-09-25 00:00:00', '2023-09-25 00:00:00', 50, 1),
(5, '2023-09-19 00:00:00', '2023-09-26 00:00:00', '2023-09-24 00:00:00', 65, 0),
(6, '2023-09-20 00:00:00', '2023-09-27 00:00:00', '2023-09-28 00:00:00', 77, 1),
(7, '2023-09-21 00:00:00', '2023-09-28 00:00:00', '2023-09-27 00:00:00', 88, 0),
(8, '2023-09-22 00:00:00', '2023-09-29 00:00:00', '2023-09-29 00:00:00', 101, 1),
(9, '2023-09-23 00:00:00', '2023-09-30 00:00:00', '2023-09-30 00:00:00', 115, 0),
(10, '2023-09-24 00:00:00', '2023-10-01 00:00:00', '2023-10-01 00:00:00', 122, 1),
(11, '2023-09-25 00:00:00', '2023-10-02 00:00:00', '2023-10-03 00:00:00', 136, 0),
(12, '2023-09-26 00:00:00', '2023-10-03 00:00:00', '2023-10-02 00:00:00', 145, 1),
(13, '2023-09-27 00:00:00', '2023-10-04 00:00:00', '2023-10-05 00:00:00', 155, 0),
(14, '2023-09-28 00:00:00', '2023-10-05 00:00:00', '2023-10-05 00:00:00', 168, 1),
(15, '2023-09-29 00:00:00', '2023-10-06 00:00:00', '2023-10-06 00:00:00', 176, 0),
(16, '2023-09-30 00:00:00', '2023-10-07 00:00:00', '2023-10-08 00:00:00', 185, 1),
(17, '2023-10-01 00:00:00', '2023-10-08 00:00:00', '2023-10-07 00:00:00', 198, 0),
(18, '2023-10-02 00:00:00', '2023-10-09 00:00:00', '2023-10-09 00:00:00', 12, 1),
(19, '2023-10-03 00:00:00', '2023-10-10 00:00:00', '2023-10-10 00:00:00', 22, 0),
(20, '2023-10-04 00:00:00', '2023-10-11 00:00:00', '2023-10-11 00:00:00', 35, 1),
(21, '2023-10-05 00:00:00', '2023-10-12 00:00:00', '2023-10-12 00:00:00', 42, 0),
(22, '2023-10-06 00:00:00', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 55, 1),
(23, '2023-10-07 00:00:00', '2023-10-14 00:00:00', '2023-10-14 00:00:00', 68, 0),
(24, '2023-10-08 00:00:00', '2023-10-15 00:00:00', '2023-10-15 00:00:00', 76, 1),
(25, '2023-10-09 00:00:00', '2023-10-16 00:00:00', '2023-10-16 00:00:00', 89, 0),
(26, '2023-10-10 00:00:00', '2023-10-17 00:00:00', '2023-10-17 00:00:00', 97, 1),
(27, '2023-10-11 00:00:00', '2023-10-18 00:00:00', '2023-10-18 00:00:00', 105, 0),
(28, '2023-10-12 00:00:00', '2023-10-19 00:00:00', '2023-10-19 00:00:00', 118, 1),
(29, '2023-10-13 00:00:00', '2023-10-20 00:00:00', '2023-10-20 00:00:00', 126, 0),
(30, '2023-10-14 00:00:00', '2023-10-21 00:00:00', '2023-10-21 00:00:00', 135, 1),
(31, '2023-10-15 00:00:00', '2023-10-22 00:00:00', '2023-10-22 00:00:00', 144, 0),
(32, '2023-09-15 00:00:00', '2023-09-22 00:00:00', '2023-09-20 00:00:00', 25, 0),
(33, '2023-09-16 00:00:00', '2023-09-23 00:00:00', '2023-09-21 00:00:00', 32, 1),
(34, '2023-09-17 00:00:00', '2023-09-24 00:00:00', '2023-09-23 00:00:00', 45, 0),
(35, '2023-09-18 00:00:00', '2023-09-25 00:00:00', '2023-09-25 00:00:00', 50, 1),
(36, '2023-09-19 00:00:00', '2023-09-26 00:00:00', '2023-09-24 00:00:00', 65, 0),
(37, '2023-09-20 00:00:00', '2023-09-27 00:00:00', '2023-09-28 00:00:00', 77, 1),
(38, '2023-09-21 00:00:00', '2023-09-28 00:00:00', '2023-09-27 00:00:00', 88, 0),
(39, '2023-09-22 00:00:00', '2023-09-29 00:00:00', '2023-09-29 00:00:00', 101, 1),
(40, '2023-09-23 00:00:00', '2023-09-30 00:00:00', '2023-09-30 00:00:00', 115, 0),
(41, '2023-09-24 00:00:00', '2023-10-01 00:00:00', '2023-10-01 00:00:00', 122, 1),
(42, '2023-09-25 00:00:00', '2023-10-02 00:00:00', '2023-10-03 00:00:00', 136, 0),
(43, '2023-09-26 00:00:00', '2023-10-03 00:00:00', '2023-10-02 00:00:00', 145, 1),
(44, '2023-09-27 00:00:00', '2023-10-04 00:00:00', '2023-10-05 00:00:00', 155, 0),
(45, '2023-09-28 00:00:00', '2023-10-05 00:00:00', '2023-10-05 00:00:00', 168, 1),
(46, '2023-09-29 00:00:00', '2023-10-06 00:00:00', '2023-10-06 00:00:00', 176, 0),
(47, '2023-09-30 00:00:00', '2023-10-07 00:00:00', '2023-10-08 00:00:00', 185, 1),
(48, '2023-10-01 00:00:00', '2023-10-08 00:00:00', '2023-10-07 00:00:00', 198, 0),
(49, '2023-10-02 00:00:00', '2023-10-09 00:00:00', '2023-10-09 00:00:00', 12, 1),
(50, '2023-10-03 00:00:00', '2023-10-10 00:00:00', '2023-10-10 00:00:00', 22, 0),
(51, '2023-10-04 00:00:00', '2023-10-11 00:00:00', '2023-10-11 00:00:00', 35, 1),
(52, '2023-10-05 00:00:00', '2023-10-12 00:00:00', '2023-10-12 00:00:00', 42, 0),
(53, '2023-10-06 00:00:00', '2023-10-13 00:00:00', '2023-10-13 00:00:00', 55, 1),
(54, '2023-10-07 00:00:00', '2023-10-14 00:00:00', '2023-10-14 00:00:00', 68, 0),
(55, '2023-10-08 00:00:00', '2023-10-15 00:00:00', '2023-10-15 00:00:00', 76, 1),
(56, '2023-10-09 00:00:00', '2023-10-16 00:00:00', '2023-10-16 00:00:00', 89, 0),
(57, '2023-10-10 00:00:00', '2023-10-17 00:00:00', '2023-10-17 00:00:00', 97, 1),
(58, '2023-10-11 00:00:00', '2023-10-18 00:00:00', '2023-10-18 00:00:00', 105, 0),
(59, '2023-10-12 00:00:00', '2023-10-19 00:00:00', '2023-10-19 00:00:00', 118, 1),
(60, '2023-10-13 00:00:00', '2023-10-20 00:00:00', '2023-10-20 00:00:00', 126, 0),
(61, '2023-10-14 00:00:00', '2023-10-21 00:00:00', '2023-10-21 00:00:00', 135, 1),
(62, '2023-10-15 00:00:00', '2023-10-22 00:00:00', '2023-10-22 00:00:00', 144, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos_libros`
--

CREATE TABLE `prestamos_libros` (
  `idPrestamo` int(11) NOT NULL,
  `idLibro` int(11) NOT NULL,
  `idPrestamos_Libros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `prestamos_libros`
--

INSERT INTO `prestamos_libros` VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(1, 26, 26),
(2, 27, 27),
(3, 28, 28),
(4, 29, 29),
(5, 30, 30),
(6, 31, 31),
(7, 32, 32),
(8, 33, 33),
(9, 34, 34),
(10, 35, 35),
(11, 36, 36),
(12, 37, 37),
(13, 38, 38),
(14, 39, 39),
(15, 40, 40),
(16, 41, 41),
(17, 42, 42),
(18, 43, 43),
(19, 44, 44),
(20, 45, 45),
(21, 46, 46),
(22, 47, 47),
(23, 48, 48),
(24, 49, 49),
(25, 50, 50),
(1, 51, 51),
(2, 52, 52),
(3, 53, 53),
(4, 54, 54),
(5, 55, 55),
(6, 56, 56),
(7, 57, 57),
(8, 58, 58),
(9, 59, 59),
(10, 60, 60),
(11, 61, 61),
(12, 62, 62),
(13, 63, 63),
(14, 64, 64),
(15, 65, 65),
(16, 66, 66),
(17, 67, 67),
(18, 68, 68),
(19, 69, 69),
(20, 70, 70),
(21, 71, 71),
(22, 72, 72),
(23, 73, 73),
(24, 74, 74),
(25, 75, 75),
(1, 1, 76),
(2, 2, 77),
(3, 3, 78),
(4, 4, 79),
(5, 5, 80),
(6, 6, 81),
(7, 7, 82),
(8, 8, 83),
(9, 9, 84),
(10, 10, 85),
(11, 11, 86),
(12, 12, 87),
(13, 13, 88),
(14, 14, 89),
(15, 15, 90),
(16, 16, 91),
(17, 17, 92),
(18, 18, 93),
(19, 19, 94),
(20, 20, 95),
(21, 21, 96),
(22, 22, 97),
(23, 23, 98),
(24, 24, 99),
(25, 25, 100),
(1, 26, 101),
(2, 27, 102),
(3, 28, 103),
(4, 29, 104),
(5, 30, 105),
(6, 31, 106),
(7, 32, 107),
(8, 33, 108),
(9, 34, 109),
(10, 35, 110),
(11, 36, 111),
(12, 37, 112),
(13, 38, 113),
(14, 39, 114),
(15, 40, 115),
(16, 41, 116),
(17, 42, 117),
(18, 43, 118),
(19, 44, 119),
(20, 45, 120),
(21, 46, 121),
(22, 47, 122),
(23, 48, 123),
(24, 49, 124),
(25, 50, 125),
(1, 51, 126),
(2, 52, 127),
(3, 53, 128),
(4, 54, 129),
(5, 55, 130),
(6, 56, 131),
(7, 57, 132),
(8, 58, 133),
(9, 59, 134),
(10, 60, 135),
(11, 61, 136),
(12, 62, 137),
(13, 63, 138),
(14, 64, 139),
(15, 65, 140),
(16, 66, 141),
(17, 67, 142),
(18, 68, 143),
(19, 69, 144),
(20, 70, 145),
(21, 71, 146),
(22, 72, 147),
(23, 73, 148),
(24, 74, 149),
(25, 75, 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idReserva` int(11) NOT NULL,
  `fechaSolicitud` datetime DEFAULT NULL,
  `fechaRetiro` datetime DEFAULT NULL,
  `idUsuarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` VALUES
(1, '2023-09-10 00:00:00', '2023-09-15 00:00:00', 25),
(2, '2023-09-11 00:00:00', '2023-09-16 00:00:00', 32),
(3, '2023-09-12 00:00:00', '2023-09-17 00:00:00', 45),
(4, '2023-09-13 00:00:00', '2023-09-18 00:00:00', 50),
(5, '2023-09-14 00:00:00', '2023-09-19 00:00:00', 65),
(6, '2023-09-15 00:00:00', '2023-09-20 00:00:00', 77),
(7, '2023-09-16 00:00:00', '2023-09-21 00:00:00', 88),
(8, '2023-09-17 00:00:00', '2023-09-22 00:00:00', 101),
(9, '2023-09-18 00:00:00', '2023-09-23 00:00:00', 115),
(10, '2023-09-19 00:00:00', '2023-09-24 00:00:00', 122),
(11, '2023-09-20 00:00:00', '2023-09-25 00:00:00', 136),
(12, '2023-09-21 00:00:00', '2023-09-26 00:00:00', 145),
(13, '2023-09-22 00:00:00', '2023-09-27 00:00:00', 155),
(14, '2023-09-23 00:00:00', '2023-09-28 00:00:00', 168),
(15, '2023-09-24 00:00:00', '2023-09-29 00:00:00', 176),
(16, '2023-09-25 00:00:00', '2023-09-30 00:00:00', 185),
(17, '2023-09-26 00:00:00', '2023-10-01 00:00:00', 198),
(18, '2023-09-27 00:00:00', '2023-10-02 00:00:00', 12),
(19, '2023-09-28 00:00:00', '2023-10-03 00:00:00', 22),
(20, '2023-09-29 00:00:00', '2023-10-04 00:00:00', 35),
(21, '2023-09-30 00:00:00', '2023-10-05 00:00:00', 42),
(22, '2023-10-01 00:00:00', '2023-10-06 00:00:00', 55),
(23, '2023-10-02 00:00:00', '2023-10-07 00:00:00', 68),
(24, '2023-10-03 00:00:00', '2023-10-08 00:00:00', 76),
(25, '2023-10-04 00:00:00', '2023-10-09 00:00:00', 89),
(26, '2023-10-05 00:00:00', '2023-10-10 00:00:00', 97),
(27, '2023-10-06 00:00:00', '2023-10-11 00:00:00', 105),
(28, '2023-10-07 00:00:00', '2023-10-12 00:00:00', 118),
(29, '2023-10-08 00:00:00', '2023-10-13 00:00:00', 126),
(30, '2023-10-09 00:00:00', '2023-10-14 00:00:00', 135),
(31, '2023-10-10 00:00:00', '2023-10-15 00:00:00', 144),
(32, '2023-10-11 00:00:00', '2023-10-16 00:00:00', 157),
(33, '2023-10-12 00:00:00', '2023-10-17 00:00:00', 166),
(34, '2023-10-13 00:00:00', '2023-10-18 00:00:00', 175),
(35, '2023-10-14 00:00:00', '2023-10-19 00:00:00', 188),
(36, '2023-10-15 00:00:00', '2023-10-20 00:00:00', 197),
(37, '2023-09-10 00:00:00', '2023-09-15 00:00:00', 25),
(38, '2023-09-11 00:00:00', '2023-09-16 00:00:00', 32),
(39, '2023-09-12 00:00:00', '2023-09-17 00:00:00', 45),
(40, '2023-09-13 00:00:00', '2023-09-18 00:00:00', 50),
(41, '2023-09-14 00:00:00', '2023-09-19 00:00:00', 65),
(42, '2023-09-15 00:00:00', '2023-09-20 00:00:00', 77),
(43, '2023-09-16 00:00:00', '2023-09-21 00:00:00', 88),
(44, '2023-09-17 00:00:00', '2023-09-22 00:00:00', 101),
(45, '2023-09-18 00:00:00', '2023-09-23 00:00:00', 115),
(46, '2023-09-19 00:00:00', '2023-09-24 00:00:00', 122),
(47, '2023-09-20 00:00:00', '2023-09-25 00:00:00', 136),
(48, '2023-09-21 00:00:00', '2023-09-26 00:00:00', 145),
(49, '2023-09-22 00:00:00', '2023-09-27 00:00:00', 155),
(50, '2023-09-23 00:00:00', '2023-09-28 00:00:00', 168),
(51, '2023-09-24 00:00:00', '2023-09-29 00:00:00', 176),
(52, '2023-09-25 00:00:00', '2023-09-30 00:00:00', 185),
(53, '2023-09-26 00:00:00', '2023-10-01 00:00:00', 198),
(54, '2023-09-27 00:00:00', '2023-10-02 00:00:00', 12),
(55, '2023-09-28 00:00:00', '2023-10-03 00:00:00', 22),
(56, '2023-09-29 00:00:00', '2023-10-04 00:00:00', 35),
(57, '2023-09-30 00:00:00', '2023-10-05 00:00:00', 42),
(58, '2023-10-01 00:00:00', '2023-10-06 00:00:00', 55),
(59, '2023-10-02 00:00:00', '2023-10-07 00:00:00', 68),
(60, '2023-10-03 00:00:00', '2023-10-08 00:00:00', 76),
(61, '2023-10-04 00:00:00', '2023-10-09 00:00:00', 89),
(62, '2023-10-05 00:00:00', '2023-10-10 00:00:00', 97),
(63, '2023-10-06 00:00:00', '2023-10-11 00:00:00', 105),
(64, '2023-10-07 00:00:00', '2023-10-12 00:00:00', 118),
(65, '2023-10-08 00:00:00', '2023-10-13 00:00:00', 126),
(66, '2023-10-09 00:00:00', '2023-10-14 00:00:00', 135),
(67, '2023-10-10 00:00:00', '2023-10-15 00:00:00', 144),
(68, '2023-10-11 00:00:00', '2023-10-16 00:00:00', 157),
(69, '2023-10-12 00:00:00', '2023-10-17 00:00:00', 166),
(70, '2023-10-13 00:00:00', '2023-10-18 00:00:00', 175),
(71, '2023-10-14 00:00:00', '2023-10-19 00:00:00', 188),
(72, '2023-10-15 00:00:00', '2023-10-20 00:00:00', 197);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `tipoUsuario` tinyint(4) DEFAULT NULL COMMENT 'Bibliotecaria(0)\nProfesor(1)\nSocio(2)\nUsuario(3)',
  `penalidad` int(11) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` VALUES
(1, 'Marta', 'GonzÃ¡lez', 28765432, '1995-02-15', 345123456, 1, NULL, 'MaGonza@gmail.com', 'Av. Callao 345'),
(2, 'Juan', 'Rodriguez', 30234567, '1990-07-22', 345234567, 1, NULL, 'JuanRodri@yahoo.com', 'Calle Sullivan 2100'),
(3, 'Laura', 'Lopez', 31234567, '1988-03-10', 345345678, 1, NULL, '', ''),
(4, 'Carlos', 'Martinez', 32987654, '1977-11-05', 345645888, 1, NULL, 'CarMAR@hotmail.com', 'Calle Vuelta de obligado 256'),
(5, 'Ana', 'Perezz', 28098765, '1998-09-18', 345567890, 1, NULL, 'patopato@gmail.com', 'Av de los Incas 1234'),
(6, 'Luis', 'Fernandez', 32456789, '1975-04-30', 345678901, 1, NULL, 'perrisimo@gmail.com', 'Calle Justo 24'),
(7, 'Sofia', 'Hernandez', 33567890, '1970-06-14', 345789012, 1, NULL, 'sooofihotmail.com', 'Calle Suspiros s/n'),
(8, 'Elena', 'Garcia', 31234567, '1985-12-25', 345890123, 1, NULL, 'elen@elenmail.com', 'Av. Justicia 123'),
(9, 'Diego', 'Diaz', 29876543, '1994-08-03', 345981234, 1, NULL, '', ''),
(10, 'Valentina', 'Silva', 32234567, '1992-10-09', 345672345, 1, NULL, '', ''),
(11, 'Mariano', 'Moreno', 31456789, '1996-05-15', 345234123, 1, NULL, '', ''),
(12, 'Carolina', 'Gomez', 30123456, '1991-01-08', 345345234, 1, NULL, '', ''),
(13, 'Mariani', 'Torres', 33876543, '1972-03-21', 345456345, 1, NULL, '', ''),
(14, 'Florencia', 'Ortega', 32876543, '1978-07-14', 345567456, 1, NULL, '', ''),
(15, 'Joaquin', 'Pacheco', 33678901, '1973-09-29', 345678567, 1, NULL, '', ''),
(16, 'Valeria', 'Rojas', 31543210, '1997-11-12', 345123456, 1, NULL, '', ''),
(17, 'Miguel', 'Lara', 29432109, '1999-12-30', 345234567, 1, NULL, '', ''),
(18, 'Sara', 'Navarro', 32210987, '1986-02-14', 345345678, 1, NULL, '', ''),
(19, 'Lucas', 'Molina', 30321098, '1993-04-05', 345456789, 1, NULL, '', ''),
(20, 'Gabriel', 'Cruz', 32098765, '1976-06-27', 345567890, 1, NULL, '', ''),
(21, 'Daniel', 'Gutierrez', 31987654, '1974-08-18', 345678901, 1, NULL, '', ''),
(22, 'Patricia', 'Vega', 29543210, '1990-10-31', 345789012, 1, NULL, '', ''),
(23, 'Ricardo', 'Castillo', 30987654, '1989-12-04', 345890123, 1, NULL, '', ''),
(24, 'Fernanda', 'Santos', 31876543, '1998-02-07', 345981234, 1, NULL, '', ''),
(25, 'Pablo', 'Ramos', 31123456, '1987-04-17', 345672345, 1, NULL, '', ''),
(26, 'Andrea', 'Romero', 32765432, '1979-06-20', 345234123, 1, NULL, '', ''),
(27, 'Camilo', 'Peralta', 32543210, '1971-08-23', 345345234, 1, NULL, '', ''),
(28, 'Marcela', 'Guzman', 33098765, '1978-10-26', 345456345, 1, NULL, '', ''),
(29, 'Eduardo', 'Jimenez', 32109876, '1983-12-12', 345567456, 1, NULL, '', ''),
(30, 'Romina', 'Vargas', 32654321, '1977-02-14', 345678567, 1, NULL, '', ''),
(31, 'Lucas', 'Martinez', 39000000, '2006-02-15', 345123456, 2, NULL, '', ''),
(32, 'Valentina', 'Gomez', 39000001, '2005-07-22', 345234567, 2, NULL, '', ''),
(33, 'Sebastian', 'Hernandez', 39000002, '2004-03-10', 345345678, 2, NULL, '', ''),
(34, 'Isabella', 'Lopez', 39000003, '2006-11-05', 345456789, 2, NULL, '', ''),
(35, 'Miguel', 'Rodriguez', 39000004, '2007-09-18', 345567890, 2, NULL, '', ''),
(36, 'Camila', 'Perezz', 39000005, '2006-04-30', 345678901, 2, NULL, '', ''),
(37, 'Mateo', 'Fernandez', 39000006, '2004-06-14', 345789012, 2, NULL, '', ''),
(38, 'Sofia', 'Diaz', 39000007, '2005-12-25', 345890123, 2, NULL, '', ''),
(39, 'Matias', 'Santos', 39000008, '2003-08-03', 345981234, 2, NULL, '', ''),
(40, 'Lucas', 'Mariani', 39000009, '2004-10-09', 345672345, 2, NULL, '', ''),
(41, 'Daniel', 'Garcia', 39000010, '2005-05-15', 345234123, 2, NULL, '', ''),
(42, 'Elena', 'Moreno', 39000011, '2005-01-08', 345345234, 2, NULL, '', ''),
(43, 'Joaquin', 'Torres', 39000012, '2003-03-21', 345456345, 2, NULL, '', ''),
(44, 'Catalina', 'Ortega', 39000013, '2004-07-14', 345567456, 2, NULL, '', ''),
(45, 'Pedro', 'Pacheco', 39000014, '2003-09-29', 345678567, 2, NULL, '', ''),
(46, 'Valeria', 'Rojas', 39000015, '2006-11-12', 345123456, 2, NULL, '', ''),
(47, 'Luis', 'Lara', 39000016, '2007-12-30', 345234567, 2, NULL, '', ''),
(48, 'Florencia', 'Navarro', 39000017, '2004-02-14', 345345678, 2, NULL, '', ''),
(49, 'Mariano', 'Molina', 39000018, '2005-04-05', 345456789, 3, NULL, '', ''),
(50, 'Carolina', 'Cruz', 39000019, '2006-06-27', 345567890, 3, NULL, '', ''),
(51, 'Eduardo', 'Gutierrez', 39000020, '2003-08-18', 345678901, 3, NULL, '', ''),
(52, 'Isabel', 'Vega', 39000021, '2006-10-31', 345789012, 3, NULL, '', ''),
(53, 'Gabriel', 'Castillo', 39000022, '2005-12-04', 345890123, 3, NULL, '', ''),
(54, 'Martina', 'Santos', 39000023, '2007-02-07', 345981234, 3, NULL, '', ''),
(55, 'Juan', 'Ramos', 39000024, '2004-04-17', 345672345, 3, NULL, '', ''),
(56, 'Andrea', 'Romero', 39000025, '2003-06-20', 345234123, 3, NULL, '', ''),
(57, 'Tomas', 'Peralta', 39000026, '2002-08-23', 345345234, 3, NULL, '', ''),
(58, 'Valentino', 'Guzman', 39000027, '2005-10-26', 345456345, 3, NULL, '', ''),
(59, 'Luciana', 'Jimenez', 39000028, '2004-12-12', 345567456, 3, NULL, '', ''),
(60, 'Mariana', 'Vargas', 39000029, '2003-02-14', 345678567, 2, NULL, '', ''),
(61, 'Lucas', 'Martinez', 39000000, '2006-02-15', 345123456, 3, NULL, '', ''),
(62, 'Valentina', 'Gomez', 39000001, '2005-07-22', 345234567, 3, NULL, '', ''),
(63, 'Sebastian', 'Hernandez', 39000002, '2004-03-10', 345345678, 3, NULL, '', ''),
(64, 'Isabella', 'Lopez', 39000003, '2006-11-05', 345456789, 3, NULL, '', ''),
(65, 'Miguel', 'Rodriguez', 39000004, '2007-09-18', 345567890, 3, NULL, '', ''),
(66, 'Camila', 'Perezz', 39000005, '2006-04-30', 345678901, 3, NULL, '', ''),
(67, 'Mateo', 'Fernandez', 39000006, '2004-06-14', 345789012, 3, NULL, '', ''),
(68, 'Sofia', 'Diaz', 39000007, '2005-12-25', 345890123, 3, NULL, '', ''),
(69, 'Matias', 'Santos', 39000008, '2003-08-03', 345981234, 3, NULL, '', ''),
(70, 'Lucas', 'Mariani', 39000009, '2004-10-09', 345672345, 3, NULL, '', ''),
(71, 'Daniel', 'Garcia', 39000010, '2005-05-15', 345234123, 3, NULL, '', ''),
(72, 'Elena', 'Moreno', 39000011, '2005-01-08', 345345234, 3, NULL, '', ''),
(73, 'Joaquin', 'Torres', 39000012, '2003-03-21', 345456345, 3, NULL, '', ''),
(74, 'Catalina', 'Ortega', 39000013, '2004-07-14', 345567456, 3, NULL, '', ''),
(75, 'Pedro', 'Pacheco', 39000014, '2003-09-29', 345678567, 3, NULL, '', ''),
(76, 'Valeria', 'Rojas', 39000015, '2006-11-12', 345123456, 3, NULL, '', ''),
(77, 'Luis', 'Lara', 39000016, '2007-12-30', 345234567, 3, NULL, '', ''),
(78, 'Florencia', 'Navarro', 39000017, '2004-02-14', 345345678, 3, NULL, '', ''),
(79, 'Mariano', 'Molina', 39000018, '2005-04-05', 345456789, 3, NULL, '', ''),
(80, 'Carolina', 'Cruz', 39000019, '2006-06-27', 345567890, 2, NULL, '', ''),
(81, 'Eduardo', 'Gutierrez', 39000020, '2003-08-18', 345678901, 2, NULL, '', ''),
(82, 'Isabel', 'Vega', 39000021, '2006-10-31', 345789012, 2, NULL, '', ''),
(83, 'Gabriel', 'Castillo', 39000022, '2005-12-04', 345890123, 2, NULL, '', ''),
(84, 'Martina', 'Santos', 39000023, '2007-02-07', 345981234, 2, NULL, '', ''),
(85, 'Juan', 'Ramos', 39000024, '2004-04-17', 345672345, 2, NULL, '', ''),
(86, 'Andrea', 'Romero', 39000025, '2003-06-20', 345234123, 2, NULL, '', ''),
(87, 'Tomas', 'Peralta', 39000026, '2002-08-23', 345345234, 2, NULL, '', ''),
(88, 'Valentino', 'Guzman', 39000027, '2005-10-26', 345456345, 2, NULL, '', ''),
(89, 'Luciana', 'Jimenez', 39000028, '2004-12-12', 345567456, 2, NULL, '', ''),
(90, 'Mariana', 'Vargas', 39000029, '2003-02-14', 345678567, 2, NULL, '', ''),
(91, 'Lucas', 'Gomez', 41000000, '2006-05-15', 345123456, 2, NULL, '', ''),
(92, 'Valentina', 'Martinez', 41000001, '2006-07-22', 345234567, 2, NULL, '', ''),
(93, 'Santiago', 'Lopez', 41000002, '2006-03-10', 345345678, 2, NULL, '', ''),
(94, 'Isabella', 'Rodriguez', 41000003, '2006-11-05', 345456789, 2, NULL, '', ''),
(95, 'Miguel', 'Perezz', 41000004, '2006-09-18', 345567890, 2, NULL, '', ''),
(96, 'Camila', 'Hernandez', 41000005, '2006-04-30', 345678901, 2, NULL, '', ''),
(97, 'Mateo', 'Fernandez', 41000006, '2006-06-14', 345789012, 2, NULL, '', ''),
(98, 'Sofia', 'Diaz', 41000007, '2006-12-25', 345890123, 2, NULL, '', ''),
(99, 'Matias', 'Santos', 41000008, '2006-08-03', 345981234, 2, NULL, '', ''),
(100, 'Lucas', 'Mariani', 41000009, '2006-10-09', 345672345, 3, NULL, '', ''),
(101, 'Daniel', 'Garcia', 41000010, '2006-05-15', 345234123, 3, NULL, '', ''),
(102, 'Elena', 'Moreno', 41000011, '2006-01-08', 345345234, 3, NULL, '', ''),
(103, 'Joaquin', 'Torres', 41000012, '2006-03-21', 345456345, 3, NULL, '', ''),
(104, 'Catalina', 'Ortega', 41000013, '2006-07-14', 345567456, 3, NULL, '', ''),
(105, 'Pedro', 'Pacheco', 41000014, '2006-09-29', 345678567, 3, NULL, '', ''),
(106, 'Valeria', 'Rojas', 41000015, '2006-11-12', 345123456, 3, NULL, '', ''),
(107, 'Luis', 'Lara', 41000016, '2006-12-30', 345234567, 3, NULL, '', ''),
(108, 'Florencia', 'Navarro', 41000017, '2006-04-05', 345345678, 3, NULL, '', ''),
(109, 'Mariano', 'Molina', 41000018, '2006-05-15', 345456789, 3, NULL, '', ''),
(110, 'Carolina', 'Cruz', 41000019, '2006-06-27', 345567890, 3, NULL, '', ''),
(111, 'Eduardo', 'Gutierrez', 41000020, '2006-08-18', 345678901, 3, NULL, '', ''),
(112, 'Isabel', 'Vega', 41000021, '2006-10-31', 345789012, 3, NULL, '', ''),
(113, 'Gabriel', 'Castillo', 41000022, '2006-12-04', 345890123, 3, NULL, '', ''),
(114, 'Martina', 'Santos', 41000023, '2006-02-07', 345981234, 2, NULL, '', ''),
(115, 'Juan', 'Ramos', 41000024, '2006-04-17', 345672345, 2, NULL, '', ''),
(116, 'Andrea', 'Romero', 41000025, '2006-06-20', 345234123, 2, NULL, '', ''),
(117, 'Tomas', 'Peralta', 41000026, '2006-08-23', 345345234, 2, NULL, '', ''),
(118, 'Valentino', 'Guzman', 41000027, '2006-10-26', 345456345, 2, NULL, '', ''),
(119, 'Luciana', 'Jimenez', 41000028, '2006-12-12', 345567456, 2, NULL, '', ''),
(120, 'Mariana', 'Vargas', 41000029, '2006-02-14', 345678567, 2, NULL, '', ''),
(121, 'NicolÃ¡s', 'SÃ¡nchez', 41000030, '2006-05-15', 345123456, 2, NULL, '', ''),
(122, 'ValentÃ­n', 'Vera', 41000031, '2006-07-22', 345234567, 2, NULL, '', ''),
(123, 'Florencia', 'Gomez', 41000032, '2006-03-10', 345345678, 2, NULL, '', ''),
(124, 'Joaquin', 'Silva', 41000033, '2006-11-05', 345456789, 2, NULL, '', ''),
(125, 'Isabella', 'Perezz', 41000034, '2006-09-18', 345567890, 2, NULL, '', ''),
(126, 'Santiago', 'Garcia', 41000035, '2006-04-30', 345678901, 2, NULL, '', ''),
(127, 'Sofia', 'Martinez', 41000036, '2006-06-14', 345789012, 2, NULL, '', ''),
(128, 'Sebastian', 'Lopez', 41000037, '2006-12-25', 345890123, 2, NULL, '', ''),
(129, 'Valentina', 'Moreno', 41000038, '2006-08-03', 345981234, 2, NULL, '', ''),
(130, 'Matias', 'Rodriguez', 41000039, '2006-10-09', 345672345, 2, NULL, '', ''),
(131, 'NicolÃ¡s', 'SÃ¡nchez', 42000000, '2007-05-15', 345123456, 1, NULL, '', ''),
(132, 'Valentina', 'Martinez', 42000001, '2007-07-22', 345234567, 2, NULL, '', ''),
(133, 'Santiago', 'Lopez', 42000002, '2007-03-10', 345345678, 2, NULL, '', ''),
(134, 'Isabella', 'Rodriguez', 42000003, '2007-11-05', 345456789, 2, NULL, '', ''),
(135, 'Miguel', 'Perezz', 42000004, '2007-09-18', 345567890, 2, NULL, '', ''),
(136, 'Camila', 'Hernandez', 42000005, '2007-04-30', 345678901, 2, NULL, '', ''),
(137, 'Mateo', 'Fernandez', 42000006, '2007-06-14', 345789012, 2, NULL, '', ''),
(138, 'Sofia', 'Diaz', 42000007, '2007-12-25', 345890123, 2, NULL, '', ''),
(139, 'Matias', 'Santos', 42000008, '2007-08-03', 345981234, 2, NULL, '', ''),
(140, 'Lucas', 'Mariani', 42000009, '2007-10-09', 345672345, 2, NULL, '', ''),
(141, 'Daniel', 'Garcia', 42000010, '2007-05-15', 345234123, 2, NULL, '', ''),
(142, 'Elena', 'Moreno', 42000011, '2007-01-08', 345345234, 2, NULL, '', ''),
(143, 'Joaquin', 'Torres', 42000012, '2007-03-21', 345456345, 2, NULL, '', ''),
(144, 'Catalina', 'Ortega', 42000013, '2007-07-14', 345567456, 2, NULL, '', ''),
(145, 'Pedro', 'Pacheco', 42000014, '2007-09-29', 345678567, 2, NULL, '', ''),
(146, 'Valeria', 'Rojas', 42000015, '2007-11-12', 345123456, 3, NULL, '', ''),
(147, 'Luis', 'Lara', 42000016, '2007-12-30', 345234567, 3, NULL, '', ''),
(148, 'Florencia', 'Navarro', 42000017, '2007-04-05', 345345678, 3, NULL, '', ''),
(149, 'Mariano', 'Molina', 42000018, '2007-05-15', 345456789, 3, NULL, '', ''),
(150, 'Carolina', 'Cruz', 42000019, '2007-06-27', 345567890, 3, NULL, '', ''),
(151, 'Eduardo', 'Gutierrez', 42000020, '2007-08-18', 345678901, 3, NULL, '', ''),
(152, 'Isabel', 'Vega', 42000021, '2007-10-31', 345789012, 3, NULL, '', ''),
(153, 'Gabriel', 'Castillo', 42000022, '2007-12-04', 345890123, 3, NULL, '', ''),
(154, 'Martina', 'Santos', 42000023, '2007-02-07', 345981234, 3, NULL, '', ''),
(155, 'Juan', 'Ramos', 42000024, '2007-04-17', 345672345, 3, NULL, '', ''),
(156, 'Andrea', 'Romero', 42000025, '2007-06-20', 345234123, 3, NULL, '', ''),
(157, 'Tomas', 'Peralta', 42000026, '2007-08-23', 345345234, 3, NULL, '', ''),
(158, 'Valentino', 'Guzman', 42000027, '2007-10-26', 345456345, 3, NULL, '', ''),
(159, 'Luciana', 'Jimenez', 42000028, '2007-12-12', 345567456, 3, NULL, '', ''),
(160, 'Mariana', 'Vargas', 42000029, '2007-02-14', 345678567, 3, NULL, '', ''),
(161, 'NicolÃ¡s', 'SÃ¡nchez', 42000030, '2007-05-15', 345123456, 3, NULL, '', ''),
(162, 'ValentÃ­n', 'Vera', 42000031, '2007-07-22', 345234567, 3, NULL, '', ''),
(163, 'Florencia', 'Gomez', 42000032, '2007-03-10', 345345678, 3, NULL, '', ''),
(164, 'Joaquin', 'Silva', 42000033, '2007-11-05', 345456789, 3, NULL, '', ''),
(165, 'Isabella', 'Perezz', 42000034, '2007-09-18', 345567890, 3, NULL, '', ''),
(166, 'Santiago', 'Garcia', 42000035, '2007-04-30', 345678901, 3, NULL, '', ''),
(167, 'Sofia', 'Martinez', 42000036, '2007-06-14', 345789012, 3, NULL, '', ''),
(168, 'Sebastian', 'Lopez', 42000037, '2007-12-25', 345890123, 3, NULL, '', ''),
(169, 'Valentina', 'Moreno', 42000038, '2007-08-03', 345981234, 3, NULL, '', ''),
(170, 'Matias', 'Rodriguez', 42000039, '2007-10-09', 345672345, 3, NULL, '', ''),
(171, 'Lucas', 'Mariani', 42000040, '2007-05-15', 345234123, 3, NULL, '', ''),
(172, 'Daniel', 'Gutierrez', 42000041, '2007-01-08', 345345234, 3, NULL, '', ''),
(173, 'Joaquin', 'Torres', 42000042, '2007-03-21', 345456345, 3, NULL, '', ''),
(174, 'Catalina', 'Ortega', 42000043, '2007-07-14', 345567456, 3, NULL, '', ''),
(175, 'Pedro', 'Pacheco', 42000044, '2007-09-29', 345678567, 3, NULL, '', ''),
(176, 'Valeria', 'Rojas', 42000045, '2007-11-12', 345123456, 3, NULL, '', ''),
(177, 'Luis', 'Lara', 42000046, '2007-12-30', 345234567, 3, NULL, '', ''),
(178, 'Florencia', 'Navarro', 42000047, '2007-04-05', 345345678, 3, NULL, '', ''),
(179, 'Mariano', 'Molina', 42000048, '2007-05-15', 345456789, 3, NULL, '', ''),
(180, 'Carolina', 'Cruz', 42000049, '2007-06-27', 345567890, 3, NULL, '', ''),
(181, 'Eduardo', 'Gutierrez', 42000050, '2007-08-18', 345678901, 3, NULL, '', ''),
(182, 'NicolÃ¡s', 'SÃ¡nchez', 43000000, '2008-05-15', 345123456, 2, NULL, '', ''),
(183, 'Valentina', 'Martinez', 43000001, '2008-07-22', 345234567, 2, NULL, '', ''),
(184, 'Santiago', 'Lopez', 43000002, '2008-03-10', 345345678, 2, NULL, '', ''),
(185, 'Isabella', 'Rodriguez', 43000003, '2008-11-05', 345456789, 2, NULL, '', ''),
(186, 'Miguel', 'Perez', 43000004, '2008-09-18', 345567890, 2, NULL, '', ''),
(187, 'Camila', 'Hernandez', 43000005, '2008-04-30', 345678901, 2, NULL, '', ''),
(188, 'Mateo', 'Fernandez', 43000006, '2008-06-14', 345789012, 2, NULL, '', ''),
(189, 'Sofia', 'Diaz', 43000007, '2008-12-25', 345890123, 2, NULL, '', ''),
(190, 'Matias', 'Santos', 43000008, '2008-08-03', 345981234, 2, NULL, '', ''),
(191, 'Lucas', 'Mariani', 43000009, '2008-10-09', 345672345, 2, NULL, '', ''),
(192, 'Daniel', 'Garcia', 43000010, '2008-05-15', 345234123, 2, NULL, '', ''),
(193, 'Elena', 'Moreno', 43000011, '2008-01-08', 345345234, 2, NULL, '', ''),
(194, 'Joaquin', 'Torres', 43000012, '2008-03-21', 345456345, 2, NULL, '', ''),
(195, 'Catalina', 'Ortega', 43000013, '2008-07-14', 345567456, 2, NULL, '', ''),
(196, 'Pedro', 'Pacheco', 43000014, '2008-09-29', 345678567, 2, NULL, '', ''),
(197, 'Valeria', 'Rojas', 43000015, '2008-11-12', 345123456, 2, NULL, '', ''),
(198, 'Luis', 'Lara', 43000016, '2008-12-30', 345234567, 2, NULL, '', ''),
(199, 'Florencia', 'Navarro', 43000017, '2008-04-05', 345345678, 2, NULL, '', ''),
(200, 'Mariano', 'Molina', 43000018, '2008-05-15', 345456789, 2, NULL, '', ''),
(201, 'Carolina', 'Cruz', 43000019, '2008-06-27', 345567890, 2, NULL, '', ''),
(202, 'Eduardo', 'Gutierrez', 43000020, '2008-08-18', 345678901, 2, NULL, '', ''),
(203, 'Isabel', 'Vega', 43000021, '2008-10-31', 345789012, 2, NULL, '', ''),
(204, 'Gabriel', 'Castillo', 43000022, '2008-12-04', 345890123, 2, NULL, '', ''),
(205, 'Martina', 'Santos', 43000023, '2008-02-07', 345981234, 2, NULL, '', ''),
(206, 'Juan', 'Ramos', 43000024, '2008-04-17', 345672345, 2, NULL, '', ''),
(207, 'Andrea', 'Romero', 43000025, '2008-06-20', 345234123, 3, NULL, '', ''),
(208, 'Tomas', 'Peralta', 43000026, '2008-08-23', 345345234, 3, NULL, '', ''),
(209, 'Valentino', 'Guzman', 43000027, '2008-10-26', 345456345, 3, NULL, '', ''),
(210, 'Luciana', 'Jimenez', 43000028, '2008-12-12', 345567456, 3, NULL, '', ''),
(211, 'Mariana', 'Vargas', 43000029, '2008-02-14', 345678567, 3, NULL, '', ''),
(212, 'NicolÃ¡s', 'SÃ¡nchez', 43000030, '2008-05-15', 345123456, 3, NULL, '', ''),
(213, 'ValentÃ­n', 'Vera', 43000031, '2008-07-22', 345234567, 3, NULL, '', ''),
(214, 'Florencia', 'Gomez', 43000032, '2008-03-10', 345345678, 3, NULL, '', ''),
(215, 'Joaquin', 'Silva', 43000033, '2008-11-05', 345456789, 3, NULL, '', ''),
(216, 'Isabella', 'Perez', 43000034, '2008-09-18', 345567890, 3, NULL, '', ''),
(217, 'Santiago', 'Garcia', 43000035, '2008-04-30', 345678901, 3, NULL, '', ''),
(218, 'Sofia', 'Martinez', 43000036, '2008-06-14', 345789012, 3, NULL, '', ''),
(219, 'Sebastian', 'Lopez', 43000037, '2008-12-25', 345890123, 3, NULL, '', ''),
(220, 'Valentina', 'Moreno', 43000038, '2008-08-03', 345981234, 3, NULL, '', ''),
(221, 'Matias', 'Rodriguez', 43000039, '2008-10-09', 345672345, 3, NULL, '', ''),
(222, 'Lucas', 'Mariani', 43000040, '2008-05-15', 345234123, 3, NULL, '', ''),
(223, 'Daniel', 'Gutierrez', 43000041, '2008-01-08', 345345234, 3, NULL, '', ''),
(224, 'Joaquin', 'Torres', 43000042, '2008-03-21', 345456345, 3, NULL, '', ''),
(225, 'Catalina', 'Ortega', 43000043, '2008-07-14', 345567456, 3, NULL, '', ''),
(226, 'Pedro', 'Pacheco', 43000044, '2008-09-29', 345678567, 3, NULL, '', ''),
(227, 'Valeria', 'Rojas', 43000045, '2008-11-12', 345123456, 3, NULL, '', ''),
(228, 'Luis', 'Lara', 43000046, '2008-12-30', 345234567, 3, NULL, '', ''),
(229, 'Florencia', 'Navarro', 43000047, '2008-04-05', 345345678, 3, NULL, '', ''),
(230, 'Mariano', 'Molina', 43000048, '2008-05-15', 345456789, 3, NULL, '', ''),
(231, 'Carolina', 'Cruz', 43000049, '2008-06-27', 345567890, 3, NULL, '', ''),
(232, 'Eduardo', 'Gutierrez', 43000050, '2008-08-18', 345678901, 3, NULL, '', ''),
(233, 'Isabel', 'Vega', 43000051, '2008-10-31', 345789012, 3, NULL, '', ''),
(234, 'Gabriel', 'Castillo', 43000052, '2008-12-04', 345890123, 3, NULL, '', ''),
(235, 'Martina', 'Santos', 43000053, '2008-02-07', 345981234, 3, NULL, '', ''),
(236, 'Juan', 'Ramos', 43000054, '2008-04-17', 345672345, 3, NULL, '', ''),
(237, 'Andrea', 'Romero', 43000055, '2008-06-20', 345234123, 3, NULL, '', ''),
(238, 'Tomas', 'Peralta', 43000056, '2008-08-23', 345345234, 3, NULL, '', ''),
(239, 'Valentino', 'Guzman', 43000057, '2008-10-26', 345456345, 3, NULL, '', ''),
(240, 'Luciana', 'Jimenez', 43000058, '2008-12-12', 345567456, 3, NULL, '', ''),
(241, 'Mariana', 'Vargas', 43000059, '2008-02-14', 345678567, 3, NULL, '', ''),
(242, 'NicolÃ¡s', 'SÃ¡nchez', 44000000, '2009-05-15', 345123456, 2, NULL, '', ''),
(243, 'Valentina', 'Martinez', 44000001, '2009-07-22', 345234567, 2, NULL, '', ''),
(244, 'Santiago', 'Lopez', 44000002, '2009-03-10', 345345678, 2, NULL, '', ''),
(245, 'Isabella', 'Rodriguez', 44000003, '2009-11-05', 345456789, 2, NULL, '', ''),
(246, 'Miguel', 'Perez', 44000004, '2009-09-18', 345567890, 2, NULL, '', ''),
(247, 'Camila', 'Hernandez', 44000005, '2009-04-30', 345678901, 2, NULL, '', ''),
(248, 'Mateo', 'Fernandez', 44000006, '2009-06-14', 345789012, 2, NULL, '', ''),
(249, 'Sofia', 'Diaz', 44000007, '2009-12-25', 345890123, 2, NULL, '', ''),
(250, 'Matias', 'Santos', 44000008, '2009-08-03', 345981234, 2, NULL, '', ''),
(251, 'Lucas', 'Mariani', 44000009, '2009-10-09', 345672345, 2, NULL, '', ''),
(252, 'Daniel', 'Garcia', 44000010, '2009-05-15', 345234123, 2, NULL, '', ''),
(253, 'Elena', 'Moreno', 44000011, '2009-01-08', 345345234, 2, NULL, '', ''),
(254, 'Joaquin', 'Torres', 44000012, '2009-03-21', 345456345, 2, NULL, '', ''),
(255, 'Catalina', 'Ortega', 44000013, '2009-07-14', 345567456, 2, NULL, '', ''),
(256, 'Pedro', 'Pacheco', 44000014, '2009-09-29', 345678567, 2, NULL, '', ''),
(257, 'Valeria', 'Rojas', 44000015, '2009-11-12', 345123456, 2, NULL, '', ''),
(258, 'Luis', 'Lara', 44000016, '2009-12-30', 345234567, 2, NULL, '', ''),
(259, 'Florencia', 'Navarro', 44000017, '2009-04-05', 345345678, 3, NULL, '', ''),
(260, 'Mariano', 'Molina', 44000018, '2009-05-15', 345456789, 3, NULL, '', ''),
(261, 'Carolina', 'Cruz', 44000019, '2009-06-27', 345567890, 3, NULL, '', ''),
(262, 'Eduardo', 'Gutierrez', 44000020, '2009-08-18', 345678901, 3, NULL, '', ''),
(263, 'Isabel', 'Vega', 44000021, '2009-10-31', 345789012, 3, NULL, '', ''),
(264, 'Gabriel', 'Castillo', 44000022, '2009-12-04', 345890123, 3, NULL, '', ''),
(265, 'Martina', 'Santos', 44000023, '2009-02-07', 345981234, 3, NULL, '', ''),
(266, 'Juan', 'Ramos', 44000024, '2009-04-17', 345672345, 3, NULL, '', ''),
(267, 'Andrea', 'Romero', 44000025, '2009-06-20', 345234123, 3, NULL, '', ''),
(268, 'Tomas', 'Peralta', 44000026, '2009-08-23', 345345234, 3, NULL, '', ''),
(269, 'Valentino', 'Guzman', 44000027, '2009-10-26', 345456345, 3, NULL, '', ''),
(270, 'Luciana', 'Jimenez', 44000028, '2009-12-12', 345567456, 3, NULL, '', ''),
(271, 'Mariana', 'Vargas', 44000029, '2009-02-14', 345678567, 3, NULL, '', ''),
(272, 'NicolÃ¡s', 'SÃ¡nchez', 44000030, '2009-05-15', 345123456, 3, NULL, '', ''),
(273, 'ValentÃ­n', 'Vera', 44000031, '2009-07-22', 345234567, 3, NULL, '', ''),
(274, 'Florencia', 'Gomez', 44000032, '2009-03-10', 345345678, 3, NULL, '', ''),
(275, 'Joaquin', 'Silva', 44000033, '2009-11-05', 345456789, 3, NULL, '', ''),
(276, 'Isabella', 'Perez', 44000034, '2009-09-18', 345567890, 3, NULL, '', ''),
(277, 'Santiago', 'Garcia', 44000035, '2009-04-30', 345678901, 3, NULL, '', ''),
(278, 'Sofia', 'Martinez', 44000036, '2009-06-14', 345789012, 3, NULL, '', ''),
(279, 'Sebastian', 'Lopez', 44000037, '2009-12-25', 345890123, 3, NULL, '', ''),
(280, 'Valentina', 'Moreno', 44000038, '2009-08-03', 345981234, 3, NULL, '', ''),
(281, 'Matias', 'Rodriguez', 44000039, '2009-10-09', 345672345, 3, NULL, '', ''),
(282, 'Lucas', 'Mariani', 44000040, '2009-05-15', 345234123, 3, NULL, '', ''),
(283, 'Daniel', 'Gutierrez', 44000041, '2009-01-08', 345345234, 3, NULL, '', ''),
(284, 'Joaquin', 'Torres', 44000042, '2009-03-21', 345456345, 3, NULL, '', ''),
(285, 'Catalina', 'Ortega', 44000043, '2009-07-14', 345567456, 3, NULL, '', ''),
(286, 'Pedro', 'Pacheco', 44000044, '2009-09-29', 345678567, 3, NULL, '', ''),
(287, 'Valeria', 'Rojas', 44000045, '2009-11-12', 345123456, 3, NULL, '', ''),
(288, 'Luis', 'Lara', 44000046, '2009-12-30', 345234567, 3, NULL, '', ''),
(289, 'Florencia', 'Navarro', 44000047, '2009-04-05', 345345678, 3, NULL, '', ''),
(290, 'Mariano', 'Molina', 44000048, '2009-05-15', 345456789, 3, NULL, '', ''),
(291, 'Carolina', 'Cruz', 44000049, '2009-06-27', 345567890, 3, NULL, '', ''),
(292, 'Eduardo', 'Gutierrez', 44000050, '2009-08-18', 345678901, 3, NULL, '', ''),
(293, 'Isabel', 'Vega', 44000051, '2009-10-31', 345789012, 3, NULL, '', ''),
(294, 'Gabriel', 'Castillo', 44000052, '2009-12-04', 345890123, 3, NULL, '', ''),
(295, 'Martina', 'Santos', 44000053, '2009-02-07', 345981234, 3, NULL, '', ''),
(296, 'Juan', 'Ramos', 44000054, '2009-04-17', 345672345, 3, NULL, '', ''),
(297, 'Andrea', 'Romero', 44000055, '2009-06-20', 345234123, 3, NULL, '', ''),
(298, 'Tomas', 'Peralta', 44000056, '2009-08-23', 345345234, 3, NULL, '', ''),
(299, 'Valentino', 'Guzman', 44000057, '2009-10-26', 345456345, 3, NULL, '', ''),
(300, 'Luciana', 'Jimenez', 44000058, '2009-12-12', 345567456, 3, NULL, '', ''),
(301, 'Mariana', 'Vargas', 44000059, '2009-02-14', 345678567, 3, NULL, '', ''),
(302, 'NicolÃ¡s', 'SÃ¡nchez', 44000060, '2009-05-15', 345123456, 3, NULL, '', ''),
(303, 'ValentÃ­n', 'Vera', 44000061, '2009-07-22', 345234567, 3, NULL, '', ''),
(304, 'Florencia', 'Gomez', 44000062, '2009-03-10', 345345678, 3, NULL, '', ''),
(305, 'Joaquin', 'Silva', 44000063, '2009-11-05', 345456789, 3, NULL, '', ''),
(306, 'Isabella', 'Perez', 44000064, '2009-09-18', 345567890, 3, NULL, '', ''),
(307, 'Santiago', 'Garcia', 44000065, '2009-04-30', 345678901, 3, NULL, '', ''),
(308, 'NicolÃ¡s', 'SÃ¡nchez', 45000000, '2010-05-15', 345123456, 3, NULL, '', ''),
(309, 'Valentina', 'Martinez', 45000001, '2010-07-22', 345234567, 3, NULL, '', ''),
(310, 'Santiago', 'Lopez', 45000002, '2010-03-10', 345345678, 3, NULL, '', ''),
(311, 'Isabella', 'Rodriguez', 45000003, '2010-11-05', 345456789, 3, NULL, '', ''),
(312, 'Miguel', 'Perez', 45000004, '2010-09-18', 345567890, 3, NULL, '', ''),
(313, 'Camila', 'Hernandez', 45000005, '2010-04-30', 345678901, 3, NULL, '', ''),
(314, 'Mateo', 'Fernandez', 45000006, '2010-06-14', 345789012, 3, NULL, '', ''),
(315, 'Sofia', 'Diaz', 45000007, '2010-12-25', 345890123, 3, NULL, '', ''),
(316, 'Matias', 'Santos', 45000008, '2010-08-03', 345981234, 3, NULL, '', ''),
(317, 'Lucas', 'Mariani', 45000009, '2010-10-09', 345672345, 3, NULL, '', ''),
(318, 'Daniel', 'Garcia', 45000010, '2010-05-15', 345234123, 3, NULL, '', ''),
(319, 'Elena', 'Moreno', 45000011, '2010-01-08', 345345234, 3, NULL, '', ''),
(320, 'Joaquin', 'Torres', 45000012, '2010-03-21', 345456345, 3, NULL, '', ''),
(321, 'Catalina', 'Ortega', 45000013, '2010-07-14', 345567456, 3, NULL, '', ''),
(322, 'Pedro', 'Pacheco', 45000014, '2010-09-29', 345678567, 3, NULL, '', ''),
(323, 'Valeria', 'Rojas', 45000015, '2010-11-12', 345123456, 3, NULL, '', ''),
(324, 'Luis', 'Lara', 45000016, '2010-12-30', 345234567, 3, NULL, '', ''),
(325, 'Florencia', 'Navarro', 45000017, '2010-04-05', 345345678, 3, NULL, '', ''),
(326, 'Mariano', 'Molina', 45000018, '2010-05-15', 345456789, 3, NULL, '', ''),
(327, 'Carolina', 'Cruz', 45000019, '2010-06-27', 345567890, 3, NULL, '', ''),
(328, 'Eduardo', 'Gutierrez', 45000020, '2010-08-18', 345678901, 3, NULL, '', ''),
(329, 'Isabel', 'Vega', 45000021, '2010-10-31', 345789012, 3, NULL, '', ''),
(330, 'Gabriel', 'Castillo', 45000022, '2010-12-04', 345890123, 3, NULL, '', ''),
(331, 'Martina', 'Santos', 45000023, '2010-02-07', 345981234, 3, NULL, '', ''),
(332, 'Juan', 'Ramos', 45000024, '2010-04-17', 345672345, 3, NULL, '', ''),
(333, 'Andrea', 'Romero', 45000025, '2010-06-20', 345234123, 3, NULL, '', ''),
(334, 'Tomas', 'Peralta', 45000026, '2010-08-23', 345345234, 3, NULL, '', ''),
(335, 'Valentino', 'Guzman', 45000027, '2010-10-26', 345456345, 3, NULL, '', ''),
(336, 'Luciana', 'Jimenez', 45000028, '2010-12-12', 345567456, 3, NULL, '', ''),
(337, 'Mariana', 'Vargas', 45000029, '2010-02-14', 345678567, 3, NULL, '', ''),
(338, 'NicolÃ¡s', 'SÃ¡nchez', 45000030, '2010-05-15', 345123456, 3, NULL, '', ''),
(339, 'ValentÃ­n', 'Vera', 45000031, '2010-07-22', 345234567, 3, NULL, '', ''),
(340, 'Florencia', 'Gomez', 45000032, '2010-03-10', 345345678, 3, NULL, '', ''),
(341, 'Joaquin', 'Silva', 45000033, '2010-11-05', 345456789, 3, NULL, '', ''),
(342, 'Isabella', 'Perez', 45000034, '2010-09-18', 345567890, 3, NULL, '', ''),
(343, 'Santiago', 'Garcia', 45000035, '2010-04-30', 345678901, 3, NULL, '', ''),
(344, 'Sofia', 'Martinez', 45000036, '2010-06-14', 345789012, 3, NULL, '', ''),
(345, 'Sebastian', 'Lopez', 45000037, '2010-12-25', 345890123, 3, NULL, '', ''),
(346, 'Valentina', 'Moreno', 45000038, '2010-08-03', 345981234, 3, NULL, '', ''),
(347, 'Matias', 'Rodriguez', 45000039, '2010-10-09', 345672345, 3, NULL, '', ''),
(348, 'Lucas', 'Mariani', 45000040, '2010-05-15', 345234123, 3, NULL, '', ''),
(349, 'Daniel', 'Gutierrez', 45000041, '2010-01-08', 345345234, 3, NULL, '', ''),
(350, 'Joaquin', 'Torres', 45000042, '2010-03-21', 345456345, 3, NULL, '', ''),
(351, 'Catalina', 'Ortega', 45000043, '2010-07-14', 345567456, 3, NULL, '', ''),
(352, 'Pedro', 'Pacheco', 45000044, '2010-09-29', 345678567, 3, NULL, '', ''),
(353, 'Valeria', 'Rojas', 45000045, '2010-11-12', 345123456, 3, NULL, '', ''),
(354, 'Luis', 'Lara', 45000046, '2010-12-30', 345234567, 3, NULL, '', ''),
(355, 'Florencia', 'Navarro', 45000047, '2010-04-05', 345345678, 3, NULL, '', ''),
(356, 'Mariano', 'Molina', 45000048, '2010-05-15', 345456789, 3, NULL, '', ''),
(357, 'Carolina', 'Cruz', 45000049, '2010-06-27', 345567890, 3, NULL, '', ''),
(358, 'Eduardo', 'Gutierrez', 45000050, '2010-08-18', 345678901, 3, NULL, '', ''),
(359, 'Isabel', 'Vega', 45000051, '2010-10-31', 345789012, 3, NULL, '', ''),
(360, 'Gabriel', 'Castillo', 45000052, '2010-12-04', 345890123, 3, NULL, '', ''),
(361, 'Martina', 'Santos', 45000053, '2010-02-07', 345981234, 3, NULL, '', ''),
(362, 'Juan', 'Ramos', 45000054, '2010-04-17', 345672345, 3, NULL, '', ''),
(363, 'Andrea', 'Romero', 45000055, '2010-06-20', 345234123, 3, NULL, '', ''),
(364, 'Tomas', 'Peralta', 45000056, '2010-08-23', 345345234, 3, NULL, '', ''),
(365, 'Valentino', 'Guzman', 45000057, '2010-10-26', 345456345, 3, NULL, '', ''),
(366, 'Luciana', 'Jimenez', 45000058, '2010-12-12', 345567456, 3, NULL, '', ''),
(367, 'Mariana', 'Vargas', 45000059, '2010-02-14', 345678567, 3, NULL, '', ''),
(368, 'NicolÃ¡s', 'SÃ¡nchez', 45000060, '2010-05-15', 345123456, 3, NULL, '', ''),
(369, 'ValentÃ­n', 'Vera', 45000061, '2010-07-22', 345234567, 3, NULL, '', ''),
(370, 'Florencia', 'Gomez', 45000062, '2010-03-10', 345345678, 3, NULL, '', ''),
(371, 'Joaquin', 'Silva', 45000063, '2010-11-05', 345456789, 3, NULL, '', ''),
(372, 'Isabella', 'Perez', 45000064, '2010-09-18', 345567890, 2, NULL, '', ''),
(373, 'Santiago', 'Garcia', 45000065, '2010-04-30', 345678901, 2, NULL, '', ''),
(374, 'Sofia', 'Martinez', 45000066, '2010-06-14', 345789012, 2, NULL, '', ''),
(375, 'Sebastian', 'Lopez', 45000067, '2010-12-25', 345890123, 2, NULL, '', ''),
(376, 'Valentina', 'Moreno', 45000068, '2010-08-03', 345981234, 2, NULL, '', ''),
(377, 'Matias', 'Rodriguez', 45000069, '2010-10-09', 345672345, 2, NULL, '', ''),
(378, 'Lucas', 'Mariani', 45000070, '2010-05-15', 345234123, 2, NULL, '', ''),
(379, 'Daniel', 'Gutierrez', 45000071, '2010-01-08', 345345234, 2, NULL, '', ''),
(380, 'Joaquin', 'Torres', 45000072, '2010-03-21', 345456345, 2, NULL, '', ''),
(381, 'Catalina', 'Ortega', 45000073, '2010-07-14', 345567456, 2, NULL, '', ''),
(382, 'Pedro', 'Pacheco', 45000074, '2010-09-29', 345678567, 2, NULL, '', ''),
(383, 'Valeria', 'Rojas', 45000075, '2010-11-12', 345123456, 2, NULL, '', ''),
(384, 'Luis', 'Lara', 45000076, '2010-12-30', 345234567, 2, NULL, '', ''),
(385, 'Florencia', 'Navarro', 45000077, '2010-04-05', 345345678, 2, NULL, '', ''),
(386, 'Mariano', 'Molina', 45000078, '2010-05-15', 345456789, 2, NULL, '', ''),
(387, 'Carolina', 'Cruz', 45000079, '2010-06-27', 345567890, 2, NULL, '', ''),
(388, 'Eduardo', 'Gutierrez', 45000080, '2010-08-18', 345678901, 2, NULL, '', ''),
(389, 'Marta', 'GonzÃ¡lez', 28765432, '1995-02-15', 345123456, 1, NULL, '', ''),
(390, 'Juan', 'Rodriguez', 30234567, '1990-07-22', 345234567, 1, NULL, '', ''),
(391, 'Laura', 'Lopez', 31234567, '1988-03-10', 345345678, 1, NULL, '', ''),
(392, 'Carlos', 'Mariani', 32987654, '1977-11-05', 345411111, 1, NULL, 'carlosMartinCampeon@gmail.com', 'Calle Las Lilas 222'),
(393, 'Ana', 'Perez', 28098765, '1998-09-18', 345567890, 1, NULL, '', ''),
(394, 'Luis', 'Fernandez', 32456789, '1975-04-30', 345678901, 1, NULL, '', ''),
(395, 'Sofia', 'Hernandez', 33567890, '1970-06-14', 345789012, 1, NULL, '', ''),
(396, 'Elena', 'Garcia', 31234567, '1985-12-25', 345890123, 1, NULL, '', ''),
(397, 'Diego', 'Diaz', 29876543, '1994-08-03', 345981234, 1, NULL, '', ''),
(398, 'Valentina', 'Silva', 32234567, '1992-10-09', 345672345, 1, NULL, '', ''),
(399, 'Mariano', 'Moreno', 31456789, '1996-05-15', 345234123, 1, NULL, '', ''),
(400, 'Carolina', 'Gomez', 30123456, '1991-01-08', 345345234, 1, NULL, '', ''),
(401, 'Mariani', 'Torres', 33876543, '1972-03-21', 345456345, 1, NULL, '', ''),
(402, 'Florencia', 'Ortega', 32876543, '1978-07-14', 345567456, 1, NULL, '', ''),
(403, 'Joaquin', 'Pacheco', 33678901, '1973-09-29', 345678567, 1, NULL, '', ''),
(404, 'Valeria', 'Rojas', 31543210, '1997-11-12', 345123456, 1, NULL, '', ''),
(405, 'Miguel', 'Lara', 29432109, '1999-12-30', 345234567, 1, NULL, '', ''),
(406, 'Sara', 'Navarro', 32210987, '1986-02-14', 345345678, 1, NULL, '', ''),
(407, 'Lucas', 'Molina', 30321098, '1993-04-05', 345456789, 1, NULL, '', ''),
(408, 'Gabriel', 'Cruz', 32098765, '1976-06-27', 345567890, 1, NULL, '', ''),
(409, 'Daniel', 'Gutierrez', 31987654, '1974-08-18', 345678901, 1, NULL, '', ''),
(410, 'Patricia', 'Vega', 29543210, '1990-10-31', 345789012, 1, NULL, '', ''),
(411, 'Ricardo', 'Castillo', 30987654, '1989-12-04', 345890123, 1, NULL, '', ''),
(412, 'Fernanda', 'Santos', 31876543, '1998-02-07', 345981234, 1, NULL, '', ''),
(413, 'Pablo', 'Ramos', 31123456, '1987-04-17', 345672345, 1, NULL, '', ''),
(414, 'Andrea', 'Romero', 32765432, '1979-06-20', 345234123, 1, NULL, '', ''),
(415, 'Camilo', 'Peralta', 32543210, '1971-08-23', 345345234, 1, NULL, '', ''),
(416, 'Marcela', 'Guzman', 33098765, '1978-10-26', 345456345, 1, NULL, '', ''),
(417, 'Eduardo', 'Jimenez', 32109876, '1983-12-12', 345567456, 1, NULL, '', ''),
(418, 'Romina', 'Vargas', 32654321, '1977-02-14', 345678567, 1, NULL, '', ''),
(419, 'Lucas', 'Martinez', 39000000, '2006-02-15', 345123456, 2, NULL, '', ''),
(420, 'Valentina', 'Gomez', 39000001, '2005-07-22', 345234567, 2, NULL, '', ''),
(421, 'Sebastian', 'Hernandez', 39000002, '2004-03-10', 345345678, 2, NULL, '', ''),
(422, 'Isabella', 'Lopez', 39000003, '2006-11-05', 345456789, 2, NULL, '', ''),
(423, 'Miguel', 'Rodriguez', 39000004, '2007-09-18', 345567890, 2, NULL, '', ''),
(424, 'Camila', 'Perez', 39000005, '2006-04-30', 345678901, 2, NULL, '', ''),
(425, 'Mateo', 'Fernandez', 39000006, '2004-06-14', 345789012, 2, NULL, '', ''),
(426, 'Sofia', 'Diaz', 39000007, '2005-12-25', 345890123, 2, NULL, '', ''),
(427, 'Matias', 'Santos', 39000008, '2003-08-03', 345981234, 2, NULL, '', ''),
(428, 'Lucas', 'Mariani', 39000009, '2004-10-09', 345672345, 2, NULL, '', ''),
(429, 'Daniel', 'Garcia', 39000010, '2005-05-15', 345234123, 2, NULL, '', ''),
(430, 'Elena', 'Moreno', 39000011, '2005-01-08', 345345234, 2, NULL, '', ''),
(431, 'Joaquin', 'Torres', 39000012, '2003-03-21', 345456345, 2, NULL, '', ''),
(432, 'Catalina', 'Ortega', 39000013, '2004-07-14', 345567456, 2, NULL, '', ''),
(433, 'Pedro', 'Pacheco', 39000014, '2003-09-29', 345678567, 2, NULL, '', ''),
(434, 'Valeria', 'Rojas', 39000015, '2006-11-12', 345123456, 2, NULL, '', ''),
(435, 'Luis', 'Lara', 39000016, '2007-12-30', 345234567, 2, NULL, '', ''),
(436, 'Florencia', 'Navarro', 39000017, '2004-02-14', 345345678, 2, NULL, '', ''),
(437, 'Mariano', 'Molina', 39000018, '2005-04-05', 345456789, 3, NULL, '', ''),
(438, 'Carolina', 'Cruz', 39000019, '2006-06-27', 345567890, 3, NULL, '', ''),
(439, 'Eduardo', 'Gutierrez', 39000020, '2003-08-18', 345678901, 3, NULL, '', ''),
(440, 'Isabel', 'Vega', 39000021, '2006-10-31', 345789012, 3, NULL, '', ''),
(441, 'Gabriel', 'Castillo', 39000022, '2005-12-04', 345890123, 3, NULL, '', ''),
(442, 'Martina', 'Santos', 39000023, '2007-02-07', 345981234, 3, NULL, '', ''),
(443, 'Juan', 'Ramos', 39000024, '2004-04-17', 345672345, 3, NULL, '', ''),
(444, 'Andrea', 'Romero', 39000025, '2003-06-20', 345234123, 3, NULL, '', ''),
(445, 'Tomas', 'Peralta', 39000026, '2002-08-23', 345345234, 3, NULL, '', ''),
(446, 'Valentino', 'Guzman', 39000027, '2005-10-26', 345456345, 3, NULL, '', ''),
(447, 'Luciana', 'Jimenez', 39000028, '2004-12-12', 345567456, 3, NULL, '', ''),
(448, 'Mariana', 'Vargas', 39000029, '2003-02-14', 345678567, 2, NULL, '', ''),
(449, 'Lucas', 'Martinez', 39000000, '2006-02-15', 345123456, 3, NULL, '', ''),
(450, 'Valentina', 'Gomez', 39000001, '2005-07-22', 345234567, 3, NULL, '', ''),
(451, 'Sebastian', 'Hernandez', 39000002, '2004-03-10', 345345678, 3, NULL, '', ''),
(452, 'Isabella', 'Lopez', 39000003, '2006-11-05', 345456789, 3, NULL, '', ''),
(453, 'Miguel', 'Rodriguez', 39000004, '2007-09-18', 345567890, 3, NULL, '', ''),
(454, 'Camila', 'Perez', 39000005, '2006-04-30', 345678901, 3, NULL, '', ''),
(455, 'Mateo', 'Fernandez', 39000006, '2004-06-14', 345789012, 3, NULL, '', ''),
(456, 'Sofia', 'Diaz', 39000007, '2005-12-25', 345890123, 3, NULL, '', ''),
(457, 'Matias', 'Santos', 39000008, '2003-08-03', 345981234, 3, NULL, '', ''),
(458, 'Lucas', 'Mariani', 39000009, '2004-10-09', 345672345, 3, NULL, '', ''),
(459, 'Daniel', 'Garcia', 39000010, '2005-05-15', 345234123, 3, NULL, '', ''),
(460, 'Elena', 'Moreno', 39000011, '2005-01-08', 345345234, 3, NULL, '', ''),
(461, 'Joaquin', 'Torres', 39000012, '2003-03-21', 345456345, 3, NULL, '', ''),
(462, 'Catalina', 'Ortega', 39000013, '2004-07-14', 345567456, 3, NULL, '', ''),
(463, 'Pedro', 'Pacheco', 39000014, '2003-09-29', 345678567, 3, NULL, '', ''),
(464, 'Valeria', 'Rojas', 39000015, '2006-11-12', 345123456, 3, NULL, '', ''),
(465, 'Luis', 'Lara', 39000016, '2007-12-30', 345234567, 3, NULL, '', ''),
(466, 'Florencia', 'Navarro', 39000017, '2004-02-14', 345345678, 3, NULL, '', ''),
(467, 'Mariano', 'Molina', 39000018, '2005-04-05', 345456789, 3, NULL, '', ''),
(468, 'Carolina', 'Cruz', 39000019, '2006-06-27', 345567890, 2, NULL, '', ''),
(469, 'Eduardo', 'Gutierrez', 39000020, '2003-08-18', 345678901, 2, NULL, '', ''),
(470, 'Isabel', 'Vega', 39000021, '2006-10-31', 345789012, 2, NULL, '', ''),
(471, 'Gabriel', 'Castillo', 39000022, '2005-12-04', 345890123, 2, NULL, '', ''),
(472, 'Martina', 'Santos', 39000023, '2007-02-07', 345981234, 2, NULL, '', ''),
(473, 'Juan', 'Ramos', 39000024, '2004-04-17', 345672345, 2, NULL, '', ''),
(474, 'Andrea', 'Romero', 39000025, '2003-06-20', 345234123, 2, NULL, '', ''),
(475, 'Tomas', 'Peralta', 39000026, '2002-08-23', 345345234, 2, NULL, '', ''),
(476, 'Valentino', 'Guzman', 39000027, '2005-10-26', 345456345, 2, NULL, '', ''),
(477, 'Luciana', 'Jimenez', 39000028, '2004-12-12', 345567456, 2, NULL, '', ''),
(478, 'Mariana', 'Vargas', 39000029, '2003-02-14', 345678567, 2, NULL, '', ''),
(479, 'Lucas', 'Gomez', 41000000, '2006-05-15', 345123456, 2, NULL, '', ''),
(480, 'Valentina', 'Martinez', 41000001, '2006-07-22', 345234567, 2, NULL, '', ''),
(481, 'Santiago', 'Lopez', 41000002, '2006-03-10', 345345678, 2, NULL, '', ''),
(482, 'Isabella', 'Rodriguez', 41000003, '2006-11-05', 345456789, 2, NULL, '', ''),
(483, 'Miguel', 'Perez', 41000004, '2006-09-18', 345567890, 2, NULL, '', ''),
(484, 'Camila', 'Hernandez', 41000005, '2006-04-30', 345678901, 2, NULL, '', ''),
(485, 'Mateo', 'Fernandez', 41000006, '2006-06-14', 345789012, 2, NULL, '', ''),
(486, 'Sofia', 'Diaz', 41000007, '2006-12-25', 345890123, 2, NULL, '', ''),
(487, 'Matias', 'Santos', 41000008, '2006-08-03', 345981234, 2, NULL, '', ''),
(488, 'Lucas', 'Mariani', 41000009, '2006-10-09', 345672345, 3, NULL, '', ''),
(489, 'Daniel', 'Garcia', 41000010, '2006-05-15', 345234123, 3, NULL, '', ''),
(490, 'Elena', 'Moreno', 41000011, '2006-01-08', 345345234, 3, NULL, '', ''),
(491, 'Joaquin', 'Torres', 41000012, '2006-03-21', 345456345, 3, NULL, '', ''),
(492, 'Catalina', 'Ortega', 41000013, '2006-07-14', 345567456, 3, NULL, '', ''),
(493, 'Pedro', 'Pacheco', 41000014, '2006-09-29', 345678567, 3, NULL, '', ''),
(494, 'Valeria', 'Rojas', 41000015, '2006-11-12', 345123456, 3, NULL, '', ''),
(495, 'Luis', 'Lara', 41000016, '2006-12-30', 345234567, 3, NULL, '', ''),
(496, 'Florencia', 'Navarro', 41000017, '2006-04-05', 345345678, 3, NULL, '', ''),
(497, 'Mariano', 'Molina', 41000018, '2006-05-15', 345456789, 3, NULL, '', ''),
(498, 'Carolina', 'Cruz', 41000019, '2006-06-27', 345567890, 3, NULL, '', ''),
(499, 'Eduardo', 'Gutierrez', 41000020, '2006-08-18', 345678901, 3, NULL, '', ''),
(500, 'Isabel', 'Vega', 41000021, '2006-10-31', 345789012, 3, NULL, '', ''),
(501, 'Gabriel', 'Castillo', 41000022, '2006-12-04', 345890123, 3, NULL, '', ''),
(502, 'Martina', 'Santos', 41000023, '2006-02-07', 345981234, 2, NULL, '', ''),
(503, 'Juan', 'Ramos', 41000024, '2006-04-17', 345672345, 2, NULL, '', ''),
(504, 'Andrea', 'Romero', 41000025, '2006-06-20', 345234123, 2, NULL, '', ''),
(505, 'Tomas', 'Peralta', 41000026, '2006-08-23', 345345234, 2, NULL, '', ''),
(506, 'Valentino', 'Guzman', 41000027, '2006-10-26', 345456345, 2, NULL, '', ''),
(507, 'Luciana', 'Jimenez', 41000028, '2006-12-12', 345567456, 2, NULL, '', ''),
(508, 'Mariana', 'Vargas', 41000029, '2006-02-14', 345678567, 2, NULL, '', ''),
(509, 'NicolÃ¡s', 'SÃ¡nchez', 41000030, '2006-05-15', 345123456, 2, NULL, '', ''),
(510, 'ValentÃ­n', 'Vera', 41000031, '2006-07-22', 345234567, 2, NULL, '', ''),
(511, 'Florencia', 'Gomez', 41000032, '2006-03-10', 345345678, 2, NULL, '', ''),
(512, 'Joaquin', 'Silva', 41000033, '2006-11-05', 345456789, 2, NULL, '', ''),
(513, 'Isabella', 'Perez', 41000034, '2006-09-18', 345567890, 2, NULL, '', ''),
(514, 'Santiago', 'Garcia', 41000035, '2006-04-30', 345678901, 2, NULL, '', ''),
(515, 'Sofia', 'Martinez', 41000036, '2006-06-14', 345789012, 2, NULL, '', ''),
(516, 'Sebastian', 'Lopez', 41000037, '2006-12-25', 345890123, 2, NULL, '', ''),
(517, 'Valentina', 'Moreno', 41000038, '2006-08-03', 345981234, 2, NULL, '', ''),
(518, 'Matias', 'Rodriguez', 41000039, '2006-10-09', 345672345, 2, NULL, '', ''),
(519, 'NicolÃ¡s', 'SÃ¡nchez', 42000000, '2007-05-15', 345123456, 1, NULL, '', ''),
(520, 'Valentina', 'Martinez', 42000001, '2007-07-22', 345234567, 2, NULL, '', ''),
(521, 'Santiago', 'Lopez', 42000002, '2007-03-10', 345345678, 2, NULL, '', ''),
(522, 'Isabella', 'Rodriguez', 42000003, '2007-11-05', 345456789, 2, NULL, '', ''),
(523, 'Miguel', 'Perez', 42000004, '2007-09-18', 345567890, 2, NULL, '', ''),
(524, 'Camila', 'Hernandez', 42000005, '2007-04-30', 345678901, 2, NULL, '', ''),
(525, 'Mateo', 'Fernandez', 42000006, '2007-06-14', 345789012, 2, NULL, '', ''),
(526, 'Sofia', 'Diaz', 42000007, '2007-12-25', 345890123, 2, NULL, '', ''),
(527, 'Matias', 'Santos', 42000008, '2007-08-03', 345981234, 2, NULL, '', ''),
(528, 'Lucas', 'Mariani', 42000009, '2007-10-09', 345672345, 2, NULL, '', ''),
(529, 'Daniel', 'Garcia', 42000010, '2007-05-15', 345234123, 2, NULL, '', ''),
(530, 'Elena', 'Moreno', 42000011, '2007-01-08', 345345234, 2, NULL, '', ''),
(531, 'Joaquin', 'Torres', 42000012, '2007-03-21', 345456345, 2, NULL, '', ''),
(532, 'Catalina', 'Ortega', 42000013, '2007-07-14', 345567456, 2, NULL, '', ''),
(533, 'Pedro', 'Pacheco', 42000014, '2007-09-29', 345678567, 2, NULL, '', ''),
(534, 'Valeria', 'Rojas', 42000015, '2007-11-12', 345123456, 3, NULL, '', ''),
(535, 'Luis', 'Lara', 42000016, '2007-12-30', 345234567, 3, NULL, '', ''),
(536, 'Florencia', 'Navarro', 42000017, '2007-04-05', 345345678, 3, NULL, '', ''),
(537, 'Mariano', 'Molina', 42000018, '2007-05-15', 345456789, 3, NULL, '', ''),
(538, 'Carolina', 'Cruz', 42000019, '2007-06-27', 345567890, 3, NULL, '', ''),
(539, 'Eduardo', 'Gutierrez', 42000020, '2007-08-18', 345678901, 3, NULL, '', ''),
(540, 'Isabel', 'Vega', 42000021, '2007-10-31', 345789012, 3, NULL, '', ''),
(541, 'Gabriel', 'Castillo', 42000022, '2007-12-04', 345890123, 3, NULL, '', ''),
(542, 'Martina', 'Santos', 42000023, '2007-02-07', 345981234, 3, NULL, '', ''),
(543, 'Juan', 'Ramos', 42000024, '2007-04-17', 345672345, 3, NULL, '', ''),
(544, 'Andrea', 'Romero', 42000025, '2007-06-20', 345234123, 3, NULL, '', ''),
(545, 'Tomas', 'Peralta', 42000026, '2007-08-23', 345345234, 3, NULL, '', ''),
(546, 'Valentino', 'Guzman', 42000027, '2007-10-26', 345456345, 3, NULL, '', ''),
(547, 'Luciana', 'Jimenez', 42000028, '2007-12-12', 345567456, 3, NULL, '', ''),
(548, 'Mariana', 'Vargas', 42000029, '2007-02-14', 345678567, 3, NULL, '', ''),
(549, 'NicolÃ¡s', 'SÃ¡nchez', 42000030, '2007-05-15', 345123456, 3, NULL, '', ''),
(550, 'ValentÃ­n', 'Vera', 42000031, '2007-07-22', 345234567, 3, NULL, '', ''),
(551, 'Florencia', 'Gomez', 42000032, '2007-03-10', 345345678, 3, NULL, '', ''),
(552, 'Joaquin', 'Silva', 42000033, '2007-11-05', 345456789, 3, NULL, '', ''),
(553, 'Isabella', 'Perez', 42000034, '2007-09-18', 345567890, 3, NULL, '', ''),
(554, 'Santiago', 'Garcia', 42000035, '2007-04-30', 345678901, 3, NULL, '', ''),
(555, 'Sofia', 'Martinez', 42000036, '2007-06-14', 345789012, 3, NULL, '', ''),
(556, 'Sebastian', 'Lopez', 42000037, '2007-12-25', 345890123, 3, NULL, '', ''),
(557, 'Valentina', 'Moreno', 42000038, '2007-08-03', 345981234, 3, NULL, '', ''),
(558, 'Matias', 'Rodriguez', 42000039, '2007-10-09', 345672345, 3, NULL, '', ''),
(559, 'Lucas', 'Mariani', 42000040, '2007-05-15', 345234123, 3, NULL, '', ''),
(560, 'Daniel', 'Gutierrez', 42000041, '2007-01-08', 345345234, 3, NULL, '', ''),
(561, 'Joaquin', 'Torres', 42000042, '2007-03-21', 345456345, 3, NULL, '', ''),
(562, 'Catalina', 'Ortega', 42000043, '2007-07-14', 345567456, 3, NULL, '', ''),
(563, 'Pedro', 'Pacheco', 42000044, '2007-09-29', 345678567, 3, NULL, '', ''),
(564, 'Valeria', 'Rojas', 42000045, '2007-11-12', 345123456, 3, NULL, '', ''),
(565, 'Luis', 'Lara', 42000046, '2007-12-30', 345234567, 3, NULL, '', ''),
(566, 'Florencia', 'Navarro', 42000047, '2007-04-05', 345345678, 3, NULL, '', ''),
(567, 'Mariano', 'Molina', 42000048, '2007-05-15', 345456789, 3, NULL, '', ''),
(568, 'Carolina', 'Cruz', 42000049, '2007-06-27', 345567890, 3, NULL, '', ''),
(569, 'Eduardo', 'Gutierrez', 42000050, '2007-08-18', 345678901, 3, NULL, '', ''),
(570, 'NicolÃ¡s', 'SÃ¡nchez', 43000000, '2008-05-15', 345123456, 2, NULL, '', ''),
(571, 'Valentina', 'Martinez', 43000001, '2008-07-22', 345234567, 2, NULL, '', ''),
(572, 'Santiago', 'Lopez', 43000002, '2008-03-10', 345345678, 2, NULL, '', ''),
(573, 'Isabella', 'Rodriguez', 43000003, '2008-11-05', 345456789, 2, NULL, '', ''),
(574, 'Miguel', 'Perez', 43000004, '2008-09-18', 345567890, 2, NULL, '', ''),
(575, 'Camila', 'Hernandez', 43000005, '2008-04-30', 345678901, 2, NULL, '', ''),
(576, 'Mateo', 'Fernandez', 43000006, '2008-06-14', 345789012, 2, NULL, '', ''),
(577, 'Sofia', 'Diaz', 43000007, '2008-12-25', 345890123, 2, NULL, '', ''),
(578, 'Matias', 'Santos', 43000008, '2008-08-03', 345981234, 2, NULL, '', ''),
(579, 'Lucas', 'Mariani', 43000009, '2008-10-09', 345672345, 2, NULL, '', ''),
(580, 'Daniel', 'Garcia', 43000010, '2008-05-15', 345234123, 2, NULL, '', ''),
(581, 'Elena', 'Moreno', 43000011, '2008-01-08', 345345234, 2, NULL, '', ''),
(582, 'Joaquin', 'Torres', 43000012, '2008-03-21', 345456345, 2, NULL, '', ''),
(583, 'Catalina', 'Ortega', 43000013, '2008-07-14', 345567456, 2, NULL, '', ''),
(584, 'Pedro', 'Pacheco', 43000014, '2008-09-29', 345678567, 2, NULL, '', ''),
(585, 'Valeria', 'Rojas', 43000015, '2008-11-12', 345123456, 2, NULL, '', ''),
(586, 'Luis', 'Lara', 43000016, '2008-12-30', 345234567, 2, NULL, '', ''),
(587, 'Florencia', 'Navarro', 43000017, '2008-04-05', 345345678, 2, NULL, '', ''),
(588, 'Mariano', 'Molina', 43000018, '2008-05-15', 345456789, 2, NULL, '', ''),
(589, 'Carolina', 'Cruz', 43000019, '2008-06-27', 345567890, 2, NULL, '', ''),
(590, 'Eduardo', 'Gutierrez', 43000020, '2008-08-18', 345678901, 2, NULL, '', ''),
(591, 'Isabel', 'Vega', 43000021, '2008-10-31', 345789012, 2, NULL, '', ''),
(592, 'Gabriel', 'Castillo', 43000022, '2008-12-04', 345890123, 2, NULL, '', ''),
(593, 'Martina', 'Santos', 43000023, '2008-02-07', 345981234, 2, NULL, '', ''),
(594, 'Juan', 'Ramos', 43000024, '2008-04-17', 345672345, 2, NULL, '', ''),
(595, 'Andrea', 'Romero', 43000025, '2008-06-20', 345234123, 3, NULL, '', ''),
(596, 'Tomas', 'Peralta', 43000026, '2008-08-23', 345345234, 3, NULL, '', ''),
(597, 'Valentino', 'Guzman', 43000027, '2008-10-26', 345456345, 3, NULL, '', ''),
(598, 'Luciana', 'Jimenez', 43000028, '2008-12-12', 345567456, 3, NULL, '', ''),
(599, 'Mariana', 'Vargas', 43000029, '2008-02-14', 345678567, 3, NULL, '', ''),
(600, 'NicolÃ¡s', 'SÃ¡nchez', 43000030, '2008-05-15', 345123456, 3, NULL, '', ''),
(601, 'ValentÃ­n', 'Vera', 43000031, '2008-07-22', 345234567, 3, NULL, '', ''),
(602, 'Florencia', 'Gomez', 43000032, '2008-03-10', 345345678, 3, NULL, '', ''),
(603, 'Joaquin', 'Silva', 43000033, '2008-11-05', 345456789, 3, NULL, '', ''),
(604, 'Isabella', 'Perez', 43000034, '2008-09-18', 345567890, 3, NULL, '', ''),
(605, 'Santiago', 'Garcia', 43000035, '2008-04-30', 345678901, 3, NULL, '', ''),
(606, 'Sofia', 'Martinez', 43000036, '2008-06-14', 345789012, 3, NULL, '', ''),
(607, 'Sebastian', 'Lopez', 43000037, '2008-12-25', 345890123, 3, NULL, '', ''),
(608, 'Valentina', 'Moreno', 43000038, '2008-08-03', 345981234, 3, NULL, '', ''),
(609, 'Matias', 'Rodriguez', 43000039, '2008-10-09', 345672345, 3, NULL, '', ''),
(610, 'Lucas', 'Mariani', 43000040, '2008-05-15', 345234123, 3, NULL, '', ''),
(611, 'Daniel', 'Gutierrez', 43000041, '2008-01-08', 345345234, 3, NULL, '', ''),
(612, 'Joaquin', 'Torres', 43000042, '2008-03-21', 345456345, 3, NULL, '', ''),
(613, 'Catalina', 'Ortega', 43000043, '2008-07-14', 345567456, 3, NULL, '', ''),
(614, 'Pedro', 'Pacheco', 43000044, '2008-09-29', 345678567, 3, NULL, '', ''),
(615, 'Valeria', 'Rojas', 43000045, '2008-11-12', 345123456, 3, NULL, '', ''),
(616, 'Luis', 'Lara', 43000046, '2008-12-30', 345234567, 3, NULL, '', ''),
(617, 'Florencia', 'Navarro', 43000047, '2008-04-05', 345345678, 3, NULL, '', ''),
(618, 'Mariano', 'Molina', 43000048, '2008-05-15', 345456789, 3, NULL, '', ''),
(619, 'Carolina', 'Cruz', 43000049, '2008-06-27', 345567890, 3, NULL, '', ''),
(620, 'Eduardo', 'Gutierrez', 43000050, '2008-08-18', 345678901, 3, NULL, '', ''),
(621, 'Isabel', 'Vega', 43000051, '2008-10-31', 345789012, 3, NULL, '', ''),
(622, 'Gabriel', 'Castillo', 43000052, '2008-12-04', 345890123, 3, NULL, '', ''),
(623, 'Martina', 'Santos', 43000053, '2008-02-07', 345981234, 3, NULL, '', ''),
(624, 'Juan', 'Ramos', 43000054, '2008-04-17', 345672345, 3, NULL, '', ''),
(625, 'Andrea', 'Romero', 43000055, '2008-06-20', 345234123, 3, NULL, '', ''),
(626, 'Tomas', 'Peralta', 43000056, '2008-08-23', 345345234, 3, NULL, '', ''),
(627, 'Valentino', 'Guzman', 43000057, '2008-10-26', 345456345, 3, NULL, '', ''),
(628, 'Luciana', 'Jimenez', 43000058, '2008-12-12', 345567456, 3, NULL, '', ''),
(629, 'Mariana', 'Vargas', 43000059, '2008-02-14', 345678567, 3, NULL, '', ''),
(630, 'NicolÃ¡s', 'SÃ¡nchez', 44000000, '2009-05-15', 345123456, 2, NULL, '', ''),
(631, 'Valentina', 'Martinez', 44000001, '2009-07-22', 345234567, 2, NULL, '', ''),
(632, 'Santiago', 'Lopez', 44000002, '2009-03-10', 345345678, 2, NULL, '', ''),
(633, 'Isabella', 'Rodriguez', 44000003, '2009-11-05', 345456789, 2, NULL, '', ''),
(634, 'Miguel', 'Perez', 44000004, '2009-09-18', 345567890, 2, NULL, '', ''),
(635, 'Camila', 'Hernandez', 44000005, '2009-04-30', 345678901, 2, NULL, '', ''),
(636, 'Mateo', 'Fernandez', 44000006, '2009-06-14', 345789012, 2, NULL, '', ''),
(637, 'Sofia', 'Diaz', 44000007, '2009-12-25', 345890123, 2, NULL, '', ''),
(638, 'Matias', 'Santos', 44000008, '2009-08-03', 345981234, 2, NULL, '', '');
INSERT INTO `usuarios` VALUES
(639, 'Lucas', 'Mariani', 44000009, '2009-10-09', 345672345, 2, NULL, '', ''),
(640, 'Daniel', 'Garcia', 44000010, '2009-05-15', 345234123, 2, NULL, '', ''),
(641, 'Elena', 'Moreno', 44000011, '2009-01-08', 345345234, 2, NULL, '', ''),
(642, 'Joaquin', 'Torres', 44000012, '2009-03-21', 345456345, 2, NULL, '', ''),
(643, 'Catalina', 'Ortega', 44000013, '2009-07-14', 345567456, 2, NULL, '', ''),
(644, 'Pedro', 'Pacheco', 44000014, '2009-09-29', 345678567, 2, NULL, '', ''),
(645, 'Valeria', 'Rojas', 44000015, '2009-11-12', 345123456, 2, NULL, '', ''),
(646, 'Luis', 'Lara', 44000016, '2009-12-30', 345234567, 2, NULL, '', ''),
(647, 'Florencia', 'Navarro', 44000017, '2009-04-05', 345345678, 3, NULL, '', ''),
(648, 'Mariano', 'Molina', 44000018, '2009-05-15', 345456789, 3, NULL, '', ''),
(649, 'Carolina', 'Cruz', 44000019, '2009-06-27', 345567890, 3, NULL, '', ''),
(650, 'Eduardo', 'Gutierrez', 44000020, '2009-08-18', 345678901, 3, NULL, '', ''),
(651, 'Isabel', 'Vega', 44000021, '2009-10-31', 345789012, 3, NULL, '', ''),
(652, 'Gabriel', 'Castillo', 44000022, '2009-12-04', 345890123, 3, NULL, '', ''),
(653, 'Martina', 'Santos', 44000023, '2009-02-07', 345981234, 3, NULL, '', ''),
(654, 'Juan', 'Ramos', 44000024, '2009-04-17', 345672345, 3, NULL, '', ''),
(655, 'Andrea', 'Romero', 44000025, '2009-06-20', 345234123, 3, NULL, '', ''),
(656, 'Tomas', 'Peralta', 44000026, '2009-08-23', 345345234, 3, NULL, '', ''),
(657, 'Valentino', 'Guzman', 44000027, '2009-10-26', 345456345, 3, NULL, '', ''),
(658, 'Luciana', 'Jimenez', 44000028, '2009-12-12', 345567456, 3, NULL, '', ''),
(659, 'Mariana', 'Vargas', 44000029, '2009-02-14', 345678567, 3, NULL, '', ''),
(660, 'NicolÃ¡s', 'SÃ¡nchez', 44000030, '2009-05-15', 345123456, 3, NULL, '', ''),
(661, 'ValentÃ­n', 'Vera', 44000031, '2009-07-22', 345234567, 3, NULL, '', ''),
(662, 'Florencia', 'Gomez', 44000032, '2009-03-10', 345345678, 3, NULL, '', ''),
(663, 'Joaquin', 'Silva', 44000033, '2009-11-05', 345456789, 3, NULL, '', ''),
(664, 'Isabella', 'Perez', 44000034, '2009-09-18', 345567890, 3, NULL, '', ''),
(665, 'Santiago', 'Garcia', 44000035, '2009-04-30', 345678901, 3, NULL, '', ''),
(666, 'Sofia', 'Martinez', 44000036, '2009-06-14', 345789012, 3, NULL, '', ''),
(667, 'Sebastian', 'Lopez', 44000037, '2009-12-25', 345890123, 3, NULL, '', ''),
(668, 'Valentina', 'Moreno', 44000038, '2009-08-03', 345981234, 3, NULL, '', ''),
(669, 'Matias', 'Rodriguez', 44000039, '2009-10-09', 345672345, 3, NULL, '', ''),
(670, 'Lucas', 'Mariani', 44000040, '2009-05-15', 345234123, 3, NULL, '', ''),
(671, 'Daniel', 'Gutierrez', 44000041, '2009-01-08', 345345234, 3, NULL, '', ''),
(672, 'Joaquin', 'Torres', 44000042, '2009-03-21', 345456345, 3, NULL, '', ''),
(673, 'Catalina', 'Ortega', 44000043, '2009-07-14', 345567456, 3, NULL, '', ''),
(674, 'Pedro', 'Pacheco', 44000044, '2009-09-29', 345678567, 3, NULL, '', ''),
(675, 'Valeria', 'Rojas', 44000045, '2009-11-12', 345123456, 3, NULL, '', ''),
(676, 'Luis', 'Lara', 44000046, '2009-12-30', 345234567, 3, NULL, '', ''),
(677, 'Florencia', 'Navarro', 44000047, '2009-04-05', 345345678, 3, NULL, '', ''),
(678, 'Mariano', 'Molina', 44000048, '2009-05-15', 345456789, 3, NULL, '', ''),
(679, 'Carolina', 'Cruz', 44000049, '2009-06-27', 345567890, 3, NULL, '', ''),
(680, 'Eduardo', 'Gutierrez', 44000050, '2009-08-18', 345678901, 3, NULL, '', ''),
(681, 'Isabel', 'Vega', 44000051, '2009-10-31', 345789012, 3, NULL, '', ''),
(682, 'Gabriel', 'Castillo', 44000052, '2009-12-04', 345890123, 3, NULL, '', ''),
(683, 'Martina', 'Santos', 44000053, '2009-02-07', 345981234, 3, NULL, '', ''),
(684, 'Juan', 'Ramos', 44000054, '2009-04-17', 345672345, 3, NULL, '', ''),
(685, 'Andrea', 'Romero', 44000055, '2009-06-20', 345234123, 3, NULL, '', ''),
(686, 'Tomas', 'Peralta', 44000056, '2009-08-23', 345345234, 3, NULL, '', ''),
(687, 'Valentino', 'Guzman', 44000057, '2009-10-26', 345456345, 3, NULL, '', ''),
(688, 'Luciana', 'Jimenez', 44000058, '2009-12-12', 345567456, 3, NULL, '', ''),
(689, 'Mariana', 'Vargas', 44000059, '2009-02-14', 345678567, 3, NULL, '', ''),
(690, 'NicolÃ¡s', 'SÃ¡nchez', 44000060, '2009-05-15', 345123456, 3, NULL, '', ''),
(691, 'ValentÃ­n', 'Vera', 44000061, '2009-07-22', 345234567, 3, NULL, '', ''),
(692, 'Florencia', 'Gomez', 44000062, '2009-03-10', 345345678, 3, NULL, '', ''),
(693, 'Joaquin', 'Silva', 44000063, '2009-11-05', 345456789, 3, NULL, '', ''),
(694, 'Isabella', 'Perez', 44000064, '2009-09-18', 345567890, 3, NULL, '', ''),
(695, 'Santiago', 'Garcia', 44000065, '2009-04-30', 345678901, 3, NULL, '', ''),
(696, 'NicolÃ¡s', 'SÃ¡nchez', 45000000, '2010-05-15', 345123456, 3, NULL, '', ''),
(697, 'Valentina', 'Martinez', 45000001, '2010-07-22', 345234567, 3, NULL, '', ''),
(698, 'Santiago', 'Lopez', 45000002, '2010-03-10', 345345678, 3, NULL, '', ''),
(699, 'Isabella', 'Rodriguez', 45000003, '2010-11-05', 345456789, 3, NULL, '', ''),
(700, 'Miguel', 'Perez', 45000004, '2010-09-18', 345567890, 3, NULL, '', ''),
(701, 'Camila', 'Hernandez', 45000005, '2010-04-30', 345678901, 3, NULL, '', ''),
(702, 'Mateo', 'Fernandez', 45000006, '2010-06-14', 345789012, 3, NULL, '', ''),
(703, 'Sofia', 'Diaz', 45000007, '2010-12-25', 345890123, 3, NULL, '', ''),
(704, 'Matias', 'Santos', 45000008, '2010-08-03', 345981234, 3, NULL, '', ''),
(705, 'Lucas', 'Mariani', 45000009, '2010-10-09', 345672345, 3, NULL, '', ''),
(706, 'Daniel', 'Garcia', 45000010, '2010-05-15', 345234123, 3, NULL, '', ''),
(707, 'Elena', 'Moreno', 45000011, '2010-01-08', 345345234, 3, NULL, '', ''),
(708, 'Joaquin', 'Torres', 45000012, '2010-03-21', 345456345, 3, NULL, '', ''),
(709, 'Catalina', 'Ortega', 45000013, '2010-07-14', 345567456, 3, NULL, '', ''),
(710, 'Pedro', 'Pacheco', 45000014, '2010-09-29', 345678567, 3, NULL, '', ''),
(711, 'Valeria', 'Rojas', 45000015, '2010-11-12', 345123456, 3, NULL, '', ''),
(712, 'Luis', 'Lara', 45000016, '2010-12-30', 345234567, 3, NULL, '', ''),
(713, 'Florencia', 'Navarro', 45000017, '2010-04-05', 345345678, 3, NULL, '', ''),
(714, 'Mariano', 'Molina', 45000018, '2010-05-15', 345456789, 3, NULL, '', ''),
(715, 'Carolina', 'Cruz', 45000019, '2010-06-27', 345567890, 3, NULL, '', ''),
(716, 'Eduardo', 'Gutierrez', 45000020, '2010-08-18', 345678901, 3, NULL, '', ''),
(717, 'Isabel', 'Vega', 45000021, '2010-10-31', 345789012, 3, NULL, '', ''),
(718, 'Gabriel', 'Castillo', 45000022, '2010-12-04', 345890123, 3, NULL, '', ''),
(719, 'Martina', 'Santos', 45000023, '2010-02-07', 345981234, 3, NULL, '', ''),
(720, 'Juan', 'Ramos', 45000024, '2010-04-17', 345672345, 3, NULL, '', ''),
(721, 'Andrea', 'Romero', 45000025, '2010-06-20', 345234123, 3, NULL, '', ''),
(722, 'Tomas', 'Peralta', 45000026, '2010-08-23', 345345234, 3, NULL, '', ''),
(723, 'Valentino', 'Guzman', 45000027, '2010-10-26', 345456345, 3, NULL, '', ''),
(724, 'Luciana', 'Jimenez', 45000028, '2010-12-12', 345567456, 3, NULL, '', ''),
(725, 'Mariana', 'Vargas', 45000029, '2010-02-14', 345678567, 3, NULL, '', ''),
(726, 'NicolÃ¡s', 'SÃ¡nchez', 45000030, '2010-05-15', 345123456, 3, NULL, '', ''),
(727, 'ValentÃ­n', 'Vera', 45000031, '2010-07-22', 345234567, 3, NULL, '', ''),
(728, 'Florencia', 'Gomez', 45000032, '2010-03-10', 345345678, 3, NULL, '', ''),
(729, 'Joaquin', 'Silva', 45000033, '2010-11-05', 345456789, 3, NULL, '', ''),
(730, 'Isabella', 'Perez', 45000034, '2010-09-18', 345567890, 3, NULL, '', ''),
(731, 'Santiago', 'Garcia', 45000035, '2010-04-30', 345678901, 3, NULL, '', ''),
(732, 'Sofia', 'Martinez', 45000036, '2010-06-14', 345789012, 3, NULL, '', ''),
(733, 'Sebastian', 'Lopez', 45000037, '2010-12-25', 345890123, 3, NULL, '', ''),
(734, 'Valentina', 'Moreno', 45000038, '2010-08-03', 345981234, 3, NULL, '', ''),
(735, 'Matias', 'Rodriguez', 45000039, '2010-10-09', 345672345, 3, NULL, '', ''),
(736, 'Lucas', 'Mariani', 45000040, '2010-05-15', 345234123, 3, NULL, '', ''),
(737, 'Daniel', 'Gutierrez', 45000041, '2010-01-08', 345345234, 3, NULL, '', ''),
(738, 'Joaquin', 'Torres', 45000042, '2010-03-21', 345456345, 3, NULL, '', ''),
(739, 'Catalina', 'Ortega', 45000043, '2010-07-14', 345567456, 3, NULL, '', ''),
(740, 'Pedro', 'Pacheco', 45000044, '2010-09-29', 345678567, 3, NULL, '', ''),
(741, 'Valeria', 'Rojas', 45000045, '2010-11-12', 345123456, 3, NULL, '', ''),
(742, 'Luis', 'Lara', 45000046, '2010-12-30', 345234567, 3, NULL, '', ''),
(743, 'Florencia', 'Navarro', 45000047, '2010-04-05', 345345678, 3, NULL, '', ''),
(744, 'Mariano', 'Molina', 45000048, '2010-05-15', 345456789, 3, NULL, '', ''),
(745, 'Carolina', 'Cruz', 45000049, '2010-06-27', 345567890, 3, NULL, '', ''),
(746, 'Eduardo', 'Gutierrez', 45000050, '2010-08-18', 345678901, 3, NULL, '', ''),
(747, 'Isabel', 'Vega', 45000051, '2010-10-31', 345789012, 3, NULL, '', ''),
(748, 'Gabriel', 'Castillo', 45000052, '2010-12-04', 345890123, 3, NULL, '', ''),
(749, 'Martina', 'Santos', 45000053, '2010-02-07', 345981234, 3, NULL, '', ''),
(750, 'Juan', 'Ramos', 45000054, '2010-04-17', 345672345, 3, NULL, '', ''),
(751, 'Andrea', 'Romero', 45000055, '2010-06-20', 345234123, 3, NULL, '', ''),
(752, 'Tomas', 'Peralta', 45000056, '2010-08-23', 345345234, 3, NULL, '', ''),
(753, 'Valentino', 'Guzman', 45000057, '2010-10-26', 345456345, 3, NULL, '', ''),
(754, 'Luciana', 'Jimenez', 45000058, '2010-12-12', 345567456, 3, NULL, '', ''),
(755, 'Mariana', 'Vargas', 45000059, '2010-02-14', 345678567, 3, NULL, '', ''),
(756, 'NicolÃ¡s', 'SÃ¡nchez', 45000060, '2010-05-15', 345123456, 3, NULL, '', ''),
(757, 'ValentÃ­n', 'Vera', 45000061, '2010-07-22', 345234567, 3, NULL, '', ''),
(758, 'Florencia', 'Gomez', 45000062, '2010-03-10', 345345678, 3, NULL, '', ''),
(759, 'Joaquin', 'Silva', 45000063, '2010-11-05', 345456789, 3, NULL, '', ''),
(760, 'Isabella', 'Perez', 45000064, '2010-09-18', 345567890, 2, NULL, '', ''),
(761, 'Santiago', 'Garcia', 45000065, '2010-04-30', 345678901, 2, NULL, '', ''),
(762, 'Sofia', 'Martinez', 45000066, '2010-06-14', 345789012, 2, NULL, '', ''),
(763, 'Sebastian', 'Lopez', 45000067, '2010-12-25', 345890123, 2, NULL, '', ''),
(764, 'Valentina', 'Moreno', 45000068, '2010-08-03', 345981234, 2, NULL, '', ''),
(765, 'Matias', 'Rodriguez', 45000069, '2010-10-09', 345672345, 2, NULL, '', ''),
(766, 'Lucas', 'Mariani', 45000070, '2010-05-15', 345234123, 2, NULL, '', ''),
(767, 'Daniel', 'Gutierrez', 45000071, '2010-01-08', 345345234, 2, NULL, '', ''),
(768, 'Joaquin', 'Torres', 45000072, '2010-03-21', 345456345, 2, NULL, '', ''),
(769, 'Catalina', 'Ortega', 45000073, '2010-07-14', 345567456, 2, NULL, '', ''),
(770, 'Pedro', 'Pacheco', 45000074, '2010-09-29', 345678567, 2, NULL, '', ''),
(771, 'Valeria', 'Rojas', 45000075, '2010-11-12', 345123456, 2, NULL, '', ''),
(772, 'Luis', 'Lara', 45000076, '2010-12-30', 345234567, 2, NULL, '', ''),
(773, 'Florencia', 'Navarro', 45000077, '2010-04-05', 345345678, 2, NULL, '', ''),
(774, 'Mariano', 'Molina', 45000078, '2010-05-15', 345456333, 3, NULL, 'MariMoli@hotmail.com', 'calle de las hojas 223'),
(775, 'Carolina', 'Cruz', 45000079, '2010-06-27', 345644440, 4, NULL, 'CruzCaro@gmail.com', 'Av de los Incas 1123'),
(776, 'Carlos', 'Gutemberg', 66978789, '1999-01-01', 546343445, 4, NULL, 'imprenta@gmail.com', 'Calle de la imprenta 435');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`idAutor`);

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`idEditorial`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`idLibro`),
  ADD KEY `fk_Libros_Editoriales1` (`idEditorial`),
  ADD KEY `fk_Libros_Autores1` (`idAutor`),
  ADD KEY `fk_Libros_Materias1` (`idMateria`);

--
-- Indices de la tabla `libros_reservas`
--
ALTER TABLE `libros_reservas`
  ADD PRIMARY KEY (`libros_Reservas`),
  ADD KEY `fk_Libros_has_Reservas_Libros1` (`idLibro`),
  ADD KEY `fk_Libros_has_Reservas_Reservas1` (`idReserva`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`idMateria`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`idPrestamo`),
  ADD KEY `fk_Usuarios1` (`idUsuarios`);

--
-- Indices de la tabla `prestamos_libros`
--
ALTER TABLE `prestamos_libros`
  ADD PRIMARY KEY (`idPrestamos_Libros`),
  ADD KEY `fk_idPrestamo` (`idPrestamo`),
  ADD KEY `fk_idLibros` (`idLibro`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `fk_Reservas_Usuarios1` (`idUsuarios`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `idAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  MODIFY `idEditorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `idLibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT de la tabla `libros_reservas`
--
ALTER TABLE `libros_reservas`
  MODIFY `libros_Reservas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `idMateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `idPrestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `prestamos_libros`
--
ALTER TABLE `prestamos_libros`
  MODIFY `idPrestamos_Libros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=778;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_Libros_Autores1` FOREIGN KEY (`idAutor`) REFERENCES `autores` (`idAutor`),
  ADD CONSTRAINT `fk_Libros_Editoriales1` FOREIGN KEY (`idEditorial`) REFERENCES `editoriales` (`idEditorial`),
  ADD CONSTRAINT `fk_Libros_Materias1` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`);

--
-- Filtros para la tabla `libros_reservas`
--
ALTER TABLE `libros_reservas`
  ADD CONSTRAINT `fk_Libros_has_Reservas_Libros1` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`),
  ADD CONSTRAINT `fk_Libros_has_Reservas_Reservas1` FOREIGN KEY (`idReserva`) REFERENCES `reservas` (`idReserva`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `fk_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`);

--
-- Filtros para la tabla `prestamos_libros`
--
ALTER TABLE `prestamos_libros`
  ADD CONSTRAINT `fk_idLibros` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`),
  ADD CONSTRAINT `fk_idPrestamo` FOREIGN KEY (`idPrestamo`) REFERENCES `prestamos` (`idPrestamo`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_Reservas_Usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
