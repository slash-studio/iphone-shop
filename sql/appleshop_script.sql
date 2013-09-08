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
  alias VARCHAR(40) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE KEY(alias)
);

CREATE TABLE subcategory (
  id        INT NOT NULL,
  parent_id INT NOT NULL,
  FOREIGN KEY(id)        REFERENCES category(id) ON DELETE CASCADE,
  FOREIGN KEY(parent_id) REFERENCES category(id) ON DELETE CASCADE
);

CREATE TABLE delivery_type (
   id   INT NOT NULL AUTO_INCREMENT,
   name VARCHAR(15),
   PRIMARY KEY(id)
);

CREATE TABLE cart_order (
  id               INT          NOT NULL AUTO_INCREMENT,
  name             VARCHAR(100) NOT NULL,
  phone            VARCHAR(30)  NOT NULL,
  email            VARCHAR(100) NOT NULL,
  delivery         INT(1)       NOT NULL DEFAULT '0', -- 0 - Доставка не нужна, 1 - доставка необходима
  delivery_type_id INT,
  address          VARCHAR(100),
  PRIMARY KEY(id),
  FOREIGN KEY(delivery_type_id) REFERENCES delivery_type(id) ON DELETE CASCADE
);
--
-- Структура таблицы `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `display` int(1) NOT NULL DEFAULT '1',
  `main_display` int(1) NOT NULL DEFAULT '0',
  `old_price` varchar(30) NOT NULL,
  `price` varchar(30) NOT NULL,
  `category_id` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY(category_id) REFERENCES category(id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

CREATE TABLE cart_order_goods (
  order_id INT NOT NULL,
  good_id  INT NOT NULL,
  amount   INT NOT NULL,
  FOREIGN KEY(order_id) REFERENCES cart_order(id) ON DELETE CASCADE,
  FOREIGN KEY(good_id)  REFERENCES goods(id)      ON DELETE CASCADE
);

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

INSERT INTO category(name, alias) VALUES
   ('iPhone', 'iphone'),
   ('iPod', 'ipod'),
   ('iPad', 'ipad'),
   ('Аксессуары', 'accessory'),
   ('Наушники', 'headphones'),
   ('Прочее', 'other');

INSERT INTO delivery_type(name) VALUES
   ('EMS'),
   ('emd1'),
   ('Почта России');


INSERT INTO subcategory(id, parent_id) VALUES
   (1, 1),
   (2, 2),
   (3, 3),
   (4, 4),
   (5, 4),
   (6, 6);
   INSERT INTO `goods` (`id`, `name`, `description`, `display`, `old_price`, `price`, `category_id`, `keywords`, `good_view`, `main_display`) VALUES
(3, 'iPhone 5 32GB Black', 'iPhone 5 оснащен 4-дюймовым дисплеем Retina, с разрешением 1136 x 640 пикселей. Разрешающая способность нового экрана составляет прежние 326 ppi. Кроме того, Apple на 44% улучшила цветопередачу экрана. iPhone 5 способен работать в сетях GPRS, EDGE, EV-DO, HSPA, HSPA+, DC-HSDPA и LTE. В сетях HSPA+ устройство поддерживает скорость до 21 Мбит/с, DC-HSDPA - до 42 Мбит/с, LTE - до 100 Мбит/с. Для поддержки всех технологий связи используется один модем. Смартфон способен автоматически переключаться с одной технологии на другую в режиме реального времени. Поддерживается двухканальная передача данныхпо Wi-Fi 802.11 a/b/g/n с максимальной скоростью 150 Мбит/с.', 1, '30000', '24000', 1, 'iphone, айфон, телефон', 0, 0),
(4, 'iPad 4 16Gb Wi-Fi', 'iPad 4-го поколения. В два раза быстрее своего предшественника; теперь с поддержкой скоростных беспроводных сетей. Оснащён экраном Retina, который даёт изображение потрясающего качества. Работает до 10 часов без подзарядки. Позволяет использовать почти 300 тыс. приложений и игр, и по-прежнему является идеальным устройством для работы, учёбы, развлечений и практически любых других задач.', 1, '12000', '11000', 3, 'ipad, айпэд, айпад, планшет', 0, 0),
(5, 'iPhone 5 64GB Black', 'iPhone 5 оснащен 4-дюймовым дисплеем Retina, с разрешением 1136 x 640 пикселей. Разрешающая способность нового экрана составляет прежние 326 ppi. Кроме того, Apple на 44% улучшила цветопередачу экрана. iPhone 5 способен работать в сетях GPRS, EDGE, EV-DO, HSPA, HSPA+, DC-HSDPA и LTE. В сетях HSPA+ устройство поддерживает скорость до 21 Мбит/с, DC-HSDPA - до 42 Мбит/с, LTE - до 100 Мбит/с. Для поддержки всех технологий связи используется один модем. Смартфон способен автоматически переключаться с одной технологии на другую в режиме реального времени. Поддерживается двухканальная передача данныхпо Wi-Fi 802.11 a/b/g/n с максимальной скоростью 150 Мбит/с.', 1, '30000', '28000', 1, 'iphone, айфон, телефон', 0, 0),
(6, 'iPad 4 16GB Wi-Fi, White', 'Возьмите в руки iPad с дисплеем Retina, и Вы удивитесь высочайшей чёткости изображения. Всё выглядит настолько реалистично, что кажется, будто Вы действительно листаете фотографии, читаете книгу или играете на фортепиано. Теперь между Вами и Вашими любимыми занятиями нет никаких преград. Основные элементы iPad — дисплей, процессор, камеры, беспроводная связь — идеально работают вместе, чтобы вы с удовольствием пользовались устройством. Это делает iPad способным на то, о чём Вы даже не мечтали. \nНовый процессор A6X в iPad работает до двух раз быстрее, чем процессор A5X предыдущего поколения, и обеспечивает вдвое более высокую скорость обработки графики — и всё это без ущерба для времени работы аккумулятора. Это означает, что даже самые сложные приложения работают плавно, быстро и невероятно реалистично. ', 1, '17000', '15000', 3, 'ipad, айпэд, айпад, планшет', 0, 0),
(7, 'Чехол для iPhone 5 Unicase', 'Unicase', 1, '1000', '1000', 7, 'чехол, unicase, england', 0, 0),
(8, 'iPod 6 64GB', 'iPod touch 5-го поколения — это игровая приставка, музыкальный и видеоплеер, фотоальбом, карманный компьютер, видеокамера и фотоаппарат. Это максимум развлечений в стильном, компактном корпусе размером чуть больше кредитной карты, на большом, красочном Retina-экране диагональю 4″.', 1, '15000', '14000', 2, 'айпод, ipod, плеер, touch', 0, 1);

INSERT INTO `images` (`id`, `good_id`) VALUES
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8);
