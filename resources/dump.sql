USE
learn_language;

DROP TABLE IF EXISTS `words`;
CREATE TABLE `words`
(
    `id`   bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `word` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

LOCK
TABLES `words` WRITE;
INSERT INTO `words` (`word`)
VALUES ('Take a look'),
       ('Pencil');
UNLOCK
TABLES;