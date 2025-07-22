-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2025 a las 23:57:03
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_librería`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `IdAlumno` int(11) NOT NULL,
  `NombreAlumno` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Carrera` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`IdAlumno`, `NombreAlumno`, `Apellidos`, `Carrera`) VALUES
(1, 'Rosa', 'Torres', 'Sistemas'),
(2, 'Ángel', 'Pérez', 'Electrónica'),
(3, 'Sonia', 'Ríos', 'Industrial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `IdLibro` int(11) NOT NULL,
  `NombreLibro` varchar(50) DEFAULT NULL,
  `Editorial` varchar(50) DEFAULT NULL,
  `Dias_limite_prestamo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`IdLibro`, `NombreLibro`, `Editorial`, `Dias_limite_prestamo`) VALUES
(1, 'Administración', 'Norma', 30),
(2, 'Redes neuronales', 'Santillana', 30),
(3, 'Estadística', 'Regio', 10),
(4, 'Desarrollo Web', 'Limusa', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `IdPrestamo` int(11) NOT NULL,
  `IdAlumno` int(11) DEFAULT NULL,
  `IdLibro` int(11) DEFAULT NULL,
  `Fecha_prestamo` date DEFAULT NULL,
  `Entregado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`IdPrestamo`, `IdAlumno`, `IdLibro`, `Fecha_prestamo`, `Entregado`) VALUES
(1, 1, 1, '2021-07-23', b'0'),
(2, 1, 2, '2021-07-22', b'0'),
(3, 1, 3, '2021-06-15', b'0'),
(4, 2, 1, '2021-07-12', b'0'),
(5, 3, 1, '2021-07-28', b'1'),
(6, 3, 2, '2021-07-16', b'1'),
(7, 3, 3, '2021-07-28', b'1'),
(8, 3, 4, '2021-05-10', b'0'),
(9, 2, 2, '2021-07-28', b'0'),
(10, 3, 2, '2021-04-05', b'0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`IdAlumno`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`IdLibro`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`IdPrestamo`),
  ADD KEY `IdAlumno` (`IdAlumno`),
  ADD KEY `IdLibro` (`IdLibro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `IdAlumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `IdLibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `IdPrestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `IdAlumno` FOREIGN KEY (`IdAlumno`) REFERENCES `alumno` (`IdAlumno`),
  ADD CONSTRAINT `IdLibro` FOREIGN KEY (`IdLibro`) REFERENCES `libro` (`IdLibro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
