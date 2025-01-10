-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-01-2025 a las 19:10:46
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
-- Estructura de tabla para la tabla `asignacion_centros`
--

CREATE TABLE `asignacion_centros` (
  `docente_id` int(11) NOT NULL,
  `docente_nombre` varchar(100) DEFAULT NULL,
  `docente_correo` varchar(100) DEFAULT NULL,
  `carrera` varchar(50) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `grupo` varchar(10) DEFAULT NULL,
  `horario` varchar(50) DEFAULT NULL,
  `alumnos` int(11) DEFAULT NULL,
  `numero_centro` int(11) DEFAULT NULL,
  `computadoras` int(11) DEFAULT NULL,
  `inicio_semestre` date DEFAULT NULL,
  `fin_semestre` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignacion_centros`
--

INSERT INTO `asignacion_centros` (`docente_id`, `docente_nombre`, `docente_correo`, `carrera`, `semestre`, `grupo`, `horario`, `alumnos`, `numero_centro`, `computadoras`, `inicio_semestre`, `fin_semestre`) VALUES
(1, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'Economía', 3, 'C', '10:30-11:25am', 10, 1, 28, NULL, NULL),
(1, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'Economía', 3, 'C', '10:30-11:25am', 10, 2, 32, NULL, NULL),
(2, 'phhfuhe fef efef', 'moises.rodriguez@uaem.edu.mx', 'administracion', 1, 'A', '1', 7, 1, 28, NULL, NULL),
(2, 'phhfuhe fef efef', 'moises.rodriguez@uaem.edu.mx', 'administracion', 1, 'A', '1', 7, 2, 32, NULL, NULL),
(12, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 5, 'A', '1', 3, 1, 28, NULL, NULL),
(12, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 5, 'A', '1', 3, 2, 32, NULL, NULL),
(13, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 5, 'A', '1', 3, 1, 28, NULL, NULL),
(13, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 5, 'A', '1', 3, 2, 32, NULL, NULL),
(14, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 5, 'A', '5', 3, 1, 28, NULL, NULL),
(14, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 5, 'A', '5', 3, 2, 32, NULL, NULL),
(15, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 8, 'A', '5', 3, 1, 28, NULL, NULL),
(15, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 8, 'A', '5', 3, 2, 32, NULL, NULL),
(16, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 8, 'A', '5', 3, 1, 28, NULL, NULL),
(16, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 8, 'A', '5', 3, 2, 32, NULL, NULL),
(17, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 8, 'A', '5', 5, 1, 28, NULL, NULL),
(17, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 8, 'A', '5', 5, 2, 32, NULL, NULL),
(18, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 8, 'A', '5', 9, 1, 28, NULL, NULL),
(18, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 8, 'A', '5', 9, 2, 32, NULL, NULL),
(19, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 8, 'A', '5', 9, 1, 28, NULL, NULL),
(19, 'phhfuhe fef efef', 'edgar-green1@hotmail.com', 'administracion', 8, 'A', '5', 9, 2, 32, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
