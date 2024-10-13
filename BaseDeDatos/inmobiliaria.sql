-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2024 a las 20:05:40
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmobiliaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `Id_Contrato` int(11) NOT NULL,
  `Id_Inmueble` int(11) DEFAULT NULL,
  `Id_Propietario` int(11) DEFAULT NULL,
  `Id_Inquilino` int(11) DEFAULT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Meses` int(255) NOT NULL,
  `Fecha_Finalizacion` date NOT NULL,
  `Monto` double NOT NULL,
  `Finalizacion_Anticipada` date DEFAULT NULL,
  `Id_Creado_Por` int(50) NOT NULL,
  `Id_Terminado_Por` int(50) DEFAULT NULL,
  `Estado_Contrato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`Id_Contrato`, `Id_Inmueble`, `Id_Propietario`, `Id_Inquilino`, `Fecha_Inicio`, `Meses`, `Fecha_Finalizacion`, `Monto`, `Finalizacion_Anticipada`, `Id_Creado_Por`, `Id_Terminado_Por`, `Estado_Contrato`) VALUES
(26, 3, 2, 6, '2024-09-06', 6, '2025-03-06', 150000, '0001-01-01', 1, 0, 1),
(27, 4, 2, 12, '2024-09-10', 6, '2025-03-09', 90000, '0001-01-01', 1, 0, 1),
(28, 10, 6, 12, '2024-09-12', 7, '2025-04-11', 160000, '0001-01-01', 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `Id_Inmueble` int(11) NOT NULL,
  `Id_Propietario` int(11) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Uso` varchar(50) DEFAULT NULL,
  `Ambientes` int(11) DEFAULT NULL,
  `Latitud` varchar(255) DEFAULT NULL,
  `Longitud` varchar(255) DEFAULT NULL,
  `Tamano` double DEFAULT NULL,
  `Id_Tipo_Inmueble` int(11) NOT NULL,
  `Servicios` varchar(255) DEFAULT NULL,
  `Bano` int(11) DEFAULT NULL,
  `Cochera` int(11) DEFAULT NULL,
  `Patio` int(11) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Condicion` varchar(50) DEFAULT NULL,
  `Estado_Inmueble` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`Id_Inmueble`, `Id_Propietario`, `Direccion`, `Uso`, `Ambientes`, `Latitud`, `Longitud`, `Tamano`, `Id_Tipo_Inmueble`, `Servicios`, `Bano`, `Cochera`, `Patio`, `Precio`, `Condicion`, `Estado_Inmueble`) VALUES
