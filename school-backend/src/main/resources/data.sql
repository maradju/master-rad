CREATE USER 'schoolmgmt'@'localhost' IDENTIFIED BY 'schoolmgmt';

GRANT ALL PRIVILEGES ON * . * TO 'schoolmgmt'@'localhost';
--
-- Starting with MySQL 8.0.4, the MySQL team changed the
-- default authentication plugin for MySQL server
-- from mysql_native_password to caching_sha2_password.
--
-- The command below will make the appropriate updates for your user account.
--
-- See the MySQL Reference Manual for details:
-- https://dev.mysql.com/doc/refman/8.0/en/caching-sha2-pluggable-authentication.html
--
ALTER USER 'schoolmgmt'@'localhost' IDENTIFIED WITH mysql_native_password BY 'schoolmgmt';

-- -----------------------------------------------------
-- Schema school-database
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `school-database`;

CREATE SCHEMA `school-database`;
USE `school-database` ;

-- -----------------------------------------------------
-- Table `school-database`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school-database`.`student` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
   `email` VARCHAR(255) NULL DEFAULT NULL,
   `jmbg` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- ALTER table `school-database`.`student` DROP COLUMN `last_name`;
-- ALTER table `school-database`.`student` RENAME COLUMN  `first_name` TO  `name`;
-- -----------------------------------------------------
-- Add sample data
-- -----------------------------------------------------

INSERT INTO student(id, name, email, jmbg) VALUES ('1', 'Ana', 'anaanic@gmail.com', '0510999574638');
