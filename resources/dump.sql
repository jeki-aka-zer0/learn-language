USE `learn_language`;

DROP TABLE IF EXISTS `words`;
CREATE TABLE `words`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `word`          varchar(255) NOT NULL,
    `translate`     varchar(255)          DEFAULT NULL,
    `example`       varchar(255)          DEFAULT NULL,
    `lang`          ENUM('en', 'fr') NOT NULL,
    `is_remembered` bool                  DEFAULT NULL,
    `asked_times`   smallint     NOT NULL DEFAULT 0,
    `created_at`    timestamp             DEFAULT NOW(),
    `updated_at`    timestamp             DEFAULT NOW(),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

LOCK
TABLES `words` WRITE;
INSERT INTO `words` (`word`, `translate`, `example`, `lang`, `is_remembered`, `asked_times`, `created_at`, `updated_at`)
VALUES ('Severity', 'Строгость', '', 'en', null, 0, '2022-11-14 20:52:00', '2022-11-14 20:52:00'),
       ('Do it over', 'Строгость', '', 'en', null, 0, '2022-11-14 20:52:01', '2022-11-14 20:52:01');
UNLOCK
TABLES;