-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-01-2025 a las 18:47:57
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facultad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `materia` varchar(100) NOT NULL,
  `carrera` varchar(50) NOT NULL,
  `semestre` int(11) NOT NULL,
  `grupo` varchar(10) NOT NULL,
  `horario` varchar(50) NOT NULL,
  `alumnos` int(11) NOT NULL,
  `programas` text NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id`, `nombre`, `correo`, `materia`, `carrera`, `semestre`, `grupo`, `horario`, `alumnos`, `programas`, `fecha_registro`) VALUES
(1, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'ttt¿¿', 'Economía', 3, 'C', '10:30-11:25am', 10, 'gghgffhgff', '2025-01-07 18:36:46'),
(2, 'phhfuhe fef efef', 'moises.rodriguez@uaem.edu.mx', 'MICROECONOMIA', 'administracion', 1, 'A', '1', 7, 'gghgffhgff', '2025-01-07 18:44:37'),
(12, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'o', 'administracion', 5, 'A', '1', 3, 'gghgffhgff', '2025-01-10 01:27:03'),
(13, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'o', 'administracion', 5, 'A', '1', 3, 'gghgffhgff', '2025-01-10 01:28:17'),
(14, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'uuuu', 'administracion', 5, 'A', '5', 3, 'gghgffhgff', '2025-01-10 01:28:55'),
(15, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'uuuu', 'administracion', 8, 'A', '5', 3, 'gghgffhgff', '2025-01-10 01:30:50'),
(16, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'uuuu', 'administracion', 8, 'A', '5', 3, 'gghgffhgff', '2025-01-10 01:31:15'),
(17, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'uuuu', 'administracion', 8, 'A', '5', 5, 'gghgffhgff', '2025-01-10 01:31:23'),
(18, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'uuuu', 'administracion', 8, 'A', '5', 9, 'gghgffhgff', '2025-01-10 01:31:41'),
(19, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'uuuu', 'administracion', 8, 'A', '5', 9, 'gghgffhgff', '2025-01-10 01:32:11');

--
-- Disparadores `docentes`
--
DELIMITER $$
CREATE TRIGGER `after_delete_docente` AFTER DELETE ON `docentes` FOR EACH ROW BEGIN
    INSERT INTO log_docentes (accion, docente_id, detalles)
    VALUES ('DELETE', OLD.id, CONCAT('Docente eliminado: Nombre=', OLD.nombre, ', Correo=', OLD.correo, ', Materia=', OLD.materia));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_docente` AFTER INSERT ON `docentes` FOR EACH ROW BEGIN
    INSERT INTO log_docentes (accion, docente_id, detalles)
    VALUES ('INSERT', NEW.id, CONCAT('Nuevo docente agregado: Nombre=', NEW.nombre, ', Correo=', NEW.correo, ', Materia=', NEW.materia));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_docente` AFTER UPDATE ON `docentes` FOR EACH ROW BEGIN
    INSERT INTO log_docentes (accion, docente_id, detalles)
    VALUES (
        'UPDATE',
        NEW.id,
        CONCAT(
            'Docente actualizado: Nombre=', NEW.nombre, ', Correo=', NEW.correo, 
            ', Materia=', NEW.materia, ', Carrera=', NEW.carrera, 
            ', Semestre=', NEW.semestre, ', Grupo=', NEW.grupo, 
            ', Horario=', NEW.horario, ', Alumnos=', NEW.alumnos, 
            ', Programas=', NEW.programas
        )
    );
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