(1, 1, 'Av. Principal 123', 'Residencial', 3, '-34.6037', '-58.3816', 75, 1, 'Agua, Luz, Gas', 1, 1, 1, 120000, 'Alquiler', 1),
(2, 1, 'Calle Secundaria 456', 'Comercial', 2, '-34.6037', '-58.3816', 50, 2, 'Agua, Luz', 1, 0, 0, 80000, 'Alquiler', 0),
(3, 2, 'Calle Tercera 789', 'Residencial', 4, '-34.6037', '-58.3816', 100, 1, 'Agua, Luz, Gas, Internet', 2, 1, 1, 150000, 'Alquiler', 1),
(4, 2, 'Av. Cuarta 101', 'Residencial', 2, '-34.6037', '-58.3816', 60, 3, 'Agua, Luz, Gas', 1, 1, 0, 90000, 'Venta', 1),
(5, 3, 'Calle Quinta 202', 'Comercial', 1, '-34.6037', '-58.3816', 30, 2, 'Agua, Luz', 1, 0, 0, 60000, 'Venta', 0),
(6, 3, 'Calle Sexta 303', 'Residencial', 3, '-34.6037', '-58.3816', 80, 1, 'Agua, Luz', 1, 1, 1, 110000, 'Alquiler', 0),
(7, 4, 'Av. Séptima 404', 'Residencial', 2, '-34.6037', '-58.3816', 70, 2, 'Agua, Luz, Gas', 1, 0, 1, 95000, 'Venta', 0),
(8, 4, 'Calle Octava 505', 'Residencial', 3, '-34.6037', '-58.3816', 85, 1, 'Agua, Luz, Gas, Internet', 2, 1, 0, 130000, 'Venta', 1),
(9, 5, 'Av. Novena 606', 'Comercial', 1, '-34.6037', '-58.3816', 40, 2, 'Agua, Luz', 1, 0, 0, 70000, 'Alquiler', 0),
(10, 6, 'Calle Décima 707', 'Residencial', 4, '-34.6037', '-58.3816', 120, 1, 'Agua, Luz, Gas, Internet', 2, 1, 1, 160000, 'Alquiler', 1),
(11, 6, 'Av. Once 808', 'Residencial', 2, '-34.6037', '-58.3816', 55, 3, 'Agua, Luz', 1, 1, 0, 85000, 'Alquiler', 0),
(12, 7, 'Calle Doce 909', 'Residencial', 3, '-34.6037', '-58.3816', 90, 1, 'Agua, Luz', 1, 1, 1, 120000, 'Alquiler', 1),
(13, 7, 'Av. Trece 1010', 'Comercial', 1, '-34.6037', '-58.3816', 35, 2, 'Agua, Luz', 1, 0, 0, 65000, 'Venta', 0),
(14, 8, 'Calle Catorce 1111', 'Residencial', 3, '-34.6037', '-58.3816', 95, 1, 'Agua, Luz, Gas', 2, 1, 1, 140000, 'Alquiler', 0),
(15, 8, 'Av. Quince 1212', 'Residencial', 2, '-34.6037', '-58.3816', 65, 2, 'Agua, Luz', 1, 1, 0, 90000, 'Venta', 0),
(16, 9, 'Av. Decimosexta 1313', 'Comercial', 1, '-34.6037', '-58.3816', 45, 2, 'Agua, Luz', 1, 0, 0, 70000, 'Alquiler', 1),
(17, 10, 'Calle Decimoséptima 1414', 'Residencial', 4, '-34.6037', '-58.3816', 110, 1, 'Agua, Luz, Gas', 2, 1, 1, 155000, 'Alquiler', 0),
(18, 11, 'Av. Decimoctava 1515', 'Residencial', 2, '-34.6037', '-58.3816', 50, 3, 'Agua, Luz', 1, 1, 0, 85000, 'Alquiler', 0),
(19, 12, 'Calle Decimonovena 1616', 'Residencial', 3, '-34.6037', '-58.3816', 80, 1, 'Agua, Luz, Gas', 2, 1, 1, 120000, 'Alquiler', 1),
(20, 13, 'Av. Vigésima 1717', 'Comercial', 1, '-34.6037', '-58.3816', 40, 2, 'Agua, Luz', 1, 0, 0, 65000, 'Alquiler', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilino`
--

CREATE TABLE `inquilino` (
  `Id_Inquilino` int(11) NOT NULL,
  `Dni` int(11) DEFAULT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Estado_Inquilino` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inquilino`
--

INSERT INTO `inquilino` (`Id_Inquilino`, `Dni`, `Apellido`, `Nombre`, `Telefono`, `Email`, `Estado_Inquilino`) VALUES
(1, 12345678, 'García', 'Ana', '555-1234', 'ana.garcia@example.com', 1),
(2, 23456789, 'López', 'Carlos', '555-5678', 'carlos.lopez@example.com', 1),
(3, 34567890, 'Martínez', 'Beatriz', '555-8765', 'beatriz.martinez@example.com', 0),
(4, 45678901, 'Pérez', 'David', '555-4321', 'david.perez@example.com', 1),
(5, 56789012, 'Gómez', 'Laura', '555-6789', 'laura.gomez@example.com', 0),
(6, 67890123, 'Fernández', 'Juan', '555-9876', 'juan.fernandez@example.com', 1),
(7, 78901234, 'Torres', 'María', '555-3456', 'maria.torres@example.com', 1),
(8, 89012345, 'Ramírez', 'Luis', '555-6543', 'luis.ramirez@example.com', 0),
(9, 90123456, 'Sánchez', 'Isabel', '555-3210', 'isabel.sanchez@example.com', 1),
(10, 1234567, 'Morales', 'Pedro', '555-2109', 'pedro.morales@example.com', 1),
(11, 12345678, 'Molina', 'Sandra', '555-1098', 'sandra.molina@example.com', 0),
(12, 23456789, 'Castro', 'Ricardo', '555-0987', 'ricardo.castro@example.com', 1),
(13, 34567890, 'Vázquez', 'Elena', '555-8765', 'elena.vazquez@example.com', 0),
(14, 45678901, 'Jiménez', 'Antonio', '555-5678', 'antonio.jimenez@example.com', 1),
(15, 56789012, 'Guerrero', 'Natalia', '555-6789', 'natalia.guerrero@example.com', 1),
(16, 12345678, 'Alonzo', 'Joaquin', '444-1234', 'alonzo@example.com', 1),
(18, 12347778, 'García', 'Omar Adolfo', '555-1234', 'oscar@example.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `Id` int(11) NOT NULL,
  `LogLevel` varchar(50) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `Timestamp` datetime DEFAULT current_timestamp(),
  `Usuario` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`Id`, `LogLevel`, `Message`, `Timestamp`, `Usuario`) VALUES
(1, 'Information', 'El usuario ha accedido a la página de inicio.', '2024-09-20 01:24:21', 'lopes,ricardo-(2)'),
(2, 'Information', 'El usuario ha accedido a la página de inicio.', '2024-09-20 01:24:24', 'lopes,ricardo-(2)'),
(3, 'Information', 'El usuario ha accedido a la página de inicio.', '2024-09-20 01:36:27', 'lopes,ricardo-(2)'),
(4, 'Information', 'El usuario ha accedido a nuevo pago de id: 19', '2024-09-20 01:58:59', 'lopes,ricardo-(2)'),
(5, 'Information', 'El usuario ha accedido a guardar pago cuota paga:1', '2024-09-20 01:59:07', 'lopes,ricardo-(2)'),
(6, 'Information', 'El usuario ha accedido a nuevo pago de id: 21', '2024-09-20 01:59:30', 'lopes,ricardo-(2)'),
(7, 'Information', 'El usuario ha accedido a guardar pago cuota paga:1', '2024-09-20 01:59:35', 'lopes,ricardo-(2)'),
(8, 'Information', 'El usuario ha accedido a nuevo pago de id: 22', '2024-09-20 01:59:38', 'lopes,ricardo-(2)'),
(9, 'Information', 'El usuario ha accedido a guardar pago cuota paga:1', '2024-09-20 01:59:41', 'lopes,ricardo-(2)'),
(10, 'Information', 'El usuario ha accedido a eliminar contarto de id: 22', '2024-09-20 02:08:21', 'lopes,ricardo-(2)'),
(11, 'Information', 'El usuario ha accedido a finalizar contarto de id: 22', '2024-09-20 02:08:28', 'lopes,ricardo-(2)'),
(12, 'Information', 'El usuario ha accedido a nuevo contrato: 0', '2024-09-20 02:09:10', 'lopes,ricardo-(2)'),
(13, 'Information', ' nuevo contrato de id propietario: 3id inquilino :2', '2024-09-20 02:14:11', 'lopes,ricardo-(2)'),
(14, 'Information', ' nuevo contrato de id propietario: 6  id inquilino :9', '2024-09-20 02:27:11', 'lopes,ricardo-(2)'),
(15, 'Information', 'El usuario ha accedido a nuevo pago de id: 20', '2024-09-20 19:19:00', 'Sarchioni,Adrian-(1)'),
(16, 'Guardar', 'El usuario ha accedido a guardar pago cuota paga:0', '2024-09-20 19:19:03', 'Sarchioni,Adrian-(1)'),
(17, 'Information', 'El usuario ha accedido a nuevo pago de id: 20', '2024-09-20 19:19:09', 'Sarchioni,Adrian-(1)'),
(18, 'Information', 'El usuario ha accedido a nuevo pago de id: 21', '2024-09-20 19:19:17', 'Sarchioni,Adrian-(1)'),
(19, 'Guardar', 'El usuario ha accedido a guardar pago cuota paga:0', '2024-09-20 19:19:27', 'Sarchioni,Adrian-(1)'),
(20, 'Information', 'El usuario ha accedido a nuevo pago de id: 24', '2024-09-20 19:19:38', 'Sarchioni,Adrian-(1)'),
(21, 'Guardar', 'El usuario ha accedido a guardar pago cuota paga:0', '2024-09-20 19:19:41', 'Sarchioni,Adrian-(1)'),
(22, 'Information', 'El usuario ha accedido a nuevo pago de id: 24', '2024-09-20 19:19:44', 'Sarchioni,Adrian-(1)'),
(23, 'Information', 'El usuario ha accedido a nuevo pago de id: 24', '2024-09-20 19:20:29', 'Sarchioni,Adrian-(1)'),
(24, 'Information', 'El usuario ha accedido a nuevo pago de id: 25', '2024-09-20 19:21:05', 'Sarchioni,Adrian-(1)'),
(25, 'Guardar', 'El usuario ha accedido a guardar pago cuota paga:0', '2024-09-20 19:21:13', 'Sarchioni,Adrian-(1)'),
(26, 'Information', 'El usuario ha accedido a nuevo pago de id: 25', '2024-09-20 19:21:15', 'Sarchioni,Adrian-(1)'),
(27, 'Information', 'El usuario ha accedido a nuevo pago de id: 24', '2024-09-20 19:21:24', 'Sarchioni,Adrian-(1)'),
(28, 'Information', 'El usuario ha accedido a nuevo pago de id: 20', '2024-09-20 19:21:45', 'Sarchioni,Adrian-(1)'),
(29, 'Information', ' nuevo contrato de id propietario: 2  id inquilino :6', '2024-09-20 22:23:00', 'Sarchioni,Adrian-(1)'),
(30, 'Information', 'El usuario ha accedido a nuevo pago de id: 26', '2024-09-20 19:23:09', 'Sarchioni,Adrian-(1)'),
(31, 'Guardar', 'El usuario ha accedido a guardar pago cuota paga:0', '2024-09-20 19:23:22', 'Sarchioni,Adrian-(1)'),
(32, 'Information', 'El usuario ha accedido a nuevo pago de id: 26', '2024-09-20 19:23:38', 'Sarchioni,Adrian-(1)'),
(33, 'Guardar', 'El usuario ha accedido a guardar pago cuota paga:0', '2024-09-20 19:23:40', 'Sarchioni,Adrian-(1)'),
(34, 'Information', 'El usuario ha accedido a nuevo pago de id: 26', '2024-09-20 19:23:54', 'Sarchioni,Adrian-(1)'),
(35, 'Guardar', 'El usuario ha accedido a guardar pago cuota paga:0', '2024-09-20 19:24:06', 'Sarchioni,Adrian-(1)'),
(36, 'Information', ' nuevo contrato de id propietario: 2  id inquilino :12', '2024-09-20 22:52:27', 'Sarchioni,Adrian-(1)'),
(37, 'Information', ' nuevo contrato de id propietario: 6  id inquilino :12', '2024-09-20 22:52:47', 'Sarchioni,Adrian-(1)'),
(38, 'Anular', 'El usuario ha accedido a anular pago.', '2024-09-20 19:56:44', 'Sarchioni,Adrian-(1)'),
(39, 'Information', 'El usuario ha accedido a nuevo pago de id: 27', '2024-09-20 19:57:22', 'Sarchioni,Adrian-(1)'),
(40, 'Information', 'El usuario ha accedido a nuevo pago de id: 28', '2024-09-20 19:57:40', 'Sarchioni,Adrian-(1)'),
(41, 'Guardar', 'El usuario ha accedido a guardar pago anulado.', '2024-09-20 19:57:45', 'Sarchioni,Adrian-(1)'),
(42, 'Information', 'El usuario ha accedido a nuevo pago de id: 26', '2024-09-20 19:58:36', 'Sarchioni,Adrian-(1)'),
(43, 'Guardar', 'El usuario ha accedido a guardar pago anulado.', '2024-09-20 19:58:42', 'Sarchioni,Adrian-(1)'),
(44, 'Information', 'El usuario ha accedido a nuevo pago de id: 26', '2024-09-20 19:59:06', 'Sarchioni,Adrian-(1)'),
(45, 'Guardar', 'El usuario ha accedido a guardar pago anulado.', '2024-09-20 19:59:13', 'Sarchioni,Adrian-(1)'),
(46, 'Information', 'El usuario ha accedido a nuevo pago de id: 26', '2024-09-20 20:00:28', 'Sarchioni,Adrian-(1)'),
(47, 'Guardar', 'El usuario ha accedido a guardar pago cuota paga:1', '2024-09-20 20:00:32', 'Sarchioni,Adrian-(1)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `Id_Pago` int(11) NOT NULL,
  `Id_Contrato` int(11) DEFAULT NULL,
  `Importe` double DEFAULT NULL,
  `CuotaPaga` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Multa` double DEFAULT NULL,
  `Id_Creado_Por` int(50) NOT NULL,
  `Id_Terminado_Por` int(50) DEFAULT NULL,
  `Estado_Pago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`Id_Pago`, `Id_Contrato`, `Importe`, `CuotaPaga`, `Fecha`, `Multa`, `Id_Creado_Por`, `Id_Terminado_Por`, `Estado_Pago`) VALUES
(61, 26, 150000, 0, '2024-09-20', 0, 1, 1, 0),
(62, 26, 150000, 0, '2024-09-20', 0, 1, 0, 1),
(63, 26, 150000, 0, '2024-09-20', 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `Id_Propietario` int(11) NOT NULL,
  `Dni` int(11) DEFAULT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Clave` varchar(255) NOT NULL,
  `Estado_Propietario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`Id_Propietario`, `Dni`, `Apellido`, `Nombre`, `Direccion`, `Telefono`, `Email`, `Clave`, `Estado_Propietario`) VALUES
(1, 12345678, 'Alvarez', 'Juan Jose', 'Av. Principal 123', '9876-5431', 'juan.alvarez@example.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 0),
(2, 23456789, 'Moreno', 'Laura', 'Calle Secundaria 456', '555-2222', 'laura.moreno@example.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 1),
(3, 34567890, 'Ruiz', 'Miguel', 'Calle Tercera 789', '555-3333', 'miguel.ruiz@example.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 0),
(4, 45678901, 'Fernández', 'Sofía', 'Av. Cuarta 101', '555-4444', 'sofia.fernandez@example.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 1),
(5, 56789012, 'Jiménez', 'Ricardo Dario', 'Calle Quinta 202', '5555555', 'ricardo.jimenez@example.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 0),
(6, 67890123, 'Torres', 'Ana', 'Calle Sexta 303', '555-6666', 'ana.torres@example.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 0),
(7, 78901234, 'García', 'Carlos', 'Av. Séptima 404', '555-7777', 'carlos.garcia@example.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 0),
(8, 89012345, 'Pérez', 'Isabel', 'Calle Octava 505', '555-8888', 'isabel.perez@example.com', '', 0),
(9, 90123456, 'Gómez', 'Luis', 'Av. Novena 606', '555-9999', 'luis.gomez@example.com', '', 1),
(10, 1234567, 'Castro', 'María', 'Calle Décima 707', '555-0000', 'maria.castro@example.com', '', 1),
(11, 12345679, 'Molina', 'Pedro', 'Av. Once 808', '555-1234', 'pedro.molina@example.com', '', 0),
(12, 23456780, 'Sánchez', 'Sandra', 'Calle Doce 909', '555-2345', 'sandra.sanchez@example.com', '', 1),
(13, 34567801, 'Morales', 'Elena', 'Av. Trece 1010', '555-3456', 'elena.morales@example.com', '', 1),
(14, 45678912, 'Vázquez', 'Antonio', 'Calle Catorce 1111', '555-4567', 'antonio.vazquez@example.com', '', 0),
(15, 56789023, 'Guerrero', 'Natalia', 'Av. Quince 1212', '555-5678', 'natalia.guerrero@example.com', '', 1),
(19, 1345552, 'gomezzz', 'Orlando Ramon', 'Av. Pringless 123', '9876-5431', 'o@o', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_inmueble`
--

CREATE TABLE `tipo_inmueble` (
  `Id_Tipo_Inmueble` int(11) NOT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Estado_Tipo_Inmueble` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_inmueble`
--

INSERT INTO `tipo_inmueble` (`Id_Tipo_Inmueble`, `Tipo`, `Estado_Tipo_Inmueble`) VALUES
(1, 'Apartamento', 1),
(2, 'Casa', 1),
(3, 'Oficina', 1),
(4, 'Local Comercial', 1),
(5, 'Estudio', 1),
(6, 'Duplex', 1),
(7, 'Cabaña', 0),
(8, 'Chalet', 1),
(9, 'Penthouse', 1),
(10, 'Garaje', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuario` int(11) NOT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Dni` int(11) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Rol` int(50) DEFAULT 1,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Avatar` varchar(255) DEFAULT NULL,
  `Estado_Usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_Usuario`, `Apellido`, `Nombre`, `Dni`, `Telefono`, `Rol`, `Email`, `Password`, `Avatar`, `Estado_Usuario`) VALUES
(1, 'Sarchioni', 'Adrian', 12345, '12345', 2, 'b@b', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', '/Uploads\\avatar_1.PNG', 1),
(3, 'Lucero', 'Gastonn', 1223344, '1233454', 1, 'bu@bu.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', '/Uploads\\avatar_3.jpg', 1),
(4, 'Sapo', 'Pepe', 1234567, '121212121', 1, 'elSapo@pepe.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', '/Uploads\\avatar_4.jpg', 1),
(19, 'sanches', 'leandro', 53535355, '123456789', 1, 'leo@sa.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', '/Uploads\\avatar_0.JPG', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`Id_Contrato`),
  ADD KEY `Id_Inmueble` (`Id_Inmueble`),
  ADD KEY `Id_Propietario` (`Id_Propietario`),
  ADD KEY `Id_Inquilino` (`Id_Inquilino`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`Id_Inmueble`),
  ADD KEY `Id_Propietario` (`Id_Propietario`),
  ADD KEY `Id_Tipo_Inmueble` (`Id_Tipo_Inmueble`);

--
-- Indices de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`Id_Inquilino`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`Id_Pago`),
  ADD KEY `Id_Contrato` (`Id_Contrato`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`Id_Propietario`);

--
-- Indices de la tabla `tipo_inmueble`
--
ALTER TABLE `tipo_inmueble`
  ADD PRIMARY KEY (`Id_Tipo_Inmueble`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `Id_Contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  MODIFY `Id_Inmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `Id_Inquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `Id_Pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `Id_Propietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tipo_inmueble`
--
ALTER TABLE `tipo_inmueble`
  MODIFY `Id_Tipo_Inmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`Id_Inmueble`) REFERENCES `inmueble` (`Id_Inmueble`),
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`Id_Propietario`) REFERENCES `propietario` (`Id_Propietario`),
  ADD CONSTRAINT `contrato_ibfk_3` FOREIGN KEY (`Id_Inquilino`) REFERENCES `inquilino` (`Id_Inquilino`);

--
-- Filtros para la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `inmueble_ibfk_1` FOREIGN KEY (`Id_Propietario`) REFERENCES `propietario` (`Id_Propietario`),
  ADD CONSTRAINT `inmueble_ibfk_2` FOREIGN KEY (`Id_Tipo_Inmueble`) REFERENCES `tipo_inmueble` (`Id_Tipo_Inmueble`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`Id_Contrato`) REFERENCES `contrato` (`Id_Contrato`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
