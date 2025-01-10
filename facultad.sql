-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-01-2025 a las 18:58:18
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_docentes`
--

CREATE TABLE `log_docentes` (
  `id` int(11) NOT NULL,
  `accion` varchar(50) NOT NULL,
  `docente_id` int(11) NOT NULL,
  `detalles` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `log_docentes`
--

INSERT INTO `log_docentes` (`id`, `accion`, `docente_id`, `detalles`, `fecha`) VALUES
(1, 'INSERT', 4, 'Nuevo docente agregado: Nombre=MOISES RODRIGUEZ, Correo=moises.rodriguez@uaem.edu.mx, Materia=dd', '2025-01-08 02:00:32'),
(2, 'INSERT', 5, 'Nuevo docente agregado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=<?= htmlspecialchars($docente[\'materia\'], ENT_QUOTES) ?>', '2025-01-09 04:45:58'),
(3, 'INSERT', 6, 'Nuevo docente agregado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=<?= htmlspecialchars($docente[\'materia\'], ENT_QUOTES) ?>', '2025-01-09 05:14:46'),
(4, 'INSERT', 7, 'Nuevo docente agregado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg', '2025-01-10 01:07:13'),
(5, 'UPDATE', 3, 'Docente actualizado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg, Carrera=administracion, Semestre=1, Grupo=A, Horario=1, Alumnos=8, Programas=gghgffhgff', '2025-01-10 01:07:13'),
(6, 'INSERT', 8, 'Nuevo docente agregado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg', '2025-01-10 01:07:51'),
(7, 'UPDATE', 3, 'Docente actualizado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg, Carrera=administracion, Semestre=5, Grupo=A, Horario=1, Alumnos=8, Programas=gghgffhgff', '2025-01-10 01:07:51'),
(8, 'INSERT', 9, 'Nuevo docente agregado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg', '2025-01-10 01:11:41'),
(9, 'UPDATE', 3, 'Docente actualizado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg, Carrera=administracion, Semestre=5, Grupo=A, Horario=1, Alumnos=8, Programas=gghgffhgff', '2025-01-10 01:11:41'),
(10, 'INSERT', 10, 'Nuevo docente agregado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg', '2025-01-10 01:11:53'),
(11, 'UPDATE', 3, 'Docente actualizado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg, Carrera=administracion, Semestre=5, Grupo=A, Horario=1, Alumnos=8, Programas=gghgffhgff', '2025-01-10 01:11:53'),
(12, 'INSERT', 11, 'Nuevo docente agregado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg', '2025-01-10 01:12:31'),
(13, 'UPDATE', 3, 'Docente actualizado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg, Carrera=administracion, Semestre=5, Grupo=A, Horario=1, Alumnos=8, Programas=gghgffhgff', '2025-01-10 01:12:31'),
(14, 'DELETE', 3, 'Docente eliminado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg', '2025-01-10 01:18:44'),
(15, 'DELETE', 5, 'Docente eliminado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=<?= htmlspecialchars($docente[\'materia\'], ENT_QUOTES) ?>', '2025-01-10 01:18:50'),
(16, 'DELETE', 11, 'Docente eliminado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg', '2025-01-10 01:19:11'),
(17, 'DELETE', 9, 'Docente eliminado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg', '2025-01-10 01:19:15'),
(18, 'DELETE', 4, 'Docente eliminado: Nombre=MOISES RODRIGUEZ, Correo=moises.rodriguez@uaem.edu.mx, Materia=dd', '2025-01-10 01:21:04'),
(19, 'DELETE', 6, 'Docente eliminado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=<?= htmlspecialchars($docente[\'materia\'], ENT_QUOTES) ?>', '2025-01-10 01:21:41'),
(20, 'DELETE', 7, 'Docente eliminado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg', '2025-01-10 01:21:45'),
(21, 'DELETE', 8, 'Docente eliminado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg', '2025-01-10 01:24:37'),
(22, 'DELETE', 10, 'Docente eliminado: Nombre=MOISES RODRIGUEZ, Correo=edgar-green1@hotmail.com, Materia=jhgfggg', '2025-01-10 01:25:13'),
(23, 'INSERT', 12, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=o', '2025-01-10 01:27:03'),
(24, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=o, Carrera=administracion, Semestre=5, Grupo=A, Horario=1, Alumnos=3, Programas=gghgffhgff', '2025-01-10 01:27:03'),
(25, 'INSERT', 13, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=o', '2025-01-10 01:28:17'),
(26, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=o, Carrera=administracion, Semestre=5, Grupo=A, Horario=1, Alumnos=3, Programas=gghgffhgff', '2025-01-10 01:28:17'),
(27, 'INSERT', 14, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu', '2025-01-10 01:28:55'),
(28, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu, Carrera=administracion, Semestre=5, Grupo=A, Horario=5, Alumnos=3, Programas=gghgffhgff', '2025-01-10 01:28:55'),
(29, 'INSERT', 15, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu', '2025-01-10 01:30:50'),
(30, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu, Carrera=administracion, Semestre=8, Grupo=A, Horario=5, Alumnos=3, Programas=gghgffhgff', '2025-01-10 01:30:50'),
(31, 'INSERT', 16, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu', '2025-01-10 01:31:15'),
(32, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu, Carrera=administracion, Semestre=8, Grupo=A, Horario=5, Alumnos=3, Programas=gghgffhgff', '2025-01-10 01:31:15'),
(33, 'INSERT', 17, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu', '2025-01-10 01:31:23'),
(34, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu, Carrera=administracion, Semestre=8, Grupo=A, Horario=5, Alumnos=5, Programas=gghgffhgff', '2025-01-10 01:31:23'),
(35, 'INSERT', 18, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu', '2025-01-10 01:31:41'),
(36, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu, Carrera=administracion, Semestre=8, Grupo=A, Horario=5, Alumnos=9, Programas=gghgffhgff', '2025-01-10 01:31:41'),
(37, 'INSERT', 19, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu', '2025-01-10 01:32:11'),
(38, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=uuuu, Carrera=administracion, Semestre=8, Grupo=A, Horario=5, Alumnos=9, Programas=gghgffhgff', '2025-01-10 01:32:11'),
(39, 'INSERT', 20, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt', '2025-01-10 01:32:26'),
(40, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt, Carrera=administracion, Semestre=8, Grupo=A, Horario=5, Alumnos=9, Programas=gghgffhgff', '2025-01-10 01:32:26'),
(41, 'INSERT', 21, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt', '2025-01-10 01:36:12'),
(42, 'INSERT', 22, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt', '2025-01-10 01:41:29'),
(43, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt, Carrera=administracion, Semestre=8, Grupo=A, Horario=5, Alumnos=11, Programas=gghgffhgff', '2025-01-10 01:41:29'),
(44, 'INSERT', 23, 'Nuevo docente agregado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt¿¿', '2025-01-10 01:41:42'),
(45, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt¿¿, Carrera=administracion, Semestre=8, Grupo=A, Horario=5, Alumnos=11, Programas=gghgffhgff', '2025-01-10 01:41:42'),
(46, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt¿¿, Carrera=administracion, Semestre=10, Grupo=A, Horario=5, Alumnos=11, Programas=gghgffhgff', '2025-01-10 01:46:14'),
(47, 'DELETE', 23, 'Docente eliminado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt¿¿', '2025-01-10 03:12:01'),
(48, 'DELETE', 22, 'Docente eliminado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt', '2025-01-10 03:12:22'),
(49, 'DELETE', 21, 'Docente eliminado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt', '2025-01-10 03:35:38'),
(50, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt¿¿, Carrera=Economía, Semestre=10, Grupo=A, Horario=5, Alumnos=11, Programas=gghgffhgff', '2025-01-10 03:58:33'),
(51, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt¿¿, Carrera=Economía, Semestre=3, Grupo=C, Horario=9, Alumnos=11, Programas=gghgffhgff', '2025-01-10 03:59:07'),
(52, 'UPDATE', 1, 'Docente actualizado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt¿¿, Carrera=Economía, Semestre=3, Grupo=C, Horario=10:30-11:25am, Alumnos=10, Programas=gghgffhgff', '2025-01-10 04:07:27'),
(53, 'INSERT', 24, 'Nuevo docente agregado: Nombre=MOISES RODRIGUEZ, Correo=moises.rodriguez@uaem.edu.mx, Materia=jhgfggg', '2025-01-10 04:08:08'),
(54, 'DELETE', 24, 'Docente eliminado: Nombre=MOISES RODRIGUEZ, Correo=moises.rodriguez@uaem.edu.mx, Materia=jhgfggg', '2025-01-10 04:08:49'),
(55, 'DELETE', 20, 'Docente eliminado: Nombre=phhfuhe fef efef, Correo=edgar-green1@hotmail.com, Materia=ttt', '2025-01-10 04:13:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrocentro`
--

