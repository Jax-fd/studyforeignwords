-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 09 2018 г., 02:21
-- Версия сервера: 5.6.34
-- Версия PHP: 7.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `3000engwords`
--

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2017_07_03_013659_create_words_table', 2),
('2017_07_03_234112_create_users_words_table', 3),
('2017_07_07_143436_add_date_of_repeat_to_users_words', 4),
('2017_07_07_163205_create_table_stages_of_repeat', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('jax_fd@mail.ru', 'a76c7f212af699c7a6da5cd9c5d6dfed517d9b2b7397f60abe5e3a959a73e5f6', '2017-07-15 20:38:57');

-- --------------------------------------------------------

--
-- Структура таблицы `stages_of_repeat`
--

CREATE TABLE `stages_of_repeat` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `stages` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `stages_of_repeat`
--

INSERT INTO `stages_of_repeat` (`id`, `user_id`, `stages`, `created_at`, `updated_at`) VALUES
(1, 0, '1,1,1,2,4,8,15,20,25,30', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'jax', 'jax_fd@mail.ru', '$2y$10$W6sYBzWalRpRc137CA3gr.87KoU9ipPcMwXoewhAxC784c3Cc.xyK', 'G4phJ4pc3Rg3enh2hwh0xm5QxuFVZ2HP9ETp7OkRdjHcsWJEmtcxKGM3o1OU', '2017-06-27 16:58:56', '2017-08-21 23:55:41'),
(2, 'Jax2', 'jax_13@inbox.ru', '$2y$10$.QwekIkkhttFsmXeKm.oK.596zxq654TYpTH/SUPkMx22e2xD07D2', 'ObgF485KnjjIz7Y3CVup9nGGRgLTGmkvCp0KgKWh0jAIEMpsKVMY88cR0FdW', '2017-07-04 12:27:45', '2017-07-04 17:10:56'),
(3, 'Jax3', 'jax_3@mail.ru', '$2y$10$Ss6dYhu4qPB.yPf9ESUOxe7VDAp6LYMCvDrZr9be2jlCtIDq8C9Ye', 'EjHm7FRoo46Hqd6oXsCA7dsSol0wURczbBXlKfOsil9up45z3hR6Z4u0oq43', '2017-07-06 15:39:06', '2017-07-06 15:40:32');

-- --------------------------------------------------------

--
-- Структура таблицы `users_words`
--

CREATE TABLE `users_words` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `word_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `stage` int(11) NOT NULL,
  `date_of_repeat` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users_words`
--

INSERT INTO `users_words` (`id`, `user_id`, `word_id`, `status`, `stage`, `date_of_repeat`, `created_at`, `updated_at`) VALUES
(96, 1, 74, 2, 2, '2017-08-23', '2017-07-27 01:54:16', '2017-08-21 23:55:24'),
(98, 1, 281, 2, 1, '2017-07-28', '2017-07-27 01:54:21', '2017-07-27 01:54:21'),
(109, 1, 230, 2, 1, '2017-07-28', '2017-07-27 02:07:49', '2017-07-27 02:07:49'),
(110, 1, 12, 0, 0, '0000-00-00', '2017-07-27 02:18:42', '2017-07-27 02:18:42'),
(111, 1, 289, 2, 1, '2017-08-23', '2017-08-21 23:54:27', '2017-08-21 23:54:27'),
(112, 1, 139, 2, 1, '2017-08-23', '2017-08-21 23:54:40', '2017-08-21 23:54:40'),
(113, 1, 193, 1, 0, '0000-00-00', '2017-08-21 23:54:46', '2017-08-21 23:54:46');

-- --------------------------------------------------------

--
-- Структура таблицы `words`
--

CREATE TABLE `words` (
  `id` int(10) UNSIGNED NOT NULL,
  `word` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `transcription` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `translation` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sound` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `words`
--

INSERT INTO `words` (`id`, `word`, `transcription`, `translation`, `sound`, `created_at`, `updated_at`) VALUES
(1, 'time', '[taɪm]', 'время', '', NULL, NULL),
(2, 'year', '[jɪə] ', 'год ', '', NULL, NULL),
(3, 'people', '[ˈpiːpl] ', 'люди (народ) ', '', NULL, NULL),
(4, 'way', '[weɪ] ', 'путь (способ)', '', NULL, NULL),
(5, 'day', '[deɪ] ', 'день ', '', NULL, NULL),
(6, 'man', '[mæn] ', 'человек (мужчина)', '', NULL, NULL),
(7, 'thing', '[θɪŋ] ', 'вещь ', '', NULL, NULL),
(8, 'woman', '[ˈwʊmən] ', 'женщина ', '', NULL, NULL),
(9, 'life', '[laɪf] ', 'жизнь ', '', NULL, NULL),
(10, 'child', '[ʧaɪld] ', 'ребенок ', '', NULL, NULL),
(11, 'world', '[wɜːld] ', 'мир ', '', NULL, NULL),
(12, 'school', '[skuːl] ', 'школа ', '', NULL, NULL),
(13, 'state (territory)', '[steɪt] ', 'государство', '', NULL, NULL),
(14, 'state (of something)', '[steɪt]', 'состояние (напр.  вещества)', '', NULL, NULL),
(15, 'family', '[ˈfæmɪli] ', 'семья ', '', NULL, NULL),
(16, 'student', '[ˈstjuːdənt] ', 'студент ', '', NULL, NULL),
(17, 'group', '[gruːp] ', 'группа ', '', NULL, NULL),
(18, 'country', '[ˈkʌntri] ', 'страна ', '', NULL, NULL),
(19, 'problem', '[ˈprɒbləm] ', 'проблема ', '', NULL, NULL),
(20, 'hand', '[hænd] ', 'рука (кисть)', '', NULL, NULL),
(21, 'part', '[pɑːt] ', 'часть чего-либо', '', NULL, NULL),
(22, 'place', '[pleɪs] ', 'место ', '', NULL, NULL),
(23, 'case (in this case…)', '[keɪs] ', 'дело (случай)', '', NULL, NULL),
(24, 'case (open the case)', '[keɪs]', 'кейс (футляр)', '', NULL, NULL),
(25, 'week', '[wiːk] ', 'неделя', '', NULL, NULL),
(26, 'company', '[ˈkʌmpəni] ', 'компания ', '', NULL, NULL),
(27, 'system', '[ˈsɪstɪm] ', 'система ', '', NULL, NULL),
(28, 'program', '[ˈprəʊgræm] ', 'программа ', '', NULL, NULL),
(29, 'question', '[ˈkwɛsʧən] ', 'вопрос ', '', NULL, NULL),
(30, 'work', '[wɜːk] ', 'работа ', '', NULL, NULL),
(31, 'government', '[ˈgʌvnmənt] ', 'правительство ', '', NULL, NULL),
(32, 'number', '[ˈnʌmbə] ', 'номер (число)', '', NULL, NULL),
(33, 'night', '[naɪt] ', 'ночь (вечер)', '', NULL, NULL),
(34, 'point', '[pɔɪnt] ', 'точка (пункт)', '', NULL, NULL),
(35, 'home', '[həʊm] ', 'дом', '', NULL, NULL),
(36, 'water', '[ˈwɔːtə] ', 'вода ', '', NULL, NULL),
(37, 'room', '[ruːm] ', 'комната', '', NULL, NULL),
(38, 'mother', '[ˈmʌðə] ', 'мать ', '', NULL, NULL),
(39, 'area', '[ˈeərɪə] ', 'местность', '', NULL, NULL),
(40, 'money', '[ˈmʌni] ', 'деньги ', '', NULL, NULL),
(41, 'story', '[ˈstɔːri] ', 'история ', '', NULL, NULL),
(42, 'fact', '[fækt] ', 'факт ', '', NULL, NULL),
(43, 'month', '[mʌnθ] ', 'месяц ', '', NULL, NULL),
(44, 'right', '[raɪt] ', 'право ', '', NULL, NULL),
(45, 'study', '[ˈstʌdi] ', 'исследование ', '', NULL, NULL),
(46, 'book', '[bʊk] ', 'книга ', '', NULL, NULL),
(47, 'eye', '[aɪ] ', 'глаз ', '', NULL, NULL),
(48, 'job', '[ʤɒb] ', 'работа ', '', NULL, NULL),
(49, 'word', '[wɜːd] ', 'слово ', '', NULL, NULL),
(50, 'business', '[ˈbɪznɪs] ', 'бизнес ', '', NULL, NULL),
(51, 'issue', '[ˈɪʃuː] ', 'вопрос (проблема) ', '', NULL, NULL),
(52, 'side', '[saɪd] ', 'сторона ', '', NULL, NULL),
(53, 'kind', '[kaɪnd] ', 'вид (сорт)', '', NULL, NULL),
(54, 'head (on your shoulders)', '[hɛd] ', 'голова', '', NULL, NULL),
(55, 'head (of the departament)', '[hɛd]', 'руководитель', '', NULL, NULL),
(56, 'house', '[haʊs] ', 'дом ', '', NULL, NULL),
(57, 'service', '[ˈsɜːvɪs] ', 'услуга (обслуживание) ', '', NULL, NULL),
(58, 'friend', '[frɛnd] ', 'друг ', '', NULL, NULL),
(59, 'father', '[ˈfɑːðə] ', 'отец ', '', NULL, NULL),
(60, 'power', '[ˈpaʊə] ', 'энергия (власть)', '', NULL, NULL),
(61, 'hour', '[ˈaʊə] ', 'час ', '', NULL, NULL),
(62, 'game', '[geɪm] ', 'игра ', '', NULL, NULL),
(63, 'line', '[laɪn] ', 'линия (очередь)', '', NULL, NULL),
(64, 'end', '[ɛnd] ', 'конец ', '', NULL, NULL),
(65, 'member', '[ˈmɛmbə] ', 'член', '', NULL, NULL),
(66, 'law', '[lɔː] ', 'закон ', '', NULL, NULL),
(67, 'car', '[kɑː] ', 'автомобиль ', '', NULL, NULL),
(68, 'city', '[ˈsɪti] ', 'город ', '', NULL, NULL),
(69, 'community', '[kəˈmjuːnɪti] ', 'сообщество ', '', NULL, NULL),
(70, 'name', '[neɪm] ', 'имя ', '', NULL, NULL),
(71, 'president', '[ˈprɛzɪdənt] ', 'президент ', '', NULL, NULL),
(72, 'team', '[tiːm] ', 'команда ', '', NULL, NULL),
(73, 'minute', '[ˈmɪnɪt] ', 'минут ', '', NULL, NULL),
(74, 'idea', '[aɪˈdɪə] ', 'идея ', '', NULL, NULL),
(75, 'kid', '[kɪd] ', 'ребенок ', '', NULL, NULL),
(76, 'body', '[ˈbɒdi] ', 'тело ', '', NULL, NULL),
(77, 'information', '[ˌɪnfəˈmeɪʃən] ', 'информация ', '', NULL, NULL),
(78, 'back', '[bæk] ', 'спина', '', NULL, NULL),
(79, 'parent', '[ˈpeərənt] ', 'родитель ', '', NULL, NULL),
(80, 'face', '[feɪs] ', 'лицо ', '', NULL, NULL),
(81, 'level', '[ˈlɛvl] ', 'уровень ', '', NULL, NULL),
(82, 'office', '[ˈɒfɪs] ', 'офис ', '', NULL, NULL),
(83, 'door', '[dɔː] ', 'дверь ', '', NULL, NULL),
(84, 'health', '[hɛlθ] ', 'здоровье ', '', NULL, NULL),
(85, 'person', '[ˈpɜːsn] ', 'человек ', '', NULL, NULL),
(86, 'art', '[ɑːt] ', 'искусство ', '', NULL, NULL),
(87, 'war', '[wɔː] ', 'война ', '', NULL, NULL),
(88, 'history', '[ˈhɪstəri] ', 'история ', '', NULL, NULL),
(89, 'party (Bithday party)', '[ˈpɑːti] ', 'вечеринка', '', NULL, NULL),
(90, 'party (group of people)', '[ˈpɑːti] ', ' партия ', '', NULL, NULL),
(91, 'result', '[rɪˈzʌlt] ', 'результат ', '', NULL, NULL),
(92, 'change', '[ʧeɪnʤ] ', 'изменение (сдача)', '', NULL, NULL),
(93, 'morning', '[ˈmɔːnɪŋ] ', 'утро ', '', NULL, NULL),
(94, 'reason', '[ˈriːzn] ', 'причина', '', NULL, NULL),
(95, 'research', '[rɪˈsɜːʧ] ', 'исследование ', '', NULL, NULL),
(96, 'girl', '[gɜːl] ', 'девушка ', '', NULL, NULL),
(97, 'guy', '[gaɪ] ', 'парень ', '', NULL, NULL),
(98, 'food', '[fuːd] ', 'еда ', '', NULL, NULL),
(99, 'moment', '[ˈməʊmənt] ', 'момент ', '', NULL, NULL),
(100, 'air', '[eə] ', 'воздух', '', NULL, NULL),
(101, 'teacher', '[ˈtiːʧə] ', 'учитель ', '', NULL, NULL),
(102, 'force', '[fɔːs] ', 'сила ', '', NULL, NULL),
(103, 'education', '[ˌɛdju(ː)ˈkeɪʃən] ', 'образование ', '', NULL, NULL),
(104, 'foot', '[fʊt] ', 'нога (ступня)', '', NULL, NULL),
(105, 'boy', '[bɔɪ] ', 'мальчик ', '', NULL, NULL),
(106, 'age', '[eɪʤ] ', 'возраст ', '', NULL, NULL),
(107, 'policy', '[ˈpɒlɪsi] ', 'политика (в знач. стратегия, линия поведения)', '', NULL, NULL),
(108, 'process', '[ˈprəʊsɛs] ', 'процесс ', '', NULL, NULL),
(109, 'music', '[ˈmjuːzɪk] ', 'музыка ', '', NULL, NULL),
(110, 'market', '[ˈmɑːkɪt] ', 'рынок ', '', NULL, NULL),
(111, 'sense', '[sɛns] ', 'чувство (смысл)', '', NULL, NULL),
(112, 'nation', '[ˈneɪʃən] ', 'нация ', '', NULL, NULL),
(113, 'plan', '[plæn] ', 'план ', '', NULL, NULL),
(114, 'college', '[ˈkɒlɪʤ] ', 'колледж ', '', NULL, NULL),
(115, 'interest', '[ˈɪntrɪst] ', 'интерес ', '', NULL, NULL),
(116, 'death', '[dɛθ] ', 'смерть ', '', NULL, NULL),
(117, 'experience', '[ɪksˈpɪərɪəns] ', 'опыт ', '', NULL, NULL),
(118, 'effect', '[ɪˈfɛkt] ', 'эффект ', '', NULL, NULL),
(119, 'use', '[juːz] ', 'использование ', '', NULL, NULL),
(120, 'class', '[klɑːs] ', 'класс ', '', NULL, NULL),
(121, 'control', '[kənˈtrəʊl] ', 'контроль ', '', NULL, NULL),
(122, 'care', '[keə] ', 'уход ', '', NULL, NULL),
(123, 'field', '[fiːld] ', 'поле ', '', NULL, NULL),
(124, 'development', '[dɪˈvɛləpmənt] ', 'развитие ', '', NULL, NULL),
(125, 'role', '[rəʊl] ', 'роль ', '', NULL, NULL),
(126, 'effort', '[ˈɛfət] ', 'усилие ', '', NULL, NULL),
(127, 'rate', '[reɪt] ', 'соотношение (пропорция) ', '', NULL, NULL),
(128, 'heart', '[hɑːt] ', 'сердце ', '', NULL, NULL),
(129, 'drug', '[drʌg] ', 'лекарства, наркотики ', '', NULL, NULL),
(130, 'show', '[ʃəʊ] ', 'шоу ', '', NULL, NULL),
(131, 'leader', '[ˈliːdə] ', 'лидер ', '', NULL, NULL),
(132, 'light', '[laɪt] ', 'свет ', '', NULL, NULL),
(133, 'voice', '[vɔɪs] ', 'голос ', '', NULL, NULL),
(134, 'wife', '[waɪf] ', 'жена ', '', NULL, NULL),
(135, 'police', '[pəˈliːs] ', 'полиция ', '', NULL, NULL),
(136, 'mind', '[maɪnd] ', 'разум, сознание', '', NULL, NULL),
(137, 'price', '[praɪs] ', 'цена ', '', NULL, NULL),
(138, 'report', '[rɪˈpɔːt] ', 'отчет (доклад)', '', NULL, NULL),
(139, 'decision', '[dɪˈsɪʒən] ', 'решение ', '', NULL, NULL),
(140, 'son', '[sʌn] ', 'сын ', '', NULL, NULL),
(141, 'view', '[vjuː] ', 'вид ', '', NULL, NULL),
(142, 'relationships', '[rɪˈleɪʃənʃɪps] ', 'отношения ', '', NULL, NULL),
(143, 'town', '[taʊn] ', 'небольшой город', '', NULL, NULL),
(144, 'road', '[rəʊd] ', 'дорога ', '', NULL, NULL),
(145, 'arm', '[ɑːm] ', 'рука (полностью)', '', NULL, NULL),
(146, 'difference', '[ˈdɪfrəns] ', 'разница ', '', NULL, NULL),
(147, 'value', '[ˈvæljuː] ', 'значение (ценность)', '', NULL, NULL),
(148, 'building', '[ˈbɪldɪŋ] ', 'здание ', '', NULL, NULL),
(149, 'action', '[ˈækʃ(ə)n] ', 'действие ', '', NULL, NULL),
(150, 'model', '[ˈmɒdl] ', 'модель ', '', NULL, NULL),
(151, 'season', '[ˈsiːzn] ', 'сезон (время года)', '', NULL, NULL),
(152, 'society', '[səˈsaɪəti] ', 'общество ', '', NULL, NULL),
(153, 'tax', '[tæks] ', 'налог ', '', NULL, NULL),
(154, 'director', '[dɪˈrɛktə] ', 'директор ', '', NULL, NULL),
(155, 'position', '[pəˈzɪʃən] ', 'положение (должность)', '', NULL, NULL),
(156, 'player', '[ˈpleɪə] ', 'игрок ', '', NULL, NULL),
(157, 'record', '[ˈrɛkɔːd] ', 'запись ', '', NULL, NULL),
(158, 'paper', '[ˈpeɪpə] ', 'бумага ', '', NULL, NULL),
(159, 'space', '[speɪs] ', 'пространство (космос)', '', NULL, NULL),
(160, 'ground', '[graʊnd] ', 'земля', '', NULL, NULL),
(161, 'form', '[fɔːm] ', 'форма ', '', NULL, NULL),
(162, 'event', '[ɪˈvɛnt] ', 'мероприятие ', '', NULL, NULL),
(163, 'official', '[əˈfɪʃəl] ', 'официальное лицо', '', NULL, NULL),
(164, 'matter', '[ˈmætə] ', 'дело (вопрос)', '', NULL, NULL),
(165, 'center', '[ˈsɛntə] ', 'центр ', '', NULL, NULL),
(166, 'couple', '[ˈkʌpl] ', 'пара ', '', NULL, NULL),
(167, 'site', '[saɪt] ', 'сайт (объект, напр. строительный) ', '', NULL, NULL),
(168, 'project', '[ˈprɒʤɛkt] ', 'проект ', '', NULL, NULL),
(169, 'activity', '[ækˈtɪvɪti] ', 'деятельность ', '', NULL, NULL),
(170, 'star', '[stɑː] ', 'звезда', '', NULL, NULL),
(171, 'table', '[ˈteɪbl] ', 'стол ', '', NULL, NULL),
(172, 'need', '[niːd] ', 'нужда в чем-то', '', NULL, NULL),
(173, 'court (law)', '[kɔːt]', 'суд', '', NULL, NULL),
(174, 'court (food court)', '[kɔːt]', 'дворик ', '', NULL, NULL),
(175, 'oil', '[ɔɪl] ', 'масло (нефть) ', '', NULL, NULL),
(176, 'situation', '[ˌsɪtjʊˈeɪʃən] ', 'ситуация ', '', NULL, NULL),
(177, 'cost', '[kɒst] ', 'стоимость', '', NULL, NULL),
(178, 'industry', '[ˈɪndəstri] ', 'промышленность ', '', NULL, NULL),
(179, 'figure', '[ˈfɪgə] ', 'фигура ', '', NULL, NULL),
(180, 'street', '[striːt] ', 'улица ', '', NULL, NULL),
(181, 'image', '[ˈɪmɪʤ] ', 'изображение ', '', NULL, NULL),
(182, 'phone', '[fəʊn] ', 'телефон ', '', NULL, NULL),
(183, 'data', '[ˈdeɪtə] ', 'данные ', '', NULL, NULL),
(184, 'picture', '[ˈpɪkʧə] ', 'картина (фото)', '', NULL, NULL),
(185, 'practice', '[ˈpræktɪs] ', 'практика', '', NULL, NULL),
(186, 'piece', '[piːs] ', 'кусок', '', NULL, NULL),
(187, 'land', '[lænd] ', 'земля (территория, страна)', '', NULL, NULL),
(188, 'product', '[ˈprɒdʌkt] ', 'продукт (товар)', '', NULL, NULL),
(189, 'doctor', '[ˈdɒktə] ', 'доктор', '', NULL, NULL),
(190, 'wall', '[wɔːl] ', 'стена ', '', NULL, NULL),
(191, 'patient', '[ˈpeɪʃənt] ', 'пациент ', '', NULL, NULL),
(192, 'worker', '[ˈwɜːkə] ', 'работник ', '', NULL, NULL),
(193, 'news', '[njuːz] ', 'новости ', '', NULL, NULL),
(194, 'test', '[tɛst] ', 'тест ', '', NULL, NULL),
(195, 'movie', '[ˈmuːvi] ', 'фильм ', '', NULL, NULL),
(196, 'north', '[nɔːθ] ', 'север', '', NULL, NULL),
(197, 'love', '[lʌv] ', 'любовь', '', NULL, NULL),
(198, 'support', '[səˈpɔːt] ', 'поддержка ', '', NULL, NULL),
(199, 'technology', '[tɛkˈnɒləʤi] ', 'технология ', '', NULL, NULL),
(200, 'step', '[stɛp] ', 'шаг ', '', NULL, NULL),
(201, 'baby', '[ˈbeɪbi] ', 'малыш', '', NULL, NULL),
(202, 'computer', '[kəmˈpjuːtə] ', 'компьютер ', '', NULL, NULL),
(203, 'type', '[taɪp] ', 'тип', '', NULL, NULL),
(204, 'attention', '[əˈtɛnʃ(ə)n] ', 'внимание ', '', NULL, NULL),
(205, 'film', '[fɪlm] ', 'фильм (кинофотопленка)', '', NULL, NULL),
(206, 'tree', '[triː] ', 'дерево ', '', NULL, NULL),
(207, 'source', '[sɔːs] ', 'источник ', '', NULL, NULL),
(208, 'organization', '[ˌɔːgənaɪˈzeɪʃən] ', 'организация ', '', NULL, NULL),
(209, 'hair', '[heə] ', 'волосы ', '', NULL, NULL),
(210, 'look', '[lʊk] ', 'взгляд', '', NULL, NULL),
(211, 'century', '[ˈsɛnʧʊri] ', 'век', '', NULL, NULL),
(212, 'evidence', '[ˈɛvɪdəns] ', 'улика ', '', NULL, NULL),
(213, 'window', '[ˈwɪndəʊ] ', 'окно ', '', NULL, NULL),
(214, 'culture', '[ˈkʌlʧə] ', 'культура ', '', NULL, NULL),
(215, 'chance', '[ʧɑːns] ', 'шанс, случайность ', '', NULL, NULL),
(216, 'brother', '[ˈbrʌðə] ', 'брат ', '', NULL, NULL),
(217, 'energy', '[ˈɛnəʤi] ', 'энергия ', '', NULL, NULL),
(218, 'period', '[ˈpɪərɪəd] ', 'период (точка в конце предложения)', '', NULL, NULL),
(219, 'course', '[kɔːs] ', 'курс ', '', NULL, NULL),
(220, 'summer', '[ˈsʌmə] ', 'лето ', '', NULL, NULL),
(221, 'plant (industry)', '[plɑːnt]', 'завод', '', NULL, NULL),
(222, 'plant (nature)', '[plɑːnt] ', 'растение', '', NULL, NULL),
(223, 'opportunity', '[ˌɒpəˈtjuːnɪti] ', 'возможность ', '', NULL, NULL),
(224, 'term', '[tɜːm] ', 'термин', '', NULL, NULL),
(225, 'letter', '[ˈlɛtə] ', 'письмо ', '', NULL, NULL),
(226, 'condition', '[kənˈdɪʃən] ', 'состояние ', '', NULL, NULL),
(227, 'choice', '[ʧɔɪs] ', 'выбор ', '', NULL, NULL),
(228, 'rule', '[ruːl] ', 'правило ', '', NULL, NULL),
(229, 'daughter', '[ˈdɔːtə] ', 'дочь ', '', NULL, NULL),
(230, 'administration', '[ədˌmɪnɪsˈtreɪʃ(ə)n] ', 'администрация ', '', NULL, NULL),
(231, 'south', '[saʊθ] ', 'юг', '', NULL, NULL),
(232, 'husband', '[ˈhʌzbənd] ', 'муж ', '', NULL, NULL),
(233, 'floor', '[flɔː] ', 'пол (этаж)', '', NULL, NULL),
(234, 'campaign', '[kæmˈpeɪn] ', 'кампания ', '', NULL, NULL),
(235, 'material', '[məˈtɪərɪəl] ', 'материал ', '', NULL, NULL),
(236, 'population', '[ˌpɒpjʊˈleɪʃən] ', 'население ', '', NULL, NULL),
(237, 'call', '[kɔːl] ', 'телефонный звонок (зов)', '', NULL, NULL),
(238, 'economy', '[i(ː)ˈkɒnəmi] ', 'экономика ', '', NULL, NULL),
(239, 'hospital', '[ˈhɒspɪtl] ', 'больница ', '', NULL, NULL),
(240, 'church', '[ʧɜːʧ] ', 'церковь ', '', NULL, NULL),
(241, 'risk', '[rɪsk] ', 'риск ', '', NULL, NULL),
(242, 'fire', '[ˈfaɪə] ', 'огонь (пожар) ', '', NULL, NULL),
(243, 'future', '[ˈfjuːʧə] ', 'будущее ', '', NULL, NULL),
(244, 'defense', '[dɪˈfɛns] ', 'защита ', '', NULL, NULL),
(245, 'security', '[sɪˈkjʊərɪti] ', 'безопасность, охрана ', '', NULL, NULL),
(246, 'bank', '[bæŋk] ', 'банк, берег реки', '', NULL, NULL),
(247, 'west', '[wɛst] ', 'запад ', '', NULL, NULL),
(248, 'sport', '[spɔːt] ', 'спорт ', '', NULL, NULL),
(249, 'board', '[bɔːd] ', 'доска ', '', NULL, NULL),
(250, 'subject', '[ˈsʌbʤɪkt] ', 'субъект (предмет чего-то)', '', NULL, NULL),
(251, 'officer', '[ˈɒfɪsə] ', 'офицер ', '', NULL, NULL),
(252, 'rest', '[rɛst] ', 'отдых', '', NULL, NULL),
(253, 'behavior', '[bɪˈheɪvjə] ', 'поведение ', '', NULL, NULL),
(254, 'performance (work)', '[pəˈfɔːməns]', 'производительность', '', NULL, NULL),
(255, 'performance (show)', '[pəˈfɔːməns]', 'выступление', '', NULL, NULL),
(256, 'top', '[tɒp] ', 'вершина', '', NULL, NULL),
(257, 'goal', '[gəʊl] ', 'цель ', '', NULL, NULL),
(258, 'second', '[ˈsɛkənd] ', 'секунда', '', NULL, NULL),
(259, 'bed', '[bɛd] ', 'кровать ', '', NULL, NULL),
(260, 'order', '[ˈɔːdə] ', 'порядок ', '', NULL, NULL),
(261, 'author', '[ˈɔːθə] ', 'автор ', '', NULL, NULL),
(262, 'blood', '[blʌd] ', 'кровь ', '', NULL, NULL),
(263, 'agency', '[ˈeɪʤənsi] ', 'агентство ', '', NULL, NULL),
(264, 'nature', '[ˈneɪʧə] ', 'природа ', '', NULL, NULL),
(265, 'color', '[ˈkʌlə] ', 'цвет ', '', NULL, NULL),
(266, 'store', '[stɔː] ', 'магазин (склад) ', '', NULL, NULL),
(267, 'sound', '[saʊnd] ', 'звук ', '', NULL, NULL),
(268, 'movement', '[ˈmuːvmənt] ', 'движение ', '', NULL, NULL),
(269, 'page', '[peɪʤ] ', 'страница ', '', NULL, NULL),
(270, 'race (sport)', '[reɪs]', 'гонка ', '', NULL, NULL),
(271, 'race (people)', '[reɪs] ', 'раса', '', NULL, NULL),
(272, 'concern', '[kənˈsɜːn] ', 'забота ', '', NULL, NULL),
(273, 'series', '[ˈsɪəriːz] ', 'серия ', '', NULL, NULL),
(274, 'language', '[ˈlæŋgwɪʤ] ', 'язык ', '', NULL, NULL),
(275, 'response', '[rɪsˈpɒns] ', 'ответ ', '', NULL, NULL),
(276, 'animal', '[ˈænɪməl] ', 'животное ', '', NULL, NULL),
(277, 'factor', '[ˈfæktə] ', 'фактор ', '', NULL, NULL),
(278, 'decade', '[ˈdɛkeɪd] ', 'десять лет ', '', NULL, NULL),
(279, 'article', '[ˈɑːtɪkl] ', 'статья (напр. в газете)', '', NULL, NULL),
(280, 'east', '[iːst] ', 'восток ', '', NULL, NULL),
(281, 'artist', '[ˈɑːtɪst] ', 'художник ', '', NULL, NULL),
(282, 'scene', '[siːn] ', 'сцена ', '', NULL, NULL),
(283, 'stock  (stock market) ', '[stɒk]  ', 'акция', '', NULL, NULL),
(284, 'career', '[kəˈrɪə] ', 'карьера ', '', NULL, NULL),
(285, 'treatment', '[ˈtriːtmənt] ', 'лечение ', '', NULL, NULL),
(286, 'approach', '[əˈprəʊʧ] ', 'подход (к чему-либо)', '', NULL, NULL),
(287, 'size', '[saɪz] ', 'размер ', '', NULL, NULL),
(288, 'dog', '[dɒg] ', 'собака ', '', NULL, NULL),
(289, 'fund', '[fʌnd] ', 'фонд ', '', NULL, NULL),
(290, 'media', '[ˈmɛdɪə] ', 'СМИ ', '', NULL, NULL),
(291, 'sign', '[saɪn] ', 'знак ', '', NULL, NULL),
(292, 'thought', '[θɔːt] ', 'мысль', '', NULL, NULL),
(293, 'list', '[lɪst] ', 'список ', '', NULL, NULL),
(294, 'individual', '[ˌɪndɪˈvɪdjʊəl] ', 'личность', '', NULL, NULL),
(295, 'quality', '[ˈkwɒlɪti] ', 'качество ', '', NULL, NULL),
(296, 'pressure', '[ˈprɛʃə] ', 'давление ', '', NULL, NULL),
(297, 'answer', '[ˈɑːnsə] ', 'ответ ', '', NULL, NULL),
(298, 'resource', '[rɪˈsɔːs] ', 'ресурс ', '', NULL, NULL),
(299, 'meeting', '[ˈmiːtɪŋ] ', 'встреча ', '', NULL, NULL),
(300, 'disease', '[dɪˈziːz] ', 'болезнь ', '', NULL, NULL),
(301, 'success', '[səkˈsɛs] ', 'успех ', '', NULL, NULL),
(302, 'cup', '[kʌp] ', 'чашка ', '', NULL, NULL),
(303, 'amount', '[əˈmaʊnt] ', 'количество ', '', NULL, NULL),
(304, 'ability', '[əˈbɪlɪti] ', 'способность ', '', NULL, NULL),
(305, 'staff', '[stɑːf] ', 'персонал ', '', NULL, NULL),
(306, 'character', '[ˈkærɪktə] ', 'характер (персонаж)', '', NULL, NULL),
(307, 'growth', '[grəʊθ] ', 'рост ', '', NULL, NULL),
(308, 'loss', '[lɒs] ', 'ущерб', '', NULL, NULL),
(309, 'degree', '[dɪˈgriː] ', 'степень (научная степень)', '', NULL, NULL),
(310, 'attack', '[əˈtæk] ', 'атака ', '', NULL, NULL),
(311, 'region', '[ˈriːʤən] ', 'регион', '', NULL, NULL),
(312, 'television', '[ˈtɛlɪˌvɪʒən] ', 'телевидение ', '', NULL, NULL),
(313, 'box', '[bɒks] ', 'коробка ', '', NULL, NULL),
(314, 'TV', '[ˌtiːˈviː] ', 'телевизор', '', NULL, NULL),
(315, 'training', '[ˈtreɪnɪŋ] ', 'обучение ', '', NULL, NULL),
(316, 'trade', '[treɪd] ', 'торговля ', '', NULL, NULL),
(317, 'deal', '[diːl] ', 'сделка ', '', NULL, NULL),
(318, 'election', '[ɪˈlɛkʃən] ', 'выборы ', '', NULL, NULL),
(319, 'feeling', '[ˈfiːlɪŋ] ', 'чувство ', '', NULL, NULL),
(320, 'standard', '[ˈstændəd] ', 'стандарт ', '', NULL, NULL),
(321, 'bill', '[bɪl] ', 'счет (напр. в ресторане) ', '', NULL, NULL),
(322, 'message', '[ˈmɛsɪʤ] ', 'сообщение ', '', NULL, NULL),
(323, 'analysis', '[əˈnæləsɪs] ', 'анализ ', '', NULL, NULL),
(324, 'benefit', '[ˈbɛnɪfɪt] ', 'выгода ', '', NULL, NULL),
(325, 'sex', '[sɛks] ', 'секс (пол)', '', NULL, NULL),
(326, 'lawyer', '[ˈlɔːjə] ', 'адвокат ', '', NULL, NULL),
(327, 'section', '[ˈsɛkʃən] ', 'раздел, секция', '', NULL, NULL),
(328, 'glass', '[glɑːs] ', 'стекло, стакан', '', NULL, NULL),
(329, 'glasses', '[ˈglɑːsɪz] ', 'очки (напр. солнечные)', '', NULL, NULL),
(330, 'skill', '[skɪl] ', 'умение ', '', NULL, NULL),
(331, 'sister', '[ˈsɪstə] ', 'сестра ', '', NULL, NULL),
(332, 'professor', '[prəˈfɛsə] ', 'профессор ', '', NULL, NULL),
(333, 'operation', '[ˌɒpəˈreɪʃən] ', 'операция ', '', NULL, NULL),
(334, 'crime', '[kraɪm] ', 'преступление ', '', NULL, NULL),
(335, 'stage', '[steɪʤ] ', 'этап ', '', NULL, NULL),
(336, 'authority', '[ɔːˈθɒrɪti] ', 'полномочия (власть)', '', NULL, NULL),
(337, 'design', '[dɪˈzaɪn] ', 'дизайн ', '', NULL, NULL),
(338, 'sort', '[sɔːt] ', 'сорт (разновидность)', '', NULL, NULL),
(339, 'knowledge', '[ˈnɒlɪʤ] ', 'знание ', '', NULL, NULL),
(340, 'gun', '[gʌn] ', 'пистолет', '', NULL, NULL),
(341, 'station', '[ˈsteɪʃən] ', 'станция ', '', NULL, NULL),
(342, 'strategy', '[ˈstrætɪʤi] ', 'стратегия ', '', NULL, NULL),
(343, 'truth', '[truːθ] ', 'правда ', '', NULL, NULL),
(344, 'song', '[sɒŋ] ', 'песня ', '', NULL, NULL),
(345, 'example', '[ɪgˈzɑːmpl] ', 'пример ', '', NULL, NULL),
(346, 'environment', '[ɪnˈvaɪərənmənt] ', 'окружающая среда', '', NULL, NULL),
(347, 'leg', '[lɛg] ', 'нога (полностью)', '', NULL, NULL),
(348, 'public', '[ˈpʌblɪk] ', 'общественность', '', NULL, NULL),
(349, 'executive', '[ɪgˈzɛkjʊtɪv] ', 'управленец, администратор', '', NULL, NULL),
(350, 'set', '[sɛt] ', 'набор ', '', NULL, NULL),
(351, 'rock', '[rɒk] ', 'камень', '', NULL, NULL),
(352, 'note', '[nəʊt] ', 'примечание ', '', NULL, NULL),
(353, 'manager', '[ˈmænɪʤə] ', 'менеджер', '', NULL, NULL),
(354, 'help', '[hɛlp] ', 'помощь ', '', NULL, NULL),
(355, 'network', '[ˈnɛtwɜːk] ', 'компьютерная сеть', '', NULL, NULL),
(356, 'science', '[ˈsaɪəns] ', 'наука ', '', NULL, NULL),
(357, 'memory', '[ˈmɛməri] ', 'память', '', NULL, NULL),
(358, 'card', '[kɑːd] ', 'карточка', '', NULL, NULL),
(359, 'seat', '[siːt] ', 'сиденье, место (напр. в кинозале)', '', NULL, NULL),
(360, 'cell (biology)', '[sɛl] ', 'клетка (биол.)', '', NULL, NULL),
(361, 'cell (prison)', '[sɛl] ', 'камера (тюремная, клетка)', '', NULL, NULL),
(362, 'trial', '[ˈtraɪəl] ', 'испытание (судебный процесс)', '', NULL, NULL),
(363, 'expert', '[ˈɛkspɜːt] ', 'эксперт ', '', NULL, NULL),
(364, 'spring', '[sprɪŋ] ', 'весна', '', NULL, NULL),
(365, 'firm', '[fɜːm] ', 'фирма ', '', NULL, NULL),
(366, 'radio', '[ˈreɪdɪəʊ] ', 'радио (рация)', '', NULL, NULL),
(367, 'management', '[ˈmænɪʤmənt] ', 'управление ', '', NULL, NULL),
(368, 'ball', '[bɔːl] ', 'мяч ', '', NULL, NULL),
(369, 'talk', '[tɔːk] ', 'разговор (обсуждение)', '', NULL, NULL),
(370, 'theory', '[ˈθɪəri] ', 'теория ', '', NULL, NULL),
(371, 'impact', '[ˈɪmpækt] ', 'удар (столкновние, воздействие) ', '', NULL, NULL),
(372, 'statement', '[ˈsteɪtmənt] ', 'заявление ', '', NULL, NULL),
(373, 'charge', '[ʧɑːʤ] ', 'плата (цена)', '', NULL, NULL),
(374, 'direction', '[dɪˈrɛkʃən] ', 'направление ', '', NULL, NULL),
(375, 'weapon', '[ˈwɛpən] ', 'оружие ', '', NULL, NULL),
(376, 'employee', '[ˌɛmplɔɪˈiː] ', 'сотрудник ', '', NULL, NULL),
(377, 'peace', '[piːs] ', 'мир (во всем мире)', '', NULL, NULL),
(378, 'base', '[beɪs] ', 'база ', '', NULL, NULL),
(379, 'pain', '[peɪn] ', 'боль ', '', NULL, NULL),
(380, 'play', '[pleɪ] ', 'пьеса', '', NULL, NULL),
(381, 'measure', '[ˈmɛʒə] ', 'измерение', '', NULL, NULL),
(382, 'interview', '[ˈɪntəvjuː] ', 'интервью (собеседование)', '', NULL, NULL),
(383, 'chair', '[ʧeə] ', 'стул ', '', NULL, NULL),
(384, 'fish', '[fɪʃ] ', 'рыба ', '', NULL, NULL),
(385, 'camera', '[ˈkæmərə] ', 'камера (фотовидео)', '', NULL, NULL),
(386, 'structure', '[ˈstrʌkʧə] ', 'структура ', '', NULL, NULL),
(387, 'politics', '[ˈpɒlɪtɪks] ', 'политика ', '', NULL, NULL),
(388, 'bit (of something)', '[bɪt]', 'частичка (небольшое количество чего-либо)', '', NULL, NULL),
(389, 'weight', '[weɪt] ', 'вес ', '', NULL, NULL),
(390, 'candidate', '[ˈkændɪdɪt] ', 'кандидат ', '', NULL, NULL),
(391, 'production', '[prəˈdʌkʃən] ', 'производство ', '', NULL, NULL),
(392, 'trip', '[trɪp] ', 'поездка ', '', NULL, NULL),
(393, 'evening', '[ˈiːvnɪŋ] ', 'вечер ', '', NULL, NULL),
(394, 'conference', '[ˈkɒnfərəns] ', 'конференция ', '', NULL, NULL),
(395, 'unit', '[ˈjuːnɪt] ', 'единица (напр. измерения, войсковая единица и др.) ', '', NULL, NULL),
(396, 'style', '[staɪl] ', 'стиль ', '', NULL, NULL),
(397, 'adult', '[ˈædʌlt] ', 'взрослый', '', NULL, NULL),
(398, 'range', '[reɪnʤ] ', 'диапазон ', '', NULL, NULL),
(399, 'past', '[pɑːst] ', 'прошлое', '', NULL, NULL),
(400, 'edge', '[ɛʤ] ', 'край ', '', NULL, NULL),
(401, 'writer', '[ˈraɪtə] ', 'писатель ', '', NULL, NULL),
(402, 'trouble', '[ˈtrʌbl] ', 'беда ', '', NULL, NULL),
(403, 'challenge', '[ˈʧælɪnʤ] ', 'вызов ', '', NULL, NULL),
(404, 'fear', '[fɪə] ', 'страх ', '', NULL, NULL),
(405, 'shoulder', '[ˈʃəʊldə] ', 'плечо ', '', NULL, NULL),
(406, 'institution', '[ˌɪnstɪˈtjuːʃən] ', 'учреждение ', '', NULL, NULL),
(407, 'sea', '[siː] ', 'море ', '', NULL, NULL),
(408, 'dream', '[driːm] ', 'мечта ', '', NULL, NULL),
(409, 'bar', '[bɑː] ', 'бар (брусок, перекладина)', '', NULL, NULL),
(410, 'property', '[ˈprɒpəti] ', 'собственность', '', NULL, NULL),
(411, 'stuff', '[stʌf] ', 'хлам (барахло)', '', NULL, NULL),
(412, 'detail', '[ˈdiːteɪl] ', 'деталь (подробность)', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `words_t`
--

CREATE TABLE `words_t` (
  `id` int(10) UNSIGNED NOT NULL,
  `word` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `transcription` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `translation` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sound` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Индексы таблицы `stages_of_repeat`
--
ALTER TABLE `stages_of_repeat`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `users_words`
--
ALTER TABLE `users_words`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `words_t`
--
ALTER TABLE `words_t`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `stages_of_repeat`
--
ALTER TABLE `stages_of_repeat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users_words`
--
ALTER TABLE `users_words`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT для таблицы `words`
--
ALTER TABLE `words`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;
--
-- AUTO_INCREMENT для таблицы `words_t`
--
ALTER TABLE `words_t`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
