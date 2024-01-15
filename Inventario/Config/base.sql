-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generaciÃ³n: 15-01-2024 a las 03:23:20
-- VersiÃ³n del servidor: 10.4.24-MariaDB
-- VersiÃ³n de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario_sexto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ProductoId` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `Precio` decimal(8,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `FechaIngreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ProductoId`, `Nombre`, `Precio`, `Cantidad`, `FechaIngreso`) VALUES
(1, 'DETERGENTE', '2.00', 4, '2024-01-03'),
(2, 'ARROZ', '3.00', 23, '2024-01-12'),
(3, 'MAICENA', '2.00', 23, '2024-01-14'),
(4, 'JABON LIQUUIDO', '2.00', 12, '2024-01-14'),
(5, 'DEJA ', '1.50', 111, '2024-01-14'),
(6, 'AZUCAR MORENA', '2.75', 11, '2024-01-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ProveedorId` int(11) NOT NULL,
  `Nombres` text NOT NULL,
  `Telefono` text NOT NULL,
  `Correo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ProveedorId`, `Nombres`, `Telefono`, `Correo`) VALUES
(1, 'CODELITESA', '0292922991', 'janio@gmail.com'),
(3, 'CERVECERIA NACIONAL', '9383383939', 'cn@gmail.com'),
(4, 'PRONACA', '902902022', 'pronaca@gmail.com'),
(5, 'AVI PAZ', '029292929', 'avipaz@gmail.com'),
(6, 'RICO POLLO', '0292929229', 'rp@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stocks`
--

CREATE TABLE `stocks` (
  `StockId` int(11) NOT NULL,
  `ProductoId` int(11) NOT NULL,
  `ProveedorId` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_Venta` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `stocks`
--

INSERT INTO `stocks` (`StockId`, `ProductoId`, `ProveedorId`, `Cantidad`, `Precio_Venta`) VALUES
(1, 1, 1, 12, '5.00'),
(2, 1, 3, 13, '2.00'),
(7, 3, 3, 3, '3.00'),
(8, 4, 4, 4, '4.00');

--
-- Ãndices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ProductoId`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ProveedorId`);

--
-- Indices de la tabla `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`StockId`),
  ADD KEY `Proveedor_Stock` (`ProveedorId`),
  ADD KEY `ProductoId` (`ProductoId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ProductoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ProveedorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `stocks`
--
ALTER TABLE `stocks`
  MODIFY `StockId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `ProductoId` FOREIGN KEY (`ProductoId`) REFERENCES `productos` (`ProductoId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Proveedor_Stock` FOREIGN KEY (`ProveedorId`) REFERENCES `proveedores` (`ProveedorId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
