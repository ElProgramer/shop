-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-07-2017 a las 16:52:15
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add item', 7, 'add_item'),
(20, 'Can change item', 7, 'change_item'),
(21, 'Can delete item', 7, 'delete_item'),
(22, 'Can add consola', 8, 'add_consola'),
(23, 'Can change consola', 8, 'change_consola'),
(24, 'Can delete consola', 8, 'delete_consola'),
(25, 'Can add usuario', 9, 'add_usuario'),
(26, 'Can change usuario', 9, 'change_usuario'),
(27, 'Can delete usuario', 9, 'delete_usuario'),
(28, 'Can add genero', 10, 'add_genero'),
(29, 'Can change genero', 10, 'change_genero'),
(30, 'Can delete genero', 10, 'delete_genero'),
(31, 'Can add tipo', 11, 'add_tipo'),
(32, 'Can change tipo', 11, 'change_tipo'),
(33, 'Can delete tipo', 11, 'delete_tipo'),
(34, 'Can add carrito', 12, 'add_carrito'),
(35, 'Can change carrito', 12, 'change_carrito'),
(36, 'Can delete carrito', 12, 'delete_carrito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `idcarrito` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_items_carrito`
--

CREATE TABLE `carrito_items_carrito` (
  `id` int(11) NOT NULL,
  `carrito_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consola`
--

CREATE TABLE `consola` (
  `idconsola` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `consola`
--

INSERT INTO `consola` (`idconsola`, `nombre`) VALUES
(1, 'PC'),
(2, 'Xbox 360'),
(3, 'Xbox One'),
(4, 'Nintendo 3DS'),
(5, 'Nintendo Switch'),
(6, 'PlayStation 4'),
(7, 'PlayStation 3'),
(8, 'PSP Vita');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'shop', 'item'),
(8, 'shop', 'consola'),
(9, 'shop', 'usuario'),
(10, 'shop', 'genero'),
(11, 'shop', 'tipo'),
(12, 'shop', 'carrito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-07-25 06:22:17.328454'),
(2, 'auth', '0001_initial', '2017-07-25 06:22:19.994828'),
(3, 'admin', '0001_initial', '2017-07-25 06:22:20.662587'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-07-25 06:22:20.677598'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-07-25 06:22:20.964500'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-07-25 06:22:21.192467'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-07-25 06:22:21.337565'),
(8, 'auth', '0004_alter_user_username_opts', '2017-07-25 06:22:21.351573'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-07-25 06:22:21.686377'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-07-25 06:22:21.691381'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-07-25 06:22:21.705391'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-07-25 06:22:21.830989'),
(13, 'sessions', '0001_initial', '2017-07-25 06:22:22.050478'),
(14, 'shop', '0001_initial', '2017-07-25 06:22:33.061468'),
(15, 'shop', '0002_auto_20170725_0355', '2017-07-25 07:55:33.473138'),
(16, 'shop', '0003_auto_20170725_0407', '2017-07-25 08:07:15.232028'),
(17, 'shop', '0004_usuario_items', '2017-07-25 22:58:43.811055'),
(18, 'shop', '0005_auto_20170726_1141', '2017-07-26 15:41:47.311887'),
(19, 'shop', '0006_auto_20170726_1214', '2017-07-26 16:14:33.493610'),
(20, 'shop', '0007_auto_20170726_1218', '2017-07-26 16:18:20.355261');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `idgenero` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`idgenero`, `nombre`) VALUES
(1, 'Supervivencia'),
(2, 'Indie'),
(3, 'Accion'),
(4, 'Aventura'),
(5, 'Shooter'),
(6, 'Luchas'),
(7, 'Horror'),
(8, 'Casual'),
(9, 'Estrategia'),
(10, 'Rol'),
(11, 'RPG'),
(12, 'Online'),
(13, 'Un jugador'),
(14, 'Deporte'),
(15, 'Metroidvania'),
(16, 'Rogue-Like'),
(17, 'Hack and Slash');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `iditem` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` double NOT NULL,
  `fecha_salida` date NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_consolas_item`
--

CREATE TABLE `item_consolas_item` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `consola_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `item_consolas_item`
--

INSERT INTO `item_consolas_item` (`id`, `item_id`, `consola_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 7, 1),
(6, 8, 1),
(7, 9, 1),
(8, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_generos_item`
--

CREATE TABLE `item_generos_item` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `genero_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `item_generos_item`
--

INSERT INTO `item_generos_item` (`id`, `item_id`, `genero_id`) VALUES
(11, 9, 1),
(10, 8, 2),
(9, 7, 1),
(4, 1, 13),
(5, 2, 1),
(6, 3, 1),
(7, 4, 1),
(12, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `idtipo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idtipo`, `nombre`) VALUES
(1, 'Usuario'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(15) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL,
  `apellido` varchar(45) CHARACTER SET latin1 NOT NULL,
  `correo` varchar(45) CHARACTER SET latin1 NOT NULL,
  `password` varchar(45) COLLATE utf8_bin NOT NULL,
  `dinero` double NOT NULL,
  `carrito_idcarrito` int(11) DEFAULT NULL,
  `tipo_idtipo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usuario`, `nombre`, `apellido`, `correo`, `password`, `dinero`, `carrito_idcarrito`, `tipo_idtipo`) VALUES
(14, 'admin', 'admin', 'admin', 'admin@admin.com', 'admin', 99999, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_items`
--

CREATE TABLE `usuario_items` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuario_items`
--

INSERT INTO `usuario_items` (`id`, `usuario_id`, `item_id`) VALUES
(17, 11, 4),
(16, 11, 3),
(15, 11, 2),
(14, 11, 1),
(18, 13, 2),
(19, 13, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  ADD KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  ADD KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  ADD KEY `auth_user_groups_group_id_97559544` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  ADD KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idcarrito`);

--
-- Indices de la tabla `carrito_items_carrito`
--
ALTER TABLE `carrito_items_carrito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carrito_items_carrito_carrito_id_item_id_fd74588f_uniq` (`carrito_id`,`item_id`),
  ADD KEY `carrito_items_carrito_carrito_id_f65d5bab` (`carrito_id`),
  ADD KEY `carrito_items_carrito_item_id_6c3b0ac6` (`item_id`);

--
-- Indices de la tabla `consola`
--
ALTER TABLE `consola`
  ADD PRIMARY KEY (`idconsola`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`idgenero`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`iditem`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `item_consolas_item`
--
ALTER TABLE `item_consolas_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_consolas_item_item_id_consola_id_e43cf98d_uniq` (`item_id`,`consola_id`),
  ADD KEY `item_consolas_item_item_id_e47373f7` (`item_id`),
  ADD KEY `item_consolas_item_consola_id_23767c9d` (`consola_id`);

--
-- Indices de la tabla `item_generos_item`
--
ALTER TABLE `item_generos_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_generos_item_item_id_genero_id_5d01e3f5_uniq` (`item_id`,`genero_id`),
  ADD KEY `item_generos_item_item_id_a897e580` (`item_id`),
  ADD KEY `item_generos_item_genero_id_4cd8fad2` (`genero_id`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`idtipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `usuario_carrito_idcarrito_3b714e7a_fk_carrito_idcarrito` (`carrito_idcarrito`),
  ADD KEY `usuario_tipo_idtipo_10b41000_fk_tipo_idtipo` (`tipo_idtipo`);

--
-- Indices de la tabla `usuario_items`
--
ALTER TABLE `usuario_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_items_usuario_id_item_id_faed6381_uniq` (`usuario_id`,`item_id`),
  ADD KEY `usuario_items_usuario_id_90018178` (`usuario_id`),
  ADD KEY `usuario_items_item_id_73035979` (`item_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `idcarrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `carrito_items_carrito`
--
ALTER TABLE `carrito_items_carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT de la tabla `consola`
--
ALTER TABLE `consola`
  MODIFY `idconsola` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `idgenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
  MODIFY `iditem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `item_consolas_item`
--
ALTER TABLE `item_consolas_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `item_generos_item`
--
ALTER TABLE `item_generos_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `idtipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `usuario_items`
--
ALTER TABLE `usuario_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
