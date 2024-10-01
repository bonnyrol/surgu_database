-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Окт 01 2024 г., 18:11
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_karachihin7661_lab_1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `consumable_invoice`
--

CREATE TABLE `consumable_invoice` (
  `id` bigint NOT NULL,
  `ci_datetime` datetime NOT NULL,
  `buyer` varchar(255) NOT NULL COMMENT 'Покупатель'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Расходная накладная';

--
-- Дамп данных таблицы `consumable_invoice`
--

INSERT INTO `consumable_invoice` (`id`, `ci_datetime`, `buyer`) VALUES
(1, '2024-01-20 12:00:00', 'Покупатель 1'),
(2, '2024-01-21 13:30:00', 'Покупатель 2'),
(3, '2024-01-22 14:45:00', 'Покупатель 3'),
(4, '2024-01-23 12:30:00', 'Покупатель 4'),
(5, '2024-01-24 15:15:00', 'Покупатель 5');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` bigint NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Название товара',
  `category_id` bigint NOT NULL,
  `weight` float NOT NULL COMMENT 'Вес товара'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Товары';

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `product_name`, `category_id`, `weight`) VALUES
(1, 'Яблоки', 1, 1),
(2, 'Кофта', 2, 0.5),
(3, 'Смартфон', 3, 0.2),
(4, 'Роман', 4, 0.3),
(5, 'Моющее средство', 5, 1),
(6, 'Крем для лица', 6, 0.1),
(7, 'Футбольный мяч', 7, 0.4),
(8, 'Конструктор', 8, 0.8),
(9, 'Диван', 9, 52),
(10, 'Автомобильные шины', 10, 10),
(11, 'Груши', 1, 1),
(12, 'Платье', 2, 0.4),
(13, 'Ноутбук', 3, 2.3),
(14, 'Кулинарная книга', 4, 0.5),
(15, 'Порошок для стирки', 5, 1.5);

-- --------------------------------------------------------

--
-- Структура таблицы `product_category`
--

CREATE TABLE `product_category` (
  `id` bigint NOT NULL,
  `category_name` varchar(255) NOT NULL COMMENT 'Название категории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Категории товаров';

--
-- Дамп данных таблицы `product_category`
--

INSERT INTO `product_category` (`id`, `category_name`) VALUES
(1, 'Продукты питания'),
(2, 'Одежда'),
(3, 'Электроника'),
(4, 'Книги'),
(5, 'Бытовая химия'),
(6, 'Косметика'),
(7, 'Спортивные товары'),
(8, 'Игрушки'),
(9, 'Мебель'),
(10, 'Автотовары');

-- --------------------------------------------------------

--
-- Структура таблицы `product_consumable_invoice`
--

CREATE TABLE `product_consumable_invoice` (
  `id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `ci_id` bigint NOT NULL,
  `ci_quantity` int NOT NULL COMMENT 'Колчиество',
  `ci_price` int NOT NULL COMMENT 'Цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='товар расходной накладной';

--
-- Дамп данных таблицы `product_consumable_invoice`
--

INSERT INTO `product_consumable_invoice` (`id`, `product_id`, `ci_id`, `ci_quantity`, `ci_price`) VALUES
(1, 1, 1, 20, 30),
(2, 3, 1, 1, 15000),
(3, 4, 2, 2, 800),
(4, 6, 2, 5, 300),
(5, 7, 3, 3, 1000),
(6, 8, 4, 4, 1200),
(7, 9, 5, 1, 15000),
(8, 10, 5, 2, 3000);

-- --------------------------------------------------------

--
-- Структура таблицы `product_receipt_invoice`
--

CREATE TABLE `product_receipt_invoice` (
  `id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `ri_id` bigint NOT NULL,
  `ri_quantity` int NOT NULL COMMENT 'Количество',
  `ri_price` int NOT NULL COMMENT 'Цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='товар приходной накладной';

--
-- Дамп данных таблицы `product_receipt_invoice`
--

INSERT INTO `product_receipt_invoice` (`id`, `product_id`, `ri_id`, `ri_quantity`, `ri_price`) VALUES
(1, 1, 1, 100, 30),
(2, 2, 1, 50, 500),
(3, 3, 2, 20, 15000),
(4, 4, 2, 15, 800),
(5, 5, 3, 25, 200),
(6, 6, 3, 30, 300),
(7, 7, 4, 10, 1000),
(8, 8, 4, 15, 1200),
(9, 9, 5, 5, 15000),
(10, 10, 5, 8, 3000);

-- --------------------------------------------------------

--
-- Структура таблицы `receipt_invoice`
--

CREATE TABLE `receipt_invoice` (
  `id` bigint NOT NULL,
  `ri_datetime` datetime NOT NULL,
  `provider` varchar(255) NOT NULL COMMENT 'Поставщик'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Приходная накладная';

--
-- Дамп данных таблицы `receipt_invoice`
--

INSERT INTO `receipt_invoice` (`id`, `ri_datetime`, `provider`) VALUES
(1, '2024-01-15 10:00:00', 'Поставщик 1'),
(2, '2024-01-16 11:30:00', 'Поставщик 2'),
(3, '2024-01-17 09:45:00', 'Поставщик 3'),
(4, '2024-01-18 14:00:00', 'Поставщик 4'),
(5, '2024-01-19 16:15:00', 'Поставщик 5');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `consumable_invoice`
--
ALTER TABLE `consumable_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_consumable_invoice`
--
ALTER TABLE `product_consumable_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`,`ci_id`),
  ADD KEY `ci_id` (`ci_id`);

--
-- Индексы таблицы `product_receipt_invoice`
--
ALTER TABLE `product_receipt_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`,`ri_id`),
  ADD KEY `ri_id` (`ri_id`);

--
-- Индексы таблицы `receipt_invoice`
--
ALTER TABLE `receipt_invoice`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `consumable_invoice`
--
ALTER TABLE `consumable_invoice`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `product_consumable_invoice`
--
ALTER TABLE `product_consumable_invoice`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `product_receipt_invoice`
--
ALTER TABLE `product_receipt_invoice`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `receipt_invoice`
--
ALTER TABLE `receipt_invoice`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_consumable_invoice`
--
ALTER TABLE `product_consumable_invoice`
  ADD CONSTRAINT `product_consumable_invoice_ibfk_1` FOREIGN KEY (`ci_id`) REFERENCES `consumable_invoice` (`id`),
  ADD CONSTRAINT `product_consumable_invoice_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_receipt_invoice`
--
ALTER TABLE `product_receipt_invoice`
  ADD CONSTRAINT `product_receipt_invoice_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_receipt_invoice_ibfk_2` FOREIGN KEY (`ri_id`) REFERENCES `receipt_invoice` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
