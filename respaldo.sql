-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2017 a las 00:24:20
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `respaldo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `id_acceso` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `area_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_area_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`id_acceso`, `user_id`, `departamento_id`, `area_id`, `sub_area_id`, `created_at`, `updated_at`) VALUES
(4, 1, 1, '1,2,3,4,5', '3,4,5,6,7,8,9,10,11', '2017-06-08 02:57:52', '2017-06-08 02:57:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id_area` int(10) UNSIGNED NOT NULL,
  `departamento_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id_area`, `departamento_id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 1, 'Departamentos', '2017-06-07 21:50:49', '2017-06-07 21:50:49'),
(2, 1, 'Proveedores', '2017-06-07 21:52:13', '2017-06-07 21:52:13'),
(3, 1, 'Unidades', '2017-06-07 21:54:18', '2017-06-07 21:54:34'),
(4, 1, 'Configuración', '2017-06-07 21:54:59', '2017-06-07 21:54:59'),
(5, 1, 'Requisiciones', '2017-06-07 21:55:17', '2017-06-07 21:55:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id_departamento` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fa_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `nombre`, `descripcion`, `fa_class`, `created_at`, `updated_at`) VALUES
(1, 'Compras', 'departamento de compras', 'fa fa-home', '2017-06-07 21:50:49', '2017-06-07 21:50:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_area`
--

CREATE TABLE `sub_area` (
  `id_sub_area` int(10) UNSIGNED NOT NULL,
  `area_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sub_area`
--

INSERT INTO `sub_area` (`id_sub_area`, `area_id`, `nombre`, `descripcion`, `ruta`, `created_at`, `updated_at`) VALUES
(3, 1, 'Ver departamentos', 'sub area para ver los departamentos', 'Compras\\Departamentos.index', '2017-06-07 21:57:25', '2017-06-07 21:57:25'),
(4, 1, 'Crear Departamento', 'Area para crear los departamentos', 'Compras\\Departamentos.create', '2017-06-07 21:57:56', '2017-06-07 21:57:56'),
(5, 2, 'Ver proveedores', 'Area para ver los proveedores', 'Compras\\Proveedores.index', '2017-06-07 21:58:22', '2017-06-07 21:58:22'),
(6, 2, 'Registrar Proveedor', 'Arear para crear proveedores', 'Compras\\Proveedores.create', '2017-06-07 21:58:54', '2017-06-07 21:58:54'),
(7, 3, 'Ver unidades', 'Area para ver las unidades', 'Compras\\UnidadesMedida.index', '2017-06-07 21:59:23', '2017-06-07 21:59:23'),
(8, 3, 'Registrar Unidad', 'Area para registrar las nidades de compra', 'Compras\\UnidadesMedida.create', '2017-06-07 22:00:10', '2017-06-07 22:00:10'),
(9, 4, 'configurar', 'area para grabar la configuración del sistema', 'Compras\\Configurar.index', '2017-06-07 22:02:27', '2017-06-07 22:02:27'),
(10, 5, 'Ver requisiciones', 'ruta para ver las requisiciones del sistema', 'Compras\\Requisiciones.index', '2017-06-07 22:08:11', '2017-06-07 22:08:11'),
(11, 5, 'Crear Requisición', 'vista para crear las requisiciones de compras', 'Compras\\Requisiciones.create', '2017-06-08 02:57:34', '2017-06-08 02:57:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nac` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol_id` int(10) UNSIGNED NOT NULL,
  `departamento_id` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombres`, `apellidos`, `nac`, `cedula`, `usuario`, `telefono`, `password`, `rol_id`, `departamento_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'xeichmann', 'Mrs. Aiyana Miller DDS', 'V', '21202500', 'admin', '04124362753', '$2y$10$N7ZXKxL5mQFm6gPaaUhjRuGkwmoJtW8DWA2BRvZJen4NX1GuWZ7HS', 1, 1, NULL, '2017-06-07 21:50:50', '2017-06-08 02:57:52');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`id_acceso`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`),
  ADD KEY `area_departamento_id_foreign` (`departamento_id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `sub_area`
--
ALTER TABLE `sub_area`
  ADD PRIMARY KEY (`id_sub_area`),
  ADD KEY `sub_area_area_id_foreign` (`area_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_rol_id_foreign` (`rol_id`),
  ADD KEY `users_departamento_id_foreign` (`departamento_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `id_acceso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id_departamento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `sub_area`
--
ALTER TABLE `sub_area`
  MODIFY `id_sub_area` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `area_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id_departamento`);

--
-- Filtros para la tabla `sub_area`
--
ALTER TABLE `sub_area`
  ADD CONSTRAINT `sub_area_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `area` (`id_area`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id_departamento`),
  ADD CONSTRAINT `users_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id_rol`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
