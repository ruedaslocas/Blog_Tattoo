-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2019 a las 09:37:51
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `erabiltzailea`
--

CREATE TABLE `erabiltzailea` (
  `id` int(20) NOT NULL,
  `izena` varchar(20) NOT NULL,
  `abizena` varchar(30) NOT NULL,
  `erabiltzaile_iz` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pasahitza` varchar(20) NOT NULL,
  `rol` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gaia`
--

CREATE TABLE `gaia` (
  `id_gaia` int(20) NOT NULL,
  `id_usuario` int(20) DEFAULT NULL,
  `laburpena` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iruzkina`
--

CREATE TABLE `iruzkina` (
  `id_iruzkina` int(20) NOT NULL,
  `id_erabiltzaile` int(20) DEFAULT NULL,
  `id_gaia` int(20) DEFAULT NULL,
  `iruzkina` varchar(500) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `erabiltzailea`
--
ALTER TABLE `erabiltzailea`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gaia`
--
ALTER TABLE `gaia`
  ADD PRIMARY KEY (`id_gaia`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `iruzkina`
--
ALTER TABLE `iruzkina`
  ADD PRIMARY KEY (`id_iruzkina`),
  ADD KEY `iruzkina_ibfk_1` (`id_erabiltzaile`),
  ADD KEY `id_gaia` (`id_gaia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `erabiltzailea`
--
ALTER TABLE `erabiltzailea`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `gaia`
--
ALTER TABLE `gaia`
  MODIFY `id_gaia` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `iruzkina`
--
ALTER TABLE `iruzkina`
  MODIFY `id_iruzkina` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gaia`
--
ALTER TABLE `gaia`
  ADD CONSTRAINT `gaia_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `erabiltzailea` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `iruzkina`
--
ALTER TABLE `iruzkina`
  ADD CONSTRAINT `iruzkina_ibfk_1` FOREIGN KEY (`id_erabiltzaile`) REFERENCES `erabiltzailea` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `iruzkina_ibfk_2` FOREIGN KEY (`id_gaia`) REFERENCES `gaia` (`id_gaia`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
