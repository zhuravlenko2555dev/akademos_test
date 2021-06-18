CREATE TABLE IF NOT EXISTS `office` (
    `id` INT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY name (`name`)
    ) DEFAULT CHARSET=utf8;
INSERT INTO `office` (`name`) VALUES
('Office1'),
('Office2'),
('Office3'),
('Office4'),
('Office5');

CREATE TABLE IF NOT EXISTS `person` (
    `id` INT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
    `office_id` INT(6) UNSIGNED NOT NULL,
    `chief_id` INT(6) UNSIGNED,
    `name` varchar(200) NOT NULL,
    `wage` decimal(15,2) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
    ) DEFAULT CHARSET=utf8;
INSERT INTO `person` (`office_id`, `chief_id`, `name`, `wage`) VALUES
(1, NULL, 'Alice R. Shoults', '755.5'),
(1, 8, 'Linda D. Everitt', '1420.7'),
(3, NULL, 'Paula R. Boucher', '925.3'),
(4, NULL, 'Jonathan S. Johnson', '590'),
(3, NULL, 'George B. Johnson', '840.8'),
(3, 3, 'Michaela M. McMahon', '850.4'),
(4, NULL, 'Jason M. McPeek', '1230.8'),
(1, NULL, 'Marion J. Johnson', '1370.5'),
(1, 8, 'Kathleen E. Scott', '930.5'),
(5, 11, 'Walter T. Nosal', '1030.7'),
(5, NULL, 'Eddie C. Leach', '780.2'),
(3, 3, 'Ethel K. Macdonald', '880'),
(3, 3, 'Cassandra J. Nall', '910.6'),
(5, 11, 'Larry K. Bello', '1030.7'),
(4, NULL, 'Debbie K. Treece', '1050'),
(4, 15, 'Olive J. Abraham', '860');



SELECT p1.* FROM `person` AS p1 INNER JOIN `person` AS p2 ON p1.`chief_id` = p2.`id` WHERE p1.`wage` > p2.`wage`;
SELECT o.`name`, p.`name`, p.`wage` FROM `office` AS o LEFT JOIN (SELECT `office_id`, MAX(`wage`) AS max_wage FROM `person` GROUP BY `office_id`) AS q ON o.`id` = q.`office_id` LEFT JOIN `person` AS p ON q.`max_wage` = p.`wage`;
SELECT p1.`name`, COUNT(p2.`id`) AS c FROM `person` AS p1 INNER JOIN `person` AS p2 ON p1.`id` = p2.`chief_id` GROUP BY p1.`id` HAVING c = 1;
SELECT o.`name`, IFNULL(SUM(p.`wage`), 0) AS sum FROM `office` AS o LEFT JOIN `person` AS p ON o.`id` = p.`office_id` GROUP BY o.`id` ORDER BY SUM DESC;