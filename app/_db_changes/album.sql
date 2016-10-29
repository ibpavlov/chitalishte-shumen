CREATE TABLE `images` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`article_id` BIGINT(20) NULL DEFAULT NULL,
	`path` VARCHAR(255) NULL DEFAULT NULL,
	`title` VARCHAR(255) NULL DEFAULT NULL,
	`date_added` DATETIME NULL DEFAULT NULL,
	`creator_id` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=2;


ALTER TABLE `articles`
	ADD COLUMN `type` ENUM('news','event','gallery','page') NULL DEFAULT 'page' AFTER `status`;