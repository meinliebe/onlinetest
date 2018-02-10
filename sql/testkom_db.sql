/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : testkom_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-02-06 13:55:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add Periode Test', '7', 'add_periode');
INSERT INTO `auth_permission` VALUES ('20', 'Can change Periode Test', '7', 'change_periode');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete Periode Test', '7', 'delete_periode');
INSERT INTO `auth_permission` VALUES ('22', 'Can add Peserta Test', '8', 'add_peserta');
INSERT INTO `auth_permission` VALUES ('23', 'Can change Peserta Test', '8', 'change_peserta');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete Peserta Test', '8', 'delete_peserta');
INSERT INTO `auth_permission` VALUES ('25', 'Can add Data Hasil Test', '9', 'add_datatest');
INSERT INTO `auth_permission` VALUES ('26', 'Can change Data Hasil Test', '9', 'change_datatest');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete Data Hasil Test', '9', 'delete_datatest');
INSERT INTO `auth_permission` VALUES ('28', 'Can add Penginput Soal', '10', 'add_penginput_soal');
INSERT INTO `auth_permission` VALUES ('29', 'Can change Penginput Soal', '10', 'change_penginput_soal');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete Penginput Soal', '10', 'delete_penginput_soal');
INSERT INTO `auth_permission` VALUES ('31', 'Can add Grup Soal', '11', 'add_soal_grup');
INSERT INTO `auth_permission` VALUES ('32', 'Can change Grup Soal', '11', 'change_soal_grup');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete Grup Soal', '11', 'delete_soal_grup');
INSERT INTO `auth_permission` VALUES ('34', 'Can add Bidang Soal (Mata Kuliah)', '12', 'add_bidang_soal');
INSERT INTO `auth_permission` VALUES ('35', 'Can change Bidang Soal (Mata Kuliah)', '12', 'change_bidang_soal');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete Bidang Soal (Mata Kuliah)', '12', 'delete_bidang_soal');
INSERT INTO `auth_permission` VALUES ('37', 'Can add Kategori Soal', '13', 'add_kategori_soal');
INSERT INTO `auth_permission` VALUES ('38', 'Can change Kategori Soal', '13', 'change_kategori_soal');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete Kategori Soal', '13', 'delete_kategori_soal');
INSERT INTO `auth_permission` VALUES ('40', 'Can add Jawaban', '14', 'add_jawaban');
INSERT INTO `auth_permission` VALUES ('41', 'Can change Jawaban', '14', 'change_jawaban');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete Jawaban', '14', 'delete_jawaban');
INSERT INTO `auth_permission` VALUES ('43', 'Can add Soal', '15', 'add_soal');
INSERT INTO `auth_permission` VALUES ('44', 'Can change Soal', '15', 'change_soal');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete Soal', '15', 'delete_soal');
INSERT INTO `auth_permission` VALUES ('46', 'Can add Data Hasil Test', '16', 'add_datatest');
INSERT INTO `auth_permission` VALUES ('47', 'Can change Data Hasil Test', '16', 'change_datatest');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete Data Hasil Test', '16', 'delete_datatest');
INSERT INTO `auth_permission` VALUES ('49', 'Can add Bidang Soal (Mata Kuliah)', '12', 'add_mata_kuliah');
INSERT INTO `auth_permission` VALUES ('50', 'Can change Bidang Soal (Mata Kuliah)', '12', 'change_mata_kuliah');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete Bidang Soal (Mata Kuliah)', '12', 'delete_mata_kuliah');
INSERT INTO `auth_permission` VALUES ('52', 'Can add Data Hasil Test', '9', 'add_data_test');
INSERT INTO `auth_permission` VALUES ('53', 'Can change Data Hasil Test', '9', 'change_data_test');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete Data Hasil Test', '9', 'delete_data_test');
INSERT INTO `auth_permission` VALUES ('55', 'Can add Status Peserta', '17', 'add_status_peserta');
INSERT INTO `auth_permission` VALUES ('56', 'Can change Status Peserta', '17', 'change_status_peserta');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete Status Peserta', '17', 'delete_status_peserta');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$100000$GbRAuBsS4sou$rikupBeixYzu2Hvh4E7AvyRukDEOAeOujJmJnPgbdZ4=', '2018-02-06 02:29:25.014804', '1', 'admin', '', '', '', '1', '1', '2017-12-04 05:20:28.821624');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$100000$GhJ5dlXDI6Qw$znYtSBiqbPLuibn1pXAIE9UttAOrbfyOaFUAzXxuuaw=', '2018-01-26 03:40:10.400268', '0', 'M3108100', '', '', '', '0', '1', '2017-12-05 02:35:42.665412');
INSERT INTO `auth_user` VALUES ('3', 'pbkdf2_sha256$100000$JTVHPdDT1rqC$E0fUhK0BUJRAM+13C4UxZQut46Rr8V6MiQsFYyK/ti4=', '2018-02-05 07:46:17.855248', '0', 'M3108200', '', '', '', '0', '1', '2017-12-13 04:11:41.506469');
INSERT INTO `auth_user` VALUES ('102', 'pbkdf2_sha256$100000$4z30uhiKFeow$n6bhsQRjZEkWtDD1k6TNHdVGK6H8MMPPb2MaIubpJkM=', '2018-02-05 08:49:00.057074', '0', 'K100170001', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:38.065092');
INSERT INTO `auth_user` VALUES ('103', 'pbkdf2_sha256$100000$x3THGg87U8t4$2fVSF5IL0e7MJubJtSlTmXJkGXMKuidrfJY/T+aAaTk=', null, '0', 'K100170002', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:38.172876');
INSERT INTO `auth_user` VALUES ('104', 'pbkdf2_sha256$100000$l6cB5ldsC17n$KTiAnsRsF1vvAypWXBQqVQT4/nx76n08g4hTR7rPEAo=', null, '0', 'D200170001', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:38.265940');
INSERT INTO `auth_user` VALUES ('105', 'pbkdf2_sha256$100000$h3nDVoQ17ah0$o+yrpKJFCJWxRef7EFL76ibIPPWR2w1TV/qbgRawQpE=', null, '0', 'A510170001', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:38.358019');
INSERT INTO `auth_user` VALUES ('106', 'pbkdf2_sha256$100000$IlEWCGbj4i6u$sKGN55cb8XfZDKmwmK2DaBSB3Fs/79jyeC3kKfan/kQ=', null, '0', 'C100170001', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:38.446067');
INSERT INTO `auth_user` VALUES ('107', 'pbkdf2_sha256$100000$o6J2aeVYoGTx$bi+jlV0jVAK06XPwd6CH1CZCpSAGSOiRi12+kLdDDyo=', null, '0', 'A410170002', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:38.532652');
INSERT INTO `auth_user` VALUES ('108', 'pbkdf2_sha256$100000$biTs7yAHKJ15$aE5qIOY2ef5x1o7AmmYYrp0nvpDxM+VzJkurb7b0xQo=', null, '0', 'B200174001', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:38.623208');
INSERT INTO `auth_user` VALUES ('109', 'pbkdf2_sha256$100000$TfNPRDO5Zeo0$NYAbu3Cg8mNgPlcb3yuj3nWxn1+6XErJFm/4KgeIKo8=', null, '0', 'D500170001', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:38.713757');
INSERT INTO `auth_user` VALUES ('110', 'pbkdf2_sha256$100000$fnHObzVtw25K$mszM5zq9+4I4r5SX0pMuL5Pf3E3ApiyfTLaQSvyylmw=', null, '0', 'B200170002', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:38.803834');
INSERT INTO `auth_user` VALUES ('111', 'pbkdf2_sha256$100000$a91UQgNusf0z$OdohAxoqdWvgxVnw6qQXXn8Gnb5T9TBaRCvqupOhJ7k=', '2018-02-05 08:48:50.623572', '0', 'B100170002', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:38.891414');
INSERT INTO `auth_user` VALUES ('112', 'pbkdf2_sha256$100000$c8EOr1Y2BKWy$khG6Pw4Z61o/CteKvp5JNT3MGLimia96+kPOLT0+KEg=', null, '0', 'A510170002', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:38.977052');
INSERT INTO `auth_user` VALUES ('113', 'pbkdf2_sha256$100000$qPbmCBjaweKn$o4vZnZur2tEHXqlqQuSKqvb6b/iecWqyG3OS8OvdMvw=', '2018-02-05 08:49:17.739617', '0', 'J210170001', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:39.064850');
INSERT INTO `auth_user` VALUES ('114', 'pbkdf2_sha256$100000$HDOxHYG8scfd$6hhPHOoiDjWld7nSJFN+5Q25c8F26kZEHX39hpmJDiw=', null, '0', 'K100170003', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:39.154413');
INSERT INTO `auth_user` VALUES ('115', 'pbkdf2_sha256$100000$sNE8ZnrlvFsW$N8mFYfaSZXJ5vBvGNpXL3fBUS6lwVKyqZxwPlmRIyAw=', null, '0', 'D100170001', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:39.242475');
INSERT INTO `auth_user` VALUES ('116', 'pbkdf2_sha256$100000$oN8kcYE4zHtA$tXl5FlOCmqwS9APW3+nRlfd16wrZ+cB4ylRZvbOJGcY=', null, '0', 'J310170003', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:39.329753');
INSERT INTO `auth_user` VALUES ('117', 'pbkdf2_sha256$100000$247UiZ3u2EKT$LJkWth0KfMRw9Cq0+WJJD6ftUeyhYvET5wZ3H/dZV5M=', null, '0', 'K100170004', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:39.417334');
INSERT INTO `auth_user` VALUES ('118', 'pbkdf2_sha256$100000$LmHpygtn1Rdd$Z6DQwsdZVif+6qMDWzWlr5Bjl7jwY9+IoAmcZQubvbA=', null, '0', 'A210170001', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:39.509893');
INSERT INTO `auth_user` VALUES ('119', 'pbkdf2_sha256$100000$6IFQupRrCNDT$qi6oY6oRC58G7SHM8EEK2sZfCTwYBbQB7vJ4DCwrvfI=', '2018-02-05 08:37:35.973419', '0', 'F100170003', '', '', 'jlennon@beatles.com', '0', '1', '2018-02-05 08:01:39.597457');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-12-05 02:35:42.804641', '2', 'M3108100', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2017-12-06 01:38:27.360257', '1', 'Ginus Pandhu Setyawan', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2017-12-06 03:00:08.963481', '2', 'BASIS DATA LANJUT', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2017-12-06 03:17:25.744067', '2', 'Soal UAS 2017', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2017-12-06 03:35:33.179068', '2', 'BASIS DATA LANJUT - Stored Procedure', '2', '[{\"changed\": {\"fields\": [\"kategori\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2017-12-06 03:35:39.722777', '2', 'BASIS DATA LANJUT - Stored Procedure', '2', '[]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2017-12-06 03:35:52.629459', '2', 'BASIS DATA LANJUT', '2', '[]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2017-12-06 04:40:55.263975', '1', 'Grup 1', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2017-12-06 21:19:27.815953', '24', 'Stored Procedure-[<p>123</p> ...]', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"123-[True]\", \"name\": \"Jawaban\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2017-12-06 21:21:43.979415', '25', 'Stored Procedure-[<p>qweqw</p> ...]', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"Jawaban\", \"object\": \"qwe-[False]\"}}, {\"added\": {\"name\": \"Jawaban\", \"object\": \"ewqewe-[False]\"}}, {\"added\": {\"name\": \"Jawaban\", \"object\": \"qweqwe-[False]\"}}, {\"added\": {\"name\": \"Jawaban\", \"object\": \"qweqewq-[False]\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2017-12-06 21:21:51.446444', '25', 'Stored Procedure-[<p>qweqw</p> ...]', '2', '[{\"changed\": {\"name\": \"Jawaban\", \"fields\": [\"jawaban_benar\"], \"object\": \"qweqwe-[True]\"}}, {\"changed\": {\"name\": \"Jawaban\", \"fields\": [\"jawaban_benar\"], \"object\": \"qweqewq-[True]\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2017-12-06 21:21:56.010549', '25', 'Stored Procedure-[<p>qweqw</p> ...]', '2', '[{\"changed\": {\"name\": \"Jawaban\", \"fields\": [\"jawaban_benar\"], \"object\": \"qweqwe-[False]\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2017-12-06 21:27:32.440368', '25', 'Stored Procedure-[<p>qweqw</p> ...]', '2', '[]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2017-12-06 22:33:18.810626', '1', 'Ginus Pandhu Setyawan', '2', '[{\"changed\": {\"fields\": [\"mata_kuliah\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2017-12-09 02:28:30.326864', '2', 'Basis Data Lanjut', '2', '[{\"changed\": {\"fields\": [\"mata_kuliah\"]}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2017-12-09 02:49:09.389038', '25', 'Stored Procedure-[<p>qweqw</p> ...]', '2', '[{\"changed\": {\"name\": \"Jawaban\", \"object\": \"1-[False]\", \"fields\": [\"text_jawaban\"]}}, {\"changed\": {\"name\": \"Jawaban\", \"object\": \"2-[False]\", \"fields\": [\"text_jawaban\"]}}, {\"changed\": {\"name\": \"Jawaban\", \"object\": \"3-[False]\", \"fields\": [\"text_jawaban\"]}}, {\"changed\": {\"name\": \"Jawaban\", \"object\": \"4-[True]\", \"fields\": [\"text_jawaban\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2017-12-09 02:49:21.751667', '24', 'Stored Procedure-[<p>123</p> ...]', '2', '[{\"added\": {\"name\": \"Jawaban\", \"object\": \"22-[False]\"}}, {\"added\": {\"name\": \"Jawaban\", \"object\": \"33-[False]\"}}, {\"added\": {\"name\": \"Jawaban\", \"object\": \"44-[False]\"}}, {\"changed\": {\"name\": \"Jawaban\", \"object\": \"11-[True]\", \"fields\": [\"text_jawaban\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2017-12-11 00:38:52.710957', '25', 'Stored Procedure-[<p>Kumpulan ...]', '2', '[{\"changed\": {\"fields\": [\"text_bantuan\", \"text_soal\"]}}, {\"changed\": {\"fields\": [\"text_jawaban\"], \"name\": \"Jawaban\", \"object\": \"Data mining-[False]\"}}, {\"changed\": {\"fields\": [\"text_jawaban\"], \"name\": \"Jawaban\", \"object\": \"Data mart-[False]\"}}, {\"changed\": {\"fields\": [\"text_jawaban\", \"jawaban_benar\"], \"name\": \"Jawaban\", \"object\": \"Data warehouse-[True]\"}}, {\"changed\": {\"fields\": [\"text_jawaban\", \"jawaban_benar\"], \"name\": \"Jawaban\", \"object\": \"Basis Data Multimedia-[False]\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2017-12-11 00:39:35.751009', '24', 'Stored Procedure-[<p>Data ...]', '2', '[{\"changed\": {\"fields\": [\"text_bantuan\", \"text_soal\"]}}, {\"changed\": {\"fields\": [\"text_jawaban\", \"jawaban_benar\"], \"name\": \"Jawaban\", \"object\": \"Integrated-[False]\"}}, {\"changed\": {\"fields\": [\"text_jawaban\"], \"name\": \"Jawaban\", \"object\": \"Subject Oriented-[False]\"}}, {\"changed\": {\"fields\": [\"text_jawaban\"], \"name\": \"Jawaban\", \"object\": \"Non Volatile-[False]\"}}, {\"changed\": {\"fields\": [\"text_jawaban\", \"jawaban_benar\"], \"name\": \"Jawaban\", \"object\": \"Time Variant-[True]\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2017-12-11 00:40:21.081635', '26', 'Stored Procedure-[<p>Suatu ...]', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"Jawaban\", \"object\": \"Data warehouse-[False]\"}}, {\"added\": {\"name\": \"Jawaban\", \"object\": \"Data mining-[True]\"}}, {\"added\": {\"name\": \"Jawaban\", \"object\": \"Data Mart-[False]\"}}, {\"added\": {\"name\": \"Jawaban\", \"object\": \"OLAP-[False]\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2017-12-11 03:21:28.570516', '1', 'Semester 1 2017', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2017-12-11 05:42:08.321488', '3', 'Struktur Data', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2017-12-11 05:42:10.198526', '1', 'Ginus Pandhu Setyawan', '2', '[{\"changed\": {\"fields\": [\"mata_kuliah\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2017-12-11 05:47:03.271238', '2', 'Ginus Pandhu Setyawan', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2017-12-13 02:44:04.995676', '2', 'Ginus Pandhu Setyawan', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2017-12-13 03:41:24.595285', '1', 'Ginus Pandhu Setyawan', '2', '[{\"changed\": {\"fields\": [\"mata_kuliah\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2017-12-13 04:03:39.660678', '4', 'Pemrograman Visual', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2017-12-13 04:03:41.620647', '3', 'Ginus Pandhu Setyawan', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2017-12-13 04:11:41.606022', '3', 'M3108200', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2017-12-13 04:11:59.997380', '4', 'Eka Saputra Aji', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2017-12-13 04:13:32.796021', '5', 'Ginus Pandhu Setyawan', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2017-12-13 04:29:20.954889', '5', 'Eka Saputra Aji', '2', '[{\"changed\": {\"fields\": [\"nama\", \"uniid\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2017-12-13 04:29:48.361584', '4', 'Eka Saputra Aji', '2', '[{\"changed\": {\"fields\": [\"mata_kuliah\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2017-12-13 04:29:53.169582', '4', 'Eka Saputra Aji', '2', '[{\"changed\": {\"fields\": [\"mata_kuliah\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2017-12-13 04:30:56.232672', '4', 'Eka Saputra Aji', '2', '[]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2017-12-13 04:31:03.274235', '5', 'Eka Saputra Aji', '2', '[{\"changed\": {\"fields\": [\"uniid\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2017-12-13 04:31:06.243173', '4', 'Eka Saputra Aji', '2', '[]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2017-12-13 04:31:48.166346', '4', 'Eka Saputra Aji', '2', '[{\"changed\": {\"fields\": [\"mata_kuliah\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2017-12-18 01:39:48.840195', '6', 'Ginus Pandhu Setyawan', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2017-12-18 01:40:00.381599', '7', 'Ginus Pandhu Setyawan', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2017-12-18 01:40:11.923248', '8', 'Ginus Pandhu Setyawan', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2017-12-18 01:44:50.133219', '9', 'Ginus Pandhu Setyawan', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2017-12-18 01:45:05.750596', '9', 'Eka Saputra Aji', '2', '[{\"changed\": {\"fields\": [\"nama\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2017-12-18 23:36:10.098095', '26', 'Stored Procedure-[<h2 ...]', '2', '[{\"changed\": {\"fields\": [\"text_soal\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2017-12-18 23:38:59.872926', '26', 'Stored Procedure-[<p>Suatu ...]', '2', '[{\"changed\": {\"fields\": [\"text_soal\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2018-01-17 04:55:26.478257', '31', 'Stored Procedure-[<p>Data ...]', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2018-01-17 04:55:26.536439', '30', 'Stored Procedure-[<p>Data ...]', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2018-01-18 01:27:24.505274', '1', 'Stored Procedure-[<p>Pimpinan ...]', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"Komandan Laskar Hisbullah di f-[True]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"Komandan Laskar Hisbullah di f-[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"Komandan Laskar Hisbullah di f-[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"Komandan Laskar Hisbullah di f-[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"Komandan Laskar Kalimantan Sel-[False]\", \"name\": \"Jawaban\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2018-01-18 01:28:18.547192', '2', 'Stored Procedure-[<p>Latar ...]', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"tidak menyetujui Indonesia tim-[True]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"ketidakpuasan daerah terhadap -[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"membentuk Negara Islam-[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"bergabung ke Negara Islam Kart-[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"menolak masuknya pasukan APRIS-[False]\", \"name\": \"Jawaban\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2018-01-18 01:29:04.782156', '3', 'Stored Procedure-[<p>Munculnya ...]', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"persaingan antara anggota ABRI-[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"perebutan jabatan di Sumatra B-[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"munculnya kelas-kelas dalam ma-[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"perebutan jabatan Kapolres di -[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"ketidakpuasan beberapa di Suma-[True]\", \"name\": \"Jawaban\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2018-01-18 01:29:50.407161', '4', 'Stored Procedure-[<p>Usaha ...]', '1', '[{\"added\": {}}, {\"added\": {\"object\": \"pembersihan terhadap antek-ant-[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"musyawarah dan pengarahan pasu-[True]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"menghukum Kartosuwiryo-[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"penyerangan terhadap Kartosuwi-[False]\", \"name\": \"Jawaban\"}}, {\"added\": {\"object\": \"penangkapan Kartosuwiryo-[False]\", \"name\": \"Jawaban\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2018-02-06 03:46:41.402631', '20', 'qweqwe', '3', '', '13', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('14', 'soal', 'jawaban');
INSERT INTO `django_content_type` VALUES ('13', 'soal', 'kategori_soal');
INSERT INTO `django_content_type` VALUES ('12', 'soal', 'mata_kuliah');
INSERT INTO `django_content_type` VALUES ('10', 'soal', 'penginput_soal');
INSERT INTO `django_content_type` VALUES ('15', 'soal', 'soal');
INSERT INTO `django_content_type` VALUES ('11', 'soal', 'soal_grup');
INSERT INTO `django_content_type` VALUES ('16', 'ujian', 'datatest');
INSERT INTO `django_content_type` VALUES ('9', 'ujian', 'data_test');
INSERT INTO `django_content_type` VALUES ('7', 'ujian', 'periode');
INSERT INTO `django_content_type` VALUES ('8', 'ujian', 'peserta');
INSERT INTO `django_content_type` VALUES ('17', 'ujian', 'status_peserta');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-12-04 05:19:59.753062');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-12-04 05:20:05.977632');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-12-04 05:20:07.558974');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-12-04 05:20:07.609747');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-12-04 05:20:08.419652');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-12-04 05:20:09.061357');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-12-04 05:20:09.759741');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-12-04 05:20:09.811985');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-12-04 05:20:10.105274');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-12-04 05:20:10.137171');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-12-04 05:20:10.192476');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2017-12-04 05:20:11.779710');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0009_alter_user_last_name_max_length', '2017-12-04 05:20:12.188358');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2017-12-04 05:20:12.544443');
INSERT INTO `django_migrations` VALUES ('15', 'soal', '0001_initial', '2017-12-05 06:59:05.330213');
INSERT INTO `django_migrations` VALUES ('16', 'ujian', '0001_initial', '2017-12-05 07:00:04.345086');
INSERT INTO `django_migrations` VALUES ('17', 'soal', '0002_auto_20171206_0924', '2017-12-06 02:24:32.046726');
INSERT INTO `django_migrations` VALUES ('18', 'ujian', '0002_datatest_jawaban', '2017-12-06 02:24:33.085096');
INSERT INTO `django_migrations` VALUES ('19', 'soal', '0003_auto_20171206_0933', '2017-12-06 02:33:16.614969');
INSERT INTO `django_migrations` VALUES ('20', 'soal', '0004_auto_20171206_0951', '2017-12-06 02:52:54.787034');
INSERT INTO `django_migrations` VALUES ('21', 'ujian', '0003_auto_20171206_0952', '2017-12-06 02:54:53.125970');
INSERT INTO `django_migrations` VALUES ('22', 'soal', '0005_auto_20171206_0958', '2017-12-06 02:58:58.604264');
INSERT INTO `django_migrations` VALUES ('23', 'ujian', '0004_auto_20171206_1032', '2017-12-06 03:33:17.694532');
INSERT INTO `django_migrations` VALUES ('24', 'soal', '0006_auto_20171206_1042', '2017-12-06 03:42:43.200186');
INSERT INTO `django_migrations` VALUES ('25', 'soal', '0007_auto_20171206_1112', '2017-12-06 04:12:52.209380');
INSERT INTO `django_migrations` VALUES ('26', 'soal', '0008_auto_20171206_1113', '2017-12-06 04:13:51.652150');
INSERT INTO `django_migrations` VALUES ('27', 'soal', '0009_remove_soal_grup', '2017-12-06 04:22:59.336317');
INSERT INTO `django_migrations` VALUES ('28', 'soal', '0010_auto_20171207_0427', '2017-12-06 21:27:16.309545');
INSERT INTO `django_migrations` VALUES ('29', 'ujian', '0005_status_peserta', '2017-12-06 23:22:40.040948');
INSERT INTO `django_migrations` VALUES ('30', 'ujian', '0006_auto_20171215_0710', '2017-12-15 00:10:21.550601');
INSERT INTO `django_migrations` VALUES ('31', 'ujian', '0007_auto_20171218_0829', '2017-12-18 01:29:26.141037');
INSERT INTO `django_migrations` VALUES ('32', 'ujian', '0008_auto_20171218_0900', '2017-12-18 02:00:59.803422');
INSERT INTO `django_migrations` VALUES ('33', 'ujian', '0009_data_test_mata_kuliah', '2017-12-18 02:04:18.662848');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('6p58a1ugssyyhpiij0y3z1rl5vlq4zab', 'ODgzMDViYTA4YTgxZmJkNWM2Yjk4ODQxNTNmYmNhOWRiNTIwMWNkODp7fQ==', '2017-12-18 06:59:44.803625');
INSERT INTO `django_session` VALUES ('98rcjakndzz8wy7dnfw9snlzhdrzgzx1', 'ODgzMDViYTA4YTgxZmJkNWM2Yjk4ODQxNTNmYmNhOWRiNTIwMWNkODp7fQ==', '2017-12-18 07:00:01.738185');
INSERT INTO `django_session` VALUES ('aem9mahtanxjrsqoongn1b1ks8daejwi', 'NTA0MTk1MDk4ZjJiMjcwNjU2YzFjYzVmYzk3ODZjNzdiYzhiYzQ0NTp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsInVzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzJmM2U0YTI4MGJiMWI4NGMxYmIzNzU4M2ZmZjM2YmVjY2YzY2UzYiJ9', '2018-02-19 08:56:00.133053');
INSERT INTO `django_session` VALUES ('b13da0yuyaqdr8979ygvhk7ro4zhpmj5', 'ZTBhMzAxZjJmMTdlZmQ5N2JiOWVhMzFhZGYxOWE5Y2JiYTlmOWNiZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlcm5hbWUiOiJhZG1pbiIsInVzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6ImMyZjNlNGEyODBiYjFiODRjMWJiMzc1ODNmZmYzNmJlY2NmM2NlM2IiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-01-02 20:50:16.504130');
INSERT INTO `django_session` VALUES ('cpgcslng9nha3gufayjssi981jvsb9xb', 'NjIxNDJhZDI5ZDJmYWM2NTIzY2M4MzhjYzZmMTdlMTVkZWY4ZTliNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJ1c2VyX2lkIjoxLCJfYXV0aF91c2VyX2hhc2giOiJjMmYzZTRhMjgwYmIxYjg0YzFiYjM3NTgzZmZmMzZiZWNjZjNjZTNiIiwidXNlcm5hbWUiOiJhZG1pbiJ9', '2017-12-20 22:25:14.475940');
INSERT INTO `django_session` VALUES ('cxe9x1kl2zplhq70l39kyiev33l77byx', 'ODgzMDViYTA4YTgxZmJkNWM2Yjk4ODQxNTNmYmNhOWRiNTIwMWNkODp7fQ==', '2017-12-18 07:00:40.961352');
INSERT INTO `django_session` VALUES ('ioeg5uwhhdmv1eapouwtcvh9ktyz51t7', 'Mzc1OTg4ZmNiODg1YTE3ZGEwYzcyZWNkNDUwZWYwODIxNmY2NWJmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzJmM2U0YTI4MGJiMWI4NGMxYmIzNzU4M2ZmZjM2YmVjY2YzY2UzYiIsInVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsInVzZXJfaWQiOjF9', '2018-02-20 02:29:25.098817');
INSERT INTO `django_session` VALUES ('iu4t39xjpsop1rpqyp0dzx32pbfuzx6c', 'ODgzMDViYTA4YTgxZmJkNWM2Yjk4ODQxNTNmYmNhOWRiNTIwMWNkODp7fQ==', '2017-12-18 07:02:03.804857');
INSERT INTO `django_session` VALUES ('jd0hj9ivo3dojiwy7fl9jhf9mrtw42e8', 'ODgzMDViYTA4YTgxZmJkNWM2Yjk4ODQxNTNmYmNhOWRiNTIwMWNkODp7fQ==', '2017-12-18 06:59:16.659295');
INSERT INTO `django_session` VALUES ('o7njdnhidznpjl4tdmt12cxfdrqp0nh8', 'ODFmYTQwODgzNTJiYTc3Y2VjNmIwYzlmNmRkZjI4MzEzNTkwODY2ZTp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsInVzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6ImMyZjNlNGEyODBiYjFiODRjMWJiMzc1ODNmZmYzNmJlY2NmM2NlM2IiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-01-31 07:07:02.638725');
INSERT INTO `django_session` VALUES ('pzkmk1tit3to9wogg3sbuyapaziisykf', 'YWVkZjM4ZWQ4N2Q0MDI1MjQxYTk3MzJjYjBmMjhkN2U1YWZlOGQ0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImMyZjNlNGEyODBiYjFiODRjMWJiMzc1ODNmZmYzNmJlY2NmM2NlM2IiLCJ1c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsInVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-02-09 07:02:18.257240');

-- ----------------------------
-- Table structure for soal_jawaban
-- ----------------------------
DROP TABLE IF EXISTS `soal_jawaban`;
CREATE TABLE `soal_jawaban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_jawaban` varchar(255) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `jawaban_benar` tinyint(1) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `user_insert` varchar(255) DEFAULT NULL,
  `user_update` varchar(255) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  `insert_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `soal_jawaban_soal_id_32dd1010_fk_soal_soal_id` (`soal_id`),
  CONSTRAINT `soal_jawaban_soal_id_32dd1010_fk_soal_soal_id` FOREIGN KEY (`soal_id`) REFERENCES `soal_soal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of soal_jawaban
-- ----------------------------

-- ----------------------------
-- Table structure for soal_kategori_soal
-- ----------------------------
DROP TABLE IF EXISTS `soal_kategori_soal`;
CREATE TABLE `soal_kategori_soal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `soal_kategori_soal_mata_kuliah_id_72b78007_fk_soal_mata` (`mata_kuliah_id`),
  CONSTRAINT `soal_kategori_soal_mata_kuliah_id_72b78007_fk_soal_mata` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `soal_mata_kuliah` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of soal_kategori_soal
-- ----------------------------
INSERT INTO `soal_kategori_soal` VALUES ('27', 'List, Dictionary, dan sebagainya', '3');

-- ----------------------------
-- Table structure for soal_mata_kuliah
-- ----------------------------
DROP TABLE IF EXISTS `soal_mata_kuliah`;
CREATE TABLE `soal_mata_kuliah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `mata_kuliah` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of soal_mata_kuliah
-- ----------------------------
INSERT INTO `soal_mata_kuliah` VALUES ('2', 'MK01', 'Basis Data Lanjut');
INSERT INTO `soal_mata_kuliah` VALUES ('3', 'MK02', 'Struktur Data');
INSERT INTO `soal_mata_kuliah` VALUES ('4', 'MK03', 'Pemrograman Visual');

-- ----------------------------
-- Table structure for soal_penginput_soal
-- ----------------------------
DROP TABLE IF EXISTS `soal_penginput_soal`;
CREATE TABLE `soal_penginput_soal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of soal_penginput_soal
-- ----------------------------

-- ----------------------------
-- Table structure for soal_soal
-- ----------------------------
DROP TABLE IF EXISTS `soal_soal`;
CREATE TABLE `soal_soal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sifat_soal` smallint(6) NOT NULL,
  `tipe_soal` smallint(6) NOT NULL,
  `text_bantuan` varchar(255) NOT NULL,
  `text_soal` longtext NOT NULL,
  `is_soal_autoescape` tinyint(1) NOT NULL,
  `is_jawaban_autoescape` tinyint(1) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `suara` varchar(100) NOT NULL,
  `kategori_soal_id` int(11) NOT NULL,
  `grup_id` int(11) DEFAULT NULL,
  `user_insert` varchar(255) DEFAULT NULL,
  `user_update` varchar(255) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  `insert_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `soal_soal_kategori_soal_id_5b8c8ff8_fk_soal_kategori_soal_id` (`kategori_soal_id`),
  CONSTRAINT `soal_soal_kategori_soal_id_5b8c8ff8_fk_soal_kategori_soal_id` FOREIGN KEY (`kategori_soal_id`) REFERENCES `soal_kategori_soal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of soal_soal
-- ----------------------------

-- ----------------------------
-- Table structure for soal_soal_grup
-- ----------------------------
DROP TABLE IF EXISTS `soal_soal_grup`;
CREATE TABLE `soal_soal_grup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `text_petunjuk` varchar(255) NOT NULL,
  `text_soal_grup` varchar(255) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `suara` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of soal_soal_grup
-- ----------------------------
INSERT INTO `soal_soal_grup` VALUES ('1', 'Grup 1', 'aa', 'bb', '', '');

-- ----------------------------
-- Table structure for ujian_data_test
-- ----------------------------
DROP TABLE IF EXISTS `ujian_data_test`;
CREATE TABLE `ujian_data_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `waktu` datetime(6) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `peserta_id` int(11) NOT NULL,
  `jawaban_id` int(11) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ujian_datatest_periode_id_4fbd2b1f_fk_ujian_periode_id` (`periode_id`),
  KEY `ujian_datatest_jawaban_id_5af28642_fk_soal_jawaban_id` (`jawaban_id`),
  KEY `ujian_data_test_peserta_id_01985e48_fk_ujian_peserta_id` (`peserta_id`),
  KEY `ujian_data_test_mata_kuliah_id_2db6a3be_fk_soal_mata_kuliah_id` (`mata_kuliah_id`),
  CONSTRAINT `ujian_data_test_mata_kuliah_id_2db6a3be_fk_soal_mata_kuliah_id` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `soal_mata_kuliah` (`id`),
  CONSTRAINT `ujian_data_test_peserta_id_01985e48_fk_ujian_peserta_id` FOREIGN KEY (`peserta_id`) REFERENCES `ujian_peserta` (`id`),
  CONSTRAINT `ujian_datatest_jawaban_id_5af28642_fk_soal_jawaban_id` FOREIGN KEY (`jawaban_id`) REFERENCES `soal_jawaban` (`id`),
  CONSTRAINT `ujian_datatest_periode_id_4fbd2b1f_fk_ujian_periode_id` FOREIGN KEY (`periode_id`) REFERENCES `ujian_periode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ujian_data_test
-- ----------------------------

-- ----------------------------
-- Table structure for ujian_periode
-- ----------------------------
DROP TABLE IF EXISTS `ujian_periode`;
CREATE TABLE `ujian_periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `pic` varchar(100) NOT NULL,
  `catatan` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ujian_periode
-- ----------------------------
INSERT INTO `ujian_periode` VALUES ('1', 'PE01', 'Semester 1 2017', '2017-12-11', '2017-12-31', 'Muh. Ridlo', '');

-- ----------------------------
-- Table structure for ujian_peserta
-- ----------------------------
DROP TABLE IF EXISTS `ujian_peserta`;
CREATE TABLE `ujian_peserta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `program_studi` varchar(255) NOT NULL,
  `uniid_id` int(11) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ujian_peserta_uniid_id_0636d5e2_fk_auth_user_id` (`uniid_id`),
  CONSTRAINT `ujian_peserta_uniid_id_0636d5e2_fk_auth_user_id` FOREIGN KEY (`uniid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ujian_peserta
-- ----------------------------
INSERT INTO `ujian_peserta` VALUES ('6', 'M3108100', 'Ginus Pandhu Setyawan', 'Teknik Informatika', '2', '2');
INSERT INTO `ujian_peserta` VALUES ('7', 'M3108100', 'Ginus Pandhu Setyawan', 'Teknik Informatika', '2', '3');
INSERT INTO `ujian_peserta` VALUES ('8', 'M3108100', 'Ginus Pandhu Setyawan', 'Teknik Informatika', '2', '4');
INSERT INTO `ujian_peserta` VALUES ('9', 'M3108200', 'Eka Saputra Aji', 'Teknik Informatika', '3', '2');
INSERT INTO `ujian_peserta` VALUES ('83', 'K100170001', 'NUR LAELA', 'TEKNIK MESIN', '102', '2');
INSERT INTO `ujian_peserta` VALUES ('84', 'K100170002', 'ERRY RIZKITA RINI', 'TEKNIK MESIN', '103', '2');
INSERT INTO `ujian_peserta` VALUES ('85', 'D200170001', 'AFIF BASUDEWA', 'TEKNIK MESIN', '104', '2');
INSERT INTO `ujian_peserta` VALUES ('86', 'A510170001', 'AISYAH CAHYA KARTIKA', 'TEKNIK MESIN', '105', '2');
INSERT INTO `ujian_peserta` VALUES ('87', 'C100170001', 'FAHIRA SALSABILA', 'TEKNIK MESIN', '106', '2');
INSERT INTO `ujian_peserta` VALUES ('88', 'A410170002', 'AMELIA RIZKI PURWANTI', 'TEKNIK MESIN', '107', '2');
INSERT INTO `ujian_peserta` VALUES ('89', 'B200174001', 'NIKMAR\'ATI KHOIRIAH', 'TEKNIK MESIN', '108', '2');
INSERT INTO `ujian_peserta` VALUES ('90', 'D500170001', 'REVITA MULFI MEFIANA', 'TEKNIK MESIN', '109', '2');
INSERT INTO `ujian_peserta` VALUES ('91', 'B200170002', 'ROSITA INDRIANI', 'TEKNIK MESIN', '110', '2');
INSERT INTO `ujian_peserta` VALUES ('92', 'B100170002', 'RIKA FITRIA BHARAWATI', 'TEKNIK MESIN', '111', '2');
INSERT INTO `ujian_peserta` VALUES ('93', 'A510170002', 'OKNIA NOVITA SARI', 'TEKNIK MESIN', '112', '2');
INSERT INTO `ujian_peserta` VALUES ('94', 'J210170001', 'WIDYA PUTRI RACHMAWATI', 'TEKNIK MESIN', '113', '2');
INSERT INTO `ujian_peserta` VALUES ('95', 'K100170003', 'NUR AMALIA MAHMUDA', 'TEKNIK MESIN', '114', '2');
INSERT INTO `ujian_peserta` VALUES ('96', 'D100170001', 'SATRIO ADHE PUTRA', 'TEKNIK MESIN', '115', '2');
INSERT INTO `ujian_peserta` VALUES ('97', 'J310170003', 'DESSY AYU WANDIRA', 'TEKNIK MESIN', '116', '2');
INSERT INTO `ujian_peserta` VALUES ('98', 'K100170004', 'SASQIA', 'TEKNIK MESIN', '117', '2');
INSERT INTO `ujian_peserta` VALUES ('99', 'A210170001', 'DEVY AYUNINGTYAS', 'TEKNIK MESIN', '118', '2');
INSERT INTO `ujian_peserta` VALUES ('100', 'F100170003', 'XENA AYUNDA BUCIMINALDA', 'TEKNIK MESIN', '119', '2');
INSERT INTO `ujian_peserta` VALUES ('101', 'C100170001', 'FAHIRA SALSABILA', 'TEKNIK MESIN', '106', '3');
INSERT INTO `ujian_peserta` VALUES ('102', 'A410170002', 'AMELIA RIZKI PURWANTI', 'TEKNIK MESIN', '107', '3');
INSERT INTO `ujian_peserta` VALUES ('103', 'B200174001', 'NIKMAR\'ATI KHOIRIAH', 'TEKNIK MESIN', '108', '3');
INSERT INTO `ujian_peserta` VALUES ('104', 'D500170001', 'REVITA MULFI MEFIANA', 'TEKNIK MESIN', '109', '3');
INSERT INTO `ujian_peserta` VALUES ('105', 'B200170002', 'ROSITA INDRIANI', 'TEKNIK MESIN', '110', '3');
INSERT INTO `ujian_peserta` VALUES ('106', 'B100170002', 'RIKA FITRIA BHARAWATI', 'TEKNIK MESIN', '111', '4');
INSERT INTO `ujian_peserta` VALUES ('107', 'A510170002', 'OKNIA NOVITA SARI', 'TEKNIK MESIN', '112', '4');
INSERT INTO `ujian_peserta` VALUES ('108', 'J210170001', 'WIDYA PUTRI RACHMAWATI', 'TEKNIK MESIN', '113', '4');
INSERT INTO `ujian_peserta` VALUES ('109', 'K100170003', 'NUR AMALIA MAHMUDA', 'TEKNIK MESIN', '114', '4');
INSERT INTO `ujian_peserta` VALUES ('110', 'D100170001', 'SATRIO ADHE PUTRA', 'TEKNIK MESIN', '115', '4');
INSERT INTO `ujian_peserta` VALUES ('111', 'J310170003', 'DESSY AYU WANDIRA', 'TEKNIK MESIN', '116', '4');
INSERT INTO `ujian_peserta` VALUES ('112', 'K100170004', 'SASQIA', 'TEKNIK MESIN', '117', '4');
INSERT INTO `ujian_peserta` VALUES ('113', 'A210170001', 'DEVY AYUNINGTYAS', 'TEKNIK MESIN', '118', '4');
INSERT INTO `ujian_peserta` VALUES ('114', 'F100170003', 'XENA AYUNDA BUCIMINALDA', 'TEKNIK MESIN', '119', '4');
INSERT INTO `ujian_peserta` VALUES ('115', 'K100170001', 'NUR LAELA', 'TEKNIK MESIN', '102', '3');
INSERT INTO `ujian_peserta` VALUES ('116', 'K100170002', 'ERRY RIZKITA RINI', 'TEKNIK MESIN', '103', '3');
INSERT INTO `ujian_peserta` VALUES ('117', 'D200170001', 'AFIF BASUDEWA', 'TEKNIK MESIN', '104', '3');
INSERT INTO `ujian_peserta` VALUES ('118', 'A510170001', 'AISYAH CAHYA KARTIKA', 'TEKNIK MESIN', '105', '3');
INSERT INTO `ujian_peserta` VALUES ('119', 'B100170002', 'RIKA FITRIA BHARAWATI', 'TEKNIK MESIN', '111', '3');
INSERT INTO `ujian_peserta` VALUES ('120', 'A510170002', 'OKNIA NOVITA SARI', 'TEKNIK MESIN', '112', '3');
INSERT INTO `ujian_peserta` VALUES ('121', 'J210170001', 'WIDYA PUTRI RACHMAWATI', 'TEKNIK MESIN', '113', '3');
INSERT INTO `ujian_peserta` VALUES ('122', 'K100170003', 'NUR AMALIA MAHMUDA', 'TEKNIK MESIN', '114', '3');
INSERT INTO `ujian_peserta` VALUES ('123', 'D100170001', 'SATRIO ADHE PUTRA', 'TEKNIK MESIN', '115', '3');
INSERT INTO `ujian_peserta` VALUES ('124', 'J310170003', 'DESSY AYU WANDIRA', 'TEKNIK MESIN', '116', '3');
INSERT INTO `ujian_peserta` VALUES ('125', 'K100170004', 'SASQIA', 'TEKNIK MESIN', '117', '3');
INSERT INTO `ujian_peserta` VALUES ('126', 'A210170001', 'DEVY AYUNINGTYAS', 'TEKNIK MESIN', '118', '3');
INSERT INTO `ujian_peserta` VALUES ('127', 'F100170003', 'XENA AYUNDA BUCIMINALDA', 'TEKNIK MESIN', '119', '3');

-- ----------------------------
-- Table structure for ujian_status_peserta
-- ----------------------------
DROP TABLE IF EXISTS `ujian_status_peserta`;
CREATE TABLE `ujian_status_peserta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mata_kuliah_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `nilai` int(11) DEFAULT NULL,
  `mulai` datetime(6) DEFAULT NULL,
  `selesai` datetime(6) DEFAULT NULL,
  `nim` varchar(255) NOT NULL,
  `peserta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ujian_status_peserta_mata_kuliah_id_67e19dff` (`mata_kuliah_id`),
  KEY `ujian_status_peserta_peserta_id_30e4d0e9_fk_ujian_peserta_id` (`peserta_id`),
  CONSTRAINT `ujian_status_peserta_mata_kuliah_id_67e19dff_fk_soal_mata` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `soal_mata_kuliah` (`id`),
  CONSTRAINT `ujian_status_peserta_peserta_id_30e4d0e9_fk_ujian_peserta_id` FOREIGN KEY (`peserta_id`) REFERENCES `ujian_peserta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ujian_status_peserta
-- ----------------------------
INSERT INTO `ujian_status_peserta` VALUES ('38', '4', '0', '0', '2018-01-15 13:23:02.920963', '2018-01-15 14:13:49.008242', 'M3108100', '8');
INSERT INTO `ujian_status_peserta` VALUES ('41', '2', '0', '3', '2018-01-16 08:29:27.136025', '2018-01-16 08:29:32.666027', 'M3108100', '6');
