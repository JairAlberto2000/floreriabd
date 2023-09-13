-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-09-2023 a las 03:19:53
-- Versión del servidor: 11.1.0-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `floreriaelazahar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id` int(1) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id`, `descripcion`) VALUES
(1, 'Admin'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `fk_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `fk_usuario`) VALUES
(1, 15),
(2, 17),
(3, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido_carrito`
--

CREATE TABLE `contenido_carrito` (
  `id` int(11) NOT NULL,
  `fk_carrito` int(11) NOT NULL,
  `fk_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fk_producto` int(11) NOT NULL,
  `fk_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`id`, `cantidad`, `fk_producto`, `fk_pedido`) VALUES
(6, 12, 4, 10),
(7, 12, 4, 10),
(8, 1, 4, 10),
(9, 1, 4, 10),
(10, 3, 4, 11),
(11, 1, 4, 11),
(12, 10, 4, 12),
(13, 1, 4, 13),
(14, 1, 4, 14),
(15, 1, 4, 15),
(16, 1, 4, 16),
(17, 1, 4, 17),
(18, 1, 4, 18),
(19, 3, 4, 18),
(20, 1, 4, 19),
(21, 1, 4, 19),
(22, 1, 4, 20),
(23, 1, 4, 20),
(24, 1, 4, 21),
(25, 1, 4, 21),
(26, 1, 4, 22),
(27, 1, 4, 22),
(28, 1, 4, 23),
(29, 2, 4, 23),
(30, 3, 4, 23),
(31, 3, 4, 23),
(32, 1, 4, 24),
(33, 1, 4, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `fk_usuario` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `fk_usuario`, `total`, `fecha`) VALUES
(10, 15, 1300, '2023-06-12 05:44:24'),
(11, 15, 200, '2023-06-12 06:41:46'),
(12, 15, 500, '2023-06-12 06:43:18'),
(13, 15, 50, '2023-06-12 06:44:44'),
(14, 15, 50, '2023-06-12 06:45:29'),
(15, 15, 50, '2023-06-12 06:46:29'),
(16, 15, 50, '2023-06-12 06:49:09'),
(17, 15, 50, '2023-06-12 06:52:43'),
(18, 15, 200, '2023-06-16 00:43:29'),
(19, 17, 100, '2023-06-19 13:35:25'),
(20, 17, 100, '2023-06-19 13:35:28'),
(21, 17, 100, '2023-06-19 13:35:30'),
(22, 17, 100, '2023-06-19 13:35:32'),
(23, 17, 10800, '2023-06-19 15:03:04'),
(24, 19, 2000, '2023-06-19 15:12:05'),
(25, 19, 2000, '2023-06-19 15:12:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) NOT NULL,
  `nombrep` varchar(255) NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombrep`, `precio`, `imagen`) VALUES
(6, 'Ramo de rosas', 500, 'https://cdn.shopify.com/s/files/1/1393/2855/products/ramo-de-rosas-rojas-a-domicilio-florerias-cdmx.jpg?v=1660674193'),
(7, 'Caja de rosas', 1000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTceOabgs1simoizo42sMShSVx_XkD6XHunv7kfW3JTYJS3SBsTtl2534elr5ANmoW7e88&usqp=CAU'),
(8, 'Caja de girasoles', 1000, 'https://lebloomroom.com/wp-content/uploads/2019/06/Caja-de-Girasoles-Grande.png'),
(9, 'Ramo de girasoles', 500, 'https://cdn.shopify.com/s/files/1/1087/4410/products/IMG_6302_1080x.jpg?v=1658117098'),
(11, 'zzz', 200, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba`
--

CREATE TABLE `prueba` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `edad` varchar(3) NOT NULL,
  `email` varchar(200) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `Id_cargo` int(1) NOT NULL,
  `sesion` varchar(30) NOT NULL DEFAULT 'NA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nombre`, `apellidos`, `contrasena`, `edad`, `email`, `genero`, `Id_cargo`, `sesion`) VALUES
(1, 'Jair Alberto', 'Tapia Becerra', '123456789', '22', 'jair.alberto1905@gmail.com', 'Hombre', 1, '1061923055953'),
(2, 'Efraín', 'Jiménez Magaña', '123456789', '20', 'chilester08@gmail.com', 'Hombre', 2, 'NA'),
(15, 'Victor', 'Medina', '123456789', '25', 'a17100195@gmail.com', 'Hombre', 2, '15061923060146'),
(17, 'Dieguito', 'Martinez', '123456789', '22', 'diego.mtz.ra@gmail.com', 'Otro', 2, 'NA'),
(18, 'Eduardo', 'Reynoso', '123456789', '20', 'a21310378@ceti.mx', 'Otro', 2, 'NA'),
(19, 'aaaaa', 'bbbbb', '123456789', '18', 'eduardochino51@gmail.com', 'Hombre', 2, '19061923051135');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contenido_carrito`
--
ALTER TABLE `contenido_carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prueba`
--
ALTER TABLE `prueba`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Id_cargo` (`Id_cargo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contenido_carrito`
--
ALTER TABLE `contenido_carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `prueba`
--
ALTER TABLE `prueba`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Id_cargo`) REFERENCES `cargo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
