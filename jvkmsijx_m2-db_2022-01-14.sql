-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 14 2022 г., 17:57
-- Версия сервера: 8.0.23
-- Версия PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `jvkmsijx_m2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  `count` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `comment` text NOT NULL,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  `comment_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `comment`, `user_id`, `course_id`, `comment_time`) VALUES
(1, 'Все было прекрасно, мой ребенок доволен, спасибо!', 2, 11, '2022-01-07 10:08:47'),
(2, 'Пример отзыв', 5, 10, '2022-01-07 10:34:05'),
(3, 'fgnxcgbxdfggbsdgb', 2, 1, '2022-01-09 10:38:56'),
(4, 'dsfbsdsdfgsdfgdsf', 2, 1, '2022-01-09 11:35:00');

-- --------------------------------------------------------

--
-- Структура таблицы `course`
--

CREATE TABLE `course` (
  `id` int NOT NULL,
  `name` varchar(512) NOT NULL,
  `description` text NOT NULL,
  `count` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `course`
--

INSERT INTO `course` (`id`, `name`, `description`, `count`, `image`, `price`) VALUES
(1, 'Английский для начинающих', 'Обучение английского языка для начинающих позволяет начать понимать иностранную речь, читать, грамотно писать и бегло разговаривать. Здесь вы познакомитесь с грамматическими правилами уровней Beginner и Elementary, выучите формы глаголов.', 0, 'f639b885193e0d7c0c1b7624173d1b1d', 400),
(3, 'Программирование для школьников', 'Знакомство с миром программирования и популярнейшим языком JavaScript. Этот курс рассчитан на новичков без опыта в программировании. Научитесь писать простые программы, понимать ошибки, которые возникают при запуске и выполнении кода, получите опыт работы с модулями в JavaScript и получите необходимую базу для движения к следующим курсам учебной программы «Профессия JavaScript-программист».', 12, '1-1.jpg', 350),
(5, 'Подготовка к ЕГЭ (любой предмет)', 'Как известно, в 2022 году нас ждут изменения в формате Единого Государственного Экзамена. В рамках данного курса мы разберем причины, по которым эти изменения были необходимы, познакомимся с новой перспективной моделью экзамена и узнаем, как выстроить стратегию подготовки учеников.', 20, '1-3.jpg', 500),
(10, 'Курсы по робототехнике для детей 12-14 лет', 'Разрабатывая автоматизированные системы, робототехник опирается на знания электроники, механики, кибернетики и других дисциплин. Школьник же при решении подобных задач ориентируется на сведения, полученные на уроках физики, математики и информатики. На занятиях по робототехнике затрагиваются все эти науки, что помогает детям открыть их для себя на новом уровне.', 20, '15c662e3777df54cc6252d5d29cf5715', 500),
(11, 'Ментальная арифметика', 'Программу занятий ментальной арифметикой составляют механические упражнения пальцами на счетах, счет в уме и упражнения на концентрацию, внимание и логику. Помогает значительно увеличить скорость мышления и способность к творческим дисциплинам. Подходит детям и взрослым.', 25, 'fb330fc621eb23d2baad001519043388', 600);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('admin','manager','customer','') NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `email`, `role`) VALUES
(1, 'admin', 'admin', 'a@mail.ru', 'admin'),
(2, 'demo', 'demo', 's@mail.rui', 'customer'),
(5, 'test', 'test', 'te@mail.ru', 'customer'),
(6, 'testmanager', 'test', 'a@mail.ru', 'manager');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Индексы таблицы `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `course`
--
ALTER TABLE `course`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
