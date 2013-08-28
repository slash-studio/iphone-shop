CREATE DATABASE apple_shop DEFAULT CHARSET utf8;

use apple_shop;

GRANT SELECT, INSERT, UPDATE, DELETE
ON apple_shop.*
TO smite@localhost IDENTIFIED BY 'smite107';

-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июл 15 2013 г., 23:31
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `sevnlayers`
--

-- --------------------------------------------------------

CREATE TABLE category (
  id    INT NOT NULL AUTO_INCREMENT,
  name  VARCHAR(40) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE subcategory (
  id        INT NOT NULL,
  parent_id INT NOT NULL,
  FOREIGN KEY(id)        REFERENCES category(id) ON DELETE CASCADE,
  FOREIGN KEY(parent_id) REFERENCES category(id) ON DELETE CASCADE
);


CREATE TABLE cart_order (
  id        INT NOT NULL AUTO_INCREMENT,
  name      VARCHAR(100) NOT NULL,
  phone     VARCHAR(30)  NOT NULL,
  email     VARCHAR(100) NOT NULL,
  delivery  int(1) NOT NULL DEFAULT '0', -- 0 - Доставка не нужна, 1 - доставка необходима
  address   VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
);



--
-- Структура таблицы `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `display` int(1) NOT NULL DEFAULT '1',
  `old_price` varchar(30) NOT NULL,
  `price` varchar(30) NOT NULL,
  `category_id` int NOT NULL,
  `keywords` text NOT NULL,
  `good_view` INT DEFAULT 0,
  PRIMARY KEY (`id`),
  FOREIGN KEY(category_id) REFERENCES category(id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO category(name) VALUES
   ('iPhone'),
   ('iPod'),
   ('iPad'),
   ('Аксессуары'),
   ('Наушники'),
   ('Прочее');

INSERT INTO subcategory(id, parent_id) VALUES
   (1, 1),
   (2, 2),
   (3, 3),
   (4, 4),
   (5, 4),
   (6, 6);