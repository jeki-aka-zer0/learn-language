USE `learn_language`;

set character_set_client='utf8';
set character_set_connection='utf8';
set character_set_database='utf8';
set character_set_results='utf8';
set character_set_server='utf8';

DROP TABLE IF EXISTS `words`;
CREATE TABLE `words`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `word`        varchar(255)        NOT NULL UNIQUE,
    `translate`   varchar(255)                 DEFAULT NULL,
    `example`     varchar(255)                 DEFAULT NULL,
    `lang`        ENUM ('en', 'fr')   NOT NULL,
    `status`      tinyint             NOT NULL DEFAULT 0,
    `asked_times` smallint            NOT NULL DEFAULT 0,
    `created_at`  timestamp                    DEFAULT NOW(),
    `updated_at`  timestamp                    DEFAULT NOW(),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 0
  DEFAULT CHARSET = utf8;

LOCK
    TABLES `words` WRITE;
INSERT INTO `words` (`word`, `translate`, `example`, `lang`, `status`, `asked_times`, `created_at`, `updated_at`)
VALUES ('Severity', 'Строгость', 'Errors with the highest severity level are considered the fatal ones', 'en', 0, 0, '2022-11-14 20:52:00', '2022-11-14 20:52:00'),
       ('Do it over', 'Переделать', 'We will try to do it over the next couple of weeks', 'en', 0, 0, '2022-11-14 20:52:01', '2022-11-14 20:52:01'),
       ('Vast', 'Обширный', 'A vast audience watched the broadcast', 'en', 0, 0, '2022-11-20 20:43:57', '2022-11-20 20:43:57'),
       ('Though', 'Хотя', 'She has not called, even though she said she would', 'en', 0, 0, '2022-11-20 20:44:58', '2022-11-20 20:44:58'),
       ('Caveat', 'Предостережение', 'One caveat: Know when passengers must be back on board the plane', 'en', 0, 0, '2022-11-20 20:49:46', '2022-11-20 20:49:46'),
       ('Computation', 'Вычисление', 'The computation of the square root of pi', 'en', 0, 0, '2022-11-20 20:51:20', '2022-11-20 20:51:20'),
       ('Paramount', 'Первостепенный', 'There are many priorities, but reducing the budget deficit is paramount', 'en', 0, 0, '2022-11-20 20:52:18', '2022-11-20 20:52:18'),
       ('Bandwidth', 'Пропускная способность', 'Text messages require less bandwidth than phone calls', 'en', 0, 0, '2022-11-20 20:53:27', '2022-11-20 20:53:27'),
       ('Tier', 'Ярус', 'My wedding cake had four tiers', 'en', 0, 0, '2022-11-20 20:57:04', '2022-11-20 20:57:04'),
       ('Arbitrary', 'Произвольный', 'Did you have a reason for choosing your destination or was it arbitrary?', 'en', 0, 0, '2022-11-20 20:57:57', '2022-11-20 20:57:57'),
       ('Surrender', 'Сдаваться', 'They would rather die than surrender', 'en', 0, 0, '2022-11-20 20:58:33', '2022-11-20 20:58:33'),
       ('Integrity', 'Честность', 'He was a journalist of great skill and integrity', 'en', 0, 0, '2022-11-20 21:00:23', '2022-11-20 21:00:23'),
       ('Behalf', 'От имени', 'On behalf of the entire company, I would like to thank you for all your work', 'en', 0, 0, '2022-11-20 21:01:01', '2022-11-20 21:01:01'),
       ('Perhaps', 'Возможно', 'Perhaps the most important question has not been asked', 'en', 0, 0, '2022-11-20 21:01:30', '2022-11-20 21:01:30'),
       ('Diverse', 'Разнообразный', 'New York is a very culturally diverse city', 'en', 0, 0, '2022-11-20 21:02:19', '2022-11-20 21:02:19'),
       ('Circuit', 'Схема', 'A defect was found in the electrical circuit', 'en', 0, 0, '2022-11-20 21:03:33', '2022-11-20 21:03:33'),
       ('Negotiate', 'Вести переговоры', 'I am negotiating for a new contract', 'en', 0, 0, '2022-11-20 21:04:19', '2022-11-20 21:04:19'),
       ('Enhancement', 'Улучшение', 'Enhancements made to websites often result in increased page views', 'en', 0, 0, '2022-11-20 21:05:20', '2022-11-20 21:05:20'),
       ('Congestion', 'Скопление', 'Major airports will need new runways to relieve congestion', 'en', 0, 0, '2022-11-20 21:06:23', '2022-11-20 21:06:23'),
       ('Conquer', 'Завоёвывать', 'Divide and conquer is an algorithm design paradigm', 'en', 0, 0, '2022-11-20 21:07:10', '2022-11-20 21:07:10'),
       ('Divisive', 'Вызывающий разногласия', 'The Vietnam war was an extremely divisive issue in the US', 'en', 0, 0, '2022-11-20 21:08:08', '2022-11-20 21:08:08'),
       ('Gain', 'Прирост', 'You will improve at the job as you gain experience', 'en', 0, 0, '2022-11-20 21:09:10', '2022-11-20 21:09:10'),
       ('Grasp', 'Понять', 'I think I managed to grasp the main points of the lecture', 'en', 0, 0, '2022-11-20 21:10:04', '2022-11-20 21:10:04'),
       ('Evenly', 'Равномерно', 'Divide the mixture evenly between the two pans', 'en', 0, 0, '2022-11-20 21:11:21', '2022-11-20 21:11:21'),
       ('Niceties', 'Тонкости', 'What are the grammatical niceties?', 'en', 0, 0, '2022-11-20 21:12:47', '2022-11-20 21:12:47'),
       ('Cohesion', 'Сплоченность', 'Cohesion refers to the degree to which the elements inside a module belong together', 'en', 0, 0, '2022-11-20 21:13:48',
        '2022-11-20 21:13:48'),
       ('Breadth', 'Широта', 'The length of this box is twice its breadth', 'en', 0, 0, '2022-11-20 21:14:34', '2022-11-20 21:14:34'),
       ('Earlobe', 'Мочка уха', 'Earlobe is the lower portion of the outer ear', 'en', 0, 0, '2022-11-20 21:15:57', '2022-11-20 21:15:57'),
       ('Expel', 'Изгонять', 'My brother was expelled from school for bad behaviour', 'en', 0, 0, '2022-11-20 21:16:33', '2022-11-20 21:16:33'),
       ('Overlap', 'Перекрывать', 'The fence is made of panels that overlap each other', 'en', 0, 0, '2022-11-20 21:17:03', '2022-11-20 21:17:03'),
       ('Greedy', 'Жадный', 'A greedy algorithm is an approach for solving a problem by selecting the best option available at the moment', 'en', 0, 0, '2022-11-20 21:19:01',
        '2022-11-20 21:19:01'),
       ('Rescue', 'Спасать', 'The lifeboat rescued the sailors from the sinking boat', 'en', 0, 0, '2022-11-20 21:19:38', '2022-11-20 21:19:38'),
       ('Foil', 'Фольга', 'Aluminium foil is probably one of the most useful mass-produced substances', 'en', 0, 0, '2022-11-20 21:23:49', '2022-11-20 21:23:49'),
       ('Comb', 'Гребень', 'She combed her hair and put on some lipstick', 'en', 0, 0, '2022-11-20 21:24:37', '2022-11-20 21:24:37'),
       ('Freckles', 'Веснушки', 'He has red hair and freckles on his face', 'en', 0, 0, '2022-11-20 21:25:25', '2022-11-20 21:25:25'),
       ('Turtleneck', 'Водолазка', 'Jobs'' personal uniform is a black turtleneck', 'en', 0, 0, '2022-11-20 21:26:52', '2022-11-20 21:26:52'),
       ('Sturdy', 'Крепкий', 'It was a sturdy building, able to withstand strong winds and cold weather', 'en', 0, 0, '2022-11-20 21:29:34', '2022-11-20 21:29:34'),
       ('Toothpick', 'Зубочистка', 'To add color he used cotton twisted on a toothpick dipped in paint', 'en', 0, 0, '2022-11-20 21:31:23', '2022-11-20 21:31:23'),
       ('Salient', 'Заметный', 'The salient points of the speech', 'en', 0, 0, '2022-11-28 21:09:13', '2022-11-28 21:09:13'),
       ('Loaf', 'Буханка', 'Loaf of bread', 'en', 0, 0, '2022-11-28 21:10:26', '2022-11-28 21:10:26'),
       ('Idle', 'Праздный', 'The team will be idle tomorrow', 'en', 0, 0, '2022-11-28 21:11:57', '2022-11-28 21:11:57'),
       ('Adversity', 'Несчастье', 'Showing courage in the face of adversity', 'en', 0, 0, '2022-11-28 21:13:45', '2022-11-28 21:13:45'),
       ('Resilient', 'Устойчивый', 'Various software resiliency techniques and mechanisms can help teams respond to errors, initiate recovery processes and maintain consistent application performance', 'en', 0, 0, '2022-11-28 21:15:58', '2022-11-28 21:15:58'),
       ('Deviate', 'Отклоняться', 'You must not deviate from the agreed route', 'en', 0, 0, '2022-11-28 21:16:36', '2022-11-28 21:16:36'),
       ('Deliberately', 'Умышленно', 'The fire was started deliberately', 'en', 0, 0, '2022-11-28 21:17:15', '2022-11-28 21:17:15'),
       ('Ceaseless', 'Непрекращающийся', 'The fort was subjected to ceaseless bombardment', 'en', 0, 0, '2022-11-28 21:17:58', '2022-11-28 21:17:58'),
       ('Beyond', 'Вне', 'Many people work well beyond the age of sixty-five', 'en', 0, 0, '2022-11-28 21:18:51', '2022-11-28 21:18:51'),
       ('Imply', 'Подразумевать', 'I did not mean to imply that there was anything wrong with the way you dress', 'en', 0, 0, '2022-11-28 21:21:42', '2022-11-28 21:21:42'),
       ('Anticipate', 'Предвидеть', 'There was every reason to anticipate the success', 'en', 0, 0, '2022-11-28 21:22:22', '2022-11-28 21:22:22'),
       ('Discrepancy', 'Несоответствие', 'If a discrepancy is found, the report will be corrected', 'en', 0, 0, '2022-11-28 21:23:28', '2022-11-28 21:23:28'),
       ('Outage', 'Отключение', 'Network outage, server crash, or disk failure affects business', 'en', 0, 0, '2022-11-28 21:25:36', '2022-11-28 21:25:36'),
       ('Discourage', 'Обескуражить', 'Don''t let the results discourage you', 'en', 0, 0, '2022-11-28 21:26:25', '2022-11-28 21:26:25'),
       ('Mundane', 'Земной', 'Mundane matters such as paying bills and shopping for food do not interest her', 'en', 0, 0, '2022-12-10 21:35:26', '2022-12-10 21:35:26'),
       ('Sacrifice', 'Жертва', 'Should i sacrifice my bed time to learn programming fast and get a development job?', 'en', 0, 0, '2022-12-10 21:37:25', '2022-12-10 21:37:25'),
       ('Rack', 'Стойка', 'A server rack is a type of frame within which you can mount server equipment, including routers, switches, and servers', 'en', 0, 0, '2022-12-10 21:42:26', '2022-12-10 21:42:26'),
       ('Redundancy', 'Избыточность', 'Data redundancy occurs when the same piece of data exists in multiple places', 'en', 0, 0, '2022-12-10 21:45:26', '2022-12-10 21:45:26'),
       ('Eliminate', 'Ликвидировать', 'This diet claims to eliminate toxins from the body', 'en', 0, 0, '2022-12-10 21:46:22', '2022-12-10 21:46:22'),
       ('Entertainment', 'Развлечение', 'Hired a band to provide entertainment', 'en', 0, 0, '2022-12-10 21:48:19', '2022-12-10 21:48:19'),
       ('Vital', 'Жизненно важный', 'These matters are vital to national defense', 'en', 0, 0, '2022-12-10 21:49:43', '2022-12-10 21:49:43'),
       ('Mitigation', 'Смягчение', 'The problem is extremely complex and its mitigation will require measures', 'en', 0, 0, '2022-12-11 14:25:31', '2022-12-11 14:25:31'),
       ('Delightful', 'Восхитительный', 'Thank you for a delightful evening', 'en', 0, 0, '2022-12-11 14:26:14', '2022-12-11 14:26:14'),
       ('Tangle', 'Клубок', 'She pulled the tangle of wires out of the box', 'en', 0, 0, '2022-12-11 14:27:15', '2022-12-11 14:27:15'),
       ('Conversely', 'Наоборот', 'Smaller dogs, conversely have longer lifespans', 'en', 0, 0, '2022-12-11 14:47:10', '2022-12-11 14:47:10'),
       ('Flux', 'Поток', 'Our plans are in a state of flux at the moment', 'en', 0, 0, '2022-12-11 14:52:03', '2022-12-11 14:52:03'),
       ('Embody', 'Воплощать', 'This cruise ship is the embodiment of luxury', 'en', 0, 0, '2022-12-11 14:53:03', '2022-12-11 14:53:03'),
       ('Appeal', 'Обращаться', 'The leader made an appeal for unity', 'en', 0, 0, '2022-12-11 14:54:00', '2022-12-11 14:54:00'),
       ('Precede', 'Предшествовать', 'I\'m not sure if i fully understand the sentence which precedes this one', 'en', 0, 0, '2022-12-11 14:55:22', '2022-12-11 14:55:22'),
       ('Derive', 'Вывести', 'Section 7 presents some user statistics derived from randomly logged requests', 'en', 0, 0, '2022-12-11 14:56:57', '2022-12-11 14:56:57'),
       ('Cumbersome', 'Громоздкий', 'This system is cumbersome, complex and slow', 'en', 0, 0, '2022-12-11 14:59:20', '2022-12-11 14:59:20'),
       ('Heterogeneous', 'Неоднородный', 'The architecture of the city until the earthquake and fire of 1906 was very heterogeneous', 'en', 0, 0, '2022-12-11 15:00:52', '2022-12-11 15:00:52'),
       ('Vigilant', 'Бдительный', 'I will keep a vigilant eye on you', 'en', 0, 0, '2022-12-11 15:03:35', '2022-12-11 15:03:35'),
       ('Severe', 'Тяжелый', 'A severe shortage of engineers', 'en', 0, 0, '2022-12-14 21:24:01', '2022-12-14 21:24:01'),
       ('Concise', 'Лаконичный', 'Write the letter in a clear, concise style', 'en', 0, 0, '2022-12-26 15:51:32', '2022-12-26 15:51:32'),
       ('Cynical', 'Циничный', 'Positive cynicism keeps you in a constant state of healthy, critical thinking', 'en', 0, 0, '2023-01-03 23:49:40', '2023-01-03 23:49:40'),
       ('Quirk', 'Причуда', 'They accepted her attitude as one of her little quirks', 'en', 0, 0, '2023-01-03 23:49:40', '2023-01-03 23:49:40'),
       ('Reveale', 'Раскрыть', 'Nintendo revealed its plans to release a new console', 'en', 0, 0, '2023-01-03 23:49:40', '2023-01-03 23:49:40'),
       ('Sustainable', 'Устойчивый', 'Sustainable economic growth', 'en', 0, 0, '2023-01-03 23:49:40', '2023-01-03 23:49:40'),
       ('Amend', 'Изменить', 'Every attempt to amend or revise the present constitution has, however, been unsuccessful', 'en', 0, 0, '2023-01-03 23:49:40', '2023-01-03 23:49:40'),
       ('Miscellaneous', 'Разнообразный', 'Large quantities of miscellaneous imports are sent by Germany, Spain, France and Italy', 'en', 0, 0, '2023-01-03 23:49:40', '2023-01-03 23:49:40'),
       ('Bogus', 'Фальшивка', 'Spammers almost exclusively use bogus sending addresses so will not see the error message', 'en', 0, 0, '2023-01-03 23:49:40', '2023-01-03 23:49:40'),
       ('Rival', 'Соперник', 'The teams have been longtime rivals', 'en', 0, 0, '2023-01-03 23:49:40', '2023-01-03 23:49:40'),
       ('Disrupt', 'Нарушить', 'Flooding disrupted rail services', 'en', 0, 0, '2023-01-03 23:49:40', '2023-01-03 23:49:40'),
       ('Reveal', 'Раскрыть', 'She was not going to reveal her secret unless she had to', 'en', 0, 0, '2023-01-03 23:49:40', '2023-01-03 23:49:40');

UNLOCK
    TABLES;
