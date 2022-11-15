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
    `word`        varchar(255)        NOT NULL,
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
VALUES ('Severity', 'Строгость', '', 'en', 0, 0, '2022-11-14 20:52:00', '2022-11-14 20:52:00'),
       ('Do it over', 'Переделать', 'I need to do it over', 'en', 0, 0, '2022-11-14 20:52:01', '2022-11-14 20:52:01');
UNLOCK
    TABLES;