CREATE TABLE `registrocentro` (
  `id` int(11) NOT NULL,
  `numero_centro` int(11) NOT NULL,
  `computadoras` int(11) NOT NULL DEFAULT 0,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `inicio_semestre` date DEFAULT NULL,
  `fin_semestre` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registrocentro`
--

INSERT INTO `registrocentro` (`id`, `numero_centro`, `computadoras`, `fecha_registro`, `inicio_semestre`, `fin_semestre`) VALUES
(1, 1, 28, '2025-01-06 23:01:43', NULL, NULL),
(2, 2, 32, '2025-01-06 23:01:43', NULL, NULL),
(3, 4, 1, '2025-01-06 23:01:43', NULL, NULL),
(5, 3, 4, '2025-01-10 04:24:31', '2025-01-09', '2025-01-11'),
(6, 3, 3, '2025-01-10 04:25:20', '2025-01-09', '2025-01-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `materia` varchar(255) NOT NULL,
  `carrera` varchar(100) NOT NULL,
  `semestre` varchar(50) NOT NULL,
  `grupo` varchar(10) NOT NULL,
  `horario` varchar(255) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `numero_alumnos` int(11) NOT NULL DEFAULT 0,
  `programas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`id`, `nombre`, `correo`, `materia`, `carrera`, `semestre`, `grupo`, `horario`, `fecha_registro`, `numero_alumnos`, `programas`) VALUES
