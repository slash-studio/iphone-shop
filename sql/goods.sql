-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Авг 30 2013 г., 20:57
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `apple_shop`
--

-- --------------------------------------------------------

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
  `category_id` int(11) NOT NULL,
  `keywords` text NOT NULL,
  `good_view` int(11) DEFAULT '0',
  `main_display` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `name`, `description`, `display`, `old_price`, `price`, `category_id`, `keywords`, `good_view`, `main_display`) VALUES
(3, 'iPhone 5 32GB Black', 'iPhone 5 оснащен 4-дюймовым дисплеем Retina, с разрешением 1136 x 640 пикселей. Разрешающая способность нового экрана составляет прежние 326 ppi. Кроме того, Apple на 44% улучшила цветопередачу экрана. iPhone 5 способен работать в сетях GPRS, EDGE, EV-DO, HSPA, HSPA+, DC-HSDPA и LTE. В сетях HSPA+ устройство поддерживает скорость до 21 Мбит/с, DC-HSDPA - до 42 Мбит/с, LTE - до 100 Мбит/с. Для поддержки всех технологий связи используется один модем. Смартфон способен автоматически переключаться с одной технологии на другую в режиме реального времени. Поддерживается двухканальная передача данныхпо Wi-Fi 802.11 a/b/g/n с максимальной скоростью 150 Мбит/с.', 1, '30000', '24000', 1, 'iphone, айфон, телефон', 0, 0),
(4, 'iPad 4 16Gb Wi-Fi', 'iPad 4-го поколения. В два раза быстрее своего предшественника; теперь с поддержкой скоростных беспроводных сетей. Оснащён экраном Retina, который даёт изображение потрясающего качества. Работает до 10 часов без подзарядки. Позволяет использовать почти 300 тыс. приложений и игр, и по-прежнему является идеальным устройством для работы, учёбы, развлечений и практически любых других задач.', 1, '12000', '11000', 3, 'ipad, айпэд, айпад, планшет', 0, 0),
(5, 'iPhone 5 64GB Black', 'iPhone 5 оснащен 4-дюймовым дисплеем Retina, с разрешением 1136 x 640 пикселей. Разрешающая способность нового экрана составляет прежние 326 ppi. Кроме того, Apple на 44% улучшила цветопередачу экрана. iPhone 5 способен работать в сетях GPRS, EDGE, EV-DO, HSPA, HSPA+, DC-HSDPA и LTE. В сетях HSPA+ устройство поддерживает скорость до 21 Мбит/с, DC-HSDPA - до 42 Мбит/с, LTE - до 100 Мбит/с. Для поддержки всех технологий связи используется один модем. Смартфон способен автоматически переключаться с одной технологии на другую в режиме реального времени. Поддерживается двухканальная передача данныхпо Wi-Fi 802.11 a/b/g/n с максимальной скоростью 150 Мбит/с.', 1, '30000', '28000', 1, 'iphone, айфон, телефон', 0, 0),
(6, 'iPad 4 16GB Wi-Fi, White', 'Возьмите в руки iPad с дисплеем Retina, и Вы удивитесь высочайшей чёткости изображения. Всё выглядит настолько реалистично, что кажется, будто Вы действительно листаете фотографии, читаете книгу или играете на фортепиано. Теперь между Вами и Вашими любимыми занятиями нет никаких преград. Основные элементы iPad — дисплей, процессор, камеры, беспроводная связь — идеально работают вместе, чтобы вы с удовольствием пользовались устройством. Это делает iPad способным на то, о чём Вы даже не мечтали. \nНовый процессор A6X в iPad работает до двух раз быстрее, чем процессор A5X предыдущего поколения, и обеспечивает вдвое более высокую скорость обработки графики — и всё это без ущерба для времени работы аккумулятора. Это означает, что даже самые сложные приложения работают плавно, быстро и невероятно реалистично. ', 1, '17000', '15000', 3, 'ipad, айпэд, айпад, планшет', 0, 0),
(7, 'Чехол для iPhone 5 Unicase', 'Unicase', 1, '1000', '1000', 7, 'чехол, unicase, england', 0, 0),
(8, 'iPod 6 64GB', 'iPod touch 5-го поколения — это игровая приставка, музыкальный и видеоплеер, фотоальбом, карманный компьютер, видеокамера и фотоаппарат. Это максимум развлечений в стильном, компактном корпусе размером чуть больше кредитной карты, на большом, красочном Retina-экране диагональю 4″.', 1, '15000', '14000', 2, 'айпод, ipod, плеер, touch', 0, 1);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
