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
-- Table `school-database`.`role`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `school-database`.`role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Add sample data into `school-database`.`role`
-- -----------------------------------------------------

INSERT INTO `school-database`.role(id, name) VALUES(null, 'ADMIN');
INSERT INTO `school-database`.role (id, name) VALUES (null, 'PROFESSOR');
INSERT INTO `school-database`.role (id, name) VALUES (null, 'STUDENT');

-- -----------------------------------------------------
-- Table `school-database`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school-database`.`student` (
	`id` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(255) NULL DEFAULT NULL,
	`last_name` varchar(255) NULL DEFAULT NULL,
	`parent_name` varchar(255) NULL DEFAULT NULL,
	`mobile` varchar(255) NULL DEFAULT NULL,
	`email` varchar(255) NULL DEFAULT NULL,
	`image_url` varchar(255) NULL DEFAULT NULL,
	`username` varchar(50) NOT NULL,
	`password` varchar(50) NOT NULL,
	`role_id` int NOT NULL,
	PRIMARY KEY (`id`),
	KEY `k_role` (`role_id`),
	CONSTRAINT `FK_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Add sample data into `school-database`.`student`
-- -----------------------------------------------------

INSERT INTO student(id, first_name, last_name, parent_name, mobile, email, image_url, username, password, role_id) VALUES (null, 'Ana', 'Anic', 'Ime roditelja', '8058252', 'anaanic@gmail.com', '0510999574638', 'ana', 'ana', '3');

-- -----------------------------------------------------
-- Table `school-database`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school-database`.`professor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NULL DEFAULT NULL,
  `last_name` varchar(255) NULL DEFAULT NULL,
  `about` varchar(255) NULL DEFAULT NULL,
  `mobile` varchar(255) NULL DEFAULT NULL,
   `email` varchar(255) NULL DEFAULT NULL,
  `image_url` varchar(255) NULL DEFAULT NULL,
   `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_role_id_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Add sample data into `school-database`.`professor`
-- -----------------------------------------------------

INSERT INTO professor(id, first_name, last_name, about, mobile, email, image_url, username, password, role_id) VALUES (null, 'Profa', 'Profic', 'rodjen tu i tu','0697874632', 'profa@gmail.com', 'IMAGE_URL', 'profa', 'profa', '2');

-- -----------------------------------------------------
-- Table `school-database`.`subject`
-- -----------------------------------------------------
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `syllabus` varchar(255) NOT NULL,
   `literature` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Add sample data into `school-database`.`subject`
-- -----------------------------------------------------

 INSERT INTO subject(id, name, syllabus, literature) VALUES(null, 'matematika', 'cilj ovog predmeta je itd itd', 'Matematika Vene Bogoslavov');

-- -----------------------------------------------------
-- Table `school-database`.`course`
-- -----------------------------------------------------
CREATE TABLE `course` (
   `id` int NOT NULL AUTO_INCREMENT,
   `name` varchar(50) NOT NULL,
   `start_date` Date NOT NULL,
   `end_date` Date NOT NULL,
   `subject_id` int NOT NULL,
   `professor_id` int NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
    CONSTRAINT `FK_professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`id`)
)ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Add sample data into `school-database`.`course`
-- -----------------------------------------------------

 INSERT INTO course(id, name, start_date, end_date, subject_id, professor_id) VALUES(null, 'matematika 5. razred', '2022-03-05', '2022-03-05', '1', '1');
-- Enrollment(enrollment_id, finished, grade, student_id, course_id)

-- -----------------------------------------------------
-- Table `school-database`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE `enrollment` (
   `id` int NOT NULL AUTO_INCREMENT,
   `finished` boolean,
   `grade` int NOT NULL,
   `student_id` int NOT NULL,
   `course_id` int NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
    CONSTRAINT `FK_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
);

-- -----------------------------------------------------
-- Add sample data into `school-database`.`enrollment`
-- -----------------------------------------------------

 INSERT INTO enrollment(id, finished, grade, student_id, course_id) VALUES(null, '1', '95', '1', '1');


-- -----------------------------------------------------
-- Table `school-database`.`user`
-- -----------------------------------------------------
-- CREATE TABLE `user` (
--  `username` varchar(50) NOT NULL,
--  `password` varchar(50) NOT NULL,
-- `role_id` int NOT NULL,
--  PRIMARY KEY (`username`),
--  KEY `k_role` (`role_id`),
--  CONSTRAINT `FK_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
-- );

-- -----------------------------------------------------
-- Add sample data into `school-database`.`user`
-- -----------------------------------------------------

-- INSERT INTO user(username, password, role_id) VALUES('admin', 'admin', 1);
-- INSERT INTO user(username, password, role_id) VALUES('profa', 'profa', 2);
-- INSERT INTO user(username, password, role_id) VALUES('anaanic', 'anaanic', 3);