(1, 'phhfuhe fef efef', 'oo@kk.com', 'dd', 'administracion', '1', 'A', '', '2024-12-10 03:17:39', 0, 0),
(2, 'phhfuhe fef efef', 'oo@kk.com', 'o', 'administracion', '1', 'A', '', '2024-12-10 03:51:15', 0, 0),
(3, 'phhfuhe fef efef', 'oo@kk.com', 'o', 'administracion', '1', 'A', '', '2024-12-10 03:51:57', 0, 0),
(4, '', '', '', '', '', '', '', '2024-12-10 03:55:50', 0, 0),
(5, 'phhfuhe fef efef', 'oo@kk.com', 'o', 'administracion', '1', 'A', '1', '2024-12-10 04:01:24', 0, 0),
(6, 'phhfuhe fef efef', 'oo@kk.com', 'o', 'administracion', '1', 'A', '1', '2024-12-12 03:50:55', 0, 0),
(7, 'phhfuhe fef efef', 'oo@kk.com', 'bjhgygijiguhojgij', 'administracion', '1', 'A', '1', '2024-12-12 03:52:46', 0, 0),
(8, 'phhfuhe fef efef', 'oo@kk.com', 'jhgfggg', 'administracion', '8', 'A', '1', '2024-12-12 03:58:45', 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `log_docentes`
--
ALTER TABLE `log_docentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registrocentro`
--
ALTER TABLE `registrocentro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `log_docentes`
--
ALTER TABLE `log_docentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `registrocentro`
--
ALTER TABLE `registrocentro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
