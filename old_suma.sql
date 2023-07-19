/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : old_suma

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 19/07/2023 08:57:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acciones
-- ----------------------------
DROP TABLE IF EXISTS `acciones`;
CREATE TABLE `acciones`  (
  `acci_id` int NOT NULL AUTO_INCREMENT,
  `acci_nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`acci_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acciones
-- ----------------------------
INSERT INTO `acciones` VALUES (1, 'TRAMITAR');
INSERT INTO `acciones` VALUES (2, 'OPINION');
INSERT INTO `acciones` VALUES (3, 'INFORME');
INSERT INTO `acciones` VALUES (4, 'CONOCIMIENTO Y ACCIONES');
INSERT INTO `acciones` VALUES (5, 'SEGUN LO CORDINADO');
INSERT INTO `acciones` VALUES (6, 'COORDINAR CON EL AREA USUARIIA');
INSERT INTO `acciones` VALUES (7, 'ARCHIVAR');
INSERT INTO `acciones` VALUES (8, 'SOLUCION DANDO ACTA POR ESCRITO');
INSERT INTO `acciones` VALUES (9, 'ATENCION DE ACUERDO A LO SOLICITADO');
INSERT INTO `acciones` VALUES (10, 'HABLAR CONMIGO');
INSERT INTO `acciones` VALUES (11, 'SOLICITAR ANTECEDENTES');
INSERT INTO `acciones` VALUES (12, 'PRESENTAR RESPUESTA');
INSERT INTO `acciones` VALUES (13, 'PROYECTAR RESOLUCION');
INSERT INTO `acciones` VALUES (14, 'ACCION INMEDIATA');
INSERT INTO `acciones` VALUES (15, 'EVALUAR Y RECOMENDAR');
INSERT INTO `acciones` VALUES (16, 'AGREGAR ANTECEDENTES');
INSERT INTO `acciones` VALUES (17, 'PROYECTAR BASES');
INSERT INTO `acciones` VALUES (18, 'VARIFICAR STOCK Y ANTENDER');
INSERT INTO `acciones` VALUES (19, 'CONOCIMIENTOS Y ARCHIVP');
INSERT INTO `acciones` VALUES (20, 'AUTORIZADO');

-- ----------------------------
-- Table structure for captcha
-- ----------------------------
DROP TABLE IF EXISTS `captcha`;
CREATE TABLE `captcha`  (
  `captcha_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `captcha_time` int UNSIGNED NOT NULL,
  `ip_address` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `word` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`captcha_id`) USING BTREE,
  INDEX `word`(`word`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 987 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of captcha
-- ----------------------------
INSERT INTO `captcha` VALUES (956, 1685718588, '192.168.100.105', 'AAQN');
INSERT INTO `captcha` VALUES (957, 1685999111, '192.168.100.69', 'F57H');
INSERT INTO `captcha` VALUES (958, 1686087773, '192.168.100.107', 'e63b');
INSERT INTO `captcha` VALUES (959, 1686169126, '192.168.100.108', 'UtQC');
INSERT INTO `captcha` VALUES (960, 1686169401, '192.168.100.232', 'MMid');
INSERT INTO `captcha` VALUES (961, 1686169623, '192.168.100.69', 'sGEb');
INSERT INTO `captcha` VALUES (962, 1686245621, '192.168.100.108', 'PyJw');
INSERT INTO `captcha` VALUES (963, 1686256015, '192.168.100.31', 'Z1Qm');
INSERT INTO `captcha` VALUES (964, 1686261191, '192.168.100.69', 'WuEL');
INSERT INTO `captcha` VALUES (965, 1686586199, '192.168.100.108', 'BQhN');
INSERT INTO `captcha` VALUES (966, 1686586218, '192.168.100.108', 'SYg7');
INSERT INTO `captcha` VALUES (967, 1686847195, '192.168.100.108', 'QeVe');
INSERT INTO `captcha` VALUES (968, 1686858702, '192.168.100.24', 'wG24');
INSERT INTO `captcha` VALUES (969, 1687281964, '192.168.100.108', 'ngbV');
INSERT INTO `captcha` VALUES (970, 1687301057, '192.168.100.108', 'j7CK');
INSERT INTO `captcha` VALUES (971, 1687301068, '192.168.100.108', 'kiE6');
INSERT INTO `captcha` VALUES (972, 1687368322, '192.168.100.108', '2QMM');
INSERT INTO `captcha` VALUES (973, 1687445268, '192.168.100.24', 'LDDa');
INSERT INTO `captcha` VALUES (974, 1687995362, '192.168.255.77', 'XM2b');
INSERT INTO `captcha` VALUES (975, 1688147582, '192.168.100.108', 'BNiO');
INSERT INTO `captcha` VALUES (976, 1688147588, '192.168.100.108', '00S4');
INSERT INTO `captcha` VALUES (977, 1688267293, '192.168.15.240', 'T5yq');
INSERT INTO `captcha` VALUES (978, 1688267323, '192.168.15.240', 'WK5t');
INSERT INTO `captcha` VALUES (979, 1688393216, '192.168.100.71', 'zh1w');
INSERT INTO `captcha` VALUES (980, 1688394283, '192.168.100.24', '0KUp');
INSERT INTO `captcha` VALUES (981, 1688394886, '192.168.100.69', '6bY1');
INSERT INTO `captcha` VALUES (982, 1688395183, '192.168.100.65', 'jyCp');
INSERT INTO `captcha` VALUES (983, 1689181114, '192.168.100.108', 'Spii');
INSERT INTO `captcha` VALUES (984, 1689181121, '192.168.100.108', 'WQ6F');
INSERT INTO `captcha` VALUES (985, 1689615486, '192.168.100.69', '5D9G');
INSERT INTO `captcha` VALUES (986, 1689615755, '192.168.100.69', 'MnV2');

-- ----------------------------
-- Table structure for configuracion
-- ----------------------------
DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion`  (
  `conf_id` int NOT NULL AUTO_INCREMENT,
  `conf_ruc` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `conf_siglas` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `conf_nombres` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `conf_direccion` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `conf_email` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `conf_telefono` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `conf_periodo` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `conf_logo` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `conf_enviaremail` enum('SI','NO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'NO',
  `conf_smtp` enum('SI','NO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NO',
  `conf_email_host` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `conf_email_user` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `conf_email_password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `conf_email_puerto` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '587',
  `conf_email_body` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`conf_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of configuracion
-- ----------------------------
INSERT INTO `configuracion` VALUES (1, '20522025071', 'SG', 'SUMMA GOLD', 'Av. El Derby 254 - Santiago de Surco ', '', '(511) 618-1555', '2022', NULL, 'SI', 'SI', 'smtp.office365.com', 'std@summagold.com', 'Summagold.2020', '587', '<div style=\"border: solid 1px; padding: 1em; width: 80%;\">\n<div style=\"display: inline-block; width: 40%;\">\n<div>\n<p style=\"display: inline-block; width: 40%;\"><strong>Expediente:</strong></p>\n<p style=\"display: inline-block; width: 55%; height: 40px;\">[N_EXPEDIENTE]</p>\n</div>\n<div>\n<p style=\"display: inline-block; width: 40%;\"><strong>Remitente:</strong></p>\n<p style=\"display: inline-block; width: 55%; height: 40px;\">[REMITENTE]</p>\n</div>\n<div>\n<p style=\"display: inline-block; width: 40%;\"><strong>Periodo:</strong></p>\n<p style=\"display: inline-block; width: 55%; height: 40px;\">[PERIODO]</p>\n</div>\n</div>\n<div style=\"display: inline-block; width: 40%;\">\n<div>\n<p style=\"display: inline-block; width: 30%;\"><strong>Asunto:</strong></p>\n<p style=\"display: inline-block; width: 55%; height: 40px;\">[ASUNTO]</p>\n</div>\n<div>\n<p style=\"display: inline-block; width: 40%;\"><strong>Folios:</strong></p>\n<p style=\"display: inline-block; width: 55%; height: 40px;\">[FOLIO]</p>\n</div>\n<div>\n<p style=\"display: inline-block; width: 40%;\"><strong>Fecha:</strong></p>\n<p style=\"display: inline-block; width: 55%; height: 40px;\">[FECHA]</p>\n</div>\n</div>\n</div>\n<div>\n<div style=\"width: 80%;\">\n<p style=\"display: inline-block; width: 20%;\"><strong>Observacion:</strong></p>\n<p style=\"display: inline-block; width: 60%; border: solid 1px; height: 60px;\">[OBSERVACION]</p>\n</div>\n<div>&nbsp;</div>\n</div>\n<p>Para consultar su expediente haga click <a href=\"[BASE_URL]consultar/inicio\">aqui<a/></p>');

-- ----------------------------
-- Table structure for documento
-- ----------------------------
DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento`  (
  `docu_id` int NOT NULL AUTO_INCREMENT,
  `docu_nombre` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `docu_estado` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`docu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of documento
-- ----------------------------
INSERT INTO `documento` VALUES (94, 'FACTURA', 0);
INSERT INTO `documento` VALUES (95, 'NOTA DE CREDITO', 0);
INSERT INTO `documento` VALUES (96, 'NOTA DE DEBITO', 0);
INSERT INTO `documento` VALUES (97, 'RECIBO POR HONORARIO', 0);
INSERT INTO `documento` VALUES (98, 'RECIBO DE SERVICIOS PÚBLICOS', 0);
INSERT INTO `documento` VALUES (99, 'GUIA DE REMISIÓN', 0);
INSERT INTO `documento` VALUES (100, 'OFICIO', 1);
INSERT INTO `documento` VALUES (101, 'CONTRATO', 1);
INSERT INTO `documento` VALUES (102, 'CARTA', 1);
INSERT INTO `documento` VALUES (103, 'INFORME', 1);
INSERT INTO `documento` VALUES (104, 'RESOLUCION', 1);
INSERT INTO `documento` VALUES (105, 'NOTIFICACIÓN', 1);
INSERT INTO `documento` VALUES (108, 'FORMULARIO ÚNICO DE TRÁMITE - FUT', 1);
INSERT INTO `documento` VALUES (109, 'ESCRITO', 1);
INSERT INTO `documento` VALUES (110, 'ACTA DE NOTIFICACIÓN PERSONAL', 1);
INSERT INTO `documento` VALUES (111, 'OTROS', 1);
INSERT INTO `documento` VALUES (112, 'COMPROBANTES DE PAGO', 1);

-- ----------------------------
-- Table structure for entidad
-- ----------------------------
DROP TABLE IF EXISTS `entidad`;
CREATE TABLE `entidad`  (
  `enti_id` int NOT NULL AUTO_INCREMENT,
  `enti_nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `enti_tipo` enum('PERSONA','EMPRESA') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `enti_ruc` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `enti_siglas` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `enti_email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`enti_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of entidad
-- ----------------------------
INSERT INTO `entidad` VALUES (48, 'Remitente Anonimo', 'PERSONA', '', 'RA', '');
INSERT INTO `entidad` VALUES (50, 'GrupoSistemas', 'EMPRESA', '20447799331', 'GrupoSistemas', 'edwin@gruposistemas.com');
INSERT INTO `entidad` VALUES (51, 'MINISTERIO DE ENERGIA Y MINAS', 'EMPRESA', '20131368829', 'MEM', '');
INSERT INTO `entidad` VALUES (52, 'M. ELEMC', '', '', '', '');
INSERT INTO `entidad` VALUES (53, 'M. ELEMC', '', '', '', '');
INSERT INTO `entidad` VALUES (54, 'M. ELECTRO S.A.', 'EMPRESA', '20100054001', 'ELECTROSA', 'melectro@melectro.com.pe');
INSERT INTO `entidad` VALUES (55, 'Deloitte & Touche SRL', 'EMPRESA', '20106910872', 'Deloitte', '');
INSERT INTO `entidad` VALUES (56, 'SERVICIOS GENERALES RIO & ALFA CONSTRUCCIONES SAC', 'EMPRESA', '20601844355', '-', '');
INSERT INTO `entidad` VALUES (57, 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', 'EMPRESA', '20521286769', 'OEFA', '');
INSERT INTO `entidad` VALUES (58, 'VARIOS', 'EMPRESA', '00000000000', 'VARIOS', '');
INSERT INTO `entidad` VALUES (59, 'MINISTERIO DEL AMBIENTE', '', '20492966658', 'MAMB', '');
INSERT INTO `entidad` VALUES (60, 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', '20112919377', 'INGEMMET', '');
INSERT INTO `entidad` VALUES (61, 'AUTORIDAD NACIONAL DEL AGUA', 'EMPRESA', '20520711865', 'ANA', '');
INSERT INTO `entidad` VALUES (62, 'ORGANISMO SUPERVISOR DE LA INVERSION EN ENERGIA Y ', 'EMPRESA', '20376082114', 'OSINERGMIN', '');
INSERT INTO `entidad` VALUES (63, 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', 'EMPRESA', '20551964940', 'SUCAMEC', '');
INSERT INTO `entidad` VALUES (64, 'MINISTERIO DE DESARROLLO AGRARIO Y RIEGO', 'EMPRESA', '20131372931', 'MIDAGRI', '');
INSERT INTO `entidad` VALUES (65, 'SUPERINTENDENCIA NACIONAL DE FISCALIZACION LABORAL', 'EMPRESA', '20555195444', 'SUNAFIL', '');
INSERT INTO `entidad` VALUES (66, 'SERVICIO NACIONAL DE CERTIFICACION AMBIENTAL PARA ', 'EMPRESA', '20556097055', 'SENACE', '');
INSERT INTO `entidad` VALUES (67, 'CORPORACION AGUILAS DEL SOL SAC', 'EMPRESA', '20477208348', 'ADS', '');
INSERT INTO `entidad` VALUES (68, 'ANIBAL QUIROGA LEON', 'PERSONA', '10078648398', 'AQL', 'aquiroga@aqlabogados.com.pe');
INSERT INTO `entidad` VALUES (69, 'PODER JUDICIAL DEL PERU', 'EMPRESA', 'JPL Surco-S', '', '');
INSERT INTO `entidad` VALUES (70, 'YARA PERU S.R.L.', 'EMPRESA', '20100193117', '', '');
INSERT INTO `entidad` VALUES (71, 'SERVICIO NACIONAL DE CERTIFICACION AMBIENTAL PARA ', 'EMPRESA', '20556097055', 'SENACE', '');
INSERT INTO `entidad` VALUES (72, 'MINIST.DE TRABAJO Y PROMOCION DEL EMPLEO', 'EMPRESA', '20131023414', '', '');
INSERT INTO `entidad` VALUES (73, 'GLOBALTEK PERU S.A.C', 'EMPRESA', '20508476915', '', '');
INSERT INTO `entidad` VALUES (74, 'BANCO PICHINCHA', '', '20100105862', '', '');
INSERT INTO `entidad` VALUES (75, 'SCOTIABANK PERU SAA', 'EMPRESA', '20100043140', 'SCOTIABANK', '');
INSERT INTO `entidad` VALUES (76, 'CAMARA DE COMERCIO DE LIMA', '', '20101266819', 'CAMARA DE COMERCIO - LIMA', '');
INSERT INTO `entidad` VALUES (77, 'CAMARA DE COMERCIO DE LIMA', '', '20101266819', 'CAMARA DE COMERCIO - LIMA', '');
INSERT INTO `entidad` VALUES (78, 'BANCO INTERAMERICANO DE FINANZAS', '', '20101036813', 'BANBIF', '');
INSERT INTO `entidad` VALUES (79, 'UNTA DE PROPIETARIOS LIMA CENTRAL TOWER', '', '20601928974', '', '');
INSERT INTO `entidad` VALUES (80, 'AVLA PERU COMPAÑIA DE SEGUROS S.A.', '', '20600825187', '', '');
INSERT INTO `entidad` VALUES (81, 'MERCANTIL SA', 'EMPRESA', '20100312736', '', '');
INSERT INTO `entidad` VALUES (82, 'QUIMICOS GOICOCHEA S.A.C.', '', ' 2021104035', '', '');
INSERT INTO `entidad` VALUES (83, 'MINISTERIO PUBLICO', '', '20131370301', 'FISCALIA DE LA NACION', '');
INSERT INTO `entidad` VALUES (84, 'MYNARSKI INTERNATIONAL VALUATION SAC', '', '20555884142', '', '');
INSERT INTO `entidad` VALUES (85, 'SOCIACION PERUANA DE CONCILIACION Y ARBITRAJE -ASP', '', '20474022472', 'ASPECOAR', '');
INSERT INTO `entidad` VALUES (86, 'BANCO DE CREDITO DEL PERU', 'EMPRESA', '20100047218', 'BCP', '');
INSERT INTO `entidad` VALUES (87, 'SUPERINTENDENCIA NACIONAL DE ADUANAS Y DE ADMINIST', '', '20131312955', 'SUNAT', '');
INSERT INTO `entidad` VALUES (88, 'SERVICIO DE ADMINISTRACION TRIBUTARIA DE LIMA', 'EMPRESA', '20337101276', 'SAT', '');
INSERT INTO `entidad` VALUES (89, 'MINISTERIO DE CULTURA', 'EMPRESA', '20537630222', 'MC', '');
INSERT INTO `entidad` VALUES (90, 'BANCO BBVA PERU', '', '20100130204', 'BBVA', '');

-- ----------------------------
-- Table structure for expediente
-- ----------------------------
DROP TABLE IF EXISTS `expediente`;
CREATE TABLE `expediente`  (
  `expe_id` int NOT NULL AUTO_INCREMENT,
  `expe_codigo` int NULL DEFAULT NULL,
  `expe_docu_id` int NULL DEFAULT NULL,
  `expe_numero` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expe_asunto` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expe_remitente` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expe_email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expe_folio` int NULL DEFAULT NULL,
  `expe_archivo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expe_observacion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `expe_fecharec` datetime(0) NULL DEFAULT NULL,
  `expe_fechareg` datetime(0) NULL DEFAULT NULL,
  `expe_tipo` enum('EXTERNO','INTERNO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expe_periodo` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `expe_procesado` enum('SI','NO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NO',
  `expe_ofic_id` int NULL DEFAULT NULL,
  `expe_user_id` int NULL DEFAULT NULL,
  `expe_proc_id` int NULL DEFAULT NULL,
  `expe_enti_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`expe_id`) USING BTREE,
  INDEX `expe_docu_id`(`expe_docu_id`) USING BTREE,
  INDEX `expe_ofic_id`(`expe_ofic_id`) USING BTREE,
  INDEX `expe_user_id`(`expe_user_id`) USING BTREE,
  INDEX `expe_proc_id`(`expe_proc_id`) USING BTREE,
  INDEX `expe_enti_id`(`expe_enti_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 429 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of expediente
-- ----------------------------
INSERT INTO `expediente` VALUES (1, 1, 100, '321-2021-MINEM-DGAAM', 'COMUNICA INTERPOSICIÓN DE RECURSO IMPUGNATIVO', 'DGAAM', '', 6, '2021/4/29/001_mem_oficio-321-2021-mimnem-dgaam-140421pdf-090335.pdf', 'Referencia:\r\na) Escrito N° 3010282 (08.01.2020)\r\na) Escrito N° 3130254 (16.03.2021)\r\n', '2021-04-15 09:02:44', '2021-04-15 09:02:44', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (2, 183, 100, '351-2021-MINEM-DGAAM', 'RECURSO DE RECONSIDERACION INTERPUESTO CONTRA LA RD N° 042-2021-MINEM-DGAAM', 'DGAAM', '', 4, '2021/4/27/002_mem_oficio-351-2021-minem-dgaam-20042021pdf-170420.pdf', 'Referencia:\r\na) Escrito N° 3010282 (08.01.2020)\r\na) Escrito N° 3134755 (06.04.2021)', '2021-04-27 17:00:01', '2021-04-27 17:04:20', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (3, 3, 101, '', 'Contrato de Servicios', 'Deloitte & Touche SRL', '', 23, '2021/5/4/d8c9_deloitte-touche-srl_carta-compromiso-asesor-tributaria-reunion-fiscaliz-actualiz-290321pdf-152654.pdf', 'Recibido por Contabilidad: Erika Cruz', '2021-05-04 15:24:22', '2021-05-04 15:26:54', 'INTERNO', '2021', 'NO', 1, 61, NULL, 55);
INSERT INTO `expediente` VALUES (4, 4, 101, '', 'Adenda al Contrato de Arrendamiento de MyE', 'SERVICIOS GENERALES RIO & ALFA CONSTRUCCIONES SAC', '', 2, '2021/5/4/s11c4a1_servic-grles-rio-alfa-construcciones-sac_adenda-arrend-mye-plazo-010121-311221pdf-153232.pdf', 'Recibido por Pedro Puente', '2021-05-04 15:27:16', '2021-05-04 15:32:32', 'INTERNO', '2021', 'NO', 1, 61, NULL, 56);
INSERT INTO `expediente` VALUES (5, 5, 102, '', 'PRESENTACIÓN DE INFORMACIÓN COMPLEMENTARIA', 'DIRECCION DE SUPERVISION AMBIENTAL EN ENERGIA Y MINAS', '', 471, '2021/5/4/presentacion-informacion-complementaria-reunion-del-210421rd-009-2021-oefa-dsem-040521pdf-162339.pdf', 'Contiene Información Complementaria - Argumentos Técnicos - OBS ANA', '2021-05-04 16:12:00', '2021-05-04 16:23:39', 'INTERNO', '2021', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (6, 6, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/5/4/registro-sofya-04-05-2021pdf-164025.pdf', '03 registros', '2021-05-04 16:33:45', '2021-05-04 16:40:25', 'INTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (7, 7, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/5/7/registro-sofya-07-05-2021pdf-092408.pdf', 'Facturas Varias', '2021-05-07 09:17:12', '2021-05-07 09:24:08', 'INTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (8, 8, 102, '-', 'CAMBIO DE DOMICILIO LEGAL', 'MINISTERIO DE ENERGIA Y MINAS', '', 1, '2021/5/7/carta_mem-cambio-de-domicilio-legal-160421pdf-161957.pdf', 'Expediente: 3138500', '2021-05-07 16:12:19', '2021-05-07 16:19:57', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (9, 9, 102, '-', 'CAMBIO DE DOMICILIO LEGAL', 'MINISTERIO DEL AMBIENTE', '', 1, '2021/5/7/carta_mamb-cambio-de-domicilio-legal-160421pdf-162404.pdf', '2021023885', '2021-05-07 16:20:30', '2021-05-07 16:24:04', 'INTERNO', '2021', 'NO', 1, 61, NULL, 59);
INSERT INTO `expediente` VALUES (10, 10, 102, '-', 'CAMBIO DE DOMICILIO LEGAL', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1, '2021/5/7/carta_ingemmet-cambio-de-domicilio-legal-160421pdf-162837.pdf', 'Expediente: 0100156621T', '2021-05-07 16:24:16', '2021-05-07 16:28:37', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (11, 11, 102, '0', 'CAMBIO DE DOMICILIO LEGAL', 'AUTORIDAD NACIONAL DEL AGUA', '', 1, '2021/5/7/carta_ana-cambio-de-domicilio-legal-160421pdf-163116.pdf', 'CUT:  60061-2021', '2021-05-07 16:28:46', '2021-05-07 16:31:16', 'INTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (12, 12, 102, '-', 'CAMBIO DE DOMICILIO LEGAL', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 2, '2021/5/7/carta_oefa-cambio-de-domicilio-legal-160421pdf-163448.pdf', '2021-E01-035006\r\n19/04/2021   08:30:00\r\nRecepción: LGODINEZ', '2021-05-07 16:31:29', '2021-05-07 16:34:48', 'INTERNO', '2021', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (13, 13, 102, '-', 'CAMBIO DE DOMICILIO LEGAL', 'ORGANISMO SUPERVISOR DE LA INVERSION EN ENERGIA Y MINERIA', '', 2, '2021/5/7/carta_osinergmin-cambio-de-domicilio-legal-160421pdf-163818.pdf', 'Expediente: 2021 00084414\r\n19/04/2021   09:58', '2021-05-07 16:35:03', '2021-05-07 16:38:18', 'INTERNO', '2021', 'NO', 1, 61, NULL, 62);
INSERT INTO `expediente` VALUES (14, 14, 102, '-', 'CAMBIO DE DOMICILIO LEGAL', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS DE SEGURIDAD, ARMAS, MUNICIONES Y EXPLOSIVOS DE US', '', 1, '2021/5/7/carta_sucamec-cambio-de-domicilio-legal-160421pdf-164132.pdf', 'Expediente: 202100098706', '2021-05-07 16:38:47', '2021-05-07 16:41:32', 'INTERNO', '2021', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (15, 15, 102, '-', 'CAMBIO DE DOMICILIO LEGAL', 'MINISTERIO DE DESARROLLO AGRARIO Y RIEGO', '', 1, '2021/5/7/carta_midagri-cambio-de-domicilio-legal-190421pdf-164956.pdf', 'CUT: 12916-2021', '2021-05-07 16:48:47', '2021-05-07 16:49:56', 'INTERNO', '2021', 'NO', 1, 61, NULL, 64);
INSERT INTO `expediente` VALUES (16, 16, 102, '-', 'CAMBIO DE DOMICILIO LEGAL', 'SUPERINTENDENCIA NACIONAL DE FISCALIZACION LABORAL', '', 1, '2021/5/7/carta_sunafil-cambio-de-domicilio-legal-190421pdf-165203.pdf', 'HOJA DE RUTA: 00055350-2021', '2021-05-07 16:50:04', '2021-05-07 16:52:03', 'INTERNO', '2021', 'NO', 1, 61, NULL, 65);
INSERT INTO `expediente` VALUES (17, 17, 102, '-', 'CAMBIO DE DOMICILIO LEGAL', 'SERVICIO NACIONAL DE CERTIFICACION AMBIENTAL PARA LAS INVERSIONES SOSTENIBLES', '', 1, '2021/5/7/carta_senace-cambio-de-domicilio-legal-190421pdf-165418.pdf', 'Expediente: 01219-2021', '2021-05-07 16:52:13', '2021-05-07 16:54:18', 'INTERNO', '2021', 'NO', 1, 61, NULL, 66);
INSERT INTO `expediente` VALUES (18, 18, 101, '-', 'Adenda Contrato Seguridad y Vigilancia', 'CORPORACION AGUILAS DEL SOL SAC', '', 3, '2021/5/10/adenda-cont-segur-y-vigil-tarifario-28042021pdf-112734.pdf', 'Adjunta Carta de fecha 28/04/2021', '2021-05-10 11:23:20', '2021-05-10 11:27:34', 'INTERNO', '2021', 'NO', 1, 61, NULL, 67);
INSERT INTO `expediente` VALUES (19, 19, 102, '0078-2021-ANA-AAA.M', 'Notifica Informe Final de Instrucción', 'AUTORIDAD ADMINISTRATIVA DEL AGUA - MARAÑON', '', 10, NULL, NULL, '2021-05-10 12:28:20', '2021-05-10 12:32:51', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (20, 20, 102, '027-2021-AQL', 'Informe Legal Constitucional sobre Informe Técnico N°344-2021-ANA-DCREH', 'ANIBAL QUIROGA LEON', 'aquiroga@aqlabogados.com.pe', 60, '2021/5/10/abogados-aql_c-027-2021-aql-17032021pdf-152945.pdf', 'Informe Legal Constitucional sobre Informe Técnico N°344-2021-ANA-DCREH, emitido por la Dirección de Calidad y Evaluación de Recursos Hídricos de la Autoridad Nacional del Agua (ANA), mediante el cual, emite opinión no favorable al Plan Ambiental Detallado (PAD) de la unidad minera El Toro seguido por SUMMA GOLD CORPORATION S.A.C. ante la Dirección General de Asuntos Ambientales Mineros del Ministerio de Energía y Minas.', '2021-05-10 15:21:23', '2021-05-10 15:29:45', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 68);
INSERT INTO `expediente` VALUES (21, 21, 102, 'C-028-2021-AQL', 'Informe Legal Constitucional sobre el procedimiento de aprobación del Plan Ambiental Detallado', 'ANIBAL QUIROGA LEON', 'aquiroga@aqlabogados.com.pe', 65, '2021/5/10/abogados-aql_c-028-2021-aql-05042021pdf-153302.pdf', 'Informe Legal Constitucional sobre el procedimiento de aprobación del Plan Ambiental Detallado de la unidad minera El Toro seguido por SUMMA GOLD CORPORATION S.A.C. ante la Dirección General de Asuntos Ambientales Mineros del Ministerio de Energía y Minas.', '2021-05-10 15:30:07', '2021-05-10 15:33:02', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 68);
INSERT INTO `expediente` VALUES (22, 22, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/5/13/registro-sofya-13-05-2021pdf-172526.pdf', '06 Facturas', '2021-05-13 17:24:00', '2021-05-13 17:25:26', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (23, 23, 102, '-', 'MODIFICACION DEL CRONOGRAMA DEL PLAN DE MINADO APROBADO CON RESOLUCION N° 0017-2021-MINEM-DGM/V', 'MINISTERIO DE ENERGIA Y MINAS', '', 0, '2021/5/14/carta_mem-modificacion-cronograma-plan-minado-resolucion-17-2021-130521pdf-172813.pdf', 'Referencia: Informe N° 006-2021-MINEM-DGM-DTM/PM\r\nExpediente N° 3048828', '2021-05-14 17:20:17', '2021-05-14 17:28:13', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (24, 24, 102, '10-2021-SUNAFIL/ILM/SIAI', 'Procedimiento de Cumplimiento Laborales', 'SUPERINTENDENCIA NACIONAL DE FISCALIZACION LABORAL', '', 2, '2021/5/18/sunafil_carta-circular-n10-2021-sunafil-ilm-siai-05052021pdf-150933.pdf', '', '2021-05-18 14:36:02', '2021-05-18 15:09:33', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 65);
INSERT INTO `expediente` VALUES (25, 25, 104, '1171-2021-OEFA/ADFAI', 'REGULARIZAR COMPONENTES Y MODIFICACIONES PROYECTO EL TORO', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 69, '2021/5/18/rd-n-1171-2021-oefa-dfai-17052021-copiapdf-204317.pdf', 'EXPEDIENTE N° 667-2020-OEFA/DFAI-PAS\r\nInforme Final de Instrucción N° 689-2021-OEFA-DFAI-SFEM DEL 16.04.2021', '2021-05-18 20:33:23', '2021-05-18 20:43:17', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (26, 26, 103, '01916-2021-OEFA/DFAI-SSAG', 'Cálculo de multa por las infracciones contenidas en el expediente N° 0667-2020-OEFA/DFAI/PA3', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 25, '2021/5/19/informe-n-01916-2021-oefa-dfai-ssag-14052021pdf-085416.pdf', 'Anexo RD N° 1171-2021-OEFA-DFAI (17.05.2021)\r\nRecibido el 17/05/2021', '2021-05-19 08:48:43', '2021-05-19 08:54:16', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (27, 27, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/5/19/registro-sofya-19-05-2021pdf-103350.pdf', 'Registro de 06 facturas', '2021-05-19 10:32:07', '2021-05-19 10:33:50', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (28, 28, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/5/20/registro-sofya-20-05-2021pdf-165322.pdf', 'Registro de 08 facturas', '2021-05-20 16:51:41', '2021-05-20 16:53:22', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (29, 29, 102, '0', 'PRESENTA INFORMACIÓN COMPLEMENTARIA', 'AUTORIDAD NACIONAL DEL AGUA', '', 32, '2021/5/24/ana_presenta-informacion-complementaria-24052021pdf-173132.pdf', 'Referencia:\r\na) Resolución de Fecha 20/04/2021\r\nOficio N° 351-2021-MINEM-DGAAM\r\nInforme N° 184-2021/MINEM-DGAAM-DGAM\r\nb) Exp. N° 3134755 - Recurso de Reconsideración\r\nc) Exp. N°  - PAD - Unidad Minera \"El Toro\"\r\nd) Reunión de trabajo de fecha 14/05/2021', '2021-05-24 17:27:12', '2021-05-24 17:31:32', 'INTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (30, 30, 102, '0', 'PRESENTA INFORMACIÓN COMPLEMENTARIA', 'MINISTERIO DE ENERGIA Y MINAS', '', 31, '2021/5/24/mem_informacion-complementaria-y-solicita-ampliacion-de-plazo-24052021pdf-173401.pdf', 'Referencia:\r\na) Resolución del 20/04/2021\r\nb) Exp. 3134755 - Recurso de Reconsideración\r\nc) Exp. 3010282 - PAD - Unidad Minera El Toro\r\nd) Reunión de trabajo del 14/05/2021', '2021-05-24 17:31:49', '2021-05-24 17:34:01', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (31, 31, 105, '12733-2021-JP-LA', 'Obligación de Dar Suma de Dinero Iniciadas por AFPS', 'JPL Surco-San Borja', '', 17, '2021/5/25/jpl-surco-san-borja_notificacion-12733-2021-jp-la-120521pdf-124252.pdf', 'Adjunta: Resolución UNO de fecha 04/0/2021', '2021-05-25 12:40:18', '2021-05-25 12:42:52', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 69);
INSERT INTO `expediente` VALUES (32, 32, 102, '-', 'Entrega del Reglamento Interno de SSO y Programa Anual de SSO 2021', 'ORGANISMO SUPERVISOR DE LA INVERSION EN ENERGIA Y ', '', 40, '2021/5/25/osinergmin_reglamento-interno-de-sso-y-programa-anual-de-sso-2021-23122020pdf-142927.pdf', 'Presentado el 28.12.2020\r\nTrámite: 2020-201124-Osinergmin Central - 1 2020/12/28 4:37pm', '2021-05-25 14:26:29', '2021-05-25 14:29:27', 'INTERNO', '2021', 'NO', 1, 61, NULL, 62);
INSERT INTO `expediente` VALUES (33, 33, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/5/25/registro-sofya-25-05-2021pdf-162221.pdf', '1 Factura registrada', '2021-05-25 16:19:57', '2021-05-25 16:22:21', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (34, 34, 102, '1', 'prueba', 'JUAN CARLOS PORTOCARRERO ALONZO', 'jportocarrero@summagold.com', 1, '2021/5/28/limapdf-144359.pdf', 'prueba', '2021-05-28 14:42:54', '2021-05-28 14:43:59', 'INTERNO', '2021', 'NO', 28, 54, NULL, 0);
INSERT INTO `expediente` VALUES (35, 35, 102, '2', 'prueba', 'JUAN CARLOS PORTOCARRERO ALONZO', 'jcarloalonzo@gmail.com', 1, '2021/5/28/limapdf-144859.pdf', 'PRUEBA DE CORREO SMTP', '2021-05-28 14:48:12', '2021-05-28 14:48:59', 'INTERNO', '2021', 'NO', 28, 54, NULL, 0);
INSERT INTO `expediente` VALUES (36, 36, 102, '-', 'Solicita Uso de la Palabra', 'AUTORIDAD NACIONAL DEL AGUA', '', 1, '2021/6/1/ana_solicita-uso-de-la-palabra-01062021-cut-184717-2020pdf-125915.pdf', 'Referencia: Procedimiento Administrativo Sancionador\r\n                    CUT°  184717-2020', '2021-06-01 12:56:09', '2021-06-01 12:59:15', 'INTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (37, 37, 108, '-', 'INFORMACION COMPLEMENTARIA - Copia de Póliza de Seguro  de Responsabilidad Civil', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', '', 42, '2021/6/1/sucamec_fut-anexo-2-15122018-202100128363pdf-133108.pdf', 'N° Expediente: 202100128363', '2021-06-01 13:23:00', '2021-06-01 13:31:08', 'INTERNO', '2021', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (38, 38, 94, '0', 'Registro de Facturas', 'VARIOS', '', 0, '2021/6/1/registro-sofya-01-06-2021pdf-174131.pdf', 'Registro en Sofya: 15 facturas', '2021-06-01 17:40:17', '2021-06-01 17:41:31', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (39, 39, 94, '0', 'Registro de Facturas', 'VARIOS', '', 0, '2021/6/3/registro-sofya-03-06-2021pdf-163012.pdf', 'Registrado en Sofya: 5 Facturas', '2021-06-03 16:28:49', '2021-06-03 16:30:12', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (40, 40, 102, '-', 'Factura Electrónica N° F001-0000350', 'YARA PERU S.R.L.', '', 1, '2021/6/8/carta_yara-peru-srl-factura-electronica-f001-350-26012021pdf-111158.pdf', 'Emitido y Legalizado el 26/01/2021\r\nNotaria Roman - Carta Notarial N° 25809-2021', '2021-06-08 10:59:45', '2021-06-08 11:11:58', 'INTERNO', '2021', 'NO', 1, 61, NULL, 70);
INSERT INTO `expediente` VALUES (41, 41, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/6/8/registro-sofya-08-06-2021pdf-172247.pdf', 'Registro de 04 facturas', '2021-06-08 17:21:04', '2021-06-08 17:22:47', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (42, 42, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/6/10/registro-sofya-10-06-2021pdf-164010.pdf', '06 Facturas', '2021-06-10 16:38:51', '2021-06-10 16:40:10', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (43, 43, 109, '3010282', 'PRESENTA RECURSO DE RECONSIDERACION CONTRA RESOLUCION DIRECTORAL 042-2021/MINEM-DGAAM', 'DGAAM', '', 1605, '2021/6/14/mem-dgaam-escrito-3010282-06042021pdf-170508.pdf', 'Ingreso N° 3134755', '2021-06-14 17:01:46', '2021-06-14 17:05:08', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (44, 44, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/6/15/registro-sofya-15-06-2021pdf-165740.pdf', '1 Factura', '2021-06-15 16:56:31', '2021-06-15 16:57:40', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (45, 45, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/6/17/registro-sofya-17-06-2021pdf-163612.pdf', '01 Factura', '2021-06-17 16:35:02', '2021-06-17 16:36:12', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (46, 46, 102, '-', 'PRESENTA INFORMACIÓN COMPLEMENTARIA', 'DGAAM', '', 68, '2021/6/21/1_mem-dgaam_presenta-inform-complement-recurso-reconsiderac-rd-042-2021-minem-dgaam-140421pdf-091453.pdf', 'Ingreso N° 3137613\r\nFecha 14/04/2021 Hora 15:57:56', '2021-06-21 09:11:20', '2021-06-21 09:14:53', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (47, 47, 100, '321-2021-MINEM-DGAAM', 'COMUNICA INTERPOSICIÓN DE RECURSO IMPUGNATIVO', 'DGAAM', '', 6, '2021/6/21/2_mem-dgaam_oficio-321-2021-minem-dgaam-comunica-interposicion-de-recurso-impugnativo-14042021pdf-092807.pdf', 'Recibido el 15.04.2021\r\nReferencia:   a) Escrito N° 3010282 (08.01.2020)\r\n                      b) Escrito N° 3130254 (16.03.2021)', '2021-06-21 09:25:00', '2021-06-21 09:28:07', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (48, 48, 102, '-', 'Presenta en Relación a Expedientes: N°3134755 R.Reconsideración, N°31337613 Inf. Complem., N°3010282 PAD de UM El Toro', 'DGAAM', '', 3, '2021/6/21/3_mem-dgaam_comunicado-y-solicitudes-referencia-expedientes-n3134755-n3137613-n3010282-160421pdf-093248.pdf', 'Ingreso N° 3138334\r\nFecha 16/04/2021 Hora 11:41:02', '2021-06-21 09:28:13', '2021-06-21 09:32:48', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (49, 49, 100, '351-2021-MINEM-DGAAM', 'RECURSO DE RECONSIDERACION INTERPUESTO CONTRA LA RD N° 042-2021-MINEM-DGAAM', 'DGAAM', '', 4, '2021/6/21/4_mem-dgaam_oficio-351-2021-minem-dgaam-recurso-reconsid-interpuesto-contra-rd-042-2021-200421pdf-093527.pdf', 'Referencia:\r\na) Escrito N° 3010282 (08.01.2020)\r\nb) Escrito N° 3134755 (06.04.2021)', '2021-06-21 09:32:57', '2021-06-21 09:35:27', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (50, 50, 102, '-', 'Solicita Reuniones de Coordinación y Ampliación de Plazo', 'DGAAM', '', 2, '2021/6/21/5_mem-dgaam_solicita-reuniones-coordinac-y-ampliac-de-plazo-ref-exped-n3134755-n3010282-280421pdf-093725.pdf', 'Ingreso N° 3141876\r\nFecha 29/04/2021 Hora 16:34:03', '2021-06-21 09:35:36', '2021-06-21 09:37:25', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (51, 51, 102, '-', 'Presenta Información Complementaria al Recurso de Reconsideración Interpuesto contra la RD N° 042-2021/MINEM-DGAAM', 'DGAAM', '', 472, '2021/6/21/6_mem-dgaam_presenta-inform-complement-recurso-reconsiderac-rd-042-2021-minem-dgaam-040521pdf-094049.pdf', 'Ingreso N° 3143250\r\nFecha 04/05/2021 Hora 16:28:19', '2021-06-21 09:37:48', '2021-06-21 09:40:49', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (52, 52, 102, '-', 'Solicitamos Copia del Audio de Grabación de Reunión Virtual del 16.06.2021. a las 16:00 horas.', 'DIRECCION DE EVALUACION AMBIENTAL PARA PROYECTOS DE RECURSOS NATURALES Y PRODUCTIVOS', '', 2, '2021/6/21/7_senace-solicitamos-copia-del-audio-de-grabacion-de-reunion-virtual-realizada-el-160621-1600pm-170621pdf-094700.pdf', 'Presentado el 17.06.2021\r\nAtención: Ing. Percy Delgado Postigo', '2021-06-21 09:43:13', '2021-06-21 09:47:00', 'INTERNO', '2021', 'NO', 1, 61, NULL, 71);
INSERT INTO `expediente` VALUES (53, 53, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/6/22/registro-sofya-22-06-2021pdf-165156.pdf', 'Registro de 09 facturas', '2021-06-22 16:50:26', '2021-06-22 16:51:56', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (54, 54, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/6/24/registro-sofya-24-06-2021pdf-165810.pdf', '08 Facturas', '2021-06-24 16:56:19', '2021-06-24 16:58:10', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (55, 55, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/7/1/registro-sofya-01-07-2021pdf-164057.pdf', 'Total de Facturas: 06', '2021-07-01 15:46:13', '2021-07-01 16:40:57', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (56, 56, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/7/6/registro-sofya-06-07-2021pdf-172135.pdf', 'Registro de 04 facturas', '2021-07-06 17:20:27', '2021-07-06 17:21:35', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (57, 57, 108, '-', 'Expedición de Avisos Petitorio Minero PAULINA 100', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1, '2021/7/7/ingemmet_solicito-expedicion-de-avisos-petitorio-minero-paulina-100-060721pdf-165414.pdf', 'Escrito: 01-003709-21-T\r\nFecha de Formulación: 06/07/2021\r\nHora de Formulación: 15.05', '2021-07-07 16:49:21', '2021-07-07 16:54:14', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (58, 58, 108, '-', 'Reiteramos Cambio de Domicilio Legal Petitorio Minero RESPLANDOR IX (06.07.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1, '2021/7/7/ingemmet_reiteramos-cambio-de-domicilio-legal-petitorio-minero-resplandor-ix-060721pdf-165656.pdf', 'Escrito: 01-003710-21-T\r\nFecha de Formulación: 06/07/2021\r\nHora de Formulación: 15.07', '2021-07-07 16:54:20', '2021-07-07 16:56:56', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (59, 59, 102, '-', 'Notificación de Informe y/o Opinión de ANA-Recurso Reconsideración PAD U.M. El Toro (06.07.21)', 'MINISTERIO DE ENERGIA Y MINAS', '', 1, '2021/7/7/mem_notificacion-de-informe-yo-opinion-de-ana-recurso-reconsiderac-pad-um-el-toro-060721pdf-165855.pdf', 'N° Ecpediente: 3168956', '2021-07-07 16:57:03', '2021-07-07 16:58:55', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (60, 60, 102, '-', 'Reporte de Movimiento Explosivos RG 403-2021-SUCAMEC-GEPP (15.06.21)', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', '', 3, '2021/7/7/sucamec_reporte-de-movimiento-explosivos-rg-403-2021-sucamec-gepp-150621pdf-170224.pdf', 'N° Expediente: 202100179079', '2021-07-07 16:59:47', '2021-07-07 17:02:24', 'INTERNO', '2021', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (61, 61, 102, '-', 'Reporte de Movimiento Explosivos RG 030-2021-SUCAMEC-GEPP (15.06.21)', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', '', 3, '2021/7/7/sucamec_reporte-de-movimiento-explosivos-rg-030-2021-sucamec-gepp-150621pdf-170359.pdf', 'N° Expediente: 202100179108', '2021-07-07 17:02:27', '2021-07-07 17:03:59', 'INTERNO', '2021', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (62, 62, 102, '-', 'Reporte Movimiento Explosivos JUN-2021 RG 030-2021-SUCAMEC-GEPP (05.07.21)', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', '', 1, '2021/7/8/sucamec_reporte-movimiento-explosivos-jun-2021-rg-030-2021-sucamec-gepp-050721pdf-094929.pdf', 'N° Expediente: 20210018277', '2021-07-08 09:41:17', '2021-07-08 09:49:29', 'INTERNO', '2021', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (63, 63, 102, '-', 'Reporte Movimiento Explosivos JUN-2021 RG 403-2021-SUCAMEC-GEPP (05.07.21)', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', '', 1, '2021/7/8/sucamec_reporte-movimiento-explosivos-jun-2021-rg-403-2021-sucamec-gepp-050721pdf-095142.pdf', 'N° Expediente: 202100182772', '2021-07-08 09:49:46', '2021-07-08 09:51:42', 'INTERNO', '2021', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (64, 64, 103, '4852-2021-INGEMMET-DCM-UTN', 'Informe N°4852-2021-INGEMMET/DCM/UTN con Resolución del 01/07/21 / C INF. TECN. N° QUE OBRA EN EXPEDIENTES Y PROTOCOLO PARA ACTOS DE REMATES', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 18, '2021/7/9/ingemmet_informe-n4852-2021-ingemmet-dcm-utn-marizabel-3-liclique-n2-n3-y-otros-010721pdf-115551.pdf', 'Acta de Notificación Personal N° --INGEMMET', '2021-07-09 11:33:36', '2021-07-09 11:55:51', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (65, 65, 110, '536661-2021-INGEMMET', 'Certificado de Devolución N° 12308 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/13/ingemmet_petitorio-radiante-v-certificado-de-devolucion-n-12308-de-fecha-30-06-2021pdf-120247.pdf', 'Pago de Derecho de Vigencia', '2021-07-13 11:59:15', '2021-07-13 12:02:47', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (66, 66, 110, '536662-2021-INGEMMET', 'Certificado de Devolución N° 12309 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/13/ingemmet_petitorio-radiante-v-certificado-de-devolucion-n-12309-de-fecha-30-06-2021pdf-120409.pdf', 'Pago de Derecho de Vigencia', '2021-07-13 12:02:56', '2021-07-13 12:04:09', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (67, 67, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/7/13/registro-sofya-13-07-2021pdf-174437.pdf', '03 Facturas', '2021-07-13 17:43:33', '2021-07-13 17:44:37', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (68, 68, 108, '-', 'Expedición de Avisos Petitorio Minero ALFONSO III', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1, '2021/7/14/ingemmet_solicito-expedicion-de-avisos-petitorio-minero-alfonso-iii-060721pdf-120801.pdf', 'Escrito: 01-003874-21-T\r\nFecha de Formulación: 13/07/201\r\nHora de Formulación: 14:41', '2021-07-14 12:00:13', '2021-07-14 12:08:01', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (69, 69, 110, '536681-2021-INGEMMET', 'Informe N°4906-2021-INGEMMET-DCM-UTN - ALTA GRACIA 100 (Ebel y Otros) (13.07.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 6, '2021/7/14/ingemmet_informe-n4906-2021-ingemmet-dcm-utn-alta-gracia-100-ebel-y-otros-130721pdf-121113.pdf', 'Informe N°4906-2021-INGEMMET/DCM/UTN con Resolución de fecha 02/07/2021 / C/ AVISO(S) / CARTELES CON 2 AVISOS', '2021-07-14 12:08:20', '2021-07-14 12:11:13', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (70, 70, 110, '536810-2021-INGEMMET', 'Informe N°4984-2021-INGEMMET-DCM-UTN - AMANECER 100 (05.07.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 9, '2021/7/15/ingemmet_informe-n4984-2021-ingemmet-dcm-utn-amanecer-100-050721pdf-170635.pdf', 'Informe N°4984-2021-INGEMMET/DCM/UTN con Resolución de fecha 05/07/2021 / C/FOLIOS 169 AL 173 Y 255 DEL EXPEDIENTE', '2021-07-15 17:03:33', '2021-07-15 17:06:35', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (71, 71, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/7/15/registro-sofya-15-07-2021pdf-171027.pdf', '02 Facturas', '2021-07-15 17:08:44', '2021-07-15 17:10:27', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (72, 72, 102, '040-2021-SGC/AP', 'Presenta Información Complementaria al Recurso de Reconsideración Interpuesto contra la RD N° 042-2021/MINEM-DGAAM', 'DGAAM', '', 1, '2021/7/19/mem-dgaam_presenta-inf-complem-rec-reconsid-interp-contra-rd-042-2021-minem-dgaam-160721pdf-144521.pdf', 'Ingreso N° 3173552\r\nFecha: 16/07/2021\r\nHorra: 13:41:29', '2021-07-19 14:39:18', '2021-07-19 14:45:21', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (73, 73, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/7/20/registro-sofya-20-07-2021pdf-171317.pdf', '03 Facturas', '2021-07-20 17:12:18', '2021-07-20 17:13:17', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (74, 74, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/7/22/registro-sofya-22-07-2021pdf-171310.pdf', '04 Facturas', '2021-07-22 17:12:13', '2021-07-22 17:13:10', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (75, 75, 110, '537848-2021-INGEMMET', 'Petitorio RADIANTE III - Certificado de Devolución N° 12297 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/23/ingemmet_petitorio-radiante-iii-certificado-de-devolucion-n-12297-de-fecha-30-06-2021pdf-111112.pdf', '', '2021-07-23 10:52:31', '2021-07-23 11:11:12', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (76, 76, 110, '537851-2021-INGEMMET', 'Petitorio RADIANTE III - Certificado de Devolución N° 12298 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/23/ingemmet_petitorio-radiante-iii-certificado-de-devolucion-n-12298-de-fecha-30-06-2021pdf-111238.pdf', '', '2021-07-23 11:11:23', '2021-07-23 11:12:38', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (77, 77, 110, '537852-2021-INGEMMET', 'Petitorio RADIANTE III - Certificado de Devolución N° 12299 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/23/ingemmet_petitorio-radiante-iii-certificado-de-devolucion-n-12299-de-fecha-30-06-2021pdf-111402.pdf', '', '2021-07-23 11:12:48', '2021-07-23 11:14:02', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (78, 78, 110, '537855-2021-INGEMMET', 'Petitorio RADIANTE III - Certificado de Devolución N° 12300 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/23/ingemmet_petitorio-radiante-iii-certificado-de-devolucion-n-12300-de-fecha-30-06-2021pdf-111511.pdf', '', '2021-07-23 11:14:06', '2021-07-23 11:15:11', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (79, 79, 110, '537859-2021-INGEMMET', 'Petitorio RESPLANDOR VI - Certificado de Devolución N° 12290 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/23/ingemmet_petitorio-resplandor-vi-certificado-de-devolucion-n-12290-de-fecha-30-06-2021pdf-111624.pdf', '', '2021-07-23 11:15:18', '2021-07-23 11:16:24', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (80, 80, 110, '537862-2021-INGEMMET', 'Petitorio RESPLANDOR VI - Certificado de Devolución N° 12291 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/23/ingemmet_petitorio-resplandor-vi-certificado-de-devolucion-n-12291-de-fecha-30-06-2021pdf-111732.pdf', '', '2021-07-23 11:16:33', '2021-07-23 11:17:32', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (81, 81, 110, '537877-2021-INGEMMET', 'Petitorio DON DIEGO II - Certificado de Devolución N° 12314 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/23/ingemmet_petitorio-don-diego-ii-certificado-de-devolucion-n-12314-de-fecha-30-06-2021pdf-111856.pdf', '', '2021-07-23 11:17:38', '2021-07-23 11:18:56', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (82, 82, 110, '537879-2021-INGEMMET', 'Petitorio DON DIEGO II - Certificado de Devolución N° 12315 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/23/ingemmet_petitorio-don-diego-ii-certificado-de-devolucion-n-12315-de-fecha-30-06-2021pdf-111957.pdf', '', '2021-07-23 11:19:02', '2021-07-23 11:19:57', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (83, 83, 104, '0739-2021-ANA-AAA.M', 'Sancionar Administrativamente con multa (15.07.2021)', 'AUTORIDAD NACIONAL DEL AGUA', '', 6, '2021/7/23/ana_rd-n0739-2021-ana-aaam-sancionar-administrativamente-con-multa-15072021pdf-112631.pdf', 'Recibido el 21.07.2021', '2021-07-23 11:21:59', '2021-07-23 11:26:31', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (84, 84, 110, '538007-2021-INGEMMET', 'Petitorio RESPLANDOR XII - Certificado de Devolución N° 12285 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/26/ingemmet_petitorio-resplandor-xii-certificado-de-devolucion-n-12285-de-fecha-30-06-2021pdf-110521.pdf', '', '2021-07-26 11:00:44', '2021-07-26 11:05:21', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (85, 85, 110, '538008-2021-INGEMMET', 'Petitorio RESPLANDOR XII - Certificado de Devolución N° 12286 de fecha 30-06-2021', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/7/26/ingemmet_petitorio-resplandor-xii-certificado-de-devolucion-n-12286-de-fecha-30-06-2021pdf-110642.pdf', '', '2021-07-26 11:05:36', '2021-07-26 11:06:42', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (86, 86, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/7/27/registro-sofya-27-07-2021pdf-165952.pdf', '07 Facturas', '2021-07-27 16:58:47', '2021-07-27 16:59:52', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (87, 87, 102, '159-SGRPE-GPE-GCSPE-ESSALUD-2021', 'Solicitud de Pago de subsidios de Incapacidad - Covid-19', 'ESSALUD', '', 2, '2021/8/3/mtpe-essalud_solicitud-de-pago-de-subsidios-de-incapacidad-covid-19-19072021pdf-103658.pdf', '', '2021-08-03 10:27:00', '2021-08-03 10:36:58', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 72);
INSERT INTO `expediente` VALUES (88, 88, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/8/3/registro-sofya-03-08-2021pdf-175123.pdf', '', '2021-08-03 17:50:00', '2021-08-03 17:51:23', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (89, 89, 102, 's/n', 'Adjunto Publicaciones de Carteles del PM ALTA GRACIA 100 código 010239520 (04.08.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 3, '2021/8/4/ingemmet_adjunto-publicaciones-de-carteles-del-pm-alta-gracia-100-codigo-010239520-040821pdf-103959.pdf', '', '2021-08-04 10:20:40', '2021-08-04 10:39:59', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (90, 90, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/8/6/registro-sofya-05-08-2021pdf-155710.pdf', 'Recibido y Registrado en Sofya el 05.08.2021', '2021-08-06 15:54:59', '2021-08-06 15:57:10', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (91, 91, 110, '539215-2021-INGEMMET', 'INGEMMET_Informe N°5836-2021-INGEMMET-DCM-UTN con Resolución del 27-07-2021 RESPLANDOR VI (05.08.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 5, '2021/8/6/ingemmet_informe-n5836-2021-ingemmet-dcm-utn-con-resolucion-del-27-07-2021-resplandor-vi-05082021pdf-173940.pdf', '', '2021-08-06 17:38:21', '2021-08-06 17:39:40', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (92, 92, 110, '539313-2021-INGEMMET', 'Informe N°5213-2021-INGEMMET-DCM-UTN con Resolución del 08-07-2021 MONTONERO 13 2019 (RADIANTE VI, ORMASAN N°12 Y OTROS) (06.08.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 5, '2021/8/9/ingemm1pdf-104434.PDF', '', '2021-08-09 10:42:19', '2021-08-09 10:44:34', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (93, 93, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/8/10/registro-sofya-10-08-2021pdf-171924.pdf', '08 Facturas', '2021-08-10 17:17:55', '2021-08-10 17:19:24', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (94, 94, 102, '044', 'Comunica la Aprobación del Recurso de Reconsideración que Aprueba el PAD UM El Toro', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 2, '2021/8/11/oefa_carta-n044-2021-sgc-ap_comunica-aprobac-recurso-reconsideracion-aprueba-pad-um-el-toro_2-ref-2021-e01-068804_cargopdf-170805.pdf', 'Referencia:\r\na) Resolución Directoral N° 152-2021-/MINEM-DGAAM\r\n     Aprobación del Plan Ambiental Detallado de Unidad Minera El Toro.\r\nb) Resolución Directoral N°0107-2021-OEFA/DFAI\r\n     Expediente 0072-2020-OEFA/DFAI/PAS', '2021-08-11 16:59:48', '2021-08-11 17:08:05', 'INTERNO', '2021', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (95, 95, 102, '045', 'Comunica la Aprobación del Recurso de Reconsideración que Aprueba el PAD UM El Toro', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 2, '2021/8/11/oefa_carta-n045-2021-sgc-ap_comunica-aprobac-recurso-reconsideracion-aprueba-pad-um-el-toro_3-ref-2021-e01-068819_cargopdf-171316.pdf', 'a) Resolución Directoral N° 152-2021-/MINEM-DGAAM.\r\n    Aprobación del Plan Ambiental Detallado de la Unidad Minera El Toro.\r\nb) Resolución Directoral N° 1171-2021-/OEFA/DFAI\r\n     Expediente 0667-2020-OEFA/DFAI/PAS\r\nc) Informe Final de Instrucción N° 689-2021-OEFA/DFAI/SFEM\r\n     Expediente 0667-2020-OEFA/DFAI/PAS', '2021-08-11 17:08:35', '2021-08-11 17:13:16', 'INTERNO', '2021', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (96, 96, 109, '-6010283', 'Recurso de Reconsideración contra Resolución Directoral N° 0739-2021-ANA-AAA.M (11.08.2021)', 'AUTORIDAD NACIONAL DEL AGUA', '', 26, '2021/8/11/ana_recurso-de-reconsideracion-contra-rd-0739-2021-ana-aaam-110821pdf-172213.pdf', 'Referencia: Resolución Directoral N° 0739-2021-ANA-AAA.M\r\n                    CUT N° 184717-2020', '2021-08-11 17:19:20', '2021-08-11 17:22:13', 'INTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (97, 97, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/8/12/registro-sofya-12-08-2021pdf-164510.pdf', '03 Facturas', '2021-08-12 16:43:55', '2021-08-12 16:45:10', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (98, 98, 110, '539822-2021-INGEMMET', 'Informe N°5880-2021-INGEMMET-DCM-UTN con Resolución del 30-07-2021 RADIANTE II (12.08.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 5, '2021/8/13/ingemmet_informe-n5880-2021-ingemmet-dcm-utn-con-resolucion-del-30-07-2021-radiante-ii-12082021pdf-115327.pdf', '', '2021-08-13 11:51:25', '2021-08-13 11:53:27', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (99, 99, 110, '539830-2021-INGEMMET', 'Informe N°5881-2021-INGEMMET-DCM-UTN con Resolución del 30-07-2021 RADIANTE V (12.08.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 5, '2021/8/13/ingemmet_informe-n5881-2021-ingemmet-dcm-utn-con-resolucion-del-30-07-2021-radiante-v-12082021pdf-115502.pdf', '', '2021-08-13 11:53:43', '2021-08-13 11:55:02', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (100, 100, 102, '046', 'Presenta Informe de Subsanación de Hecho Detectado N°8, e Información Complementaria al Hecho Detectado N°3 y N°6, en la Supervisión realizada el 08.0', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 1, '2021/8/16/oefa_carta-n046-2021-sgc-ap_presenta-inf-subsanac-hecho-detectado-informac-complementaria-en-supervision-del-0806-al-1606-16082021pdf-144557.pdf', '', '2021-08-16 14:37:14', '2021-08-16 14:45:57', 'INTERNO', '2021', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (101, 101, 109, '-6010282', 'Solicito Guías de tránsito para extorno de saldos (16.08.2021)', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', '', 31, '2021/8/17/sucamec_solicito-guias-de-transito-para-extorno-de-saldos-16082021pdf-150715.pdf', 'Referencia:\r\nResolución de Gerencia N° 01963-2021-SUCAMEC/GEPP Guía de tránsito N° 23619-2021-SUCAMEC-GEPP-GTE', '2021-08-17 15:01:15', '2021-08-17 15:07:15', 'INTERNO', '2021', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (102, 102, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/8/17/registro-sofya-17-08-2021pdf-172336.pdf', '03 Facturas', '2021-08-17 17:22:10', '2021-08-17 17:23:36', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (103, 103, 110, '540048-2021-INGEMMET', 'Informe N°5942-2021-INGEMMET-DCM-UTN - PAULINA 100 (17.08.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 6, '2021/8/18/ingemmet_informe-n5942-2021-ingemmet-dcm-utn-con-resolucion-del-02-08-2021-paulina-100-17082021pdf-101628.pdf', 'Informe N°5942-2021-INGEMMET/DCM/UTN con Resolución del 02-08-2021 C/AVISO(S) / CARTELES CON 2 AVISOS Y RESOLUC. DEL 28/05/2021', '2021-08-18 10:12:36', '2021-08-18 10:16:28', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (104, 104, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/8/19/registro-sofya-19-08-2021pdf-172528.pdf', '09 Facturas', '2021-08-19 17:00:51', '2021-08-19 17:25:28', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (105, 105, 109, '-6010281', 'Adjunto Publicaciones de Cartes del Petitorio Minero RESPLANDOR VI código 010302919 (20.08.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 4, '2021/8/23/ingemmet_adjunto-publicaciones-de-cartes-del-petitorio-minero-resplandor-vi-codigo-010302919-20082021pdf-164438.pdf', 'Tramitado\r\nCódigo Único: 01-004816-21-T\r\n23/08/2021\r\n09:07am', '2021-08-23 16:40:45', '2021-08-23 16:44:38', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (106, 106, 108, '-', 'Reiteramos cambio de domicilio legal Petitorio Minero ALFONSO VI (23.087.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1, '2021/8/23/ingemmet-reiteramos-cambio-de-domicilio-legal-petitorio-minero-alfonso-vi-230872021pdf-164630.pdf', 'Tramitado', '2021-08-23 16:44:48', '2021-08-23 16:46:30', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (107, 107, 108, '-', 'Reiteramos cambio de domicilio legal Petitorio Minero ALTA GRACIA 600 (23.087.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1, '2021/8/23/ingemmet-reiteramos-cambio-de-domicilio-legal-petitorio-minero-alta-gracia-600-230872021pdf-164827.pdf', '', '2021-08-23 16:46:45', '2021-08-23 16:48:27', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (108, 108, 109, '-6010280', 'Reporte Movimiento Explosivos JUL-2021 RG 030-2021-SUCAMEC-GEPP (16.08.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 3, '2021/8/23/sucamec_reporte-movimiento-explosivos-jul-2021-rg-030-2021-sucamec-gepp-160821pdf-165120.pdf', 'N° Expediente: 202100222730', '2021-08-23 16:49:12', '2021-08-23 16:51:20', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (109, 109, 109, '-6010279', 'Reporte Movimiento Explosivos JUL-2021 RG 01963-2021-SUCAMEC-GEPP (16.08.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 3, '2021/8/23/sucamec_reporte-movimiento-explosivos-jul-2021-rg-01963-2021-sucamec-gepp-160821pdf-165300.pdf', 'N° Expediente: 202100222732', '2021-08-23 16:51:26', '2021-08-23 16:53:00', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (110, 110, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/8/25/registro-sofya-25-08-2021pdf-095230.pdf', 'Recibidos el 24/08/2021\r\n09 Facturas', '2021-08-25 09:50:12', '2021-08-25 09:52:30', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (111, 111, 110, '540799-2021-INGEMMET', 'Informe N°6657-2021-INGEMMET/DCM/UTN con Resolución del 17-08-2021 RESPLANDOR X (25.08.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 5, '2021/8/26/ingemmet_informe-n6657-2021-ingemmet-dcm-utn-con-resolucion-del-17-08-2021-resplandor-x-25082021pdf-105732.pdf', 'Informe N°6657-2021-INGEMMET/DCM/UTN con Resolución del 17-08-2021 / C/ AVISO(S) / CARTELES CON 2 AVISOS', '2021-08-26 10:53:18', '2021-08-26 10:57:32', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (112, 112, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/8/26/registro-sofya-26-08-2021pdf-180659.pdf', '5 FACTURAS', '2021-08-26 18:05:44', '2021-08-26 18:06:59', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (113, 113, 110, '541066-2021-INGEMMET', 'Informe N°6657-2021-INGEMMET/DCM/UTN con Resolución del 17-08-2021 C / INFORME TECNICO N°. QUE OBRA EN EXPEDIENTES Y PROTOCOLO PARA REMATES EN INGEMME', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 34, '2021/8/27/ingemm1pdf-105816.PDF', '', '2021-08-27 10:52:30', '2021-08-27 10:58:16', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (114, 114, 109, '-6010278', 'Escrito Complementario a Reconsideración contra la RD N° 1171-2021-OEFA/DFAI y comunica aprobación del PAD U.M. EL Toro', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 0, '2021/8/27/oefa_escrito-complementario-a-reconsideracion-contra-rd-n1171-2021-oefa-dfai-y-aprobacion-pad-260821pdf-144441.pdf', 'Expediente: 0667-2020-OEFA/DFAI/PAS\r\nIncluye Anexo 1_RD_152_2021-MINEM_DGAAM\r\nIncluye Anexo 2_PE_ROSA AMPARO AC6', '2021-08-27 14:24:42', '2021-08-27 14:44:41', 'INTERNO', '2021', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (115, 115, 109, '', 'Adjunto Publicaciones de Carteles del PM PAULINA 100 código 010241020 (13.09.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1, '2021/9/15/ingemmet_adjunto-publicaciones-de-carteles-del-petitorio-minero-paulina-100-codigo-010241020-13092021pdf-151428.pdf', 'PRESENTADO EL 13.09.2021', '2021-09-15 15:09:48', '2021-09-15 15:14:28', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (116, 116, 109, '', 'Adjunto Publicaciones de Carteles del PM RESPLANDOR X código 010244420 (13.09.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1, '2021/9/15/ingemmet_adjunto-publicaciones-de-carteles-del-petitorio-minero-resplandor-x-codigo-010244420-13092021pdf-151607.pdf', 'PRESENTADO EL 13.09.2021', '2021-09-15 15:14:35', '2021-09-15 15:16:07', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (117, 117, 109, '', 'Adjunto Publicaciones de Carteles del PM RADIANTE II código 010168518 (13.09.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1, '2021/9/15/ingemmet_adjunto-publicaciones-de-carteles-del-petitorio-minero-radiante-ii-codigo-010168518-13092021pdf-151743.pdf', 'PRESENTADO EL 13.09.2021', '2021-09-15 15:16:15', '2021-09-15 15:17:43', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (118, 118, 109, '', 'Adjunto Publicaciones de Carteles del PM RADIANTE V código 010302819 (13.09.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1, '2021/9/15/ingemmet_adjunto-publicaciones-de-carteles-del-petitorio-minero-radiante-v-codigo-010302819-13092021pdf-151926.pdf', 'PRESENTADO EL 13.09.2021', '2021-09-15 15:17:50', '2021-09-15 15:19:26', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (119, 119, 109, '', 'SOLICITA INFORME ORAL (14.09.2021)', 'AUTORIDAD NACIONAL DEL AGUA', '', 1, '2021/9/15/ana_solicita-informe-oral-ref_rd-0355-2021-aprobac-pad-cut-procedm-adm-sancionador-cut-n184717-2020-14092021pdf-153424.pdf', 'Referencia:\r\na) Recurso de Apelación contra RD N°0355-2021-ANA-AAAM que declaró infundada la R.D. N° 1264-2020-ANA-AAA.M. CUT 124258-2021\r\nb) Comunica Aprobación del PAD de la Unidad Minera El Toro CUT 147738-2021 y CUT 145617-2021', '2021-09-15 15:27:28', '2021-09-15 15:34:24', 'INTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (120, 120, 109, '', 'SOLICITA INFORME ORAL (14.09.22021)', 'AUTORIDAD NACIONAL DEL AGUA', '', 1, '2021/9/15/ana_solicita-informe-oral-ref_rd-0739-2021-procedm-adm-sancionador-cut-n184717-2020-14092021pdf-153855.pdf', 'Referencia : Resolución Directoral N° 0739-2021-ANA-AAA.M Procedimiento Administrativo Sancionador \r\n                     CUT N° 184717-2020', '2021-09-15 15:34:32', '2021-09-15 15:38:55', 'INTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (121, 121, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/9/16/registro-sofya-16-09-2021pdf-173258.pdf', '03 Facturas', '2021-09-16 17:31:32', '2021-09-16 17:32:58', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (122, 122, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/9/21/registro-sofya-21-09-2021pdf-173556.pdf', '07 FACTURAS', '2021-09-21 17:34:45', '2021-09-21 17:35:56', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (123, 123, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/9/23/registro-sofya-23-09-2021pdf-175238.pdf', '06 Facturas', '2021-09-23 17:51:21', '2021-09-23 17:52:38', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (124, 124, 102, '-', 'Presenta Informe de subsanación voluntaria de los hechos verificados en la supervisión realizada del 06 al 09/09/2021 (23.09.21)', 'ORGANISMO SUPERVISOR DE LA INVERSION EN ENERGIA Y ', '', 8, '2021/9/24/osinergmin_presenta-informe-de-subsanacion-voluntaria-del-06-al-09092021-230921pdf-090821.pdf', 'Adjunto Cargo de Recepción en Ventanilla Virtual', '2021-09-24 09:05:37', '2021-09-24 09:08:21', 'INTERNO', '2021', 'NO', 1, 61, NULL, 62);
INSERT INTO `expediente` VALUES (125, 125, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/9/28/registro-sofya-28-09-2021pdf-174347.pdf', '04 Facturas', '2021-09-28 17:42:31', '2021-09-28 17:43:47', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (126, 126, 110, '544007-2021-INGEMMET', 'Inf. N°7981-2021-INGEMMET-DCM-UTN Resolución 13-09-2021 SOLANGEL (LICLIQUE N°2, RESPLANDOT XIII Y OTROS (28.09.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2021/9/29/ingemmet_inf-n7981-2021-ingemmet-dcm-utn-resolucion-13-09-2021-solangel-liclique-n2-resplandot-xiii-y-otros-28092021pdf-115245.pdf', '', '2021-09-29 11:42:09', '2021-09-29 11:52:45', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (127, 126, 110, '544007-2021-INGEMMET', 'Inf. N°7981-2021-INGEMMET-DCM-UTN Resolución 13-09-2021 SOLANGEL (LICLIQUE N°2, RESPLANDOT XIII Y OTROS (28.09.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, NULL, NULL, '2021-09-29 11:42:09', '2021-09-29 11:52:55', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (128, 128, 110, '544363-2021-INGEMMET', 'Inf. N°7890-2021-INGEMMET-DCM-UTN Resolución 10-09-2021 RESPLANDOR XIV (Las Minas 12 2020 y Otros) (29.09.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1605, '2021/9/30/ingemmet_inf-n7890-2021-ingemmet-dcm-utn-resolucion-10-09-2021-resplandor-xiv-las-minas-12-2020-y-otros-29092021pdf-112657.pdf', 'Inf. N°7890-2021-INGEMMET-DCM-UTN Resolución 10-09-2021  C/INFORME TECNICO N° FOLIOS 20-28 Y PROTOCOLO PARA ACTOS DE REMATE EN INGEMMET', '2021-09-30 11:24:15', '2021-09-30 11:26:57', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (129, 129, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/9/30/registro-sofya-30-09-2021pdf-171046.pdf', '04 Facturas', '2021-09-30 17:09:29', '2021-09-30 17:10:46', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (130, 130, 102, '-', 'Informe Subsanación Hechos Verificados en Supervisión del 06 al 09 Set-2021-CargoRecepcion (23.09.21)', 'ORGANISMO SUPERVISOR DE LA INVERSION EN ENERGIA Y ', '', 8, '2021/10/6/osinergmin_informe-subsanacion-hechos-verificados-en-supervision-del-06-al-09-set-2021-cargorecepcion-230921pdf-092115.pdf', 'Expediente: 202100199203\r\nAdjunta: Carta, Informe, Anexos 1, Anexo 2', '2021-10-06 08:58:19', '2021-10-06 09:21:15', 'INTERNO', '2021', 'NO', 1, 61, NULL, 62);
INSERT INTO `expediente` VALUES (131, 131, 109, '-', 'Reporte Movimiento Explosivos AGO-2021 RG 01963-2021-SUCAMEC-GEPP (16.09.21)', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', '', 3, '2021/10/7/_sucamec_reporte-movimiento-explosivos-ago-2021-rg-01963-2021-sucamec-gepp-160921pdf-094811.pdf', 'Presentado el 28.09.2021', '2021-10-07 09:43:36', '2021-10-07 09:48:11', 'INTERNO', '2021', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (132, 132, 109, '-', 'Reporte Movimiento Explosivos AGO-2021 RG 030-2021-SUCAMEC-GEPP (16.09.21)', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', '', 3, '2021/10/7/_sucamec_reporte-movimiento-explosivos-ago-2021-rg-030-2021-sucamec-gepp-160921pdf-094936.pdf', 'Presentado el 28.09.2021', '2021-10-07 09:48:25', '2021-10-07 09:49:36', 'INTERNO', '2021', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (133, 133, 110, '-', 'Solicitud de representante de SGC SAC enviada el 01.09.21 para Aclarar Información y Acciones (04.10.21)', 'COMISION DE ENERGIA Y MINAS DEL CONGESO DE LA REPUBLIICA', '', 1, '2021/10/7/mem-cemcr_solicitud-de-representante-de-sgc-sac-enviada-el-010921-para-aclarar-informacion-y-acciones-04102pdf-095841.pdf', 'Tramitado', '2021-10-07 09:51:41', '2021-10-07 09:58:41', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (134, 134, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/10/7/registro-sofya-07-10-2021pdf-175725.pdf', '1 factura 05/10/2021\r\n1 factura 07/10/2021', '2021-10-07 17:55:49', '2021-10-07 17:57:25', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (135, 135, 109, '-', 'Recurso Apelación contra RD 0355-2021-ANA-AAA.M declaró infundado recurso reconsiderac. contra RD 1264-2020-ANA-AAA.M (05.07.21)', 'AUTORIDAD NACIONAL DEL AGUA (AAA) MARAÑON', '', 0, '2021/10/11/ana_recurso-apelacion-contra-rd-0355-2021-ana-aaam-declaro-infundado-recurso-reconsiderac-contra-rd-1264-2020-ana-aaam-050721pdf-091352.pdf', 'Referencia: C.U.T. N° 232-2020', '2021-10-11 09:05:45', '2021-10-11 09:13:52', 'INTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (136, 136, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/10/12/registro-sofya-12-10-2021pdf-175143.pdf', '06 Facturas ', '2021-10-12 17:50:37', '2021-10-12 17:51:43', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (140, 137, 110, '547306-2021-INGEMMET', 'INGEMMET_Informe N°8394-2021-INGEMMET-DCM-UTN con Resolución del 27-09-2021 MAURO V (18.10.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 16, '2021/10/19/ingemmet_informe-n8394-2021-ingemmet-dcm-utn-con-resolucion-del-27-09-2021-mauro-v-18102021pdf-131022.pdf', 'Informe N°8394-2021-INGEMMET-DCM-UTN con Resolución del 27-09-2021 / C/C DEL INFORME N° OBRANTE A FOLIOS 89-97', '2021-10-19 13:06:55', '2021-10-19 13:10:22', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (141, 141, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/10/19/registro-sofya-19-10-2021pdf-165024.pdf', '04 facturas', '2021-10-19 16:49:06', '2021-10-19 16:50:24', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (142, 142, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/10/22/registro-sofya-21-10-2021pdf-093832.pdf', '05 FACTURAS', '2021-10-22 09:36:38', '2021-10-22 09:38:32', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (143, 143, 110, '547946-2021-INGEMMET', 'Informe N°8859-2021-INGEMMET-DCM-UTN con Resolución del 07-10-2021 LAS MINAS 14 2020 (ALFONSO IV Y OTROS (20.10.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 7, '2021/10/22/ingemm1pdf-105118.PDF', 'Informe N°8859-2021-INGEMMET/DCM/UTN con Resolución del 07-10-2021\r\nLAS MINAS 14 2020 (ALFONSO IV Y OTROS (20.10.2021)', '2021-10-22 10:48:01', '2021-10-22 10:51:18', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (144, 144, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/10/26/registro-sofya-26-10-2021pdf-180258.pdf', '2 Facturas', '2021-10-26 18:01:40', '2021-10-26 18:02:58', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (145, 145, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/10/28/registro-sofya-28-10-2021pdf-171614.pdf', '01 Factura', '2021-10-28 17:15:04', '2021-10-28 17:16:14', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (146, 146, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/11/2/registro-sofya-02-11-2021pdf-165827.pdf', '03 Facturas', '2021-11-02 16:57:21', '2021-11-02 16:58:27', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (147, 147, 108, '-', 'Presentación de Petitorio Minero RADIANTE XIII-Incluye Certificado Devolución N°12286 y N°12285 (03.11.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 11, '2021/11/3/ingemmet_presentacion-de-petitorio-minero-radiante-xiii-incluye-certificado-devolucion-n12286-y-n12285-031121pdf-173647.pdf', 'Registro: 01-02532-21\r\nTramitado 03.11.2021\r\nHora: 08:15a.m.', '2021-11-03 17:21:05', '2021-11-03 17:36:47', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (148, 148, 108, '-', 'Presentación de Petitorio Minero RADIANTE XIV-Incluye Certificado Devolución N°12297 (03.11.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2021/11/3/ingemmet_presentacion-de-petitorio-minero-radiante-xiv-incluye-certificado-devolucion-n12297-031121pdf-173842.pdf', 'Registro: 01-02533-21\r\nTramitado: 03.11.2021\r\nHora: 08:15 am', '2021-11-03 17:37:02', '2021-11-03 17:38:42', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (149, 149, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/11/4/registro-sofya-04-11-2021pdf-174942.pdf', '01 Factura', '2021-11-04 17:48:44', '2021-11-04 17:49:42', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (150, 150, 109, '1', 'Presentación de Solicitud-Escrito Subsanación Requerimiento - MAURO V', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2021/11/5/ingemmet_presentacion-de-solicitud-escrito-subsanacion-requerimiento_mauro-v-constancia-recepcion-03112021pdf-152649.pdf', 'Constancia de Recepción\r\nCódigo Único: 01-006968-21-T\r\nFecha: 03/11/2021\r\nHora: 16:10 pm\r\n', '2021-11-05 15:18:00', '2021-11-05 15:26:49', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (152, 151, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/11/9/registro-sofya-09-11-2021pdf-165145.pdf', '05 Facturas', '2021-11-09 16:50:27', '2021-11-09 16:51:45', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (153, 153, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/11/12/registro-sofya-12-11-2021pdf-092420.pdf', '05 Facturas', '2021-11-12 09:17:47', '2021-11-12 09:24:20', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (155, 154, 105, '0031-2021-ANA-AAA.M-ALA-H', 'Notificación N°331-2021-Inicio Procedimiento Administrativo Sancionador (12.11.2021)', 'AUTORIDAD NACIONAL DEL AGUA', '', 20, '2021/11/15/154_ana_notificacion-n331-2021-inicio-procedimiento-administrativo-sancionador-12112021pdf-152244.pdf', 'Recibido por Propiedades - Isabel Orozco 15.11.2021', '2021-11-15 15:19:39', '2021-11-15 15:22:44', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (156, 156, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/11/18/registro-sofya-18-11-2021pdf-172451.pdf', '01 Factura', '2021-11-18 17:23:00', '2021-11-18 17:24:51', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (157, 157, 110, '550902-2021-INGEMMET', 'INGEMMET_Informe N°9785-2021-INGEMMET-DCM-UTN con Resolución del 08-11-2021 RESPLANDOR XV (19.11.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 11, '2021/11/22/ingemmet_informe-n9785-2021-ingemmet-dcm-utn-con-resolucion-del-08-11-2021-resplandor-xv-19112021pdf-110445.pdf', '', '2021-11-22 11:02:20', '2021-11-22 11:04:45', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (158, 158, 110, '550909-2021-INGEMMET', 'Informe N°9783-2021-INGEMMET-DCM-UTN con Resolución del 08-11-2021 RESPLANDOR XVI (19.11.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 11, '2021/11/22/ingemmet_informe-n9783-2021-ingemmet-dcm-utn-con-resolucion-del-08-11-2021-resplandor-xvi-19112021pdf-110627.pdf', '', '2021-11-22 11:04:58', '2021-11-22 11:06:27', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (159, 159, 110, '550918-2021-INGEMMET', 'Informe N°9782-2021-INGEMMET-DCM-UTN con Resolución del 08-11-2021 RESPLANDOR XVII (19.11.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2021/11/22/ingemmet_informe-n9782-2021-ingemmet-dcm-utn-con-resolucion-del-08-11-2021-resplandor-xvii-19112021pdf-110754.pdf', '', '2021-11-22 11:06:39', '2021-11-22 11:07:54', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (160, 160, 104, '436-2021-ANA/TNRCH', 'Resolución N°436-2021-ANA-TNRCH-Renovac. Autorización de Vertimiento de aguas residuales industriales tratadas', 'AUTORIDAD NACIONAL DEL AGUA', '', 12, '2021/11/23/ana_resolucion-n436-2021-ana-tnrch-renovac-autorizac-vertim-aguas-resid-21092021pdf-160419.pdf', 'Emitido el 21-09-2021\r\nRecibido el 23-11-2021', '2021-11-23 16:00:37', '2021-11-23 16:04:19', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (161, 161, 110, '551064-2021-INGEMMET', 'INGEMMET_Resolución N° 3486-2021-INGEMMET-PE-PM del 11-11-2021 RESPLANDOR VI (22.11.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2021/11/23/ingemmet_resolucion-n-3486-2021-ingemmet-pe-pm-del-11-11-2021-resplandor-vi-22112021pdf-160616.pdf', '', '2021-11-23 16:04:47', '2021-11-23 16:06:16', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (162, 162, 110, '551134-2021-INGEMMET', 'INGEMMET_Inf. 9810-2021-INGEMMET-DCM-UTN Resoluc. 08-11-2021 RESPLANDOR XIV (Las Minas 12 2020 y Otros) (22.11.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 7, '2021/11/23/ingemmet_inf-9810-2021-ingemmet-dcm-utn-resoluc-08-11-2021-resplandor-xiv-las-minas-12-2020-y-otros-22112021pdf-160738.pdf', '', '2021-11-23 16:06:25', '2021-11-23 16:07:38', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (163, 163, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/11/25/registro-sofya-25-11-2021pdf-164658.pdf', '01 Factura', '2021-11-25 16:45:44', '2021-11-25 16:46:58', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (164, 164, 108, '-', 'INGEMMET_Presentar Formato Petitorio RESPLANDOR VIII-Corrección de Coordenadas UTM (25.11.21)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2021/11/25/ingemmet_presentar-formato-petitorio-resplandor-viii-correccion-de-coordenadas-utm-251121pdf-181024.pdf', 'Constancia de Recepción: 0100774421T\r\n25/11/2021 16:00', '2021-11-25 18:04:33', '2021-11-25 18:10:24', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (165, 165, 104, '1056-2021-ANA-AAA.M', 'ANA_Resoluc. Directoral N°1056-2021-ANA-AAA.M-Rec. Reconsideración contra RD 0739-2021 (19.11.2021)', 'AUTORIDAD NACIONAL DEL AGUA', '', 4, '2021/11/26/ana_resoluc-directoral-n1056-2021-ana-aaam-rec-reconsideracion-contra-rd-0739-2021-19112021pdf-160836.pdf', 'Recibido por Isabel Orozco', '2021-11-26 16:06:36', '2021-11-26 16:08:36', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (166, 166, 110, '551804-2021-INGEMMET', 'INGEMMET_Resolución N° 3564-2021-INGEMMET-PE-PM del 16-11-2021 RADIANTE V (25.11.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 9, '2021/11/26/ingemmet_resolucion-n-3564-2021-ingemmet-pe-pm-del-16-11-2021-radiante-v-25112021pdf-161729.pdf', 'Recibido por Isabel Orozco', '2021-11-26 16:15:36', '2021-11-26 16:17:29', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (167, 167, 109, '-', 'Reporte Movimiento Explosivos OCT-2021 RG 01963-2021-SUCAMEC-GEPP (15.11.21)', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', '', 3, '2021/11/29/sucamec_reporte-movimiento-explosivos-oct-2021-rg-01963-2021-sucamec-gepp-151121pdf-154045.pdf', 'Expediente N° 202100332155', '2021-11-29 15:35:41', '2021-11-29 15:40:45', 'INTERNO', '2021', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (168, 168, 102, 'SGC-012', 'Presentación de Comunicación Previa en U.M. El Toro (29.11.21) 2021-E01-100217_cargo', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 1, '2021/11/30/oefa_presentacion-de-comunicacion-previa-en-um-el-toro-291121-2021-e01-100217_cargopdf-143635.pdf', '2021-E01-100217\r\n30/11/2021 10:04:12\r\nRecepción: LGODINEZ', '2021-11-30 14:33:26', '2021-11-30 14:36:35', 'INTERNO', '2021', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (169, 169, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/12/15/registro-sofya-15-12-2021pdf-131756.pdf', '07 Facturas, recibidas en sobre por Rosario O.', '2021-12-15 13:16:25', '2021-12-15 13:17:56', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (170, 170, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/12/16/registro-sofya-16-12-2021pdf-154621.pdf', '01 Factura', '2021-12-16 15:45:27', '2021-12-16 15:46:21', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (171, 171, 110, '554080-2021-INGEMMET', 'Informe N°11163-2021-INGEMMET-DCM-UTN con Resolución del 09-12-2021 ALFONSO VI (16.12.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 12, '2021/12/20/ingemmet_informe-n11163-2021-ingemmet-dcm-utn-con-resolucion-del-09-12-2021-alfonso-vi-16122021pdf-155052.pdf', 'Recibido por Isabel O.', '2021-12-20 15:48:40', '2021-12-20 15:50:52', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (172, 172, 110, '554101-2021-INGEMMET', 'Recibido por Isabel O.', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 13, '2021/12/20/ingemmet_informe-n11133-2021-ingemmet-dcm-utn-con-resolucion-del-09-12-2021-alta-gracia-400-16122021pdf-155229.pdf', '', '2021-12-20 15:51:10', '2021-12-20 15:52:29', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (173, 173, 110, '554343-2021-INGEMMET', 'Informe N°11066-2021-INGEMMET-DCM-UTN MARIZABEL 3 (Liclique N°2, Liclique N°3 Y OTROS) (17.12.021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 11, '2021/12/20/ingemmet_informe-n11066-2021-ingemmet-dcm-utn-marizabel-3-liclique-n2-liclique-n3-y-otros-1712021pdf-155403.pdf', 'Recibido por Isabel O.', '2021-12-20 15:52:38', '2021-12-20 15:54:03', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (174, 174, 94, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2021/12/21/registro-sofya-21-12-2021pdf-173738.pdf', '01 Factura', '2021-12-21 17:35:40', '2021-12-21 17:37:38', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (175, 175, 110, '554576-2021-INGEMMET', 'Informe N°11162-2021-INGEMMET-DCM-UTN con Resolución del 09-12-2021 ALTA GRACIA 600 (21.12.2021)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 11, '2021/12/22/ingemmet_informe-n11162-2021-ingemmet-dcm-utn-con-resolucion-del-09-12-2021-alta-gracia-600-21122021pdf-121925.pdf', 'informe N°11162-2021-INGEMMET-DCM-UTN con Resolución del 09/12/2021 C/AVISO(S) / CARTELES CON 2 CARTELES CON COPIA DE LA RESOLUCION DE FECHA 02/07/2021 Y DEL INFORME LEGAL QUE LA SUSTENTA.', '2021-12-22 12:15:53', '2021-12-22 12:19:25', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (180, 176, 111, '-', '02 Calendarios de escritorio', 'GLOBALTEK PERU S.A.C', '', 0, '2021/12/29/skm_c45821122910040pdf-100249.pdf', 'Destinatario: Srta. Elita Espinoza Perez', '2021-12-29 09:53:37', '2021-12-29 10:02:49', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 73);
INSERT INTO `expediente` VALUES (181, 181, 111, '-', '02 Calendarios de escritorio', 'GLOBALTEK PERU S.A.C', '', 0, '2021/12/29/skm_c45821122910040pdf-100415.pdf', 'Destinatario: Liz Pomachagua', '2021-12-29 10:02:57', '2021-12-29 10:04:15', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 73);
INSERT INTO `expediente` VALUES (182, 182, 110, '555235-2021-INGEMMET', 'Informe N°11277-2021-INGEMMET-DCM/ CON RESOLUCIÓN DE FECHA 13/12/2021 COPIA DE LOS FOLIOS 35 AL 40 DEL EXPEDIENTE', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 17, '2021/12/30/ingemmet_informe-n11277-2021-ingemmet-dcm-utn-con-resolucion-del-13-12-2021-radiante-xii-29122021pdf-143823.pdf', 'Recibido 30/12/2021', '2021-12-30 14:34:00', '2021-12-30 14:38:23', 'EXTERNO', '2021', 'NO', 35, 73, NULL, 60);
INSERT INTO `expediente` VALUES (183, 183, 110, '-', 'Informe N°1951-2021-MINEM-DGM-DGES-DAC-DAC 2020 Exp. 3166526 del 02.07.2021 (23-12-2021)', 'MINISTERIO DE ENERGIA Y MINAS', '', 3, '2021/12/30/mem-dgm_informe-n1951-2021-minem-dgm-dges-dac-dac-2020-exp-3166526-del-02072021-23-12-2021pdf-144218.pdf', 'D.A.C. 2020\r\nRef: Expediente web N°3166526 de fecha 02/07/2021\r\nSolicitd de ventanilla virtual N° 3237890 de fecha 22/12/2021', '2021-12-30 14:38:42', '2021-12-30 14:42:18', 'EXTERNO', '2021', 'NO', 35, 73, NULL, 51);
INSERT INTO `expediente` VALUES (184, 184, 110, '555828-2022', 'Informe N°011441-2021- INGEMMET-DMC-UTN con Resolución de fecha 14-12-2021_MI SAYAPULLO 4 - 04-01-2022', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/1/5/184_ingemmet_informe-n-011441-2021-ingemmet-dmc-utn-con-resolucion-de-fecha-14-12_2021-mi-sayapullo-4-04-01-2022pdf-110342.pdf', 'Se recibe Acta de notificación personal el 05 de enero 2022', '2022-01-05 10:51:45', '2022-01-05 11:03:42', 'EXTERNO', '2021', 'NO', 35, 73, NULL, 60);
INSERT INTO `expediente` VALUES (185, 185, 110, '556285-2022', 'Informe N° 011930 - INGEMMET/ DCM/UTN', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 4, '2022/1/11/185_ingemmet_informe-n-011930-2021-ingemmet-dmc-utn-con-resolucion-de-fecha-29-12_2021-mauro-v-10-01_2022pdf-145047.pdf', '', '2022-01-11 14:42:26', '2022-01-11 14:50:47', 'EXTERNO', '2021', 'NO', 35, 73, NULL, 60);
INSERT INTO `expediente` VALUES (186, 186, 109, '-', 'Adjunta Cartas Fianzas AVLA, SECREX CESCE Total US$ 8,269,365.03-PCM 2022 (30.12.2021)', 'MINISTERIO DE ENERGIA Y MINAS', '', 2, '2022/1/13/mem_cartas-fianzas-avla-secrex-cesce-total-us-826936503-pcm-2022-30122021pdf-121734.pdf', 'Referencia:\r\nExpediente N° 3241281\r\nEscrito de fecha 30.DIC.2021', '2022-01-13 12:13:04', '2022-01-13 12:17:34', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (187, 187, 111, '-', 'CARTA FIANZA_AVLA-Garantía Anual Plan de Cierre US$ 4,134,682.52 (31.12.21-31.12.22)', 'MINISTERIO DE ENERGIA Y MINAS', '', 1, '2022/1/13/carta-fianza_avla-garantia-anual-plan-de-cierre-us-413468252-311221-311222pdf-122020.pdf', 'Fecha de Emisión: 21/12/2021\r\nPóliza: 3012021021219', '2022-01-13 12:18:16', '2022-01-13 12:20:20', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (188, 188, 111, '-', 'CARTA FIANZA_SECREX-Garantía Anual Plan de Cierre US$ 4,134,682.52 (31.12.21-31.12.22)', 'MINISTERIO DE ENERGIA Y MINAS', '', 1, '2022/1/13/carta-fianza_secrex-garantia-anual-plan-de-cierre-us-413468252-311221-311222pdf-122242.pdf', 'Fecha de Emisión: 28-12-2021\r\nCARTA FIANZA N° E3121-00-2021', '2022-01-13 12:20:43', '2022-01-13 12:22:42', 'INTERNO', '2021', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (189, 189, 111, '-', 'Estado de Cuenta Corriente', 'BANCO PICHINCHA', '', 2, '2022/1/14/bco-pichincha_estado-de-cuenta-corrientepdf-144956.pdf', 'No se ha recibido los meses de Octubre y Noviembre', '2022-01-14 14:25:05', '2022-01-14 14:49:56', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 74);
INSERT INTO `expediente` VALUES (190, 190, 110, '557038-2020-INGEMMET', 'Informe N°0013-2022-INGEMMET-DDV-L Resolución del 07-01-2022 RADIANTE IX (14.01.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 5, '2022/1/17/ingemmet_informe-n0013-2022-ingemmet-ddv-l-resolucion-del-07-01-2022-radiante-ix-14012022pdf-110619.pdf', '', '2022-01-17 11:04:17', '2022-01-17 11:06:19', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (191, 191, 111, '-', 'Scotiabank_Aviso de Titularidas, Solicitud de Confirmación y Fecha de Vencimiento', 'SCOTIABANK PERU SAA', '', 3, '2022/1/17/scotiabank_aviso-de-titularidas-solicitud-de-confirmacion-y-fecha-de-vencimientopdf-161425.pdf', '03 Facturas Negociables:\r\nF006-6500, 6507, 6514\r\n', '2022-01-17 16:09:39', '2022-01-17 16:14:25', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 75);
INSERT INTO `expediente` VALUES (192, 192, 102, '21-SGRPE-GPE-GCSPE-ESSALUD-2022', 'MTPE-ESSALUD_Carta N° 21-SGRPE-GPE-GCSPE-SSALUD-2022 (14.01.2022)', 'MINIST.DE TRABAJO Y PROMOCION DEL EMPLEO', '', 1, '2022/1/18/mtpe-essalud_carta-n-21-sgrpe-gpe-gcspe-ssalud-2022-14012022pdf-110139.pdf', 'Asunto: Inicio de Procedimiento de Nulidad de Oficio de Acto Administrativo', '2022-01-18 10:58:29', '2022-01-18 11:01:39', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 72);
INSERT INTO `expediente` VALUES (193, 193, 111, '-', 'Revista', 'CAMARA DE COMERCIO DE LIMA', '', 0, '2022/1/18/revista-n1010pdf-141819.pdf', 'Del 10 al 16 de enero del 2022, N° 1010', '2022-01-18 14:12:00', '2022-01-18 14:18:19', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 77);
INSERT INTO `expediente` VALUES (194, 194, 111, '-', 'Revista N°1010_Tesorería', 'CAMARA DE COMERCIO DE LIMA', '', 0, '2022/1/18/revista-n1010_tesoreriapdf-142007.pdf', 'Del 10 al 16/01/2022', '2022-01-18 14:18:52', '2022-01-18 14:20:07', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 76);
INSERT INTO `expediente` VALUES (195, 195, 108, '-', 'INGEMMET_Solicito Expedición de Avisos Petitorio RESPLANDOR XV (17.01.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 4, '2022/1/20/ingemmet_solicito-expedicion-de-avisos-petitorio-resplandor-xv-17012022pdf-172846.pdf', 'Código Único: *0100046222T\r\nTramitado el 17/01/2022\r\n15:01', '2022-01-20 17:24:58', '2022-01-20 17:28:46', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (196, 196, 108, '-', 'INGEMMET_Solicito Expedición de Avisos Petitorio ALTA GRACIA 600 (17.01.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 4, '2022/1/20/ingemmet_solicito-expedicion-de-avisos-petitorio-alta-gracia-600-17012022pdf-173105.pdf', 'Código Único:*0100047422T\r\n18/01/2022\r\n08:17', '2022-01-20 17:29:16', '2022-01-20 17:31:05', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (197, 197, 108, '-', 'INGEMMET_Solicito Expedición de Avisos Petitorio ALFONSO VI (17.01.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 4, '2022/1/20/ingemmet_solicito-expedicion-de-avisos-petitorio-alfonso-vi-17012022pdf-173317.pdf', 'Código Único: *0100047522T\r\n18/01/2022\r\n08:17', '2022-01-20 17:31:53', '2022-01-20 17:33:17', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (198, 198, 108, '-', 'INGEMMET_Solicito Expedición de Avisos Petitorio ALTA GRACIA 400 (17.01.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 4, '2022/1/20/ingemmet_solicito-expedicion-de-avisos-petitorio-alta-gracia-400-17012022pdf-173454.pdf', 'Código Único: * 0100047622T\r\n18/01/2022\r\n08:17', '2022-01-20 17:33:36', '2022-01-20 17:34:54', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (199, 199, 108, '-', 'INGEMMET_Solicito Expedición de Avisos Petitorio ALTA GRACIA 200 (17.01.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 4, '2022/1/20/ingemmet_solicito-expedicion-de-avisos-petitorio-alta-gracia-200-17012022pdf-173630.pdf', 'Código Único: *0100047722T\r\n18/01/2022\r\n08:17', '2022-01-20 17:35:10', '2022-01-20 17:36:30', 'INTERNO', '2021', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (200, 200, 102, '006-2022-SGC/AP', 'SUCAMEC_Carta 006-2022-SGC-AP-Consulta Permiso Agente Gasificante L11 (20.01.22)', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', '', 1, '2022/1/20/sucamec_carta-006-2022-sgc-ap-consulta-permiso-agente-gasificante-l11-200122pdf-173857.pdf', 'Expediente: 202200016102\r\n20/01/2022\r\n14:44', '2022-01-20 17:36:46', '2022-01-20 17:38:57', 'INTERNO', '2021', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (201, 201, 111, '-', 'Estado de Cuenta Consolidado y Carta de Información de Tarifas', 'BANCO INTERAMERICANO DE FINANZAS', '', 6, '2022/1/24/carta-banbif_eecc-consolidado-y-comisiones-2022pdf-113817.pdf', 'Registrado y Actualizado en Data de Tesorería.', '2022-01-24 11:24:07', '2022-01-24 11:38:17', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 78);
INSERT INTO `expediente` VALUES (202, 202, 102, '-', 'CCL-Centro de Arbitraje_Caso Arbitral N° 0016-2022-CCL (21.01.2022)', 'CAMARA DE COMERCIO DE LIMA', '', 41, '2022/1/24/ccl-centro-de-arbitraje_caso-arbitral-n-0016-2022-ccl-21012022pdf-114150.pdf', 'Adjunta Escrito N°1\r\nSolicitud de Arbitraje\r\nCBL INSURANCE LIMITED In Liquidation', '2022-01-24 11:38:49', '2022-01-24 11:41:50', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 76);
INSERT INTO `expediente` VALUES (203, 203, 102, '-', 'Absolvemos Requerimiento Carta del 04.01.2022 (20.01.22)', 'UNTA DE PROPIETARIOS LIMA CENTRAL TOWER', '', 1, '2022/1/26/junta-propietarios-lima-central-tower_absolvemos-requerimiento-carta-del-04012022-200122pdf-161932.pdf', 'Carta de Fecha 04/01/2022\r\nLevantar Observaciones con el área de Mantenimiento', '2022-01-26 16:03:02', '2022-01-26 16:19:32', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 79);
INSERT INTO `expediente` VALUES (204, 204, 102, '-', 'AVLA PERU Compañia de Seguros SA_Póliza de Caución N° 3012020013647 (25.11.20)', 'AVLA PERU COMPAÑIA DE SEGUROS S.A.', '', 2, '2022/2/4/avla-peru-compania-de-seguros-sa_poliza-de-caucion-n-3012020013647-251120pdf-094025.pdf', 'Recibido por el área de Legal con fecha 25-11-2020\r\nAdjunto: Carta emitida el 15-12-2020', '2022-02-04 09:32:23', '2022-02-04 09:40:25', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 80);
INSERT INTO `expediente` VALUES (205, 205, 102, '-', 'AVLA PERU Cia. Seguros_Carta 18-12-2020 Póliza Caución N° 3012020013647 (21.12.20)', 'AVLA PERU COMPAÑIA DE SEGUROS S.A.', '', 1, '2022/2/4/avla-peru-cia-seguros_carta-18-12-2020-poliza-caucion-n-3012020013647-211220pdf-094225.pdf', 'Recibido por el área Legal', '2022-02-04 09:40:40', '2022-02-04 09:42:25', 'EXTERNO', '2021', 'NO', 1, 61, NULL, 80);
INSERT INTO `expediente` VALUES (206, 206, 102, '-', 'AVLA Compañia de Seguros SAA_Cartas Notariales del 23-11-2020 y 21-12-2020', 'AVLA PERU COMPAÑIA DE SEGUROS S.A.', '', 2, '2022/2/4/avla-compania-de-seguros-saa_cartas-notariales-del-23-11-2020-y-21-12-2020pdf-094406.pdf', 'Presentado por el área de Legal el 23-12-2020', '2022-02-04 09:42:33', '2022-02-04 09:44:06', 'INTERNO', '2021', 'NO', 1, 61, NULL, 80);
INSERT INTO `expediente` VALUES (207, 207, 102, '007', 'ANA_CARTA N° 007-Solicita Informe Oral RD 1056-2021-ANA-AAAN (21-01-2022)', 'AUTORIDAD NACIONAL DEL AGUA', '', 2, '2022/2/4/ana_carta-n-007-solicita-informe-oral-rd-1056-2021-ana-aaan-21-01-2022pdf-155508.pdf', 'Tramite Virtual\r\nN° CUT: 128709-2021\r\n21/01/2022 02:27PM', '2022-02-04 15:41:17', '2022-02-04 15:55:08', 'INTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (208, 208, 102, '008', 'ANA-Tribunal Sol. Controv. Rec. HId._CARTA N° 008-Sol. Informe Oral (21-01-2022)', 'AUTORIDAD NACIONAL DEL AGUA', '', 1, '2022/2/4/ana-tribunal-sol-controv-rec-hid_carta-n-008-sol-informe-oral-21-01-2022pdf-155733.pdf', 'Tramite Virtual\r\nN° CUT: 128709-2021\r\nFecha: 21/01/2022 05:11PM', '2022-02-04 15:55:34', '2022-02-04 15:57:33', 'INTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (209, 209, 109, '1', 'SUCAMEC_Reporte Movim. Explosivos DIC-2021 RG 01963-2021-SUCAMEC-GEPP (18.01.22)', 'SUPERINTENDENCIA NACIONAL DE CONTROL DE SERVICIOS ', '', 3, '2022/2/4/sucamec_reporte-movim-explosivos-dic-2021-rg-01963-2021-sucamec-gepp-180122pdf-173625.pdf', 'Tramite virtual\r\nN° Expediente: 202200032094', '2022-02-04 17:34:01', '2022-02-04 17:36:25', 'INTERNO', '2022', 'NO', 1, 61, NULL, 63);
INSERT INTO `expediente` VALUES (210, 210, 101, '-', 'EMP. TRANSP. LA MAMITA-3° ADENDA CONT. ARRENDAMIENTO DE MYE', 'VARIOS', '', 3, '2022/2/7/e4c4a3_por-firmar-empresa-transp-la-mamita-sac_3-ad-cont-arrend-mye-plazo-tarifario-010122-311222pdf-102117.pdf', '02 Adendas en físico Original para firmas', '2022-02-07 10:15:42', '2022-02-07 10:21:17', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (211, 211, 111, '-', 'EECC MN Y ME ENERO-2022', 'BANCO PICHINCHA', '', 2, '2022/2/7/bco-pichincha_eecc-ene-2022pdf-131841.pdf', 'REGISTRADO Y ACTUALIZADO EN DATA TESORERÍA', '2022-02-07 13:17:14', '2022-02-07 13:18:41', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 74);
INSERT INTO `expediente` VALUES (212, 212, 110, '55859-2022-INGEMMET', 'INGEMMET_Resolución N° 000375-2022-INGEMMET-PE-PM de fecha 31-01-2022 ALTA GRACIA 100 (08.02.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/2/9/ingemmet_resolucion-n-000375-2022-ingemmet-pe-pm-de-fecha-31-01-2022-alta-gracia-100-08022022pdf-113453.pdf', 'Entregado a Srta. Carla Solis', '2022-02-09 11:29:06', '2022-02-09 11:34:53', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (213, 213, 111, '-', 'RECIBO DE SERVICIO PUBLICO', 'VARIOS', '', 1, '2022/2/10/ccf_20220210_104729_000591pdf-105503.pdf', 'Comprobante de Pago registrado en Sofya\r\nV_136-02-2022', '2022-02-10 10:51:59', '2022-02-10 10:55:03', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (214, 214, 101, '-', 'Contrato Legalizado-Notaria  Perez Tello', 'VARIOS', '', 5, '2022/2/10/s10c12_por-firmar-servisap-srl_contrato-de-mutuo-con-garantia-mobiliaria-prestamo-de-us-20000000-090222pdf-122252.pdf', 'Contrato de Mutuo con Garantía Mobiliaria\r\nSERVISAP SRL', '2022-02-10 12:12:20', '2022-02-10 12:22:52', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (215, 215, 102, '-', 'Notaria Collantes Becerra_Carta Notarial-Deuda Consorcio Torino SA (08.02.2022)', 'VARIOS', '', 11, '2022/2/11/notaria-collantes-becerra_carta-notarial-deuda-consorcio-torino-sa-08022022pdf-113028.pdf', 'Adjunto: Expediente N° 01922-2021-0-1601-JR-CI-04 (31.01.2022)', '2022-02-11 11:27:40', '2022-02-11 11:30:28', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (216, 216, 111, '-', 'Estado de Cuenta Consolidado y Carta de Información de Tarifas', 'BANCO INTERAMERICANO DE FINANZAS', '', 3, '2022/2/11/banbif_eecc-ene-2022pdf-170511.pdf', '', '2022-02-11 17:03:30', '2022-02-11 17:05:11', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 78);
INSERT INTO `expediente` VALUES (217, 217, 101, '-', 'Addendum N°2 LLYC', 'VARIOS', '', 3, '2022/2/15/addendum-n2-llycpdf-172502.pdf', 'Registrado y actualizado en Data Contratos', '2022-02-15 17:22:09', '2022-02-15 17:25:02', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (218, 218, 111, '3', 'Documentos TI - ISO 270001', 'VARIOS', '', 3, '2022/2/16/politica-de-criptografia-01-10-2021pdf-110045.pdf', 'Documento debidamente firmado  ', '2022-02-16 10:54:08', '2022-02-16 11:00:45', 'INTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (219, 219, 111, '4', 'Documentos TI - ISO 270001', 'VARIOS', '', 1, '2022/2/16/politica-del-sgsi-15-12-2021pdf-110602.pdf', 'Documento debidamente firmado', '2022-02-16 11:04:15', '2022-02-16 11:06:02', 'INTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (220, 220, 111, '0', 'Documentos TI - ISO 270001', 'VARIOS', '', 1, '2022/2/16/acta-designacion-responsable-sgsi-28-12-2021pdf-110809.pdf', 'Documento debidamente firmado', '2022-02-16 11:06:40', '2022-02-16 11:08:09', 'INTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (221, 221, 105, '0008-2022-ANA-AAA.M', 'Notifica Informe Final de Instrucción', 'AUTORIDAD NACIONAL DEL AGUA', '', 10, '2022/2/16/ana_notificacion-n008-2022-ana-aaam-09022022pdf-112356.pdf', 'Documento entregado al área de Medio Ambiente', '2022-02-16 11:17:59', '2022-02-16 11:23:56', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (222, 222, 100, '', 'Revista Nº 1014 (7-13/02/2022)', 'CAMARA DE COMERCIO DE LIMA', '', 0, '2022/2/17/revista-no-1014jpg-173121.jpg', 'Entregas:\r\nGerencia: Eleana Saba\r\ntesorería: Ivan Silva', '2022-02-17 17:27:23', '2022-02-17 17:31:21', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 76);
INSERT INTO `expediente` VALUES (223, 223, 110, '559835-2022-INGEMMET', 'INGEMMET_Informe N° 1638-2022-INGEMMET-DCM-UTN con Resolución del 08-02-2022 Las Minas 13 2020 (17.02.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 6, '2022/2/18/ingemmet_informe-n-1638-2022-ingemmet-dcm-utn-con-resolucion-del-08-02-2022-las-minas-13-2020-17022022pdf-130625.pdf', '', '2022-02-18 13:03:57', '2022-02-18 13:06:25', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (224, 224, 110, '559845-2022-INGEMMET', 'INGEMMET_Informe N° 1575-2022-INGEMMET-DCM-UTN con Resolución del 08-02-2022 RESPLANDOR XI (17.02.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 14, '2022/2/18/ingemmet_informe-n-1575-2022-ingemmet-dcm-utn-con-resolucion-del-08-02-2022-resplandor-xi-17022022pdf-130801.pdf', '', '2022-02-18 13:06:34', '2022-02-18 13:08:01', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (225, 225, 110, '559950-2022-INGEMMET', 'INGEMMET_Informe N° 1586-2022-INGEMMET-DCM-UTN con Resolución del 08-02-2022 RESPLANDOR XII (17.02.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 12, '2022/2/18/ingemmet_informe-n-1586-2022-ingemmet-dcm-utn-con-resolucion-del-08-02-2022-resplandor-xii-17022022pdf-131014.pdf', '', '2022-02-18 13:08:42', '2022-02-18 13:10:14', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (226, 226, 110, '559957-2022-INGEMMET', 'INGEMMET_Informe N° 1587-2022-INGEMMET-DCM-UTN con Resolución del 08-02-2022 RESPLANDOR IX (17.02.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 11, '2022/2/18/ingemmet_informe-n-1587-2022-ingemmet-dcm-utn-con-resolucion-del-08-02-2022-resplandor-ix-17022022pdf-131130.pdf', '', '2022-02-18 13:10:27', '2022-02-18 13:11:30', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (227, 227, 102, '-', 'MERCANTIL SA_Propuesta Tecnica y Económica-Concurso N°054-COM-22 Abastecim. Carbon Activado (23.02.2022)', 'MERCANTIL SA', '', 0, '2022/2/23/mercantil-sa_propuesta-tecnica-y-economica-concurso-n054-com-22-abastecim-carbon-activado-23022022pdf-112432.pdf', 'Destinatario: Elita Espinoza\r\nAdjunto:\r\nSobre N° 1: Propuesta Técnica (01 original)\r\nSobre N° 2: Propuesta Económica (01 original)', '2022-02-23 11:14:32', '2022-02-23 11:24:32', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 81);
INSERT INTO `expediente` VALUES (228, 228, 102, '-', 'QUIMICOS GOICOCHEA SAC_Concurso N°054-COM-22 Abastecimiento Carbón Activado (23.02.2022)', 'QUIMICOS GOICOCHEA S.A.C.', '', 0, '2022/2/23/quimicos-goicochea-sac_concurso-n054-com-22-abastecimiento-de-carbon-activado-23022022pdf-175738.pdf', 'Atención: Elita Espinoza', '2022-02-23 17:52:09', '2022-02-23 17:57:38', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 82);
INSERT INTO `expediente` VALUES (229, 229, 111, '3710', 'ANA_UCRE-Transaccion 3710-Retribución Económica por Uso Agua Superficial con fines No Agrario (20-10-2021)', 'AUTORIDAD NACIONAL DEL AGUA', '', 1, '2022/2/28/ana_transaccion-3710-retribucion-economica-por-uso-agua-superficial-con-fines-no-agrario-20102021pdf-115159.pdf', 'Recibido en Sobre cerrado.', '2022-02-28 11:45:54', '2022-02-28 11:51:59', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (230, 230, 110, '561221-2022-INGEMMET', 'INGEMMET_Informe N° 1780-2022-INGEMMET-DCM-UTN con Resolución del 11-02-2022 RADIANTE XIV (28.02.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 9, '2022/3/1/ingemmet_informe-n-1780-2022-ingemmet-dcm-utn-con-resolucion-del-11-02-2022-radiante-xiv-28022022pdf-115741.pdf', '', '2022-03-01 11:55:52', '2022-03-01 11:57:41', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (231, 231, 102, '019-2022-SGC/AP', 'OEFA_Carta N°019-2022-SGGCAP-Solicitud de Reunión (2022-E01-018278_cargo)', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 1, '2022/3/2/oefa_carta-n019-2022-sggcap-solicitud-de-reunion-2022-e01-018278_cargopdf-144423.pdf', 'Referencia:\r\nCarta N° 018-2022-SGC/AP\r\nCarta N° 00146-2022-OEFA/DSEM\r\nResolución N° 00009-2021-OEFA/DSEM', '2022-03-02 14:38:35', '2022-03-02 14:44:23', 'INTERNO', '2022', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (232, 232, 111, '-', 'Registro de Facturas', 'VARIOS', '', 0, '2022/3/3/registro-sofya-03-03-2022pdf-175607.pdf', '02 Facturas', '2022-03-03 17:52:15', '2022-03-03 17:56:07', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (233, 233, 110, '561697-2022-INGEMMET', 'INGEMMET_Informe N° 1879-2022-INGEMMET-DCM-UTN con Resolución del 14-02-2022 RADIANTE III (03.03.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 20, '2022/3/4/ingemmet_informe-n-1879-2022-ingemmet-dcm-utn-con-resolucion-del-14-02-2022-radiante-iii-03032022pdf-110833.pdf', 'C/C DEL INFORME N° IN-008722-2021-INGEMMET/DCM/UTO', '2022-03-04 11:06:29', '2022-03-04 11:08:33', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (234, 234, 110, '561720-2022-INGEMMET', 'INGEMMET_Informe N° 2329-2022-INGEMMET-DCM-UTN con Resolución del 23-02-2022 RESPLANDOR XVIII (03.03.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 27, '2022/3/4/ingemmet_informe-n-2329-2022-ingemmet-dcm-utn-con-resolucion-del-23-02-2022-resplandor-xviii-03032022pdf-111028.pdf', 'C/INFORME TECNICO N°. C/INF. TECNICO', '2022-03-04 11:08:43', '2022-03-04 11:10:28', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (235, 235, 111, 'DPTO COB/ 00011998 / 2021', 'La Positiva Seguros-DPTO COB-0001198-2021 Primas Pendientes de Pago (01.03.2022)', 'VARIOS', '', 1, '2022/3/7/la-positiva-seguros-dpto-cob-0001198-2021-primas-pendientes-de-pago-01032022pdf-115116.pdf', 'Referencia: Primas Pendientes de Pago', '2022-03-07 11:49:49', '2022-03-07 11:51:16', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (236, 236, 110, '562149-2022-INGEMMET', 'INGEMMET_Informe N° 2345-2022-INGEMMET-DCM-UTN con Resolución del 24-02-2022 ROSA AMPARO A.C.6 (08.03.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 4, '2022/3/9/ingemmet_informe-n-2345-2022-ingemmet-dcm-utn-con-resolucion-del-24-02-2022-rosa-amparo-ac6-08032022pdf-111249.pdf', '', '2022-03-09 11:11:46', '2022-03-09 11:12:49', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (237, 237, 110, '562528-2022-INGEMMET', 'INGEMMET_Informe N° 2531-2022-INGEMMET-DCM-UTN con Resolución 28-02-2022 VALE928 (RESPLANDOR XX Y OTROS) (10.03.22)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 17, '2022/3/11/ingemmet_informe-n-2531-2022-ingemmet-dcm-utn-con-resolucion-28-02-2022-vale928-resplandor-xx-y-otros-100322pdf-112132.pdf', '', '2022-03-11 11:18:47', '2022-03-11 11:21:32', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (238, 238, 110, '562534-2022-INGEMMET', 'INGEMMET_Informe N° 000782-2022-INGEMMET-PE-PM de fecha 28-02-2022 RESPLANDOR X (10.03.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/3/11/ingemmet_informe-n-000782-2022-ingemmet-pe-pm-de-fecha-28-02-2022-resplandor-x-10032022pdf-112301.pdf', '', '2022-03-11 11:21:40', '2022-03-11 11:23:01', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (239, 239, 100, '085-2022/CF 37-2017-1°FSEDLAYPD-2°D-MP-FN', 'Solicitud de documentación detallada', 'MINISTERIO PUBLICO', '', 1, '2022/3/21/mp_oficio-n-85-2022-cf-37-2017-1fsedlaypd-2d-mp-fn-15032022pdf-093843.pdf', '', '2022-03-21 09:32:54', '2022-03-21 09:38:43', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 83);
INSERT INTO `expediente` VALUES (240, 240, 108, '-', 'INGEMMET_Solicitar la Subsanación de Requerimiento RADIANTE III (22-03-2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 1, '2022/3/22/ingemmet_solicitar-la-subsanacion-de-requerimiento-radiante-iii-22-03-2022pdf-175009.pdf', 'Tramitado Código Unico: 01-002376-22-T\r\nTicket de Cola N° M14', '2022-03-22 17:46:07', '2022-03-22 17:50:09', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (241, 241, 108, '-', 'INGEMMET_Expediente de Petitorio Minero - RESPLANDOR 02 (21.03.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 14, '2022/3/22/ingemmet_expediente-de-petitorio-minero-resplandor-02-21032022pdf-175824.pdf', 'Tramitado 21/03/2022\r\n16:11\r\nTicket de Cola N° M53, Código Único: 01-00552-22', '2022-03-22 17:56:06', '2022-03-22 17:58:24', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (242, 242, 108, '-', 'INGEMMET_Expediente de Petitorio Minero - URUMACHAY (18.03.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 12, '2022/3/23/ingemmet_expediente-de-petitorio-minero-urumachay-18032022pdf-130706.pdf', 'Tramitado el 18/03/2022, 16:30pm\r\nTicket de Cola N° M47\r\nCódigo Único: 01-00549-22', '2022-03-23 13:04:57', '2022-03-23 13:07:06', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (243, 243, 100, '167-2022/CF 37-2017-1°FSEDLAYPD-2°D-MP-FN', 'MP_Ofic.N°167-2022--CD-37-2017-1°FSEDLAYPD-2°D-MP-FN-Solicita Información (23.03.2022)', 'MINISTERIO PUBLICO', '', 1, '2022/3/29/mp_oficn167-2022-cd-37-2017-1fsedlaypd-2d-mp-fn-solicita-informacion-23032022pdf-165025.pdf', 'RECIBIDO EL 28/03/2022', '2022-03-29 16:48:17', '2022-03-29 16:50:25', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 83);
INSERT INTO `expediente` VALUES (244, 244, 110, '564275-2022-INGEMMET', 'INGEMMET_Informe N° 3583-2022-INGEMMET-DCM-UTN con Resolución del 21-03-2022 RADIANTE XIII (25.03.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 14, '2022/3/29/ingemmet_informe-n-3583-2022-ingemmet-dcm-utn-con-resolucion-del-21-03-2022-radiante-xiii-25032022pdf-165540.pdf', 'RECIBIDO EL 28/03/2022', '2022-03-29 16:53:58', '2022-03-29 16:55:40', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (245, 245, 110, '564806-2022-INGEMMET', 'INGEMMET_Informe N°3509-2022-INGEMMET-DCM-UTN con Resolución del 17-03-2022 ALTA GRACIA 200 (31.03.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 9, '2022/4/1/ingemmet_informe-n3509-2022-ingemmet-dcm-utn-con-resolucion-del-17-03-2022-alta-gracia-200-31032022pdf-142129.pdf', '', '2022-04-01 14:14:10', '2022-04-01 14:21:29', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (246, 246, 102, '602-2022', 'Contra Notificación Resolución OS', 'MYNARSKI INTERNATIONAL VALUATION SAC', '', 18, '2022/4/7/mynarski-international-valuation-sac_carta-notarial-602-2022_contra-notificacion-resolucion-os-01042022pdf-113520.pdf', 'RECIBIDO DE NOTARIA TINAGEROS', '2022-04-07 11:25:11', '2022-04-07 11:35:20', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 84);
INSERT INTO `expediente` VALUES (247, 247, 110, '565585-2022-INGEMMET', 'NGEMMET_Informe N°3751-2022-INGEMMET-DCM-UTN con Resolución del 22-03-2022 AMANDITA CUATRO (31.03.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 17, '2022/4/8/ngemmet_informe-n3751-2022-ingemmet-dcm-utn-con-resolucion-del-22-03-2022-amandita-cuatro-31032022pdf-115650.pdf', '', '2022-04-08 11:55:08', '2022-04-08 11:56:50', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (248, 248, 104, '0079-2022-ANA-DCERH', 'ANA_RESOL. DIRECTORAL N° 0079-2022-ANA-DCERH_Autorización de Vertimiento de Aguas Residuales RD 194-2017-ANA-DGCR (08.04.2022)', 'AUTORIDAD NACIONAL DEL AGUA', '', 22, '2022/4/11/ana_resol-directoral-n-0079-2022-ana-dcerh_autorizvertiimaguas-resid-rd-194-2017-ana-dgcr-08042022pdf-123225.pdf', 'Sobre cerrado con Destinatario al Sr. William Yactayo\r\nRepresentante Legal', '2022-04-11 12:20:37', '2022-04-11 12:32:25', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (249, 249, 110, '566893-2022-INGEMMET', 'INGEMMET_Informe N°4139-2022-INGEMMET-DCM-UTN con Resolución del 29-03-2022 RADIANTE XV (19.04.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/4/20/ingemmet_informe-n4139-2022-ingemmet-dcm-utn-con-resolucion-del-29-03-2022-radiante-xv-19042022pdf-111915.pdf', '', '2022-04-20 11:17:30', '2022-04-20 11:19:15', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (250, 250, 110, '566966-2022-INGEMMET', 'INGEMMET_Informe N°4140-2022-INGEMMET-DCM-UTN con Resolución del 29-03-2022 RADIANTE XVI (20.04.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/4/21/ingemmet_informe-n4140-2022-ingemmet-dcm-utn-con-resolucion-del-29-03-2022-radiante-xvi-20042022pdf-111445.pdf', '', '2022-04-21 11:13:14', '2022-04-21 11:14:45', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (251, 251, 104, '972-OSPE-LA LIBERTAD-GCSPE-ESSALUD-2021', 'ESSALUD_RESOL. N°972-OSPE-LL-GCSPE-ESSALUD-2021 (05.11.2021)', 'VARIOS', '', 2, '2022/4/21/essalud_resol-n972-ospe-ll-gcspe-essalud-2021-05112021pdf-181431.pdf', '', '2022-04-21 18:10:44', '2022-04-21 18:14:31', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (252, 252, 104, '90-OSPE-LA LIBERTAD-GCSPE-ESSALUD-2022', 'ESSALUD_RESOL. N°090-OSPE-LL-GCSPE-ESSALUD-2022 (15.02.2022)', 'VARIOS', '', 2, '2022/4/21/essalud_resol-n090-ospe-ll-gcspe-essalud-2022-15022022pdf-181540.pdf', '', '2022-04-21 18:14:46', '2022-04-21 18:15:40', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (253, 253, 104, '91-OSPE-LA LIBERTAD-GCSPE-ESSALUD-2022', 'ESSALUD_RESOL. N°091-OSPE-LL-GCSPE-ESSALUD-2022 (15.02.2022)', 'VARIOS', '', 2, '2022/4/21/essalud_resol-n091-ospe-ll-gcspe-essalud-2022-15022022pdf-181643.pdf', '', '2022-04-21 18:15:47', '2022-04-21 18:16:43', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (254, 254, 104, '196-OSPELALIBERTAD-GCSPE-ESSALUD-2022', 'ESSALUD_RESOL. N°196-OSPE-LL-GCSPE-ESSALUD-2022 (22.02.2022)', 'VARIOS', '', 3, '2022/4/28/essalud_resol-n196-ospe-ll-gcspe-essalud-2022-22022022pdf-175531.pdf', 'NIT: 1046-2021-4775', '2022-04-28 17:53:53', '2022-04-28 17:55:31', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (255, 255, 104, '225-OSPELALIBERTAD-GCSPE-ESSALUD-2022', 'ESSALUD_RESOL. N°225-OSPE-LL-GCSPE-ESSALUD-2022 (22.02.2022)', 'VARIOS', '', 3, '2022/4/28/essalud_resol-n225-ospe-ll-gcspe-essalud-2022-22022022pdf-175703.pdf', 'NIT: 8579-2022-99', '2022-04-28 17:55:39', '2022-04-28 17:57:03', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (256, 256, 104, '226-OSPELALIBERTAD-GCSPE-ESSALUD-2022', 'ESSALUD_RESOL. N°226-OSPE-LL-GCSPE-ESSALUD-2022 (22.02.2022)', 'VARIOS', '', 2, '2022/4/28/essalud_resol-n226-ospe-ll-gcspe-essalud-2022-22022022pdf-175858.pdf', 'NIT: 1046-2021-2359', '2022-04-28 17:58:00', '2022-04-28 17:58:58', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (257, 257, 104, '438-OSPELALIBERTAD-GCSPE-ESSALUD-2022', 'ESSALUD_RESOL. N°438-OSPE-LL-GCSPE-ESSALUD-2022 (07.03.2022)', 'VARIOS', '', 3, '2022/4/28/essalud_resol-n438-ospe-ll-gcspe-essalud-2022-07032022pdf-180005.pdf', 'NIT: 8579-2022-955', '2022-04-28 17:59:09', '2022-04-28 18:00:05', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (258, 258, 104, '439-OSPELALIBERTAD-GCSPE-ESSALUD-2022', 'ESSALUD_RESOL. N°439-OSPE-LL-GCSPE-ESSALUD-2022 (07.03.2022)', 'VARIOS', '', 3, '2022/4/28/essalud_resol-n439-ospe-ll-gcspe-essalud-2022-07032022pdf-180111.pdf', 'NIT: 8579-2022-957', '2022-04-28 18:00:11', '2022-04-28 18:01:11', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (259, 259, 110, '568048-2022-INGEMMET', 'INGEMMET_Informe N°4883-2022-INGEMMET-DCM-UTN con Resolución del 19-04-2022 PASCUAL 20 (28.04.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/4/29/ingemmet_informe-n4883-2022-ingemmet-dcm-utn-con-resolucion-del-19-04-2022-pascual-20-28042022pdf-120028.pdf', '', '2022-04-29 11:59:02', '2022-04-29 12:00:28', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (260, 260, 102, 's/n', 'Requerimiento de respuesta a Pago', 'VARIOS', '', 1, '2022/5/3/hewlett-packard-enterprise-requerimiento-de-pago-25042022pdf-180304.pdf', 'Referencia: Contrato Marco de Arrendamiento número\r\n5552667411234336PER1\r\n5552667411234338PER2\r\n5552667411234337PER3', '2022-05-03 17:54:18', '2022-05-03 18:03:04', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (261, 261, 102, 's/n', 'Cargos de Entregas de Contratos yo Adendas (31.03.2022)', 'VARIOS', '', 19, '2022/5/10/varios_cargos-de-entregas-de-contratos-yo-adendas-31032022pdf-165410.pdf', 'DC-1358-22', '2022-05-10 16:48:15', '2022-05-10 16:54:10', 'INTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (262, 262, 100, '124-2022-MPSC-A', 'Oficio N° 124-2022-MPSC-A_Suscripción Contrato Entidad Privada Supervisora (06.03.2022)', 'VARIOS', '', 10, '2022/5/10/mpsc_oficio-n-124-2022-mpsc-a_suscripcion-contrato-entidad-privada-supervisora-06032022pdf-171104.pdf', 'Referencia: Proyecto de Inversión \"MEJORAMIENTO DEL SERVICIO DE MOVILIDAD URBANA EN CALLE PARANSHIQUE CUADRAS DE LA 1 A LA 5, JUNTA VECINAL N°010 DEL DISTRITO DE HUAMACHUCO - PROVINCIA DE SANCHEZ CARRON - DPTO. DE LA LIBERTAD\" con CUI 2490271', '2022-05-10 17:07:08', '2022-05-10 17:11:04', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (263, 263, 100, '223-2022-2JPLW-CSJCU/PJ-Mgr.', 'Remuneración Mensual', 'VARIOS', '', 1, '2022/5/17/pj-csjcu_oficio-n-223-2022-2jplw-csjcu-pj-mgr-remun-mensual-06052022pdf-110037.pdf', 'Wánchaq, 06 de mayo del 2022.\r\nDemandado: Eyner Malaver Caceres\r\n', '2022-05-17 10:50:24', '2022-05-17 11:00:37', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (264, 264, 100, '442-2022-MPSC/SG', 'MPSC_Oficio N° 442-2022-MG-Notifica Acuerdo de Concejo N°082-2022-MPSC (09-05-2022)', 'VARIOS', '', 3, '2022/5/18/mpsc_oficio-n-442-2022-mg-notifica-acuerdo-de-concejo-n082-2022-mpsc-09-05-2022pdf-122639.pdf', 'Asunto: Notifica Acuerdo de Concejo\r\nRef.    : A.C. N° 082-2022-MPSC ', '2022-05-18 12:17:19', '2022-05-18 12:26:39', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (265, 265, 110, '570069-2022-INGEMMET', 'INGEMMET_Informe N°4592-2022-INGEMMET-DCM-UTN con Resolución 11-04-2022 ROSA AMPARO A.C. 6 (18.05.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 19, '2022/5/19/ingemmet_informe-n4592-2022-ingemmet-dcm-utn-con-resolucion-11-04-2022-rosa-amparo-ac-6-18052022pdf-113841.pdf', '', '2022-05-19 11:35:42', '2022-05-19 11:38:41', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (266, 266, 110, '570082-2022-INGEMMET', 'INGEMMET_Informe N°5617-2022-INGEMMET-DCM-UTN con Resolución 09-05-2022 MI SAYAPULLO 1 (18.05.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 48, '2022/5/19/ingemmet_informe-n5617-2022-ingemmet-dcm-utn-con-resolucion-09-05-2022-mi-sayapullo-1-18052022pdf-114057.pdf', '', '2022-05-19 11:38:51', '2022-05-19 11:40:57', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (267, 267, 108, '-', 'INGEMMET_Solicito Expedición de Avisos Petitorio ROSA AMPARO A.C. 6 (11.05.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 3, '2022/5/19/ingemmet_solicito-expedicion-de-avisos-petitorio-rosa-amparo-ac-6-11052022pdf-143025.pdf', 'Código Único: 01-003758-22-T\r\nFecha de Formulación: 11/05/2022\r\nHora de Formulación: 15:47pm', '2022-05-19 02:20:28', '2022-05-19 14:30:25', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (268, 268, 102, 's/n', 'ASPECDAR_N° Exp. 00436-2022-Audiencia Conciliación por Mynarski International Valuation SAC (18.05.2022)', 'SOCIACION PERUANA DE CONCILIACION Y ARBITRAJE -ASPECOAR', '', 196, NULL, NULL, '2022-05-19 16:14:11', '2022-05-19 16:27:16', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 85);
INSERT INTO `expediente` VALUES (269, 269, 109, '--', 'MINAM_Escrito según Exped. N°00732-2022 del 22-02.22, artículo N°122 TUO-LPAG (27.05.22)', 'MINISTERIO DEL AMBIENTE', '', 23, '2022/5/30/minam_escrito-segun-exped-n00732-2022-del-22-0222-articulo-n122-tuo-lpag-270522pdf-123253.pdf', '2022031523\r\n30/05/022       11:05:22am\r\nClave verificación: 47823', '2022-05-30 12:28:23', '2022-05-30 12:32:53', 'INTERNO', '2022', 'NO', 1, 61, NULL, 59);
INSERT INTO `expediente` VALUES (270, 270, 102, 's/n', 'ASPECDAR_N° Exp. 00436-2022-Invitación N°2 Aud. Conciliac.-Mynarski International Valuation SAC (30.05.2022)', 'SOCIACION PERUANA DE CONCILIACION Y ARBITRAJE -ASP', '', 2, '2022/5/30/aspecdar_n-exp-00436-2022-invitacion-n2-aud-conciliac-mynarski-international-valuation-sac-30052022pdf-165332.pdf', 'N° Exp. 00436-2022\r\n2° Invitación Audiencia de Conciliación', '2022-05-30 16:49:09', '2022-05-30 16:53:32', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 85);
INSERT INTO `expediente` VALUES (271, 271, 109, 's/n', 'BBVA_Traslados cuenta CTS-Martin Yarleque, Manuel Quezada (25.05.2022)', 'VARIOS', '', 2, '2022/5/30/bbva_traslados-cuenta-cts-martin-yarleque-manuel-quezada-25052022pdf-165601.pdf', 'Comunicado y conocimiento a Recursos Humanos', '2022-05-30 16:53:52', '2022-05-30 16:56:01', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (272, 272, 110, '571554-2022-INGEMMET', 'INGEMMET_Inf. N°6258-2022-INGEMMET-DCM-UTN c.Resolución 24-05-2022 KAREAN N°1 (Sander N°1, y Otros) (31.05.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 9, '2022/6/1/ingemmet_inf-n6258-2022-ingemmet-dcm-utn-cresolucion-24-05-2022-karean-n1-sander-n1-y-otros-31052022pdf-112812.pdf', '', '2022-06-01 11:26:52', '2022-06-01 11:28:12', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (273, 273, 100, '495-2022-MPSC-GM', 'MPSC-GM_Oficio N° 495-2022-Solicita copia de documentos para formalizar donación (25.05.2022)', 'VARIOS', '', 4, '2022/6/1/mpsc-gm_oficio-n-495-2022-solicita-copia-de-documentos-para-formalizar-donacion-25052022pdf-145324.pdf', 'Referencia: Oficio N° 167-2022-MPSC/PAT', '2022-06-01 14:49:34', '2022-06-01 14:53:24', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (274, 274, 100, '1139-2022-MP-FN-2°FSCECCCOR-EQ04', 'MP-FN_Oficio N° 1139-2022-MP-FN-2°FSCECCOR-EQ04-Solicita Información (31.05.2022)', 'MINISTERIO PUBLICO', '', 20, '2022/6/3/mp-fn_oficio-n-1139-2022-mp-fn-2fsceccor-eq04-solicita-informacion-31052022pdf-160624.pdf', 'CARPETA FISCAL N° 035-2020\r\nCASO \"EL TORO\"', '2022-06-03 16:03:03', '2022-06-03 16:06:24', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 83);
INSERT INTO `expediente` VALUES (275, 275, 102, '048', 'INGEMMET_Carta N°048-2022-SGC-AP_Acreditac. Pago Vigencia 2022 Conc. Min. (03.06.22)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 7, '2022/6/6/ingemmet_carta-n048-2022-sgc-ap_acreditac-pago-vigencia-2022-conc-min-030622pdf-095012.pdf', 'Código Unico: 01-000762-22-D\r\nFecha de Formulación: 03/06/2022\r\nHora de Formulación: 16:05\r\nReferencia: Certificado de Devolución N° 13751 a nombre de SGC SAC', '2022-06-06 09:45:17', '2022-06-06 09:50:12', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (276, 276, 110, '572420-2022-INGEMMET', 'INGEMMET_Resolución N° 2042-2022-INGEMMET-PE-PM de fecha 31-05-2022-RESPLANDOR XVI (07.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/6/8/ingemmet_resolucion-n-2042-2022-ingemmet-pe-pm-de-fecha-31-05-2022-resplandor-xvi-07062022pdf-113654.pdf', '', '2022-06-08 11:35:20', '2022-06-08 11:36:54', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (277, 277, 108, '-1', 'INGEMMET_Solicitar Actualización de Titularidad ALTA GRACIA 2012 (08.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2022/6/8/ingemmet_solicitar-actualizacion-de-titularidad-alta-gracia-2012-08062022pdf-143933.pdf', 'Ticket de Cola N° M19\r\nFecha de Formulación: 08/06/2022\r\nHora de Formulación: 12:22', '2022-06-08 14:36:21', '2022-06-08 14:39:33', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (278, 278, 108, '0', 'INGEMMET_Solicitar Actualización de Titularidad PIODAN GOLD (08.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 13, '2022/6/8/ingemmet_solicitar-actualizacion-de-titularidad-piodan-gold-08062022pdf-144225.pdf', 'Ticket de Cola N° M19\r\nFecha de Formulación: 08/06/2022\r\nHora de Formulación: 12:22', '2022-06-08 14:40:10', '2022-06-08 14:42:25', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (279, 279, 110, '572624+2022-INGEMMET', 'NGEMMET_Resolución N° 2043-2022-INGEMMET-PE-PM de fecha 31-05-2022-RESPLANDOR XV (08.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/6/9/ingemmet_resolucion-n-2043-2022-ingemmet-pe-pm-de-fecha-31-05-2022-resplandor-xv-08062022pdf-120755.pdf', '', '2022-06-09 12:06:27', '2022-06-09 12:07:55', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (280, 280, 110, '572975-2022-INGEMMET', 'INGEMMET_Informe N°6610-2022-INGEMMET-DCM-UTN con Resolución del 31-05-2022 BAMBILLO (10.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/6/13/ingemmet_informe-n6610-2022-ingemmet-dcm-utn-con-resolucion-del-31-05-2022-bambillo-10062022pdf-110858.pdf', '', '2022-06-13 11:07:10', '2022-06-13 11:08:58', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (281, 281, 110, '573223-2022-INGEMMET', 'INGEMMET_Informe N°6727-2022-INGEMMET-DCM-UTN con Resolución del 01-06-2022 RESPLANDOR 02 (14.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/6/15/ingemmet_informe-n6727-2022-ingemmet-dcm-utn-con-resolucion-del-01-06-2022-resplandor-02-14062022pdf-122724.pdf', '', '2022-06-15 12:25:46', '2022-06-15 12:27:24', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (282, 282, 110, '573390-2022-INGEMMET', 'INGEMMET_Informe N°6729-2022-INGEMMET-DCM-UTN con Resolución del 01-06-2022 URUMACHAY (15.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 7, '2022/6/16/ingemmet_informe-n6729-2022-ingemmet-dcm-utn-con-resolucion-del-01-06-2022-urumachay-15062022pdf-114018.pdf', '', '2022-06-16 11:39:14', '2022-06-16 11:40:18', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (283, 283, 108, '1-', 'INGEMMET_Solicita Información Complementaria Acreditación Vigencia 58 Conc. Min. (17.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 3, '2022/6/17/ingemmet_solicita-informacion-complementaria-acreditacion-vigencia-58-conc-min-17062022pdf-180645.pdf', 'Fecha de Formulación: 17/06/2022\r\nHora de Formulación: 13:45', '2022-06-17 18:04:11', '2022-06-17 18:06:45', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (284, 284, 102, '0068-2022-ANA-AAA.M/LOBM', 'Subsanar Observaciones al expediente de \"Autorización de ejecución de obras en fuentes naturales en la quebrada \"Coigobamba\"(10.06.2022)', 'AUTORIDAD NACIONAL DEL AGUA', '', 2, '2022/6/22/anam_carta-n0068-2022-ana-aaam-lobm-subsanar-observaciones-10062022pdf-124838.pdf', 'Referencia:\r\na) Solicitud, de fecha 03 de junio de 2022\r\nb) Expediente Administrativo CUT N° 92253-2022\r\nc) Resolución Jefatural N° 007-2015-ANA', '2022-06-22 12:43:02', '2022-06-22 12:48:38', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (285, 285, 110, '573960-2022-INGEMMET', 'INGEMMET_Informe N°6862-2022-INGEMMET-DCM-UTN con Resolución del 02-06-2022 PAULINA 200 (22.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/6/23/ingemmet_informe-n6862-2022-ingemmet-dcm-utn-con-resolucion-del-02-06-2022-paulina-200-22062022pdf-114251.pdf', '', '2022-06-23 11:41:19', '2022-06-23 11:42:51', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (286, 286, 104, '', 'RESOLUC. DE EJECUCION COACTIVA N°00871-2022-OEFA-OAD-COAC (31.05.2022)', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 124, '2022/6/23/resoluc-de-ejecucion-coactiva-n00871-2022-oefa-oad-coac-31052022pdf-130855.pdf', 'Actos Administrativos:\r\nResolución Directoral 107-2021-OEFA-DFAI (21.02.2021)\r\nResolución Directoral 01845-2021-OEFA-DFAI (27.07.2021)', '2022-06-23 13:00:28', '2022-06-23 13:08:55', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (287, 287, 100, '635-2022-MPSC/SG', 'MPSC_Oficio N° 635-2022-MPSC-SG_Convenio Inversión Local N° 02-Mejoram. Servicio Mov. Urbana (22.06.2022)', 'VARIOS', '', 20, '2022/6/27/mpsc_oficio-n-635-2022-mpsc-sg_convenio-inversion-local-n-02-mejoram-servicio-mov-urbana-22062022pdf-155834.pdf', '', '2022-06-27 15:40:46', '2022-06-27 15:58:34', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (289, 288, 104, '152-OSPE-LL-GCSPE-ESSALUD-2022', 'ESSALUD_RESOL. N°152-OSPE-LL-GCSPE-ESSALUD-2022 (16.02.2022)', 'VARIOS', '', 3, '2022/6/28/essalud_resol-n152-ospe-ll-gcspe-essalud-2022-16022022pdf-180150.pdf', '', '2022-06-28 18:00:16', '2022-06-28 18:01:50', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (290, 290, 110, '574474-2022-INGEMMET', 'INGEMMET_Informe N°7227-2022-INGEMMET-DCM-UTN con Resolución del 09-06-2022 RESPLANDOR XIII (27.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 14, '2022/6/30/ingemmet_informe-n7227-2022-ingemmet-dcm-utn-con-resolucion-del-09-06-2022-resplandor-xiii-27062022pdf-144219.pdf', '', '2022-06-30 14:37:49', '2022-06-30 14:42:19', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (291, 291, 110, '574744-22022-INGEMMET', 'INGEMMET_Informe N° 7523-2022-INGEMMET-DCM-UTN con Resolución del 21-06-2022 MAURO V (30.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 7, '2022/7/1/ingemmet_informe-n-7523-2022-ingemmet-dcm-utn-con-resolucion-del-21-06-2022-mauro-v-30062022pdf-115026.pdf', '', '2022-07-01 11:46:42', '2022-07-01 11:50:26', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (292, 292, 104, '00360-2022-OEFA/OAD-COAC', 'RESOLUCIÓN COACTIVA N° 00360-2022-OEFA-OAD-COAC_Exped. 0871-2022 (23.06.2022)', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 2, '2022/7/5/resolucion-coactiva-n-00360-2022-oefa-oad-coac_exped-0871-2022-23062022pdf-111955.pdf', '', '2022-07-05 11:17:01', '2022-07-05 11:19:55', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (293, 293, 102, '0522022-SGC/AP', 'MEM_Presenta Levantam. Observac. Formato Digital (USB) Exp. 331465 21.06 (22.06.2022)', 'MINISTERIO DE ENERGIA Y MINAS', '', 19, '2022/7/6/mem_presenta-levantam-observac-formato-digital-usb-exp-331465-2106-22062022pdf-173843.pdf', 'Referencia:   Expediente 3319465 de fecha 21.06.2022.\r\n                      Informe N° 0027-2022-MINEM-DGM-DTM/PM\r\n                      Número de Expediente 3248450', '2022-07-06 17:27:00', '2022-07-06 17:38:43', 'INTERNO', '2022', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (294, 294, 102, '058-2022-SGC/AP', 'SOLICITUD DE REUNION', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 1, '2022/7/7/oefa_carta-n058-2022-sgc-ap-solicitud-de-reunion-2022-e01-061296_cargo-06072022pdf-103953.pdf', 'Referencia:  a) Informe Supervisión N° 00225-2022-OEFA/DSEM-CMIN del 28           \r\n                         de junio del 2022\r\n                     b) Resolución N° 00009-2021-OEFA/DSEM', '2022-07-07 10:32:41', '2022-07-07 10:39:53', 'INTERNO', '2022', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (295, 295, 100, '553-2022-EXP. N° 069-2022-0-1608-JP-FC-01-NCP', 'CSJLL_JPLH_Oficio N°0553-2022-EXP. 069-202-Remita Informe (17-05-2022)', 'VARIOS', '', 1, '2022/7/7/csjll_jplh_oficio-n0553-2022-exp-069-202-remita-informe-17-05-2022pdf-161128.pdf', '', '2022-07-07 16:09:34', '2022-07-07 16:11:28', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (296, 296, 100, '554-2022-EXP. 069-2022-0-1608-JP-FC-01-CJVO', 'CSJLL_JPLH_Oficio N°0554-2022-EXP. 069-202-Solita Descuento (17-05-2022)', 'VARIOS', '', 1, '2022/7/7/csjll_jplh_oficio-n0554-2022-exp-069-202-solita-descuento-17-05-2022pdf-161241.pdf', '', '2022-07-07 16:11:38', '2022-07-07 16:12:41', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (297, 297, 108, '-', 'INGEMMET_Devolución de Pagos SGC I (07.07.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2022/7/7/ingemmet_devolucion-de-pagos-sgc-i-07072022pdf-161941.pdf', '', '2022-07-07 16:14:31', '2022-07-07 16:19:41', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (298, 298, 108, '-', 'INGEMMET_Devolución de Pagos RADIANTE III (07.07.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 3, '2022/7/7/ingemmet_devolucion-de-pagos-radiante-iii-07072022pdf-162036.pdf', '', '2022-07-07 16:19:47', '2022-07-07 16:20:36', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (299, 299, 102, '001-2022-OEFA OAD UFI', 'CARTA CIRCULAR N 0001-2022-OEFA OAD UFI-Capacitación Nuevo Sistema Aporte Regulación (07.07.22)', 'ORGANISMO DE EVALUACION Y FISCALIZACION AMBIENTAL', '', 2, '2022/7/8/carta-circular-n-0001-2022-oefa-oad-ufi-capacitacion-nuevo-sistema-aporte-regulacion-070722pdf-144008.pdf', '', '2022-07-08 14:36:34', '2022-07-08 14:40:08', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 57);
INSERT INTO `expediente` VALUES (300, 300, 102, '1649-2022-JUS/DGTAIPD-DPDP', 'MINJUS_DPDP_Carta N°1649-2022-JUSDGTAIPD-DPDP (06.07.2022)', 'VARIOS', '', 3, '2022/7/12/minjus_dpdp_carta-n1649-2022-jusdgtaipd-dpdp-06072022pdf-114702.pdf', 'Expediente N°908-2022-PJ (30.06.2022)', '2022-07-12 11:43:33', '2022-07-12 11:47:02', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (301, 301, 102, '059-2022-SGC/AP', 'MEM_Carta N°059-2022-SGC-AP-Carta Fianza Original N°R1688-00-2022 Actualiz. PCM (12.07.2022)', 'MINISTERIO DE ENERGIA Y MINAS', '', 4, '2022/7/12/mem_carta-n059-2022-sgc-ap-carta-fianza-original-nr1688-00-2022-actualiz-pcm-12072022pdf-124128.pdf', 'Referencia:  Expediente N° 3248450\r\n                     Informe N° 0021-2022-MINEM-DGM-DTM/´,\r\nAtención:      Ing. Rudy Raffo Yauyo Verastegui\r\n                     Dirección Técnica Minera', '2022-07-12 12:34:19', '2022-07-12 12:41:28', 'INTERNO', '2022', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (302, 302, 102, '129-2022-PEC/proy.smarcos', 'PEC_Carta N°129-2022-PEC-proy.smarcos-Solicito Información Existencias Estructuras Mineras Conc. Min. R.A. 5 (26.05.2022)', 'VARIOS', '', 1, '2022/7/13/pec_carta-n129-2022-pec-proysmarcos-solicito-informacion-existencias-estructuras-mineras-conc-min-ra-5-26052022pdf-163816.pdf', 'Referencia:\r\na) CONTRATO N° 101-2021-MTC/20.2\r\nESTUDIO DEFINITIVO PARA LA \"CULMINACION DE LAS OBRAS DE LA CARRETERA LONGITUDINAL DE LA SIERRA (PE-3N), TRAMOS: SAN MARCOS, CAJABAMBA, COCHABAMBA - CHOTA - HUALGAYOC - DV. YANACOCHA, EN EL DEPARTAMENTO DE CAJAMARCA Y EL SECTOR: HUAMACHUCO - SACSACOCHA - PUENTE PALLAR EN EL DEPARTAMENTO DE LA LIBERTAD\"', '2022-07-13 16:27:32', '2022-07-13 16:38:16', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 0);
INSERT INTO `expediente` VALUES (303, 303, 100, '0456-2022-INGEMMET/DC', 'INGEMMET_Oficio N°0456-2022-INGEMMET-DC_Remito Información Solicitada (21.06.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 7, '2022/7/14/ingemmet_oficio-n0456-2022-ingemmet-dc_remito-informacion-solicitada-21062022pdf-114132.pdf', 'Referencia:\r\nOficio N° 00306-2022-ARCC/DE/DSI\r\nOficio N° 0160-2022-INGEMMET/DC\r\nOficio N° 00643-2022-ARCC/DE/DSI\r\nOficio N° 305-2022-ARCC/GG/OA', '2022-07-14 11:36:24', '2022-07-14 11:41:32', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (304, 304, 102, 'S/N', 'BBVA_Traslado de CTS Sedul Jesus Henriquez Escobedo (07.07.2022)', 'VARIOS', '', 1, '2022/7/14/bbva_traslado-de-cts-sedul-jesus-henriquez-escobedo-07072022pdf-164528.pdf', '', '2022-07-14 16:40:50', '2022-07-14 16:45:28', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (305, 305, 110, '576745-2022-INGEMMET', 'INGEMMET_Informe N° 8256-2022-INGEMMET-DCM-UTN con Resolución del 07-06-2022 RESPLANDOR XIX (15.07.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/7/18/ingemmet_informe-n-8256-2022-ingemmet-dcm-utn-con-resolucion-del-07-06-2022-resplandor-xix-15072022pdf-125015.pdf', '', '2022-07-18 11:41:50', '2022-07-18 12:50:15', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (306, 306, 100, '608-2022-MPSC-GM', 'MPSC_GM_Oficio N° 608-2022-Valorización de Obra N° 01 - Ejecución Contiene 387 folios+CD (12.07.2022)', 'VARIOS', '', 394, '2022/7/18/mpsc_gm_oficio-n-608-2022-valorizacion-de-obra-n-01-ejecucion-contiene-387-folioscd-12072022pdf-170427.pdf', '', '2022-07-18 16:51:00', '2022-07-18 17:04:27', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (307, 307, 110, '577125-2022-INGEMMET', 'INGEMMET_Informe N° 8128-2022-INGEMMET-DCM-UTN con Resolución del 04-07-2022 AMANDITA CUATRO (18.07.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/7/19/ingemmet_informe-n-8128-2022-ingemmet-dcm-utn-con-resolucion-del-04-07-2022-amandita-cuatro-18072022pdf-120430.pdf', '', '2022-07-19 12:00:49', '2022-07-19 12:04:30', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (308, 308, 110, '1', '_WORDLCOB CSR 2011.03 (Placa y Certificados) 22.06.2022', 'VARIOS', '', 1, '2022/7/19/_wordlcob-csr-201103-placa-y-certificados-22062022pdf-125238.pdf', '', '2022-07-19 12:50:52', '2022-07-19 12:52:38', 'INTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (309, 309, 108, '-', 'INGEMMET_Solicitud División Derechos Mineros ROSA AMPARO A.C. 6 (19.07.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 9, '2022/7/19/ingemmet_solicitud-division-derechos-mineros-rosa-amparo-ac-6-19072022pdf-173144.pdf', 'TICKET DE COLA N° M30\r\nCódigo Único: 01-005584-22-T\r\nFecha de Formulación: 19/07/2022, Hora: 14:43', '2022-07-19 17:24:00', '2022-07-19 17:31:44', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (310, 310, 102, '66-OSPE-LA LIBERTAD-GCSPE-ESSALUD-2022', 'ESSALUD_Carta N° 66-OSPE-LA LIBERTAD-GCSPE-ESSALUD-2022 (11.07.2022)', 'VARIOS', '', 2, '2022/7/19/essalud_carta-n-66-ospe-la-libertad-gcspe-essalud-2022-11072022pdf-175042.pdf', 'Devolución Pago Indebido - INCAPACIDAD 070E101495', '2022-07-19 17:48:37', '2022-07-19 17:50:42', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (311, 311, 102, ' 68-OSPE-LA LIBERTAD-GCSPE-ESSALUD-2022', 'ESSALUD_Carta N° 68-OSPE-LA LIBERTAD-GCSPE-ESSALUD-2022 (11.07.2022)', 'VARIOS', '', 2, '2022/7/19/essalud_carta-n-68-ospe-la-libertad-gcspe-essalud-2022-11072022pdf-175223.pdf', 'Devolución Pago Indebido - INCAPACIDAD 070E101495', '2022-07-19 17:50:56', '2022-07-19 17:52:23', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (314, 312, 102, '000808-2022-DCIA/MC', 'MC_Carta N° 808-2022-DCIA-MC-Autorizac. Proy. Evaluac. Arqueológico Poligonal del Sito Cajón 3 (18.07.2022)', 'VARIOS', '', 3, '2022/7/25/mc_carta-n-808-2022-dcia-mc-autorizac-proy-evaluac-arqueologico-poligonal-del-sito-cajon-3-18072022pdf-155957.pdf', 'REFERENCIA: Expediente N° 2022-0066936 de fecha 28.06.2022', '2022-07-25 15:45:32', '2022-07-25 15:59:57', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (315, 315, 110, '577714-2022-INGEMMET', 'INGEMMET_Resolución N° 2688-2022-INGEMMET-PE-PM de fecha 13-07-2022-RESPLANDOR XI (25.07.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/7/26/ingemmet_resolucion-n-2688-2022-ingemmet-pe-pm-de-fecha-13-07-2022-resplandor-xi-25072022pdf-114128.pdf', '', '2022-07-26 11:39:21', '2022-07-26 11:41:28', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (316, 316, 109, '133025', 'BCP_Escrito 133025-Envío de Estados de cuenta CTS semestrales Dic-2021-May-2022 (Mayo-2022)', 'BANCO DE CREDITO DEL PERU', '', 1, '2022/8/2/bcp_escrito-133025-envio-de-estados-de-cuenta-cts-semestrales-dic-2021-may-2022-mayo-2022pdf-143218.pdf', 'Adjunta sobre cerrado', '2022-08-02 14:27:16', '2022-08-02 14:32:18', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 86);
INSERT INTO `expediente` VALUES (317, 317, 102, '', 'Supplies & Services SA_Inscripción como proveedor (22.07.2022)', 'VARIOS', '', 4, '2022/8/5/supplies-services-sa_inscripcion-como-proveedor-22072022pdf-110908.pdf', '', '2022-08-05 11:05:00', '2022-08-05 11:09:08', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (318, 318, 104, 'N° 0156-2022-ANA-DCERH', 'ANA_Resolución Directoral N° 156-2022-ANA-DCERH-RD N° 0079-2022-ANA-DCERH (26.07.2022)', 'AUTORIDAD NACIONAL DEL AGUA', '', 55, '2022/8/5/ana_resolucion-directoral-n-156-2022-ana-dcerh-rd-n-0079-2022-ana-dcerh-26072022pdf-111347.pdf', 'Resolución Directoral N° 0079-2022-ANA-DCERH de fecha 08/04/2022', '2022-08-05 11:10:26', '2022-08-05 11:13:47', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (319, 319, 108, '-', 'ACREDITA TITULARIDAD ALFONSO 400', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2022/8/9/ingemmet_acredita-titularidad-alfonso-400-09082022pdf-155543.pdf', 'CODIGO UNICO: 01-006079-22-T\r\n09/08/2022\r\n12:00', '2022-08-09 15:45:29', '2022-08-09 15:55:43', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (320, 320, 100, '637-2022-MPSC-GM', '306_MPSC_GM_Oficio N° 608-2022-Valorización de Obra N° 01 - Ejecución Contiene 387 folios+CD (12.07.2022)', 'VARIOS', '', 382, '2022/8/9/mpsc_gm_oficio-n-637-2022-valorizacion-de-obra-n-02-ejecucion-contiene-382-folioscd-27072022pdf-181320.pdf', 'Adjunta Expediente', '2022-08-09 18:07:45', '2022-08-09 18:13:20', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (321, 321, 105, '10662-2022-JP-FC', 'PJ-CSJLL_Oficio N° 379-2022-JPL-MBJ-LE-CSJL-EXP. N°585-2020-0-FC-LBB-Ramirez Paredes Romulo R. (20.06.2022)', 'PODER JUDICIAL DEL PERU', '', 7, '2022/8/11/pj-csjll_oficio-n-379-2022-jpl-mbj-le-csjl-exp-n585-2020-0-fc-lbb-ramirez-paredes-romulo-r-20062022pdf-125009.pdf', '', '2022-08-11 12:43:08', '2022-08-11 12:50:09', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 69);
INSERT INTO `expediente` VALUES (322, 322, 102, '455-DE/FE-2022', 'FONDOEMPLEO_Carta Notarial N° 455-DE-FE-2022-Pendiente saldo remanente declarado 2021 (11.08.2022)', 'VARIOS', '', 3, '2022/8/15/fondoempleo_carta-notarial-n-455-de-fe-2022-pend-saldo-reman-declar-2021-11082022pdf-100302.pdf', 'Referencias: Carta N° 204-DE/FE-2022\r\n                     Carta N° 224-DE/FE-2022\r\n                     Carta N° 295-DE/FE-2022', '2022-08-15 09:55:42', '2022-08-15 10:03:02', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (323, 323, 104, '03200200003438', 'SUNAT_Resolución de Multa N°0320020003438-FF01-00012752 (04.08.2022)', 'SUPERINTENDENCIA NACIONAL DE ADUANAS Y DE ADMINISTRACION TRIBUTARIA', '', 2, '2022/8/16/sunat_resolucion-de-multa-n0320020003438-ff01-00012752-04082022pdf-111754.pdf', '', '2022-08-16 11:08:43', '2022-08-16 11:17:53', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 87);
INSERT INTO `expediente` VALUES (324, 324, 110, '579762-2022-INGEMMET', 'INGEMMET_Informe N°9096-2022-INGEMMET-DCM-UTN con Resolución del 25-07-2022 RESPLANDOR VIII (17.08.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 5, '2022/8/18/ingemmet_informe-n9096-2022-ingemmet-dcm-utn-con-resolucion-del-25-07-2022-resplandor-viii-17082022pdf-110501.pdf', '', '2022-08-18 11:01:39', '2022-08-18 11:05:01', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (325, 325, 110, '580205-2022-INGEMMET', 'INGEMMET_Informe N°009820-2022-INGEMMET-DCM-UTN con Resolución del 12-08-2022 MAURO 2 (19.08.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 7, '2022/8/22/ingemmet_informe-n009820-2022-ingemmet-dcm-utn-con-resolucion-del-12-08-2022-mauro-2-19082022pdf-120707.pdf', '', '2022-08-22 11:56:26', '2022-08-22 12:07:07', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (326, 326, 111, '8887-2022', 'MP-FP_Caso N° 506015703-2020-61-0_Actos de Conversión y Transferencia (17.08.2022)', 'MINISTERIO PUBLICO', '', 65, '2022/8/22/mp-fp_caso-n-506015703-2020-61-0_actos-de-conversion-y-transferencia-17082022pdf-121021.pdf', 'CEDULA DE NOTIFICACION 8887-2022\r\nMuy Urgente', '2022-08-22 12:07:21', '2022-08-22 12:10:21', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 83);
INSERT INTO `expediente` VALUES (327, 327, 110, '580334-2022-INGEMMET', 'INGEMMET_Informe N°9524-2022-INGEMMET-DCM-UTN con Resolución del 04-08-2022 ALFONSO III (22.08.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/8/23/ingemmet_informe-n9524-2022-ingemmet-dcm-utn-con-resolucion-del-04-08-2022-alfonso-iii-22082022pdf-175130.pdf', '', '2022-08-23 17:48:09', '2022-08-23 17:51:30', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (328, 328, 111, '280-084-55895396', 'SAT_Cargo Notificación N° 280-084-55895396-Papeleta Infracción N° VP00335459 (02.08.22)', 'SERVICIO DE ADMINISTRACION TRIBUTARIA DE LIMA', '', 3, '2022/8/26/sat_cargo-notificacion-n-280-084-55895396-papeleta-infraccion-n-vp00335459-020822pdf-121356.pdf', 'Cargo de Notificación\r\n', '2022-08-26 12:09:12', '2022-08-26 12:13:56', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 88);
INSERT INTO `expediente` VALUES (329, 329, 110, '581173-2022-INGEMMET', 'INGEMMET_Resolución N° 3149-2022-INGEMMET-PE-PM de fecha 12-08-2022-DON DIEGO IV (31.082022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 11, '2022/9/1/ingemmet_resolucion-n-3149-2022-ingemmet-pe-pm-de-fecha-12-08-2022-don-diego-iv-31082022pdf-122508.pdf', '', '2022-09-01 12:19:51', '2022-09-01 12:25:08', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (330, 330, 110, '581295-2022-INGEMMET', 'INGEMMET_Informe N° 10045-2022-INGEMMET-DCM-UTN con Resolución del 17-08-2022 ALFONSO IV (01.09.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/9/2/ingemmet_informe-n-10045-2022-ingemmet-dcm-utn-con-resolucion-del-17-08-2022-alfonso-iv-01092022pdf-104727.pdf', '', '2022-09-02 10:46:08', '2022-09-02 10:47:27', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (331, 331, 100, '715-2022-MPSC-GM', 'MPSC_GM_Oficio N° 715-2022-Valorización de Obra N° 01 - Supervisión Contiene 117 folios+CD (24.08.2022)', 'VARIOS', '', 122, '2022/9/5/mpsc_gm_oficio-n-715-2022-valorizacion-de-obra-n-01-supervision-contiene-117-folioscd-24082022pdf-174239.pdf', '', '2022-09-05 17:33:38', '2022-09-05 17:42:39', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (332, 332, 102, '104-2022-MPSC-GM', 'MPSC_GM_Carta N° 104-2022_Riesgo de no contar personal ofertado y acreditado en ejecución convenio (31.08.2022)', 'VARIOS', '', 64, '2022/9/6/mpsc_gm_carta-n-104-2022_riesgo-de-no-contar-personal-ofertado-y-acreditado-en-ejecucion-convenio-31082022pdf-131121.pdf', '', '2022-09-06 12:58:00', '2022-09-06 13:11:21', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (333, 333, 110, '582011-2022-INGEMMET', 'INGEMMET_Resolución N° 3290-2022-INGEMMET-PE-PM de fecha 24-08-2022-ALTA GRACIA 600 (06.09.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/9/7/ingemmet_resolucion-n-3290-2022-ingemmet-pe-pm-de-fecha-24-08-2022-alta-gracia-600-06092022pdf-112452.pdf', '', '2022-09-07 11:23:26', '2022-09-07 11:24:52', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (334, 334, 110, '582074-2022-INGEMMET', 'INGEMMET_Resolución N° 3291-2022-INGEMMET-PE-PM de fecha 24-08-2022-ALTA GRACIA 400 (07.09.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 11, '2022/9/8/ingemmet_resolucion-n-3291-2022-ingemmet-pe-pm-de-fecha-24-08-2022-alta-gracia-400-07092022pdf-113828.pdf', '', '2022-09-08 11:37:05', '2022-09-08 11:38:28', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (335, 335, 110, '582878-2022-INGEMMET', 'INGEMMET_Informe N°9967-2022-INGEMMET-DCM-UTN con Resolución del 12-08-2022 RESPLANDOR XVII (13.09.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 12, '2022/9/14/ingemmet_informe-n9967-2022-ingemmet-dcm-utn-con-resolucion-del-12-08-2022-resplandor-xvii-13092022pdf-114007.pdf', '', '2022-09-14 11:38:13', '2022-09-14 11:40:07', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (336, 336, 110, '583171-2022-INGEMMET', 'INGEMMET_Informe N°9998-2022-INGEMMET-DCM-UTN con Resolución del 15-08-2022 RESPLANDOR XX (14.09.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/9/15/ingemmet_informe-n9998-2022-ingemmet-dcm-utn-con-resolucion-del-15-08-2022-resplandor-xx-14092022pdf-104642.pdf', '', '2022-09-15 10:45:16', '2022-09-15 10:46:42', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (337, 337, 105, '36084-2022-JP-LA', 'CSJLL_Oficio N°06-2022-1JPLT-MCPM-6750-2021-Pago y Reintegro Beneficios Sociales (31-07-2022)', 'VARIOS', '', 5, '2022/9/21/csjll_oficio-n06-2022-1jplt-mcpm-6750-2021-pago-y-reintegro-beneficios-sociales-31-07-2022pdf-112552.pdf', '', '2022-09-21 11:09:54', '2022-09-21 11:25:52', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (338, 338, 110, '584020-2022-INGEMMET', 'INGEMMET_Informe N°10771-2022-INGEMMET-DCM-UTN con Resolución del 08-09-2022 BAMBILLO (22.09.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 5, '2022/9/23/ingemmet_informe-n10771-2022-ingemmet-dcm-utn-con-resolucion-del-08-09-2022-bambillo-22092022pdf-114640.pdf', '', '2022-09-23 11:41:36', '2022-09-23 11:46:40', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (339, 339, 100, '782-2022-MPSC-GM', 'MPSC_GM_Oficio N° 782-2022-Valorización de Obra N° 02 - Supervisón Contiene 163 folios+CD (23.09.2022)', 'VARIOS', '', 163, '2022/9/26/mpsc_gm_oficio-n-782-2022-valorizacion-de-obra-n-02-supervison-contiene-163-folioscd-23092022pdf-160010.pdf', '', '2022-09-26 15:58:26', '2022-09-26 16:00:10', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (340, 340, 100, '00781-2021-Exp. N° 403-2021-0-1608-JP-FC-01-C', 'CSJLL_Oficio N°781-2021-Exp. 403-2021-0-1608-JP-FC-01-CJVO-Descuento correspondiente Trabajador (26.08.2022)', 'VARIOS', '', 3, '2022/9/27/csjll_oficio-n781-2021-exp-403-2021-0-1608-jp-fc-01-cjvo-descuento-correspondiente-trabajador-26082022pdf-154615.pdf', '', '2022-09-27 15:39:02', '2022-09-27 15:46:15', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (341, 341, 104, 'COACTIVA N° 0630071289986', 'SUNAT_Resolución Coactiva N° 0630071289986 Deudor Tributario-Corp. del Norte Ingenieros SAC (04.02.2022)', 'SUPERINTENDENCIA NACIONAL DE ADUANAS Y DE ADMINIST', '', 1, '2022/9/28/sunat_resolucion-coactiva-n-0630071289986-deudor-tributario-corp-del-norte-ingenieros-sac-04022022pdf-173111.pdf', '', '2022-09-28 17:20:14', '2022-09-28 17:31:11', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 87);
INSERT INTO `expediente` VALUES (342, 342, 110, '584300-2022-INGEMMET', 'INGEMMET_Resolución N° 3637-2022-INGEMMET-PE-PM de fecha 16-09-2022-AMANECER 200 (26.09.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/9/28/ingemmet_resolucion-n-3637-2022-ingemmet-pe-pm-de-fecha-16-09-2022-amanecer-200-26092022pdf-173425.pdf', '', '2022-09-28 17:32:40', '2022-09-28 17:34:25', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (343, 343, 110, '584782-2022-INGEMMET', 'INGEMMET_Resolución N° 3711-2022-INGEMMET-PE-PM de fecha 21-09-2022-ALTA GRACIA 200 (28.09.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/9/29/ingemmet_resolucion-n-3711-2022-ingemmet-pe-pm-de-fecha-21-09-2022-alta-gracia-200-28092022pdf-150438.pdf', '', '2022-09-29 15:03:22', '2022-09-29 15:04:38', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (344, 344, 111, 'Tribuna Fiscal N° 05709-9-2022', 'MEF-Tribuna Fiscal N° 05709-9-2022-Expediente 7996-2022 Compensación (10.08.2022)', 'VARIOS', '', 3, '2022/9/30/mef-tribuna-fiscal-n-05709-9-2022-expediente-7996-2022-compensacion-10082022pdf-180359.pdf', '', '2022-09-30 17:50:25', '2022-09-30 18:03:59', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (345, 345, 110, '585480-2022-INGEMMET', 'INGEMMET_Informe N°11529-2022-INGEMMET-DCM-UTN con Resolución del 21-09-2022 RESPLANDOR XIV (30.09.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2022/10/3/ingemmet_informe-n11529-2022-ingemmet-dcm-utn-con-resolucion-del-21-09-2022-resplandor-xiv-30092022pdf-114047.pdf', '', '2022-10-03 11:39:07', '2022-10-03 11:40:47', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (346, 346, 102, 'NOTARIAL S/N', 'Mantilla López Jorge L.._Carta Notarial-Acta Infracción N°016620-2021-SUNAFIL-ILM (23.09.2022)', 'VARIOS', '', 28, '2022/10/3/mantilla-lopez-jorge-l_carta-notarial-acta-infraccion-n016620-2021-sunafil-ilm-23092022pdf-114912.pdf', '', '2022-10-03 11:44:44', '2022-10-03 11:49:12', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (347, 347, 110, '586146-2022-INGEMMET', 'INGEMMET_Informe N° 11719-2022-INGEMMET-DCM-UTN con Resolución del 26-09-2022 RESPLANDOR XIII (05.10.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 6, '2022/10/6/ingemmet_informe-n-11719-2022-ingemmet-dcm-utn-con-resolucion-del-26-09-2022-resplandor-xiii-05102022pdf-164750.pdf', '', '2022-10-06 16:43:01', '2022-10-06 16:47:50', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (348, 348, 100, '859-2022-MPSC/GADM-G', 'MPSC_Oficio N° 859-2022-MPSC-GADM-G-Renovación de Carta Fianza (23.09.2022)', 'VARIOS', '', 7, '2022/10/6/mpsc_oficio-n-859-2022-mpsc-gadm-g-renovacion-de-carta-fianza-23092022pdf-170504.pdf', '', '2022-10-06 17:03:14', '2022-10-06 17:05:04', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (349, 349, 102, 'S/N', 'BCP_Solicitud de Traslados CTS-Ortiz Castrejon Gumercindo (03.10.2022)', 'BANCO DE CREDITO DEL PERU', '', 5, '2022/10/6/bcp_solicitud-de-traslados-cts-ortiz-castrejon-gumercindo-03102022pdf-170716.pdf', '', '2022-10-06 17:05:23', '2022-10-06 17:07:16', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 86);
INSERT INTO `expediente` VALUES (350, 350, 102, 'S/N', 'BCP_Solicitud de Traslados CTS-Bazan Chaman Vanessa del Carmen (03.10.2022)', 'BANCO DE CREDITO DEL PERU', '', 5, '2022/10/6/bcp_solicitud-de-traslados-cts-bazan-chaman-vanessa-del-carmen-03102022pdf-170813.pdf', '', '2022-10-06 17:07:26', '2022-10-06 17:08:13', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 86);
INSERT INTO `expediente` VALUES (351, 351, 110, '586265-2022-INGEMMET', 'INGEMMET_Resolución N° 3858-2022-INGEMMET-PE-PM de fecha 30-09-2022 RADIANTE XVI (06.10.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/10/7/ingemmet_resolucion-n-3858-2022-ingemmet-pe-pm-de-fecha-30-09-2022-radiante-xvi-06102022pdf-112827.pdf', '', '2022-10-07 11:27:15', '2022-10-07 11:28:27', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (352, 352, 110, '587791-2022-INGEMMET', 'INGEMMET_Informe N° 11844-2022-INGEMMET-DCM-UTN con Resolución del 30-09-2022 PULA (Otros) (18.10.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 5, '2022/10/19/ingemmet_informe-n-11844-2022-ingemmet-dcm-utn-con-resolucion-del-30-09-2022-pula-otros-18102022pdf-111412.pdf', '', '2022-10-19 11:08:50', '2022-10-19 11:14:12', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (353, 353, 110, '587983-2022-INGEMMET', 'INGEMMET_Informe N° 12049-2022-INGEMMET-DCM-UTN con Resolución del 12-10-22 ALFONSO 400 (20.10.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 5, '2022/10/21/ingemmet_informe-n-12049-2022-ingemmet-dcm-utn-con-resolucion-del-12-10-22-alfonso-400-20102022pdf-113420.pdf', '', '2022-10-21 11:32:31', '2022-10-21 11:34:20', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (354, 354, 110, '587996-2022-INGEMMET', 'INGEMMET_Inf. 12107-2022-INGEMMET-DCM-UTN con Resolución del 06-10-22 ALFONSO VII (20.10.2022-587996)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/10/21/ingemmet_inf-12107-2022-ingemmet-dcm-utn-con-resolucion-del-06-10-22-alfonso-vii-20102022-587996pdf-113620.pdf', '', '2022-10-21 11:34:29', '2022-10-21 11:36:20', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (355, 355, 110, '587997-2022-INGEMMET', 'INGEMMET_Inf. 12107-2022-INGEMMET-DCM-UTN con Resolución del 06-10-22 ALFONSO VII (20.10.2022-587997)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/10/21/ingemmet_inf-12107-2022-ingemmet-dcm-utn-con-resolucion-del-06-10-22-alfonso-vii-20102022-587997pdf-113748.pdf', '', '2022-10-21 11:36:29', '2022-10-21 11:37:48', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (356, 356, 110, '588600-2022-INGEMMET', 'INGEMMET_Resolución N° 3959-2022-INGEMMET-PE-PM del 12-10-2022 RESPLANDOR IX (24.10.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/10/25/ingemmet_resolucion-n-3959-2022-ingemmet-pe-pm-del-12-10-2022-resplandor-ix-24102022pdf-142033.pdf', '', '2022-10-25 14:11:43', '2022-10-25 14:20:33', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (357, 357, 102, '341-2022-PEC/proy.smarcos', 'PEC_Carta N°341-2022-PEC-proy.smarcos-Reiterat. Solicitud Inform. Existencias Estruct. Mineras R.A. 5 (25.10.22)', 'VARIOS', '', 1, '2022/10/26/pec_carta-n341-2022-pec-proysmarcos-reiterat-solicitud-inform-existencias-estruct-mineras-ra-5-251022pdf-163051.pdf', '', '2022-10-26 16:29:56', '2022-10-26 16:30:51', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (358, 358, 100, '2516-10-2022-DIRNIC-PNP/DIRPOFIS-DIVIDA-DEPID', 'MI-PNP-PF_Of. 2516-10+2022-DIRNIC-PNP-DIRPOFIS-DIVIDA-DEPIDRAC_Solic. Docum. aduanera (28.10.2022)', 'VARIOS', '', 2, '2022/11/2/mi-pnp-pf_of-2516-102022-dirnic-pnp-dirpofis-divida-depidrac_solic-docum-aduanera-28102022pdf-174339.pdf', '', '2022-11-02 17:36:25', '2022-11-02 17:43:39', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (359, 359, 102, '1074-2022-MPSC/S.G.LOG', 'Alcanzar Información', 'VARIOS', '', 3, '2022/11/3/mpsc-sgl_carta-n1074-2022-mpsc-sglog-alcanzar-informacion-25102022pdf-151840.pdf', 'Referencia: Informe N° 0693-2022-MPSC/S.G.LOG/MDQ', '2022-11-03 15:12:22', '2022-11-03 15:18:40', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (360, 360, 102, 'S/N', 'LCT_Carta comunicado reunión sobre situación administrativa, operativa y económica de Junta Propietarios (02-11-2022)', 'VARIOS', '', 1, '2022/11/4/lct_carta-comunicado-reunion-sobre-situacion-administrativa-operativa-y-economica-de-junta-propietarios-02-11-2022pdf-094815.pdf', '', '2022-11-04 09:47:09', '2022-11-04 09:48:15', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (361, 361, 108, '-', 'INGEMMET_Solicito Expedición de Avisos Petitorio ALFONSO VII (04.11.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 4, '2022/11/4/ingemmet_solicito-expedicion-de-avisos-petitorio-alfonso-vii-04112022pdf-143741.pdf', '', '2022-11-04 14:32:08', '2022-11-04 14:37:41', 'INTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (362, 362, 109, '-', 'Información sobre fondos del exterior', 'BANCO INTERAMERICANO DE FINANZAS', '', 2, '2022/11/4/banbif_carta-ref-correo-del-25-10-2022-prohibicion-ingresos-fondos-del-exterior28102022pdf-160847.pdf', '', '2022-11-04 16:02:23', '2022-11-04 16:08:47', 'INTERNO', '2022', 'NO', 1, 61, NULL, 78);
INSERT INTO `expediente` VALUES (363, 363, 110, '590347-2022-INGEMMET', 'INGEMMET_Informe N°12950-2022-INGEMMET-DCM-UTN con Resolución del 27-10-2022 RADIANTE III (04.11.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 13, '2022/11/7/ingemmet_informe-n12950-2022-ingemmet-dcm-utn-con-resolucion-del-27-10-2022-radiante-iii-04112022pdf-111434.pdf', '', '2022-11-07 11:10:44', '2022-11-07 11:14:34', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (364, 364, 100, '0779-2022/MINEM-DGAAM', 'MEM-DGAAM_Oficio N°779-2022-MINEM-DGAAM-Atención a consultas (03-11-2022)', 'MINISTERIO DE ENERGIA Y MINAS', '', 10, '2022/11/7/mem-dgaam_oficio-n779-2022-minem-dgaam-atencion-a-consultas-03-11-2022pdf-111631.pdf', '', '2022-11-07 11:14:43', '2022-11-07 11:16:31', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 51);
INSERT INTO `expediente` VALUES (365, 365, 110, '590827-2022-INGEMMET', 'INGEMMET_Certificado Devolución N° 14630 de fecha 24-10-2022 ALFONSO V (CUADERNO) (08.11.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2022/11/9/ingemmet_certificado-devolucion-n-14630-de-fecha-24-10-2022-alfonso-v-cuaderno-08112022pdf-173916.pdf', '', '2022-11-09 17:20:32', '2022-11-09 17:39:16', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (366, 366, 110, '590828-2022-INGEMMET', 'INGEMMET_Certificado Devolución N° 14631 de fecha 24-10-2022 ALFONSO V (CUADERNO) (08.11.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2022/11/9/ingemmet_certificado-devolucion-n-14631-de-fecha-24-10-2022-alfonso-v-cuaderno-08112022pdf-174035.pdf', '', '2022-11-09 17:39:26', '2022-11-09 17:40:35', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (367, 367, 110, '590829-2022-INGEMMET', 'INGEMMET_Certificado Devolución N° 14632 de fecha 24-10-2022 ALFONSO V (CUADERNO) (08.11.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2022/11/9/ingemmet_certificado-devolucion-n-14632-de-fecha-24-10-2022-alfonso-v-cuaderno-08112022pdf-174142.pdf', '', '2022-11-09 17:40:42', '2022-11-09 17:41:42', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (368, 368, 110, '590830-2022-INGEMMET', 'INGEMMET_Certificado Devolución N° 14633 de fecha 24-10-2022 ALFONSO V (CUADERNO) (08.11.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2022/11/9/ingemmet_certificado-devolucion-n-14633-de-fecha-24-10-2022-alfonso-v-cuaderno-08112022pdf-174239.pdf', '', '2022-11-09 17:41:53', '2022-11-09 17:42:39', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (369, 369, 105, '263756-2022-JR-CI', 'PJ-CSJL_Exp.05849-2022-0-1801-JR-CI-32_Obligac. Dar Dinero-Mynarski International Valuation SAC (21.10.22)', 'PODER JUDICIAL DEL PERU', '', 369, '2022/11/11/pj-csjl_exp05849-2022-0-1801-jr-ci-32_obligac-dar-dinero-mynarski-international-valuation-sac-211022pdf-151406.pdf', '', '2022-11-11 15:08:04', '2022-11-11 15:14:06', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 69);
INSERT INTO `expediente` VALUES (370, 370, 110, '591757-2022-INGEMMET', 'INGEMMET_Certificado Devolución N° 14715 de fecha 02-11-2022 RADIANTE XII (CUADERNO) (15.11.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 4, '2022/11/18/ingemmet_certificado-devolucion-n-14715-de-fecha-02-11-2022-radiante-xii-cuaderno-15112022pdf-113112.pdf', '', '2022-11-18 11:24:38', '2022-11-18 11:31:12', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (371, 371, 110, '592496-2022-INGEMMET', 'INGEMMET_Resolución N° 4359-2022-INGEMMET-PE-PM del 11-11-2022 RESPLANDOR XIX (23.11.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 9, '2022/11/24/ingemmet_resolucion-n-4359-2022-ingemmet-pe-pm-del-11-11-2022-resplandor-xix-23112022pdf-123548.pdf', '', '2022-11-24 12:25:20', '2022-11-24 12:35:48', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (372, 372, 102, '1270-2022-MPSC/S.G.LOG', 'MPSC-SGL_Carta N°1270-2022-MPSCC-SG.LOG-Alcanzar Información (28.11.22)', 'VARIOS', '', 4, '2022/12/6/mpsc-sgl_carta-n1270-2022-mpscc-sglog-alcanzar-informacion-281122pdf-150149.pdf', 'Referencia: INFORME N° 0844-2022-MPSC/S.G.LOG/MDQ', '2022-12-06 14:52:26', '2022-12-06 15:01:49', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (373, 373, 110, '594216-2022-INGEMMET', 'INGEMMET_Resolución N° 4625-2022-INGEMMET-PE-PM del 25-11-2022 RADIANTE XIV (06.12.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/12/7/ingemmet_resolucion-n-4625-2022-ingemmet-pe-pm-del-25-11-2022-radiante-xiv-06122022pdf-121941.pdf', '', '2022-12-07 12:14:14', '2022-12-07 12:19:41', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (374, 374, 110, '594264-2022-INGEMMET', 'INGEMMET_Resolución N° 4599-2022-INGEMMET-PE-PM del 25-11-2022 ALFONSO VI (06.12.2022)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2022/12/7/ingemmet_resolucion-n-4599-2022-ingemmet-pe-pm-del-25-11-2022-alfonso-vi-06122022pdf-122217.pdf', 'Entregado a Lizzete Aguilar', '2022-12-07 12:20:37', '2022-12-07 12:22:17', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (375, 375, 110, 'S/N', 'SOLICITA REUNION VIRTUAL O PRESENCIAL, MIERCOLES 21-12-2022 15:00PM', 'VARIOS', '', 1, '2022/12/21/upc_carta-del-191222-solicita-reunion-virtual-o-presencial-211222pdf-105341.pdf', '', '2022-12-21 10:52:01', '2022-12-21 10:53:41', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (376, 376, 102, 'DPTO COB/0125579/2022', 'COBRANZA DE POLIZA MUILTIRIESGOS N°220023238 VENCIDO EL 06-12-2022', 'VARIOS', '', 1, '2022/12/26/la-positiva-seguros_carta-dpto-cob-0125579-2022-cobranza-poliza-multiriesgos-n-220023238-231222pdf-152255.pdf', '', '2022-12-26 14:45:57', '2022-12-26 15:22:55', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (377, 377, 110, 'DPTO COB/0125767/2022', 'La Positiva Seguros_Carta DPTO COB-0125767-2022-Cobranza póliza Robo y Asalto N° 220023049 (23.12.22)', 'VARIOS', '', 1, '2022/12/26/la-positiva-seguros_carta-dpto-cob-0125767-2022-cobranza-poliza-robo-y-asalto-n-220023049-231222pdf-152451.pdf', '', '2022-12-26 15:23:42', '2022-12-26 15:24:51', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (378, 378, 102, '', 'Confirmación de Servicio', 'VARIOS', '', 2, '2022/12/29/universidad-esan_carta-de-aceptacion-de-servicio-confirmacion-de-servicio-04112022pdf-130318.pdf', '', '2022-12-29 13:01:28', '2022-12-29 13:03:18', 'INTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (379, 379, 100, '01220-2022-EXP.856-2022-0-1608-JP-FC-01-CJVO', 'CSJLL-JPLH_OF.1220-2022-Exp.856-2022-0-1608-JP-FC-01-CJVO Dscto. renum. (05.12.2022)', 'VARIOS', '', 1, '2023/1/12/csjll-jplh_of1220-2022-exp856-2022-0-1608-jp-fc-01-cjvo-dscto-renum-05122022pdf-093129.pdf', '', '2023-01-12 09:24:53', '2023-01-12 09:31:29', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (380, 380, 102, 'DPTO COB/0127946/2022', 'PAGO POLIZA DE DOMICILIARIO N° 220023198 (06.01.2023)', 'VARIOS', '', 1, '2023/1/12/la-positiva_carta-dpto-cob-0127946-2022-cobro-poliza-06012023pdf-175836.pdf', '', '2023-01-12 17:41:01', '2023-01-12 17:58:36', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (381, 381, 100, '101-2023-EXP. N°0069-2022-0-1608-JP-FC-01-CJV', 'Realizar Descuentos en Remuneración-Moreno Sanchez Oscar E.', 'PODER JUDICIAL DEL PERU', '', 30, '2023/1/30/pj-csjll_of101-2023-exp69-2022-0-1608-jp-fc-01-cjvo-dsctoremun-090123pdf-154722.pdf', 'ADJUNTA EXPEDIENTE: 00069-2022-0-168-JP-FC-01\r\nSENTENCIA', '2023-01-30 15:37:35', '2023-01-30 15:47:22', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 69);
INSERT INTO `expediente` VALUES (382, 382, 110, '601321-2023-INGEMMET', 'INGEMMET_Informe N°735-2023-INGEMMET-DCM-UTN con Resolución del 24-01-2023 RADIANTE III (03.02.2023)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 7, '2023/2/14/ingemmet_informe-n735-2023-ingemmet-dcm-utn-con-resolucion-del-24-01-2023-radiante-iii-03022023pdf-130536.pdf', '', '2023-02-14 12:52:19', '2023-02-14 13:05:36', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (383, 383, 110, '601325-2023-INGEMMET', 'INGEMMET_Informe N°734-2023-INGEMMET-DCM-UTN con Resolución del 24-01-2023 RADIANTE III-A (03.02.2023)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 6, '2023/2/14/ingemmet_informe-n734-2023-ingemmet-dcm-utn-con-resolucion-del-24-01-2023-radiante-iii-a-03022023pdf-130728.pdf', '', '2023-02-14 13:06:25', '2023-02-14 13:07:28', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (384, 384, 110, '601567-2023-INGEMMET', 'INGEMMET_Resolución N° 255-2023-INGEMMET-PE-PM del 25-01-2023 MAURO 2 (06.02.2023)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 9, '2023/2/14/ingemmet_resolucion-n-255-2023-ingemmet-pe-pm-del-25-01-2023-mauro-2-06022023pdf-130911.pdf', '', '2023-02-14 13:07:41', '2023-02-14 13:09:11', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (385, 385, 110, '602153-2023-INGEMMET', 'INGEMMET_Resolución N° 351-2023-INGEMMET-PE-PM del 27-01-2023 RESPLANDOR XVII (08.02.2023)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 9, '2023/2/14/ingemmet_resolucion-n-351-2023-ingemmet-pe-pm-del-27-01-2023-resplandor-xvii-08022023pdf-131018.pdf', '', '2023-02-14 13:09:16', '2023-02-14 13:10:18', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (386, 386, 110, '602724-2023-INGEMMET', 'INGEMMET_Resolución N° 494-2023-INGEMMET-PE-PM del 06-02-2023 ALFONSO III (13.02.2023)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 6, '2023/2/20/ingemmet_resolucion-n-494-2023-ingemmet-pe-pm-del-06-02-2023-alfonso-iii-13022023pdf-171431.pdf', '', '2023-02-20 17:12:47', '2023-02-20 17:14:31', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (387, 387, 102, '-', 'Notaria Carlos Herrera Carrera-Carta Notarial 02.02.2023 -Polo Espejo Fernando M (06.02.2023)', 'VARIOS', '', 2, '2023/2/21/notaria-carlos-herrera-carrera-carta-notarial-02022023-polo-espejo-fernando-m-06022023pdf-122207.pdf', '', '2023-02-21 12:19:36', '2023-02-21 12:22:07', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (388, 388, 110, '603708-2023-INGEMMET', 'INGEMMET_Inf. N°1797-2023-INGEMMET-DCM-UTN con Resoluc. del 14-02-23 PANCHITA 200 (21.02.23)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 5, '2023/2/28/ingemmet_inf-n1797-2023-ingemmet-dcm-utn-con-resoluc-del-14-02-23-panchita-200-210223pdf-113931.pdf', '', '2023-02-28 11:37:38', '2023-02-28 11:39:31', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (389, 389, 110, '603716-2023-INGEMMET', 'INGEMMET_Resolución N° 480-2023-INGEMMET-PE-PM del 06-02-23 RESPLANDOR 02 (21.02.23)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2023/2/28/ingemmet_resolucion-n-480-2023-ingemmet-pe-pm-del-06-02-23-resplandor-02-210223pdf-114118.pdf', '', '2023-02-28 11:40:15', '2023-02-28 11:41:18', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (390, 390, 104, '124-2022-ANA-TNRCH', 'ANA_Resolución N°124-2022-ANA-TNRCH Autorizac. Ejec. Obras Fte. Natural (23.02.22)', 'AUTORIDAD NACIONAL DEL AGUA', '', 13, '2023/3/7/ana_resolucion-n124-2022-ana-tnrch-autorizac-ejec-obras-fte-natural-230222pdf-124639.pdf', '', '2023-03-07 12:43:30', '2023-03-07 12:46:39', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (391, 391, 110, '605020-2023-INGEMMET', 'INGEMMET_Resolución N° 611-2023-INGEMMET-PE-PM del 14-02-23 URUMACHAY (07.03.23)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2023/3/14/ingemmet_resolucion-n-611-2023-ingemmet-pe-pm-del-14-02-23-urumachay-070323pdf-104734.pdf', '', '2023-03-14 10:42:25', '2023-03-14 10:47:34', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (392, 392, 102, '076-2023-MPSC/GADM', 'MPSC_Carta N°076-2023-MPSC-GADM Solicita Renovación de Carta Fianza (17.03.2023)', 'VARIOS', '', 4, '2023/3/22/mpsc_carta-n076-2023-mpsc-gadm-solicita-renovacion-de-carta-fianza-17032023pdf-180806.pdf', '', '2023-03-22 18:06:20', '2023-03-22 18:08:06', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (393, 393, 100, '115-2023-DGPA/MC', 'MC_Oficio N°000115-2023-DGPA-MC-X Congreso Nacional de Arqueología (13.03.23)', 'MINISTERIO DE CULTURA', '', 1, '2023/3/27/mc_oficio-n000115-2023-dgpa-mc-x-congreso-nacional-de-arqueologia-130323pdf-102441.pdf', '', '2023-03-27 10:19:02', '2023-03-27 10:24:41', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 89);
INSERT INTO `expediente` VALUES (394, 394, 102, '-', '03 CARTAS CTS NO TRASLADADOS', 'BANCO BBVA PERU', '', 3, '2023/3/27/bbva_cartas-del-20-03-cts-no-trasladadospdf-163153.pdf', '', '2023-03-27 16:28:10', '2023-03-27 16:31:53', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 90);
INSERT INTO `expediente` VALUES (395, 395, 110, '606067-2023-INGEMMET', 'INGEMMET_Resolución N° 698-2022-INGEMMET-PE-PM del 15-02-2023-DIOS BENDICE 2021 (27.03.2023)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 78, '2023/3/28/ingemmet_resolucion-n-698-2022-ingemmet-pe-pm-del-15-02-2023-dios-bendice-2021-27032023pdf-111449.pdf', 'Adjunta 03 Actas de Notificación Personal\r\nN° 606067-2023-INGEMMET\r\nN° 606068-2023-INGEMMET\r\nN° 606069-2023-INGEMMET', '2023-03-28 11:02:57', '2023-03-28 11:14:49', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (396, 396, 102, '538-XIV CONAMIN-INSC 2023/CIP CD LIMA', 'CONAMIN_Carta N° 538-XIV CONAMIN-INSC 2023-CIP CD LIMA-Entrega de 75 pases (28.03.2023)', 'VARIOS', '', 1, '2023/3/31/conamin_carta-n-538-xiv-conamin-insc-2023-cip-cd-lima-entrega-de-75-pases-28032023pdf-113805.pdf', 'Remite 75 pases a Feria MAQ-EMIN 2023', '2023-03-31 11:35:13', '2023-03-31 11:38:05', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (397, 397, 110, '606496-2023-INGEMMET', 'INGEMMET_Inf. N°2867-2023-INGEMMET-DCM-UTN con Resoluc. del 15-03-23 RESPLANDOR XVIII (31.03.23)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 9, '2023/4/3/ingemmet_inf-n2867-2023-ingemmet-dcm-utn-con-resoluc-del-15-03-23-resplandor-xviii-310323pdf-120251.pdf', '', '2023-04-03 11:56:17', '2023-04-03 12:02:51', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (398, 398, 100, '42-2017-FC-JPLC-DNC', 'CSJA_Oficio N°42-2017-FC-JPLC-DNC-Remuneración Nicolás Suni Velazco (08.03.23)', 'VARIOS', '', 1, '2023/4/3/csja_oficio-n42-2017-fc-jplc-dnc-remuneracion-nicolas-suni-velazco-080323pdf-125930.pdf', '', '2023-04-03 12:29:11', '2023-04-03 12:59:30', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (399, 399, 110, '607013-2023-INGEMMET', 'INGEMMET_Inf. N°3017-2023-INGEMMET-DCM-UTN con Resoluc. del 23-03-23 RADIANTE III (04.04.23)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2023/4/5/ingemmet_inf-n3017-2023-ingemmet-dcm-utn-con-resoluc-del-23-03-23-radiante-iii-040423pdf-120801.pdf', '', '2023-04-05 12:02:45', '2023-04-05 12:08:01', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (400, 400, 100, '203-2023-0-1704-JP-FC-01', 'CSJSI_PL_Oficio N°203-2023-0-1704-JP-FC-01-Informar Demandado y Descuento Pensión Alimentos (20.04.2023)', 'VARIOS', '', 2, '2023/5/2/csjsi_pl_oficio-n203-2023-0-1704-jp-fc-01-informar-demandado-y-dscto-pension-alimentos-20042023pdf-122414.pdf', '', '2023-05-02 12:21:19', '2023-05-02 12:24:14', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (401, 401, 103, '0106-2023-ANA-TNRCH-ST', 'TNRCH-ST_ANA_Informe Legal N°0106-2023-Expediente CUT N° 181220-2021 (21.04.23)', 'AUTORIDAD NACIONAL DEL AGUA', '', 32, '2023/5/5/tnrch-st_ana_informe-legal-n0106-2023-expediente-cut-n-181220-2021-210423pdf-101329.pdf', '', '2023-05-05 10:11:18', '2023-05-05 10:13:29', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (402, 402, 110, '611677-2023-INGEMMET', 'INGEMMET_Informe N° 003706-2023-INGEMMET-DCM-UTN con Resolución del 05-04-2023 RESPLANDOR XX (05.05.2023)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2023/5/8/ingemmet_informe-n-003706-2023-ingemmet-dcm-utn-con-resolucion-del-05-04-2023-resplandor-xx-05052023pdf-160126.pdf', '', '2023-05-08 15:56:03', '2023-05-08 16:01:26', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (403, 403, 104, 'DIRECTORAL N°0086-2023-ANA-DCERH', 'ANA_Resolución Directoral N° 0086-2023-ANA-DCERH-CUT N° 158327-2022 (03.05.2023)', 'AUTORIDAD NACIONAL DEL AGUA', '', 40, '2023/5/9/ana_resolucion-directoral-n-0086-2023-ana-dcerh-cut-n-158327-2022-03052023pdf-095403.pdf', 'ADJUNTO:\r\nINFORME TECNICO N° 0049-2023-ANA-DCERH/MGHA (24.03.2023)\r\nINFORME LEGAL N° 0427-2023-ANA-OAJ (02.05.2023)\r\niNFORME TECNICO N° 0037-2023-ANA-DCERH/KNSV (27.04.2023)', '2023-05-09 09:43:23', '2023-05-09 09:54:03', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (404, 404, 100, 'N° 203-2023-01-1704-JP-FC-01', 'CSJLA_Oficio N°203-2023-Dscto. Remuneración Sr. Moreno Sanchez Oscar E. (02.05.2023)', 'VARIOS', '', 2, '2023/5/11/csjla_oficio-n203-2023-dscto-remuneracion-sr-moreno-sanchez-oscar-e-02052023pdf-144549.pdf', '', '2023-05-11 14:30:32', '2023-05-11 14:45:49', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (405, 405, 102, '-', 'EXPRESIÓN DE INTERÉS DE COMPRA DE ORO EN PERÚ', 'VARIOS', '', 2, '2023/5/15/adr-tecnology-sac_expresion-de-interes-de-compra-de-oro-en-peru-15052023pdf-103411.pdf', '', '2023-05-15 10:30:13', '2023-05-15 10:34:11', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (406, 406, 105, '00023-2023, 00037-2023', 'CARPETA FISCAL 1057-2022, QUEJA DERECHO N° 113-2023', 'VARIOS', '', 12, '2023/5/18/fsmsc_notificacion-n00023-2023-n00037-2023-09-052023pdf-102557.pdf', 'FINALIDAD: PARA CONOCIMIENTO\r\nMATERIA: EXTORSIÓN', '2023-05-18 10:22:34', '2023-05-18 10:25:57', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (407, 407, 100, '845-2023-3ER.JPL-CSJP', 'CSJP_Ofic.845-2023-3°JPL-CSJP-Retener Asignación Anticipada Oscar E. Moreno Sanchez (10.05.23)', 'VARIOS', '', 1, '2023/5/19/csjp_ofic845-2023-3jpl-csjp-retener-asignacion-anticipada-oscar-e-moreno-sanchez-100523pdf-174548.pdf', '', '2023-05-19 17:44:11', '2023-05-19 17:45:48', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (408, 408, 100, '117-2023-MPSC/GADM-G', 'MPSC_Oficio N°117-2023-MPSC-GADM-G-Devuelve Carta Fianza Original (16.05.23)', 'VARIOS', '', 2, '2023/5/25/mpsc_oficio-n117-2023-mpsc-gadm-g-devuelve-carta-fianza-original-160523pdf-162653.pdf', '', '2023-05-25 04:26:47', '2023-05-25 16:26:53', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (409, 409, 104, '841140001379', 'Resolución N°841140001379-Declarar Fundado en parte recurso impugnatorio (10.05.23)', 'VARIOS', '', 14, '2023/5/25/resolucion-n841140001379-declarar-fundado-en-parte-recurso-impugnatorio-100523pdf-163009.pdf', '', '2023-05-25 04:28:58', '2023-05-25 16:30:09', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (410, 410, 102, '-', 'TARGET ROCKS PERU SAC_Carta remite Certificado e Informe Material. Referencia SGC-01 (25.05.23)', 'VARIOS', '', 1, '2023/5/25/target-rocks-peru-sac_carta-remite-certificado-e-informe-material-referencia-sgc-01-250523pdf-181023.pdf', 'ADJUNTA SOBRE MANILA CERRADO., CONTIENE ANILLADO', '2023-05-25 17:55:40', '2023-05-25 18:10:23', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (411, 411, 105, '242101-2023-JR-LA', 'CSJL_Notificación N°242101-2023-JR-LA_Desnaturalización de Contrato (17.05.2023)', 'PODER JUDICIAL DEL PERU', '', 7, '2023/5/26/csjl_notificacion-n242101-2023-jr-la_desnaturalizacion-de-contrato-17052023pdf-095949.pdf', '', '2023-05-26 09:53:36', '2023-05-26 09:59:49', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 69);
INSERT INTO `expediente` VALUES (412, 412, 102, '30673-23', 'REGULARIZACIÓN DE TRANSFERENCIA VEHICULAR', 'VARIOS', '', 1, '2023/5/31/carta-notarial-n30673-23-regularizacion-de-transferencia-vehicular-26-05-2023pdf-172319.pdf', 'Regularización de Transferencia Vehicular', '2023-05-31 17:18:57', '2023-05-31 17:23:19', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (413, 413, 102, 'MULTIPLE N°0053-2023-ANA-AAA.M-ALA.H', 'ANA_Carta Multiple N°0053-2023-ANA-AAAM-ALA.H-Soliicita Información (25.05.23)', 'AUTORIDAD NACIONAL DEL AGUA', '', 1, '2023/6/2/ana_carta-multiple-n0053-2023-ana-aaam-alah-soliicita-informacion-250523pdf-100832.pdf', 'Documento recibido digitalmente por el área de Permisos Ambientales el 26/05/2023.', '2023-06-02 10:02:58', '2023-06-02 10:08:32', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (414, 414, 102, 'NOTARIAL N°175465', 'Notaria Becerra Sosaya_Carta Notarial N°175465-Bco.Interbank (01.06.2023)', 'VARIOS', '', 1, '2023/6/5/notaria-becerra-sosaya_carta-notarial-n175465-bcointerbank-01062023pdf-160436.pdf', 'Carta del Banco Interbank, según carta SGC del 08-05-2023, recibida el 09-05-2023', '2023-06-05 15:59:24', '2023-06-05 16:04:36', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (415, 415, 102, '0056-2023-ANA-AAA.M', 'ANA.M_Carta N° 0056-2023-ANA-AAA.M-Respuesta Carta N°041-2023-SGC-PA (17.05.23)', 'AUTORIDAD NACIONAL DEL AGUA', '', 1, '2023/6/6/anam_carta-n-0056-2023-ana-aaam-respuesta-carta-n041-2023-sgc-pa-170523pdf-164518.pdf', '', '2023-06-06 16:44:08', '2023-06-06 16:45:18', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (416, 416, 102, '0062-2023-ANA-AAA.M', 'ANA.M_Carta N° 0062-2023-ANA-AAA.M-Respuesta Carta N°042-2023-SGC-PA (30.05.23)', 'AUTORIDAD NACIONAL DEL AGUA', '', 2, '2023/6/6/anam_carta-n-0062-2023-ana-aaam-respuesta-carta-n042-2023-sgc-pa-300523pdf-164647.pdf', '', '2023-06-06 16:45:35', '2023-06-06 16:46:47', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 61);
INSERT INTO `expediente` VALUES (417, 417, 102, 'NOTARIAL N°1279-2023', 'Notaria Collantes Becerra_Carta Notarial N°1279-2023 Ofrecimiento Preferente Vta. Inmuebles (07.06.23)', 'VARIOS', '', 2, '2023/6/8/notaria-collantes-becerra_carta-notarial-n1279-2023-ofrecimiento-preferente-vta-inmuebles-070623pdf-163731.pdf', 'Carta del 05/06/2023 firmada por el Sr. Nontol Nontol Walter Jesus', '2023-06-08 16:34:56', '2023-06-08 16:37:31', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (418, 418, 110, '618378-2023-INGEMMET', 'INGEMMET_Informe N° 006036-2023-INGEMMET-DCM-UTN con Resolución del 05-06-2023 ROSA AMPARO A.C.6 (09.06.2023)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 24, '2023/6/12/ingemmet_informe-n-006036-2023-ingemmet-dcm-utn-con-resolucion-del-05-06-2023-rosa-amparo-ac6-09062023pdf-110843.pdf', '', '2023-06-12 11:06:40', '2023-06-12 11:08:43', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (419, 419, 110, '618930-2023-INGEMMET', 'INGEMMET_Resolución N° 2447-2023-INGEMMET-PE-PM de fecha 30-05-2023-RADIANTE XIII (14.06.2023)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 8, '2023/6/15/ingemmet_resolucion-n-2447-2023-ingemmet-pe-pm-de-fecha-30-05-2023-radiante-xiii-14062023pdf-113632.pdf', '', '2023-06-15 11:34:44', '2023-06-15 11:36:32', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (420, 420, 110, '619495-2023-INGEMMET', 'INGEMMET_Resolución N° 2420-2023-INGEMMET-PE-PM de fecha 30-05-2023-BAMBILLO (19.06.2023)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 10, '2023/6/20/ingemmet_resolucion-n-2420-2023-ingemmet-pe-pm-de-fecha-30-05-2023-bambillo-19062023pdf-110827.pdf', '', '2023-06-20 11:04:11', '2023-06-20 11:08:27', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (421, 421, 105, '00001-2023', 'MP-FP_Notificacion N° 00001-2023 Conocimiento-Delito Informático (14.06.2023)', 'VARIOS', '', 3, '2023/6/21/mp-fp_notificacion-n-00001-2023-conocimiento-delito-informatico-14062023pdf-143725.pdf', 'Carpeta Fiscal: 506149600-2023-917-0', '2023-06-21 14:32:07', '2023-06-21 14:37:25', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 0);
INSERT INTO `expediente` VALUES (422, 422, 102, '145-2023-MPSC/GADM', 'MPSC_Carta N°145-2023-MPSC-GADM-Solicita Renovación de Carta Fianza (20.06.23)', 'VARIOS', '', 3, '2023/6/28/mpsc_carta-n145-2023-mpsc-gadm-solicita-renovacion-de-carta-fianza-200623pdf-112800.pdf', '', '2023-06-28 11:18:57', '2023-06-28 11:28:00', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (423, 423, 100, '548-2023-3°FPPCT-OVG(4830-2023)', 'MP-DFLL_Oficio N° 548-2023-3°FPPCT-OVG(4830-2023)-Informar (12.06.2023)', 'MINISTERIO PUBLICO', '', 2, '2023/6/28/mp-dfll_oficio-n-548-2023-3fppct-ovg4830-2023-informar-12062023pdf-182441.pdf', 'Atención: Muy Urgente', '2023-06-28 18:18:12', '2023-06-28 18:24:41', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 83);
INSERT INTO `expediente` VALUES (424, 424, 110, '621150-2023-INGEMMET', 'INGEMMET_Informe N° 006467-2023-INGEMMET-DCM-UTN con Resolución del 13-06-2023 ANA PAULA 2202 (Chazca01, Chazca02 y Otros) (28.06.23)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 39, '2023/6/30/ingemmet_informe-n-006467-2023-ingemmet-dcm-utn-con-resolucion-del-13-06-2023-ana-paula-2202-chazca01-chazca02-y-otros-280623pdf-125205.pdf', '', '2023-06-30 12:50:27', '2023-06-30 12:52:05', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (425, 425, 100, '207-2023-MPSC/GADM-G', 'SOLICITA RENOVACIÓN DE CARTA FIANZA', 'VARIOS', '', 2, '2023/7/11/mpsc_carta-n207-2023-mpsc-gadm-g-solicita-renovacion-de-carta-fianza-270623pdf-165724.pdf', 'REFERENCIA: Oficio No. 213-2022-A.TES/MPSC', '2023-07-11 16:54:19', '2023-07-11 16:57:24', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);
INSERT INTO `expediente` VALUES (426, 426, 110, '623638-2023-INGEMMET', 'INGEMMET_Certificado Devolución N° 16195 de fecha 03-07-23 SGC III (CUADERNO) (11.07.23)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2023/7/12/ingemmet_certificado-devolucion-n-16195-de-fecha-03-07-23-sgc-iii-cuaderno-110723pdf-115427.pdf', '', '2023-07-12 11:46:13', '2023-07-12 11:54:27', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (427, 427, 110, '623639-2023-INGEMMET', 'INGEMMET_Certificado Devolución N° 16196 de fecha 03-07-23 SGC III (CUADERNO) (11.07.23)', 'INSTITUTO GEOLOGICO MINERO Y METALURGICO', '', 2, '2023/7/12/ingemmet_certificado-devolucion-n-16196-de-fecha-03-07-23-sgc-iii-cuaderno-110723pdf-115558.pdf', '', '2023-07-12 11:54:34', '2023-07-12 11:55:58', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 60);
INSERT INTO `expediente` VALUES (428, 428, 100, '0825-2023-EXP.0895-2020-0-1608-JP-FC-01-CJVO', 'CSJLL-Oficio N°825-2023-EXP.895-2022-0-1608-JP-FC-01-CJVO (11.07.23)', 'VARIOS', '', 19, '2023/7/17/csjll-oficio-n825-2023-exp895-2022-0-1608-jp-fc-01-cjvo-110723pdf-123535.pdf', '', '2023-07-17 12:27:27', '2023-07-17 12:35:35', 'EXTERNO', '2022', 'NO', 1, 61, NULL, 58);

-- ----------------------------
-- Table structure for mensaje
-- ----------------------------
DROP TABLE IF EXISTS `mensaje`;
CREATE TABLE `mensaje`  (
  `mens_id` int NOT NULL AUTO_INCREMENT,
  `mens_ofic_ini` int NULL DEFAULT NULL,
  `mens_ofic_fin` int NULL DEFAULT NULL,
  `mens_user_ini` int NULL DEFAULT NULL,
  `mens_user_fin` int NULL DEFAULT NULL,
  `mens_mensaje` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `mens_archivo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mens_fechareg` datetime(0) NULL DEFAULT NULL,
  `mens_leido` enum('SI','NO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'NO',
  PRIMARY KEY (`mens_id`) USING BTREE,
  INDEX `mens_ofic_ini`(`mens_ofic_ini`) USING BTREE,
  INDEX `mens_ofic_fin`(`mens_ofic_fin`) USING BTREE,
  INDEX `mens_user_ini`(`mens_user_ini`) USING BTREE,
  INDEX `mens_user_fin`(`mens_user_fin`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mensaje
-- ----------------------------
INSERT INTO `mensaje` VALUES (2, 1, 0, 1, 0, 'hola', NULL, '2021-03-16 13:18:10', 'NO');
INSERT INTO `mensaje` VALUES (3, 1, 0, 1, 0, '', NULL, '2021-03-16 13:18:13', 'NO');
INSERT INTO `mensaje` VALUES (4, 1, 2, 49, 50, '', NULL, '2021-03-16 13:43:26', 'SI');
INSERT INTO `mensaje` VALUES (5, 1, 2, 49, 50, 'HOLAAAAAA', NULL, '2021-03-16 13:43:41', 'SI');
INSERT INTO `mensaje` VALUES (6, 2, 1, 50, 49, 'holaaaa', NULL, '2021-03-16 13:44:01', 'SI');
INSERT INTO `mensaje` VALUES (7, 2, 1, 50, 49, '', NULL, '2021-03-16 13:44:03', 'SI');
INSERT INTO `mensaje` VALUES (8, 2, 1, 50, 49, 'mensajeee de pruebaaaaa', NULL, '2021-03-16 13:44:11', 'SI');
INSERT INTO `mensaje` VALUES (9, 2, 1, 50, 49, '', NULL, '2021-03-16 13:44:14', 'SI');
INSERT INTO `mensaje` VALUES (10, 2, 1, 50, 49, '', NULL, '2021-03-16 13:44:15', 'SI');
INSERT INTO `mensaje` VALUES (11, 2, 1, 50, 49, '', NULL, '2021-03-16 13:44:15', 'SI');
INSERT INTO `mensaje` VALUES (12, 1, 2, 49, 50, '', NULL, '2021-03-16 13:44:48', 'SI');
INSERT INTO `mensaje` VALUES (13, 1, 2, 49, 50, '', NULL, '2021-03-16 13:44:56', 'SI');
INSERT INTO `mensaje` VALUES (14, 1, 2, 49, 50, '', NULL, '2021-03-16 13:45:02', 'SI');
INSERT INTO `mensaje` VALUES (15, 1, 2, 49, 50, '', NULL, '2021-03-16 13:45:08', 'SI');
INSERT INTO `mensaje` VALUES (16, 1, 2, 49, 50, '', NULL, '2021-03-16 13:45:08', 'SI');
INSERT INTO `mensaje` VALUES (17, 1, 2, 49, 50, '', NULL, '2021-03-16 13:45:27', 'SI');
INSERT INTO `mensaje` VALUES (18, 1, 2, 1, 50, 'hola', NULL, '2021-03-16 14:15:31', 'SI');
INSERT INTO `mensaje` VALUES (19, 1, 2, 1, 50, '', NULL, '2021-03-16 14:15:49', 'SI');
INSERT INTO `mensaje` VALUES (20, 2, 1, 50, 1, 'holaaaa', NULL, '2021-03-16 14:16:13', 'SI');
INSERT INTO `mensaje` VALUES (21, 2, 1, 50, 1, '', NULL, '2021-03-16 14:16:15', 'SI');
INSERT INTO `mensaje` VALUES (22, 1, 2, 1, 50, 'hola1', NULL, '2021-03-16 14:16:25', 'SI');
INSERT INTO `mensaje` VALUES (23, 1, 2, 1, 50, 'HOLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', NULL, '2021-03-16 14:16:38', 'SI');
INSERT INTO `mensaje` VALUES (24, 2, 1, 50, 1, 'sadadadas', NULL, '2021-03-16 14:16:44', 'SI');
INSERT INTO `mensaje` VALUES (25, 2, 1, 50, 1, '', NULL, '2021-03-16 14:17:03', 'SI');
INSERT INTO `mensaje` VALUES (26, 2, 1, 50, 1, '', NULL, '2021-03-16 14:17:04', 'SI');
INSERT INTO `mensaje` VALUES (27, 1, 2, 1, 50, 'H', NULL, '2021-03-16 14:17:05', 'SI');
INSERT INTO `mensaje` VALUES (28, 2, 1, 50, 1, '', NULL, '2021-03-16 14:17:08', 'SI');
INSERT INTO `mensaje` VALUES (29, 3, 4, 51, 52, '', NULL, '2021-03-17 10:09:04', 'SI');
INSERT INTO `mensaje` VALUES (30, 4, 3, 52, 51, 'holaaaa', NULL, '2021-03-17 10:09:31', 'SI');
INSERT INTO `mensaje` VALUES (31, 4, 3, 52, 51, 'sadadadas', NULL, '2021-03-17 10:10:07', 'NO');
INSERT INTO `mensaje` VALUES (32, 4, 28, 41, 1, 'hgjhgj', NULL, '2021-03-18 12:25:13', 'SI');
INSERT INTO `mensaje` VALUES (33, 28, 1, 1, 53, 'Hola', NULL, '2021-03-23 15:48:22', 'SI');
INSERT INTO `mensaje` VALUES (34, 28, 1, 1, 53, '', NULL, '2021-03-29 21:01:11', 'SI');
INSERT INTO `mensaje` VALUES (35, 28, 1, 1, 53, '', NULL, '2021-03-29 21:01:12', 'SI');
INSERT INTO `mensaje` VALUES (36, 28, 1, 1, 53, '', NULL, '2021-03-29 21:01:13', 'SI');
INSERT INTO `mensaje` VALUES (37, 28, 4, 1, 41, '', NULL, '2021-03-29 21:01:17', 'NO');
INSERT INTO `mensaje` VALUES (38, 28, 4, 1, 41, '', NULL, '2021-03-29 21:01:17', 'NO');
INSERT INTO `mensaje` VALUES (39, 1, 0, 73, 0, 'juliana', NULL, '2021-04-26 20:31:02', 'NO');
INSERT INTO `mensaje` VALUES (40, 1, 0, 73, 0, 'asda', NULL, '2021-04-26 20:31:12', 'NO');
INSERT INTO `mensaje` VALUES (41, 1, 28, 73, 54, 'PRUEBA', NULL, '2021-04-26 20:31:20', 'SI');
INSERT INTO `mensaje` VALUES (42, 1, 28, 73, 54, 'MENSAJE DE PRUEBA', NULL, '2021-04-26 20:31:29', 'SI');
INSERT INTO `mensaje` VALUES (43, 1, 28, 73, 54, '', '2021/4/26/sin-titulo-4-203136.png', '2021-04-26 20:31:36', 'SI');
INSERT INTO `mensaje` VALUES (44, 28, 1, 54, 73, 'Recepción correcta... prueba ok', NULL, '2021-04-26 20:51:14', 'NO');
INSERT INTO `mensaje` VALUES (45, 1, 29, 61, 63, 'Estimado Germán,', '2022/1/18/192_mtpe-essalud_carta-n-21-sgrpe-gpe-gcspe-ssalud-2022-14-140910.pdf', '2022-01-18 14:09:10', 'SI');
INSERT INTO `mensaje` VALUES (46, 1, 29, 61, 63, 'Adjunto el documento con el sello de recepción.', NULL, '2022-01-18 14:09:40', 'SI');
INSERT INTO `mensaje` VALUES (47, 39, 28, 1, 85, 'gg', NULL, '2022-06-27 17:05:42', 'NO');
INSERT INTO `mensaje` VALUES (48, 39, 28, 1, 85, '', NULL, '2022-06-27 17:05:46', 'NO');
INSERT INTO `mensaje` VALUES (49, 39, 28, 1, 85, '', NULL, '2022-06-27 17:05:47', 'NO');
INSERT INTO `mensaje` VALUES (50, 39, 28, 1, 85, '', NULL, '2022-06-27 17:05:48', 'NO');
INSERT INTO `mensaje` VALUES (51, 39, 0, 1, 0, 'hola', NULL, '2022-07-22 16:59:18', 'NO');

-- ----------------------------
-- Table structure for oficina
-- ----------------------------
DROP TABLE IF EXISTS `oficina`;
CREATE TABLE `oficina`  (
  `ofic_id` int NOT NULL AUTO_INCREMENT,
  `ofic_nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ofic_padre_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`ofic_id`) USING BTREE,
  INDEX `ofic_padre_id`(`ofic_padre_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oficina
-- ----------------------------
INSERT INTO `oficina` VALUES (1, 'ARCHIVO CENTRAL', NULL);
INSERT INTO `oficina` VALUES (2, 'LOGÍSTICA Y ABASTECIMIENTO', NULL);
INSERT INTO `oficina` VALUES (3, 'CONTABILIDAD', NULL);
INSERT INTO `oficina` VALUES (4, 'ALMACEN', NULL);
INSERT INTO `oficina` VALUES (29, 'GESTION HUMANA', NULL);
INSERT INTO `oficina` VALUES (30, 'LEGAL', NULL);
INSERT INTO `oficina` VALUES (31, 'TESORERIA', NULL);
INSERT INTO `oficina` VALUES (33, 'COSTOS', NULL);
INSERT INTO `oficina` VALUES (34, 'ASUNTOS GUBERNAMENTALES', NULL);
INSERT INTO `oficina` VALUES (35, 'GERENCIA GENERAL', NULL);
INSERT INTO `oficina` VALUES (37, 'PERMISOS AMBIENTALES', NULL);
INSERT INTO `oficina` VALUES (39, 'SISTEMAS', NULL);
INSERT INTO `oficina` VALUES (41, 'AUDITORIA INTERNA', NULL);
INSERT INTO `oficina` VALUES (42, 'RESPONSABILIDAD SOCIAL', NULL);
INSERT INTO `oficina` VALUES (46, 'ASISTENTE ADMINISTRATIVO', NULL);
INSERT INTO `oficina` VALUES (47, 'SECRETARIA', NULL);
INSERT INTO `oficina` VALUES (48, 'GERENCIA ADMINISTRATIVO', NULL);
INSERT INTO `oficina` VALUES (49, 'ASUNTOS CORPORATIVOS', NULL);
INSERT INTO `oficina` VALUES (50, 'GEOLOGIA', NULL);

-- ----------------------------
-- Table structure for proceso_detalle
-- ----------------------------
DROP TABLE IF EXISTS `proceso_detalle`;
CREATE TABLE `proceso_detalle`  (
  `deta_id` int NOT NULL AUTO_INCREMENT,
  `deta_proc_id` int NULL DEFAULT NULL,
  `deta_ofic_id` int NULL DEFAULT NULL,
  `deta_plazo` int NULL DEFAULT NULL,
  `deta_estado` enum('DERIVAR','CONCLUIDO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deta_orden` int NOT NULL,
  `deta_activo` enum('SI','NO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`deta_id`) USING BTREE,
  INDEX `deta_proc_id`(`deta_proc_id`) USING BTREE,
  INDEX `deta_ofic_id`(`deta_ofic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_detalle
-- ----------------------------
INSERT INTO `proceso_detalle` VALUES (10, 10, 28, 2, 'DERIVAR', 1, 'NO');
INSERT INTO `proceso_detalle` VALUES (11, 10, 4, 1, 'CONCLUIDO', 2, 'NO');

-- ----------------------------
-- Table structure for proceso_requisito
-- ----------------------------
DROP TABLE IF EXISTS `proceso_requisito`;
CREATE TABLE `proceso_requisito`  (
  `requ_id` int NOT NULL AUTO_INCREMENT,
  `requ_proc_id` int NULL DEFAULT NULL,
  `requ_nombre` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `requ_activo` enum('SI','NO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`requ_id`) USING BTREE,
  INDEX `requ_proc_id`(`requ_proc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proceso_requisito
-- ----------------------------
INSERT INTO `proceso_requisito` VALUES (31, 10, 'DNI', 'SI');
INSERT INTO `proceso_requisito` VALUES (32, 10, 'Constancia de registro', 'SI');

-- ----------------------------
-- Table structure for procesos
-- ----------------------------
DROP TABLE IF EXISTS `procesos`;
CREATE TABLE `procesos`  (
  `proc_id` int NOT NULL AUTO_INCREMENT,
  `proc_nombre` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proc_activo` enum('SI','NO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'SI',
  PRIMARY KEY (`proc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of procesos
-- ----------------------------
INSERT INTO `procesos` VALUES (10, 'Solicitud de código', 'SI');

-- ----------------------------
-- Table structure for recursos
-- ----------------------------
DROP TABLE IF EXISTS `recursos`;
CREATE TABLE `recursos`  (
  `recu_id` int NOT NULL AUTO_INCREMENT,
  `recu_nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `recu_ext` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `recu_archivo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`recu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of recursos
-- ----------------------------
INSERT INTO `recursos` VALUES (2, 'Plantilla de carta', 'doc', '2021/3/23/plantilla-de-carta-155058.doc');

-- ----------------------------
-- Table structure for tramite
-- ----------------------------
DROP TABLE IF EXISTS `tramite`;
CREATE TABLE `tramite`  (
  `tram_id` int NOT NULL AUTO_INCREMENT,
  `tram_expe_id` int NULL DEFAULT NULL,
  `tram_codigo` int NULL DEFAULT NULL,
  `tram_estado` enum('PENDIENTE','RECIBIDO','DERIVADO','RECHAZADO','FINALIZADO','ARCHIVADO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tram_fechaestado` datetime(0) NULL DEFAULT NULL,
  `tram_ofic_ini` int NULL DEFAULT NULL,
  `tram_ofic_fin` int NULL DEFAULT NULL,
  `tram_user_ini` int NULL DEFAULT NULL,
  `tram_user_fin` int NULL DEFAULT NULL,
  `tram_observacion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tram_fechareg` datetime(0) NULL DEFAULT NULL,
  `tram_plazo` int NULL DEFAULT NULL,
  `tram_acci_id` int NULL DEFAULT NULL,
  `tram_archivo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tram_id`) USING BTREE,
  INDEX `tram_expe_id`(`tram_expe_id`) USING BTREE,
  INDEX `tram_ofic_ini`(`tram_ofic_ini`) USING BTREE,
  INDEX `tram_ofic_fin`(`tram_ofic_fin`) USING BTREE,
  INDEX `tram_user_ini`(`tram_user_ini`) USING BTREE,
  INDEX `tram_user_fin`(`tram_user_fin`) USING BTREE,
  INDEX `tram_acci_id`(`tram_acci_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 605 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tramite
-- ----------------------------
INSERT INTO `tramite` VALUES (112, 2, NULL, 'RECIBIDO', '2021-05-03 12:46:02', 1, 34, 61, NULL, 'Enviado por correo.', '2021-04-27 17:04:20', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (114, 1, NULL, 'RECIBIDO', '2021-04-30 16:45:54', 1, 35, 61, NULL, 'Entregado a Eleana', '2021-04-29 09:03:35', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (115, 3, NULL, 'PENDIENTE', '2021-05-04 15:26:54', 1, 30, 61, NULL, 'Enviado por correo: 30/04/2021 16:56p.m.\r\nFísico: Original', '2021-05-04 15:26:54', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (116, 4, NULL, 'PENDIENTE', '2021-05-04 15:32:32', 1, 30, 61, NULL, 'Enviado por correo: 03/05/2021 16:18p.m.\r\nFísico: 02 Originales', '2021-05-04 15:32:32', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (117, 5, NULL, 'PENDIENTE', '2021-05-04 16:23:39', 1, 34, 61, NULL, 'Emitido por Isabel Orozco', '2021-05-04 16:23:39', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (118, 6, NULL, 'PENDIENTE', '2021-05-04 16:40:25', 1, 3, 61, NULL, 'Entregado a Carla Principe', '2021-05-04 16:40:25', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (119, 7, NULL, 'PENDIENTE', '2021-05-07 09:24:08', 1, 3, 61, NULL, 'Entregado 11 Facturas, 1 ya registrada-Adjunta GR.', '2021-05-07 09:24:08', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (120, 8, NULL, 'ARCHIVADO', '2021-05-11 12:47:33', 1, 34, 61, NULL, 'Presentado', '2021-05-07 16:19:57', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (121, 9, NULL, 'ARCHIVADO', '2021-05-11 12:47:28', 1, 34, 61, NULL, 'Presentado', '2021-05-07 16:24:04', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (122, 10, NULL, 'ARCHIVADO', '2021-05-11 12:47:22', 1, 34, 61, NULL, 'Presentado', '2021-05-07 16:28:37', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (123, 11, NULL, 'ARCHIVADO', '2021-05-11 12:47:16', 1, 34, 61, NULL, 'Presentado', '2021-05-07 16:31:17', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (124, 12, NULL, 'ARCHIVADO', '2021-05-11 12:47:11', 1, 34, 61, NULL, 'Presentada', '2021-05-07 16:34:48', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (125, 13, NULL, 'ARCHIVADO', '2021-05-11 12:47:06', 1, 34, 61, NULL, 'Presentada', '2021-05-07 16:38:18', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (126, 14, NULL, 'ARCHIVADO', '2021-05-11 12:46:57', 1, 34, 61, NULL, '', '2021-05-07 16:41:32', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (127, 15, NULL, 'ARCHIVADO', '2021-05-11 12:46:50', 1, 34, 61, NULL, 'Presentada', '2021-05-07 16:49:56', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (128, 16, NULL, 'ARCHIVADO', '2021-05-11 12:46:42', 1, 34, 61, NULL, 'Presentada', '2021-05-07 16:52:03', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (129, 17, NULL, 'ARCHIVADO', '2021-05-11 12:46:35', 1, 34, 61, NULL, 'Presentada', '2021-05-07 16:54:18', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (130, 18, NULL, 'PENDIENTE', '2021-05-10 11:27:34', 1, 30, 61, NULL, 'Enviado por correo: 10/05/2021 11:27am\r\nDevolver Cargo para ADS SAC', '2021-05-10 11:27:34', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (131, 20, NULL, 'ARCHIVADO', '2021-05-11 12:46:27', 1, 34, 61, NULL, 'Recibido para archivo.', '2021-05-10 15:29:45', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (132, 21, NULL, 'ARCHIVADO', '2021-05-11 12:46:12', 1, 34, 61, NULL, 'Recibido para archivo', '2021-05-10 15:33:02', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (133, 22, NULL, 'PENDIENTE', '2021-05-13 17:25:26', 1, 3, 61, NULL, 'Entregado a Carla Principe', '2021-05-13 17:25:26', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (134, 23, NULL, 'PENDIENTE', '2021-05-14 17:28:13', 1, 34, 61, NULL, 'Presentado el 13/05/2021\r\nExpediente: 3147228', '2021-05-14 17:28:13', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (135, 24, NULL, 'PENDIENTE', '2021-05-18 15:09:33', 1, 29, 61, NULL, 'Entregado a Germán Mejía D.', '2021-05-18 15:09:33', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (136, 25, NULL, 'PENDIENTE', '2021-05-18 20:43:17', 1, 34, 61, NULL, 'Recibido Casillero Digital el 17/05/2021', '2021-05-18 20:43:17', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (137, 26, NULL, 'PENDIENTE', '2021-05-19 08:54:16', 1, 34, 61, NULL, 'Enviado con la RD N° 1171-2021-OEFA-DFAI (17.05/.2021) por correo al Dr. Olivera y a Cecilia ', '2021-05-19 08:54:16', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (138, 27, NULL, 'PENDIENTE', '2021-05-19 10:33:50', 1, 3, 61, NULL, 'Entregado a Carla Principe', '2021-05-19 10:33:50', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (139, 28, NULL, 'RECIBIDO', '2021-05-20 16:59:14', 1, 3, 61, NULL, 'Registrado en }Sofya.', '2021-05-20 16:53:22', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (140, 29, NULL, 'PENDIENTE', '2021-05-24 17:31:32', 1, 34, 61, NULL, '', '2021-05-24 17:31:32', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (141, 30, NULL, 'PENDIENTE', '2021-05-24 17:34:01', 1, 34, 61, NULL, '', '2021-05-24 17:34:01', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (142, 31, NULL, 'PENDIENTE', '2021-05-25 12:42:52', 1, 30, 61, NULL, 'Entregado con cargo', '2021-05-25 12:42:52', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (143, 32, NULL, 'PENDIENTE', '2021-05-25 14:29:27', 1, 30, 61, NULL, 'Recibido por: Kiara Ortiz', '2021-05-25 14:29:27', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (144, 33, NULL, 'PENDIENTE', '2021-05-25 16:22:21', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-05-25 16:22:21', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (145, 34, NULL, 'PENDIENTE', '2021-05-28 14:43:59', 28, 36, 54, NULL, 'Prueba de sistema', '2021-05-28 14:43:59', NULL, 2, NULL);
INSERT INTO `tramite` VALUES (146, 35, NULL, 'PENDIENTE', '2021-05-28 14:48:59', 28, 36, 54, NULL, 'PRUEBA', '2021-05-28 14:48:59', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (147, 36, NULL, 'PENDIENTE', '2021-06-01 12:59:15', 1, 34, 61, NULL, '', '2021-06-01 12:59:15', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (148, 37, NULL, 'PENDIENTE', '2021-06-01 13:31:08', 1, 34, 61, NULL, '', '2021-06-01 13:31:08', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (149, 38, NULL, 'PENDIENTE', '2021-06-01 17:41:31', 1, 3, 61, NULL, '', '2021-06-01 17:41:31', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (150, 39, NULL, 'PENDIENTE', '2021-06-03 16:30:12', 1, 3, 61, NULL, '', '2021-06-03 16:30:12', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (151, 40, NULL, 'PENDIENTE', '2021-06-08 11:11:58', 1, 30, 61, NULL, 'Documento ya presentado', '2021-06-08 11:11:58', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (152, 41, NULL, 'PENDIENTE', '2021-06-08 17:22:47', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-06-08 17:22:47', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (153, 42, NULL, 'PENDIENTE', '2021-06-10 16:40:10', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-06-10 16:40:10', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (154, 43, NULL, 'PENDIENTE', '2021-06-14 17:05:08', 1, 34, 61, NULL, 'Presentado el 06/04/2021 y recibido el 14/06/2021', '2021-06-14 17:05:08', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (155, 44, NULL, 'PENDIENTE', '2021-06-15 16:57:40', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-06-15 16:57:40', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (156, 45, NULL, 'PENDIENTE', '2021-06-17 16:36:12', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-06-17 16:36:12', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (157, 46, NULL, 'PENDIENTE', '2021-06-21 09:14:53', 1, 34, 61, NULL, 'Recibido el 18/06/2021', '2021-06-21 09:14:53', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (158, 47, NULL, 'PENDIENTE', '2021-06-21 09:28:07', 1, 34, 61, NULL, 'Recibido el 18.06.2021', '2021-06-21 09:28:07', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (159, 48, NULL, 'PENDIENTE', '2021-06-21 09:32:48', 1, 34, 61, NULL, 'Recibido el 18.06.2021', '2021-06-21 09:32:48', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (160, 49, NULL, 'PENDIENTE', '2021-06-21 09:35:27', 1, 34, 61, NULL, 'Recibido el 18.06.2021', '2021-06-21 09:35:27', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (161, 50, NULL, 'PENDIENTE', '2021-06-21 09:37:25', 1, 34, 61, NULL, 'Recibido el 18.06.2021', '2021-06-21 09:37:25', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (162, 51, NULL, 'PENDIENTE', '2021-06-21 09:40:49', 1, 34, 61, NULL, 'Recibido el 18.06.2021', '2021-06-21 09:40:49', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (163, 52, NULL, 'PENDIENTE', '2021-06-21 09:47:00', 1, 34, 61, NULL, 'Recibido el 18.06.2021', '2021-06-21 09:47:00', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (164, 53, NULL, 'PENDIENTE', '2021-06-22 16:51:56', 1, 3, 61, NULL, 'Registrado en Sofya.', '2021-06-22 16:51:56', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (165, 54, NULL, 'PENDIENTE', '2021-06-24 16:58:10', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-06-24 16:58:10', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (166, 55, NULL, 'PENDIENTE', '2021-07-01 16:40:57', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-07-01 16:40:57', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (167, 56, NULL, 'PENDIENTE', '2021-07-06 17:21:36', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-07-06 17:21:36', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (168, 57, NULL, 'PENDIENTE', '2021-07-07 16:54:14', 1, 34, 61, NULL, 'Recibido 07/07/2021', '2021-07-07 16:54:14', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (169, 58, NULL, 'PENDIENTE', '2021-07-07 16:56:56', 1, 34, 61, NULL, 'Recibido  el 07/07/2021', '2021-07-07 16:56:56', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (170, 59, NULL, 'PENDIENTE', '2021-07-07 16:58:55', 1, 34, 61, NULL, 'Recibido el 07/07/2021', '2021-07-07 16:58:55', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (171, 60, NULL, 'PENDIENTE', '2021-07-07 17:02:24', 1, 34, 61, NULL, 'Recibido el 07//07/2021', '2021-07-07 17:02:24', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (172, 61, NULL, 'PENDIENTE', '2021-07-07 17:03:59', 1, 34, 61, NULL, 'Recibido el 07/07/2021', '2021-07-07 17:03:59', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (173, 62, NULL, 'PENDIENTE', '2021-07-08 09:49:29', 1, 34, 61, NULL, 'Recibido el 07/07/2021, tramitado vía web por I.Orozco', '2021-07-08 09:49:29', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (174, 63, NULL, 'PENDIENTE', '2021-07-08 09:51:42', 1, 34, 61, NULL, 'Recibido el 07/07/2021 y tramitado vía web por I. Orozco', '2021-07-08 09:51:42', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (175, 64, NULL, 'PENDIENTE', '2021-07-09 11:55:51', 1, 34, 61, NULL, '//Recibido el 09/07/2021', '2021-07-09 11:55:51', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (176, 65, NULL, 'PENDIENTE', '2021-07-13 12:02:47', 1, 34, 61, NULL, '', '2021-07-13 12:02:47', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (177, 66, NULL, 'PENDIENTE', '2021-07-13 12:04:09', 1, 34, 61, NULL, '', '2021-07-13 12:04:09', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (178, 67, NULL, 'PENDIENTE', '2021-07-13 17:44:37', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-07-13 17:44:37', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (179, 68, NULL, 'PENDIENTE', '2021-07-14 12:08:01', 1, 34, 61, NULL, 'Recibido el 14/07/2021', '2021-07-14 12:08:01', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (180, 69, NULL, 'PENDIENTE', '2021-07-14 12:11:13', 1, 34, 61, NULL, '', '2021-07-14 12:11:13', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (182, 70, NULL, 'PENDIENTE', '2021-07-15 17:06:35', 1, 34, 61, NULL, 'Recibido el 15/07/2021', '2021-07-15 17:06:35', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (183, 71, NULL, 'PENDIENTE', '2021-07-15 17:10:27', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-07-15 17:10:27', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (185, 72, NULL, 'PENDIENTE', '2021-07-19 14:45:21', 1, 34, 61, NULL, 'Presentado el 16/07/2021', '2021-07-19 14:45:21', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (186, 73, NULL, 'PENDIENTE', '2021-07-20 17:13:17', 1, 3, 61, NULL, 'Registrado en  Sofya', '2021-07-20 17:13:17', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (187, 74, NULL, 'PENDIENTE', '2021-07-22 17:13:10', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-07-22 17:13:10', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (188, 75, NULL, 'PENDIENTE', '2021-07-23 11:11:12', 1, 34, 61, NULL, '', '2021-07-23 11:11:12', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (189, 76, NULL, 'PENDIENTE', '2021-07-23 11:12:38', 1, 34, 61, NULL, '', '2021-07-23 11:12:38', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (190, 77, NULL, 'PENDIENTE', '2021-07-23 11:14:02', 1, 34, 61, NULL, '', '2021-07-23 11:14:02', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (191, 78, NULL, 'PENDIENTE', '2021-07-23 11:15:11', 1, 34, 61, NULL, '', '2021-07-23 11:15:11', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (192, 79, NULL, 'PENDIENTE', '2021-07-23 11:16:24', 1, 34, 61, NULL, '', '2021-07-23 11:16:24', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (193, 80, NULL, 'PENDIENTE', '2021-07-23 11:17:32', 1, 34, 61, NULL, '', '2021-07-23 11:17:32', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (194, 81, NULL, 'PENDIENTE', '2021-07-23 11:18:56', 1, 34, 61, NULL, '', '2021-07-23 11:18:56', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (195, 82, NULL, 'PENDIENTE', '2021-07-23 11:19:57', 1, 34, 61, NULL, '', '2021-07-23 11:19:57', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (196, 83, NULL, 'PENDIENTE', '2021-07-23 11:26:31', 1, 37, 61, NULL, 'Recibido el 21.07.2021 por Srta. Paola Cunco', '2021-07-23 11:26:31', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (197, 83, NULL, 'PENDIENTE', '2021-07-23 16:26:37', 1, 34, 61, NULL, 'Entregado a Cecilia Melgarejo', '2021-07-23 16:26:37', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (198, 84, NULL, 'PENDIENTE', '2021-07-26 11:05:21', 1, 34, 61, NULL, '', '2021-07-26 11:05:21', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (199, 85, NULL, 'PENDIENTE', '2021-07-26 11:06:42', 1, 34, 61, NULL, '', '2021-07-26 11:06:42', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (200, 86, NULL, 'PENDIENTE', '2021-07-27 16:59:52', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-07-27 16:59:52', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (201, 87, NULL, 'PENDIENTE', '2021-08-03 10:36:58', 1, 29, 61, NULL, 'Entrega físico con cargo.', '2021-08-03 10:36:58', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (202, 88, NULL, 'PENDIENTE', '2021-08-03 17:51:23', 1, 3, 61, NULL, '01 Factura', '2021-08-03 17:51:23', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (203, 89, NULL, 'PENDIENTE', '2021-08-04 10:39:59', 1, 34, 61, NULL, '', '2021-08-04 10:39:59', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (204, 90, NULL, 'RECIBIDO', '2021-08-06 16:19:12', 1, 3, 61, NULL, 'Se recepcionaron 66 Fact. y 02 GR_TRC SAC', '2021-08-06 15:57:10', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (205, 91, NULL, 'PENDIENTE', '2021-08-06 17:39:40', 1, 34, 61, NULL, '', '2021-08-06 17:39:40', NULL, 20, NULL);
INSERT INTO `tramite` VALUES (206, 92, NULL, 'PENDIENTE', '2021-08-09 10:44:34', 1, 34, 61, NULL, '', '2021-08-09 10:44:34', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (207, 93, NULL, 'PENDIENTE', '2021-08-10 17:19:24', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-08-10 17:19:24', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (208, 94, NULL, 'PENDIENTE', '2021-08-11 17:08:05', 1, 31, 61, NULL, 'Tramitado vía web.', '2021-08-11 17:08:05', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (209, 95, NULL, 'PENDIENTE', '2021-08-11 17:13:16', 1, 34, 61, NULL, 'Tramitado vía web', '2021-08-11 17:13:16', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (210, 96, NULL, 'PENDIENTE', '2021-08-11 17:22:13', 1, 34, 61, NULL, 'Tramitado vía web', '2021-08-11 17:22:13', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (211, 97, NULL, 'RECIBIDO', '2021-08-12 16:54:16', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-08-12 16:45:10', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (212, 97, NULL, 'PENDIENTE', '2021-08-12 16:53:40', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-08-12 16:53:40', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (213, 98, NULL, 'PENDIENTE', '2021-08-13 11:53:27', 1, 34, 61, NULL, '', '2021-08-13 11:53:27', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (214, 99, NULL, 'PENDIENTE', '2021-08-13 11:55:02', 1, 34, 61, NULL, '', '2021-08-13 11:55:02', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (215, 99, NULL, 'PENDIENTE', '2021-08-13 11:55:24', 1, 34, 61, NULL, '', '2021-08-13 11:55:24', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (216, 98, NULL, 'PENDIENTE', '2021-08-13 11:56:16', 1, 34, 61, NULL, '', '2021-08-13 11:56:16', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (217, 100, NULL, 'PENDIENTE', '2021-08-16 14:45:57', 1, 34, 61, NULL, 'Presentado vía web', '2021-08-16 14:45:57', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (218, 100, NULL, 'PENDIENTE', '2021-08-16 14:46:43', 1, 34, 61, NULL, 'Presentado vía web\r\n2021-E01-071399\r\n16/08/2021  14:12:51', '2021-08-16 14:46:43', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (219, 101, NULL, 'PENDIENTE', '2021-08-17 15:07:15', 1, 34, 61, NULL, 'Trámite vía web', '2021-08-17 15:07:15', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (220, 101, NULL, 'PENDIENTE', '2021-08-17 15:07:47', 1, 34, 61, NULL, 'Trámite vía web', '2021-08-17 15:07:47', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (221, 102, NULL, 'PENDIENTE', '2021-08-17 17:23:36', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-08-17 17:23:36', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (222, 102, NULL, 'PENDIENTE', '2021-08-17 17:24:42', 1, 3, 61, NULL, 'Registro en Sofya (03 Facturas)', '2021-08-17 17:24:42', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (223, 103, NULL, 'PENDIENTE', '2021-08-18 10:16:28', 1, 34, 61, NULL, '', '2021-08-18 10:16:28', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (224, 103, NULL, 'PENDIENTE', '2021-08-18 10:16:57', 1, 34, 61, NULL, '', '2021-08-18 10:16:57', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (225, 104, NULL, 'PENDIENTE', '2021-08-19 17:25:28', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-08-19 17:25:28', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (226, 104, NULL, 'PENDIENTE', '2021-08-19 17:26:04', 1, 3, 61, NULL, 'Registrado en Sofya: 09 Facturas', '2021-08-19 17:26:04', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (227, 105, NULL, 'PENDIENTE', '2021-08-23 16:44:38', 1, 34, 61, NULL, 'Documento Tramitado', '2021-08-23 16:44:38', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (228, 106, NULL, 'PENDIENTE', '2021-08-23 16:46:30', 1, 34, 61, NULL, 'Tramitado vía web', '2021-08-23 16:46:30', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (229, 107, NULL, 'PENDIENTE', '2021-08-23 16:48:27', 1, 34, 61, NULL, 'Tramitado vía web', '2021-08-23 16:48:27', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (230, 108, NULL, 'PENDIENTE', '2021-08-23 16:51:20', 1, 34, 61, NULL, 'Tramita vía web', '2021-08-23 16:51:20', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (231, 109, NULL, 'PENDIENTE', '2021-08-23 16:53:00', 1, 34, 61, NULL, 'Tramitado vía web', '2021-08-23 16:53:00', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (232, 110, NULL, 'PENDIENTE', '2021-08-25 09:52:30', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-08-25 09:52:30', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (233, 111, NULL, 'PENDIENTE', '2021-08-26 10:57:32', 1, 34, 61, NULL, '', '2021-08-26 10:57:32', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (234, 112, NULL, 'PENDIENTE', '2021-08-26 18:06:59', 1, 3, 61, NULL, 'REGISTRADO EN SOFYA', '2021-08-26 18:06:59', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (235, 113, NULL, 'PENDIENTE', '2021-08-27 10:58:16', 1, 34, 61, NULL, '', '2021-08-27 10:58:16', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (236, 114, NULL, 'PENDIENTE', '2021-08-27 14:44:41', 1, 34, 61, NULL, 'Tramitado vía web', '2021-08-27 14:44:41', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (237, 115, NULL, 'PENDIENTE', '2021-09-15 15:14:28', 1, 34, 61, NULL, '', '2021-09-15 15:14:28', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (238, 116, NULL, 'PENDIENTE', '2021-09-15 15:16:07', 1, 34, 61, NULL, '', '2021-09-15 15:16:07', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (239, 117, NULL, 'PENDIENTE', '2021-09-15 15:17:43', 1, 34, 61, NULL, '', '2021-09-15 15:17:43', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (240, 118, NULL, 'PENDIENTE', '2021-09-15 15:19:26', 1, 34, 61, NULL, '', '2021-09-15 15:19:26', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (241, 119, NULL, 'PENDIENTE', '2021-09-15 15:34:24', 1, 34, 61, NULL, 'PRESENTADO EL 14.09.2021', '2021-09-15 15:34:24', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (242, 120, NULL, 'PENDIENTE', '2021-09-15 15:38:55', 1, 34, 61, NULL, 'PRESENTADO EL 14.09.2021', '2021-09-15 15:38:55', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (243, 121, NULL, 'PENDIENTE', '2021-09-16 17:32:58', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-09-16 17:32:58', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (244, 122, NULL, 'PENDIENTE', '2021-09-21 17:35:56', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-09-21 17:35:56', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (245, 123, NULL, 'PENDIENTE', '2021-09-23 17:52:38', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-09-23 17:52:38', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (246, 124, NULL, 'PENDIENTE', '2021-09-24 09:08:21', 1, 34, 61, NULL, 'Presentado el 23/09/2021 16:15pm', '2021-09-24 09:08:21', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (247, 125, NULL, 'PENDIENTE', '2021-09-28 17:43:47', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-09-28 17:43:47', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (248, 126, NULL, 'PENDIENTE', '2021-09-29 11:52:45', 1, 34, 61, NULL, '', '2021-09-29 11:52:45', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (249, 128, NULL, 'PENDIENTE', '2021-09-30 11:26:57', 1, 34, 61, NULL, '', '2021-09-30 11:26:57', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (250, 129, NULL, 'PENDIENTE', '2021-09-30 17:10:46', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-09-30 17:10:46', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (251, 130, NULL, 'PENDIENTE', '2021-10-06 09:21:15', 1, 34, 61, NULL, 'Tramitado por ventanilla virtual', '2021-10-06 09:21:15', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (253, 131, NULL, 'PENDIENTE', '2021-10-07 09:48:11', 1, 34, 61, NULL, 'Tramitado por mesa de partes virtual', '2021-10-07 09:48:11', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (254, 132, NULL, 'PENDIENTE', '2021-10-07 09:49:36', 1, 34, 61, NULL, 'Tramitado por mesa de partes virtual', '2021-10-07 09:49:36', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (255, 133, NULL, 'PENDIENTE', '2021-10-07 09:58:41', 1, 34, 61, NULL, '', '2021-10-07 09:58:41', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (256, 134, NULL, 'PENDIENTE', '2021-10-07 17:57:25', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-10-07 17:57:25', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (257, 135, NULL, 'PENDIENTE', '2021-10-11 09:13:52', 1, 34, 61, NULL, 'Tramitado', '2021-10-11 09:13:52', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (258, 136, NULL, 'PENDIENTE', '2021-10-12 17:51:43', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-10-12 17:51:43', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (259, 137, NULL, 'PENDIENTE', '2021-10-14 17:41:07', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-10-14 17:41:07', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (260, 138, NULL, 'PENDIENTE', '2021-10-14 17:41:13', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-10-14 17:41:13', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (261, 139, NULL, 'PENDIENTE', '2021-10-14 17:41:19', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-10-14 17:41:19', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (262, 140, NULL, 'PENDIENTE', '2021-10-19 13:10:22', 1, 34, 61, NULL, '', '2021-10-19 13:10:22', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (263, 141, NULL, 'PENDIENTE', '2021-10-19 16:50:24', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-10-19 16:50:24', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (264, 142, NULL, 'PENDIENTE', '2021-10-22 09:38:32', 1, 3, 61, NULL, 'REGISTRADO EN SOFYA 20/10/2021', '2021-10-22 09:38:32', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (265, 143, NULL, 'PENDIENTE', '2021-10-22 10:51:18', 1, 34, 61, NULL, '', '2021-10-22 10:51:18', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (266, 144, NULL, 'PENDIENTE', '2021-10-26 18:02:58', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-10-26 18:02:58', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (267, 145, NULL, 'PENDIENTE', '2021-10-28 17:16:14', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-10-28 17:16:14', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (268, 146, NULL, 'PENDIENTE', '2021-11-02 16:58:27', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-11-02 16:58:27', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (269, 147, NULL, 'PENDIENTE', '2021-11-03 17:36:47', 1, 34, 61, NULL, '', '2021-11-03 17:36:47', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (270, 148, NULL, 'PENDIENTE', '2021-11-03 17:38:42', 1, 34, 61, NULL, '', '2021-11-03 17:38:42', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (271, 149, NULL, 'PENDIENTE', '2021-11-04 17:49:42', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-11-04 17:49:42', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (272, 150, NULL, 'PENDIENTE', '2021-11-05 15:26:49', 1, 34, 61, NULL, 'Tramitado vía web', '2021-11-05 15:26:49', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (273, 151, NULL, 'PENDIENTE', '2021-11-05 15:26:56', 1, 34, 61, NULL, 'Tramitado vía web', '2021-11-05 15:26:56', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (274, 152, NULL, 'PENDIENTE', '2021-11-09 16:52:00', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-11-09 16:52:00', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (275, 153, NULL, 'PENDIENTE', '2021-11-12 09:24:20', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-11-12 09:24:20', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (276, 154, NULL, 'PENDIENTE', '2021-11-15 11:15:56', 1, 34, 61, NULL, '', '2021-11-15 11:15:56', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (277, 155, NULL, 'PENDIENTE', '2021-11-15 15:22:44', 1, 34, 61, NULL, '', '2021-11-15 15:22:44', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (278, 156, NULL, 'PENDIENTE', '2021-11-18 17:24:51', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-11-18 17:24:51', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (279, 157, NULL, 'PENDIENTE', '2021-11-22 11:04:45', 1, 34, 61, NULL, '', '2021-11-22 11:04:45', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (280, 158, NULL, 'PENDIENTE', '2021-11-22 11:06:27', 1, 34, 61, NULL, '', '2021-11-22 11:06:27', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (281, 159, NULL, 'PENDIENTE', '2021-11-22 11:07:54', 1, 34, 61, NULL, '', '2021-11-22 11:07:54', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (282, 160, NULL, 'PENDIENTE', '2021-11-23 16:04:19', 1, 34, 61, NULL, 'Revisado por Isabel O.', '2021-11-23 16:04:19', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (283, 161, NULL, 'PENDIENTE', '2021-11-23 16:06:16', 1, 34, 61, NULL, '', '2021-11-23 16:06:16', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (284, 162, NULL, 'PENDIENTE', '2021-11-23 16:08:04', 1, 34, 61, NULL, '', '2021-11-23 16:08:04', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (285, 163, NULL, 'PENDIENTE', '2021-11-25 16:46:58', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-11-25 16:46:58', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (286, 164, NULL, 'PENDIENTE', '2021-11-25 18:10:24', 1, 34, 61, NULL, 'Tramitado vía web', '2021-11-25 18:10:24', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (287, 165, NULL, 'PENDIENTE', '2021-11-26 16:08:36', 1, 34, 61, NULL, 'Por Tramitar y custodia.', '2021-11-26 16:08:36', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (288, 166, NULL, 'PENDIENTE', '2021-11-26 16:18:24', 1, 37, 61, NULL, '', '2021-11-26 16:18:24', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (289, 167, NULL, 'PENDIENTE', '2021-11-29 15:40:45', 1, 34, 61, NULL, 'Tramitado vía web', '2021-11-29 15:40:45', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (290, 168, NULL, 'PENDIENTE', '2021-11-30 14:36:35', 1, 34, 61, NULL, 'Tramitado vía Web', '2021-11-30 14:36:35', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (291, 169, NULL, 'PENDIENTE', '2021-12-15 13:17:56', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-12-15 13:17:56', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (292, 170, NULL, 'PENDIENTE', '2021-12-16 15:46:21', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-12-16 15:46:21', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (293, 171, NULL, 'PENDIENTE', '2021-12-20 15:50:52', 1, 34, 61, NULL, '', '2021-12-20 15:50:52', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (294, 172, NULL, 'PENDIENTE', '2021-12-20 15:52:29', 1, 34, 61, NULL, '', '2021-12-20 15:52:29', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (295, 173, NULL, 'PENDIENTE', '2021-12-20 15:54:03', 1, 34, 61, NULL, '', '2021-12-20 15:54:03', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (296, 174, NULL, 'PENDIENTE', '2021-12-21 17:37:38', 1, 3, 61, NULL, 'Registrado en Sofya', '2021-12-21 17:37:38', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (297, 175, NULL, 'PENDIENTE', '2021-12-22 12:19:25', 1, 34, 61, NULL, '', '2021-12-22 12:19:25', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (298, 176, NULL, 'RECHAZADO', '2021-12-27 16:54:19', 28, 38, 54, NULL, '', '2021-12-27 15:53:41', NULL, 2, NULL);
INSERT INTO `tramite` VALUES (299, 177, NULL, 'RECHAZADO', '2021-12-27 16:54:18', 28, 38, 80, NULL, '', '2021-12-27 16:22:49', NULL, 3, NULL);
INSERT INTO `tramite` VALUES (300, 178, NULL, 'ARCHIVADO', '2021-12-27 16:44:16', 38, 39, 54, NULL, 'ARCHIVAR PRUEBA', '2021-12-27 16:29:04', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (301, 178, NULL, 'RECHAZADO', '2021-12-27 16:44:45', 38, 39, 54, NULL, '', '2021-12-27 16:30:16', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (302, 178, NULL, 'FINALIZADO', '2021-12-27 16:44:16', 39, 39, 80, NULL, '', '2021-12-27 16:44:16', NULL, NULL, '2021/12/27/fondjpg-164416.jpg');
INSERT INTO `tramite` VALUES (303, 179, NULL, 'ARCHIVADO', '2021-12-27 16:51:12', 38, 1, 54, NULL, 'PRUEBA DESTINO ARCHIVO', '2021-12-27 16:49:20', NULL, 2, NULL);
INSERT INTO `tramite` VALUES (304, 180, NULL, 'PENDIENTE', '2021-12-29 10:02:49', 1, 2, 61, NULL, 'Recibido el 28/12/2021', '2021-12-29 10:02:49', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (305, 181, NULL, 'PENDIENTE', '2021-12-29 10:04:15', 1, 2, 61, NULL, 'Recibido el 28/12/2021', '2021-12-29 10:04:15', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (306, 182, NULL, 'PENDIENTE', '2021-12-30 14:38:23', 35, 34, 73, NULL, '', '2021-12-30 14:38:23', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (307, 183, NULL, 'PENDIENTE', '2021-12-30 14:42:18', 35, 34, 73, NULL, '', '2021-12-30 14:42:18', NULL, 9, NULL);
INSERT INTO `tramite` VALUES (308, 184, NULL, 'PENDIENTE', '2022-01-05 11:04:09', 35, 37, 73, NULL, '', '2022-01-05 11:04:09', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (309, 185, NULL, 'PENDIENTE', '2022-01-11 14:50:47', 35, 34, 73, NULL, 'Recibido el 11-01-2022', '2022-01-11 14:50:47', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (310, 186, NULL, 'PENDIENTE', '2022-01-13 12:17:34', 1, 34, 61, NULL, 'Presentado el 04/01/2022\r\nHora 11:12:34', '2022-01-13 12:17:34', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (311, 187, NULL, 'PENDIENTE', '2022-01-13 12:20:20', 1, 34, 61, NULL, 'Presentado el 04/01/2022\r\nHora: 11:12:34', '2022-01-13 12:20:20', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (312, 188, NULL, 'PENDIENTE', '2022-01-13 12:22:42', 1, 34, 61, NULL, 'Presentado el 04/01/2022\r\nHora: 11:12:34', '2022-01-13 12:22:42', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (313, 189, NULL, 'PENDIENTE', '2022-01-14 14:49:56', 1, 31, 61, NULL, 'Registrado.', '2022-01-14 14:49:56', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (314, 190, NULL, 'PENDIENTE', '2022-01-17 11:06:19', 1, 34, 61, NULL, '', '2022-01-17 11:06:19', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (315, 191, NULL, 'PENDIENTE', '2022-01-17 16:14:26', 1, 31, 61, NULL, 'Entregado con cargo a Juan C. Cisneros.', '2022-01-17 16:14:26', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (316, 192, NULL, 'PENDIENTE', '2022-01-18 11:01:39', 1, 29, 61, NULL, 'Entregado con cargo: German Mejía', '2022-01-18 11:01:39', NULL, 9, NULL);
INSERT INTO `tramite` VALUES (317, 193, NULL, 'PENDIENTE', '2022-01-18 14:18:19', 1, 35, 61, NULL, 'Entregado a Asistente Gerencia', '2022-01-18 14:18:19', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (318, 194, NULL, 'PENDIENTE', '2022-01-18 14:20:07', 1, 31, 61, NULL, 'Entregado a Juan C. Cisneros.', '2022-01-18 14:20:07', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (319, 195, NULL, 'PENDIENTE', '2022-01-20 17:28:46', 1, 34, 61, NULL, 'Recibido el 19/01/2022 sin cargo', '2022-01-20 17:28:46', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (320, 196, NULL, 'PENDIENTE', '2022-01-20 17:31:05', 1, 34, 61, NULL, 'Recibido el 19/01/2022 sin cargo', '2022-01-20 17:31:05', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (321, 197, NULL, 'PENDIENTE', '2022-01-20 17:33:17', 1, 34, 61, NULL, 'Recibido el 19/01/2022 sin cargo', '2022-01-20 17:33:17', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (322, 198, NULL, 'PENDIENTE', '2022-01-20 17:34:54', 1, 34, 61, NULL, 'Recibido el 19/01/2022 sin cargo', '2022-01-20 17:34:54', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (323, 199, NULL, 'PENDIENTE', '2022-01-20 17:36:30', 1, 34, 61, NULL, 'Recibido el 19/01/2022 sin cargo', '2022-01-20 17:36:30', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (324, 200, NULL, 'PENDIENTE', '2022-01-20 17:38:57', 1, 34, 61, NULL, 'Presentado vía web', '2022-01-20 17:38:57', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (325, 201, NULL, 'PENDIENTE', '2022-01-24 11:38:17', 1, 31, 61, NULL, '', '2022-01-24 11:38:17', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (326, 202, NULL, 'PENDIENTE', '2022-01-24 11:41:50', 1, 30, 61, NULL, 'Comunicado a Dra. Gabriela Laos', '2022-01-24 11:41:50', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (327, 203, NULL, 'PENDIENTE', '2022-01-26 16:19:32', 1, 35, 61, NULL, 'Entregado a Asistente Gerencia: Eleana Saba', '2022-01-26 16:19:32', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (328, 204, NULL, 'PENDIENTE', '2022-02-04 09:40:25', 1, 30, 61, NULL, 'Documento solicitado por GAF el 03/02/2022.', '2022-02-04 09:40:25', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (329, 205, NULL, 'PENDIENTE', '2022-02-04 09:42:25', 1, 30, 61, NULL, 'Solicitado por la GAF el 03/02/2022', '2022-02-04 09:42:25', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (330, 206, NULL, 'PENDIENTE', '2022-02-04 09:44:06', 1, 30, 61, NULL, 'Solicitado por la GAF el 03/02/2022', '2022-02-04 09:44:06', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (331, 207, NULL, 'PENDIENTE', '2022-02-04 15:55:08', 1, 34, 61, NULL, 'Carta de fecha 21/01/2022', '2022-02-04 15:55:08', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (332, 208, NULL, 'PENDIENTE', '2022-02-04 15:57:33', 1, 34, 61, NULL, 'Carta de fecha fecha: 21/01/2022', '2022-02-04 15:57:33', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (333, 209, NULL, 'PENDIENTE', '2022-02-04 17:36:25', 1, 34, 61, NULL, 'Adjunto correo del cargo recibido por SUCAMEC', '2022-02-04 17:36:25', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (334, 210, NULL, 'PENDIENTE', '2022-02-07 10:21:17', 1, 2, 61, NULL, 'Entregado a Jefatura de Logística: Edgar Quiroz', '2022-02-07 10:21:17', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (335, 211, NULL, 'PENDIENTE', '2022-02-07 13:18:41', 1, 31, 61, NULL, '', '2022-02-07 13:18:41', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (336, 212, NULL, 'PENDIENTE', '2022-02-09 11:34:53', 1, 34, 61, NULL, '', '2022-02-09 11:34:53', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (337, 213, NULL, 'RECIBIDO', '2022-10-03 09:20:53', 1, 3, 61, NULL, 'Comunicado a Contabilidad - Erika Cruz', '2022-02-10 10:55:03', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (338, 214, NULL, 'RECIBIDO', '2022-02-10 12:57:16', 1, 33, 61, NULL, 'Destinatario: Pedro Puente', '2022-02-10 12:22:52', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (339, 215, NULL, 'RECIBIDO', '2022-02-11 11:36:23', 1, 30, 61, NULL, 'Entregado a Dra. Laos.', '2022-02-11 11:30:28', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (340, 216, NULL, 'RECIBIDO', '2022-02-11 17:08:36', 1, 31, 61, NULL, 'Comunicado a Jefatura de Tesorería', '2022-02-11 17:05:11', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (341, 217, NULL, 'PENDIENTE', '2022-02-15 17:25:02', 1, 30, 61, NULL, 'Entrega documento debidamente firmado.', '2022-02-15 17:25:02', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (342, 218, NULL, 'PENDIENTE', '2022-02-16 11:00:45', 1, 28, 61, NULL, 'Documento físico entregado Asistente TI-JC Portocarrero', '2022-02-16 11:00:45', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (343, 218, NULL, 'PENDIENTE', '2022-02-16 11:00:45', 1, 35, 61, NULL, 'Documento físico entregado Asistente TI-JC Portocarrero', '2022-02-16 11:00:45', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (344, 219, NULL, 'PENDIENTE', '2022-02-16 11:06:02', 1, 28, 61, NULL, 'Documento físico entregado a Asistente TI-JC Portocarrero', '2022-02-16 11:06:02', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (345, 219, NULL, 'PENDIENTE', '2022-02-16 11:06:02', 1, 35, 61, NULL, 'Documento físico entregado a Asistente TI-JC Portocarrero', '2022-02-16 11:06:02', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (346, 220, NULL, 'PENDIENTE', '2022-02-16 11:08:09', 1, 28, 61, NULL, 'Documento físico entregado a Asistente TI-JC Portocarrero', '2022-02-16 11:08:09', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (347, 220, NULL, 'PENDIENTE', '2022-02-16 11:08:09', 1, 35, 61, NULL, 'Documento físico entregado a Asistente TI-JC Portocarrero', '2022-02-16 11:08:09', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (348, 221, NULL, 'PENDIENTE', '2022-02-16 11:23:56', 1, 37, 61, NULL, 'Copio para conocimiento al área de Propiedades', '2022-02-16 11:23:56', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (349, 221, NULL, 'PENDIENTE', '2022-02-16 16:24:01', 1, 34, 61, NULL, 'Documento entregado al área de Medio Ambiente', '2022-02-16 16:24:01', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (350, 222, NULL, 'PENDIENTE', '2022-02-17 17:31:21', 1, 35, 61, NULL, '', '2022-02-17 17:31:21', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (351, 222, NULL, 'PENDIENTE', '2022-02-17 22:31:26', 1, 31, 61, NULL, '', '2022-02-17 22:31:26', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (352, 223, NULL, 'PENDIENTE', '2022-02-18 13:06:25', 1, 34, 61, NULL, 'Entregado a Asistente: Srta. Carla Solis', '2022-02-18 13:06:25', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (353, 224, NULL, 'PENDIENTE', '2022-02-18 13:08:33', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-02-18 13:08:33', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (354, 225, NULL, 'PENDIENTE', '2022-02-18 13:10:14', 1, 34, 61, NULL, 'Entregado a Carla Solis', '2022-02-18 13:10:14', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (355, 226, NULL, 'PENDIENTE', '2022-02-18 13:11:30', 1, 34, 61, NULL, 'Entregado a Carla Solis', '2022-02-18 13:11:30', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (356, 227, NULL, 'PENDIENTE', '2022-02-23 11:24:32', 1, 2, 61, NULL, 'Entregado con cargo, propuestas en sobre cerrado.', '2022-02-23 11:24:32', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (357, 228, NULL, 'PENDIENTE', '2022-02-23 17:57:38', 1, 2, 61, NULL, 'Entregado en sobre cerrado.', '2022-02-23 17:57:38', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (358, 229, NULL, 'PENDIENTE', '2022-02-28 11:52:06', 1, 37, 61, NULL, '', '2022-02-28 11:52:06', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (359, 229, NULL, 'PENDIENTE', '2022-02-28 16:52:13', 1, 34, 61, NULL, '', '2022-02-28 16:52:13', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (360, 230, NULL, 'PENDIENTE', '2022-03-01 11:57:41', 1, 34, 61, NULL, 'Documento entregado a Srta. Carla Solis', '2022-03-01 11:57:41', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (361, 231, NULL, 'PENDIENTE', '2022-03-02 14:44:24', 1, 34, 61, NULL, 'Tramitado vía virtual : 2022-E01-018278\r\n02/03/2022 10:21:33\r\nRecepción: DCHUNG\r\n', '2022-03-02 14:44:24', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (362, 232, NULL, 'RECIBIDO', '2022-10-03 09:20:49', 1, 3, 61, NULL, 'Registrado en Sofya', '2022-03-03 17:56:07', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (363, 233, NULL, 'PENDIENTE', '2022-03-04 11:08:33', 1, 34, 61, NULL, '', '2022-03-04 11:08:33', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (364, 234, NULL, 'PENDIENTE', '2022-03-04 11:10:29', 1, 34, 61, NULL, '', '2022-03-04 11:10:29', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (365, 235, NULL, 'PENDIENTE', '2022-03-07 11:51:16', 1, 29, 61, NULL, 'Entregado con cargo', '2022-03-07 11:51:16', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (366, 235, NULL, 'PENDIENTE', '2022-03-07 14:24:24', 1, 29, 61, NULL, 'Documento entregado a Germán Mejía', '2022-03-07 14:24:24', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (367, 236, NULL, 'PENDIENTE', '2022-03-09 11:12:49', 1, 34, 61, NULL, '', '2022-03-09 11:12:49', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (368, 237, NULL, 'PENDIENTE', '2022-03-11 11:21:33', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-03-11 11:21:33', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (369, 238, NULL, 'PENDIENTE', '2022-03-11 11:23:01', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-03-11 11:23:01', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (370, 239, NULL, 'PENDIENTE', '2022-03-21 09:38:43', 1, 30, 61, NULL, '', '2022-03-21 09:38:43', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (371, 240, NULL, 'PENDIENTE', '2022-03-22 17:50:25', 1, 34, 61, NULL, '', '2022-03-22 17:50:25', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (372, 241, NULL, 'PENDIENTE', '2022-03-22 17:58:35', 1, 34, 61, NULL, '', '2022-03-22 17:58:35', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (373, 242, NULL, 'PENDIENTE', '2022-03-23 13:07:06', 1, 34, 61, NULL, '', '2022-03-23 13:07:06', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (374, 243, NULL, 'PENDIENTE', '2022-03-29 16:50:25', 1, 30, 61, NULL, 'Entregado a la Dra. Gabriela Laos', '2022-03-29 16:50:25', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (375, 244, NULL, 'PENDIENTE', '2022-03-29 16:56:18', 1, 34, 61, NULL, 'Entregado el 29/03/2022', '2022-03-29 16:56:18', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (377, 245, NULL, 'PENDIENTE', '2022-04-01 14:21:29', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis.', '2022-04-01 14:21:29', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (378, 246, NULL, 'PENDIENTE', '2022-04-07 11:35:20', 1, 30, 61, NULL, 'Recibido por Dr. Reyes', '2022-04-07 11:35:20', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (379, 247, NULL, 'PENDIENTE', '2022-04-08 11:56:50', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis.', '2022-04-08 11:56:50', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (380, 248, NULL, 'PENDIENTE', '2022-04-11 12:32:25', 1, 37, 61, NULL, 'Entregado a Carlos Gómez', '2022-04-11 12:32:25', NULL, 9, NULL);
INSERT INTO `tramite` VALUES (381, 248, NULL, 'PENDIENTE', '2022-04-11 17:32:30', 1, 34, 61, NULL, 'Para conocimiento', '2022-04-11 17:32:30', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (382, 249, NULL, 'PENDIENTE', '2022-04-20 11:19:15', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-04-20 11:19:15', NULL, 20, NULL);
INSERT INTO `tramite` VALUES (383, 250, NULL, 'PENDIENTE', '2022-04-21 11:14:45', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-04-21 11:14:45', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (384, 251, NULL, 'PENDIENTE', '2022-04-21 18:14:33', 1, 29, 61, NULL, '', '2022-04-21 18:14:33', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (385, 252, NULL, 'PENDIENTE', '2022-04-21 18:15:40', 1, 29, 61, NULL, '', '2022-04-21 18:15:40', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (386, 253, NULL, 'PENDIENTE', '2022-04-21 18:16:43', 1, 29, 61, NULL, '', '2022-04-21 18:16:43', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (387, 254, NULL, 'PENDIENTE', '2022-04-28 17:55:31', 1, 29, 61, NULL, '', '2022-04-28 17:55:31', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (388, 255, NULL, 'PENDIENTE', '2022-04-28 17:57:03', 1, 29, 61, NULL, '', '2022-04-28 17:57:03', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (389, 256, NULL, 'PENDIENTE', '2022-04-28 17:58:58', 1, 29, 61, NULL, '', '2022-04-28 17:58:58', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (390, 257, NULL, 'PENDIENTE', '2022-04-28 18:00:05', 1, 29, 61, NULL, '', '2022-04-28 18:00:05', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (391, 258, NULL, 'PENDIENTE', '2022-04-28 18:01:11', 1, 29, 61, NULL, '', '2022-04-28 18:01:11', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (392, 259, NULL, 'PENDIENTE', '2022-04-29 12:00:28', 1, 34, 61, NULL, 'Entregado: Carla Solis', '2022-04-29 12:00:28', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (393, 260, NULL, 'PENDIENTE', '2022-05-03 18:03:04', 1, 35, 61, NULL, '', '2022-05-03 18:03:04', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (394, 261, NULL, 'PENDIENTE', '2022-05-10 16:54:10', 1, 2, 61, NULL, 'Tramitado por Administrador Senior de Contratos.\r\nDennis Velarde', '2022-05-10 16:54:10', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (395, 262, NULL, 'PENDIENTE', '2022-05-10 17:11:04', 1, 41, 61, NULL, '', '2022-05-10 17:11:04', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (396, 263, NULL, 'PENDIENTE', '2022-05-17 11:00:37', 1, 30, 61, NULL, 'Entregado a Dra. Laos.', '2022-05-17 11:00:37', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (397, 263, NULL, 'PENDIENTE', '2022-05-17 16:00:41', 1, 29, 61, NULL, 'Para conocimiento.', '2022-05-17 16:00:41', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (398, 264, NULL, 'PENDIENTE', '2022-05-18 12:26:39', 1, 37, 61, NULL, 'Entregado a la Gerencia Asuntos Corporativos- Sr. Francisco Medina', '2022-05-18 12:26:39', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (399, 265, NULL, 'PENDIENTE', '2022-05-19 11:38:41', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-05-19 11:38:41', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (400, 266, NULL, 'PENDIENTE', '2022-05-19 11:40:57', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-05-19 11:40:57', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (401, 267, NULL, 'PENDIENTE', '2022-05-19 14:30:25', 1, 34, 61, NULL, 'Trámite P.O.M. (vía virtual)\r\n', '2022-05-19 14:30:25', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (402, 269, NULL, 'PENDIENTE', '2022-05-30 12:32:53', 1, 34, 61, NULL, 'Presentado vía virtual', '2022-05-30 12:32:53', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (403, 270, NULL, 'PENDIENTE', '2022-05-30 16:53:32', 1, 30, 61, NULL, 'Entregado a Dra. Gabriela Laos.', '2022-05-30 16:53:32', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (404, 271, NULL, 'PENDIENTE', '2022-05-30 16:56:01', 1, 29, 61, NULL, 'Entregado al Sr. Germán Mejía.', '2022-05-30 16:56:01', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (405, 272, NULL, 'PENDIENTE', '2022-06-01 11:28:12', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis.', '2022-06-01 11:28:12', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (406, 273, NULL, 'PENDIENTE', '2022-06-01 14:53:24', 1, 42, 61, NULL, 'Entregado a Gerencia de Asuntos Corporativos: Sr. Francisco Medina.', '2022-06-01 14:53:24', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (407, 274, NULL, 'PENDIENTE', '2022-06-03 16:06:24', 1, 30, 61, NULL, 'Entregado a Dra. Gabriela Laos', '2022-06-03 16:06:24', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (408, 275, NULL, 'PENDIENTE', '2022-06-06 09:50:12', 1, 34, 61, NULL, 'Tramitado vía web (03/06/2022  16:05pm)', '2022-06-06 09:50:12', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (409, 276, NULL, 'PENDIENTE', '2022-06-08 11:36:54', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-06-08 11:36:54', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (410, 277, NULL, 'PENDIENTE', '2022-06-08 14:39:33', 1, 34, 61, NULL, 'Trámite presencial', '2022-06-08 14:39:33', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (411, 278, NULL, 'PENDIENTE', '2022-06-08 14:42:25', 1, 34, 61, NULL, 'Trámite presencial', '2022-06-08 14:42:25', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (412, 279, NULL, 'PENDIENTE', '2022-06-09 12:07:55', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-06-09 12:07:55', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (413, 280, NULL, 'PENDIENTE', '2022-06-13 11:08:58', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-06-13 11:08:58', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (414, 281, NULL, 'PENDIENTE', '2022-06-15 12:27:24', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-06-15 12:27:24', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (415, 282, NULL, 'PENDIENTE', '2022-06-16 11:40:18', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-06-16 11:40:18', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (416, 283, NULL, 'PENDIENTE', '2022-06-17 18:06:45', 1, 34, 61, NULL, 'Tramitado vía electrónica.', '2022-06-17 18:06:45', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (417, 284, NULL, 'PENDIENTE', '2022-06-22 12:48:38', 1, 41, 61, NULL, 'Documento dirigido a Sr. William Yactayo', '2022-06-22 12:48:38', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (418, 284, NULL, 'PENDIENTE', '2022-06-22 12:48:38', 1, 37, 61, NULL, 'Recibido por correo', '2022-06-22 12:48:38', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (419, 285, NULL, 'PENDIENTE', '2022-06-23 11:42:51', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-06-23 11:42:51', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (420, 286, NULL, 'PENDIENTE', '2022-06-23 13:08:55', 1, 34, 61, NULL, '', '2022-06-23 13:08:55', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (421, 286, NULL, 'PENDIENTE', '2022-06-23 18:08:58', 1, 37, 61, NULL, 'Documento Físico entregado a Propiedades-Isabel Orozco', '2022-06-23 18:08:58', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (422, 287, NULL, 'PENDIENTE', '2022-06-27 15:58:34', 1, 42, 61, NULL, '', '2022-06-27 15:58:34', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (423, 287, NULL, 'PENDIENTE', '2022-06-27 15:58:34', 1, 41, 61, NULL, 'Entregado al Sr. Francisco Medina', '2022-06-27 15:58:34', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (424, 288, NULL, 'PENDIENTE', '2022-06-27 17:33:38', 1, 28, 61, NULL, '', '2022-06-27 17:33:38', NULL, 20, NULL);
INSERT INTO `tramite` VALUES (425, 289, NULL, 'PENDIENTE', '2022-06-28 18:01:50', 1, 29, 61, NULL, '', '2022-06-28 18:01:50', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (426, 290, NULL, 'PENDIENTE', '2022-06-30 14:42:19', 1, 34, 61, NULL, 'Entregado a Srta. Carla Solis', '2022-06-30 14:42:19', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (427, 291, NULL, 'PENDIENTE', '2022-07-01 11:50:26', 1, 34, 61, NULL, '', '2022-07-01 11:50:26', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (428, 292, NULL, 'PENDIENTE', '2022-07-05 11:19:55', 1, 34, 61, NULL, '', '2022-07-05 11:19:55', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (429, 292, NULL, 'PENDIENTE', '2022-07-05 16:19:59', 1, 37, 61, NULL, 'Documento entregado a Propiedades-Isabel Orozco', '2022-07-05 16:19:59', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (430, 293, NULL, 'PENDIENTE', '2022-07-06 17:38:43', 1, 34, 61, NULL, 'Presentado: \r\nFECHA 23/06/2022  Hora 16:05:57', '2022-07-06 17:38:43', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (431, 294, NULL, 'PENDIENTE', '2022-07-07 10:39:53', 1, 34, 61, NULL, 'Presentado por Mesa de Partes Virtual (OEFA)\r\n2022-E01-061296 \r\nFecha 06/07/2022\r\nHora 17:41 \r\nRecepcionado por LORENA GODINEZ CARRASCO ', '2022-07-07 10:39:53', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (432, 294, NULL, 'PENDIENTE', '2022-07-07 15:39:57', 1, 37, 61, NULL, 'Copiado para conocimiento', '2022-07-07 15:39:57', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (433, 295, NULL, 'PENDIENTE', '2022-07-07 16:11:28', 1, 30, 61, NULL, 'Entregado con cargo', '2022-07-07 16:11:28', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (434, 296, NULL, 'PENDIENTE', '2022-07-07 16:12:41', 1, 30, 61, NULL, 'Entregado con cargo', '2022-07-07 16:12:41', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (435, 297, NULL, 'PENDIENTE', '2022-07-07 16:19:41', 1, 34, 61, NULL, 'Presentado 07/07/2022 \r\n14:30pm', '2022-07-07 16:19:41', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (436, 298, NULL, 'PENDIENTE', '2022-07-07 16:20:36', 1, 34, 61, NULL, 'Presentado 07/07/2022 \r\n14:30pm', '2022-07-07 16:20:36', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (437, 299, NULL, 'PENDIENTE', '2022-07-08 14:40:08', 1, 34, 61, NULL, '', '2022-07-08 14:40:08', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (438, 299, NULL, 'PENDIENTE', '2022-07-08 19:40:13', 1, 37, 61, NULL, '', '2022-07-08 19:40:13', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (439, 300, NULL, 'PENDIENTE', '2022-07-12 11:47:02', 1, 30, 61, NULL, '', '2022-07-12 11:47:02', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (440, 300, NULL, 'PENDIENTE', '2022-07-12 16:47:07', 1, 35, 61, NULL, 'Documento entregado al área de Legal: Dra. Laos.', '2022-07-12 16:47:07', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (441, 301, NULL, 'PENDIENTE', '2022-07-12 12:41:28', 1, 34, 61, NULL, 'Presentado: INGRESO DE DOCUMENTOS N° 3332860\r\nFECHA: 12/07/2022      HORA: 11:33:13\r\n', '2022-07-12 12:41:28', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (442, 302, NULL, 'PENDIENTE', '2022-07-13 16:38:16', 1, 34, 61, NULL, '', '2022-07-13 16:38:16', NULL, 20, NULL);
INSERT INTO `tramite` VALUES (443, 303, NULL, 'PENDIENTE', '2022-07-14 11:41:32', 1, 34, 61, NULL, 'Documento dirigido AUTORIDAD PARA LA RECONSTRUCCIÓ CON CAMBIOS, Dirección de Soluciones Integrales', '2022-07-14 11:41:32', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (444, 304, NULL, 'PENDIENTE', '2022-07-14 16:45:28', 1, 29, 61, NULL, 'Documento entregado a Srta. Mariela Trujillo', '2022-07-14 16:45:28', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (445, 305, NULL, 'PENDIENTE', '2022-07-18 12:50:15', 1, 34, 61, NULL, 'Entregado a Srta. Evelyn Gamboa', '2022-07-18 12:50:15', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (446, 306, NULL, 'PENDIENTE', '2022-07-18 17:04:27', 1, 42, 61, NULL, '', '2022-07-18 17:04:27', NULL, 19, NULL);
INSERT INTO `tramite` VALUES (447, 306, NULL, 'RECIBIDO', '2022-08-10 09:54:38', 1, 3, 61, NULL, 'Archivo escaneado y compartido en SharePoint.', '2022-07-18 22:04:32', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (448, 307, NULL, 'ARCHIVADO', '2022-07-19 17:42:34', 1, 34, 61, NULL, 'Entregado a Srta. Evelyn Gamboa', '2022-07-19 12:04:30', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (449, 307, NULL, 'RECIBIDO', '2022-07-19 16:21:25', 1, 28, 61, NULL, 'verificar recepción', '2022-07-19 12:09:50', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (450, 307, NULL, 'PENDIENTE', '2022-07-19 12:18:29', 1, 28, 61, NULL, 'verificar', '2022-07-19 12:18:29', NULL, 12, NULL);
INSERT INTO `tramite` VALUES (451, 307, NULL, 'ARCHIVADO', '2022-07-19 17:42:49', 1, 34, 61, NULL, 'Reenvío', '2022-07-19 12:19:33', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (452, 307, NULL, 'ARCHIVADO', '2022-07-19 17:43:13', 1, 34, 61, NULL, 'verificar', '2022-07-19 12:25:47', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (453, 308, NULL, 'RECIBIDO', '2022-07-19 12:57:52', 1, 44, 61, NULL, 'Modo Prueba', '2022-07-19 12:52:38', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (454, 309, NULL, 'ARCHIVADO', '2022-07-19 17:42:21', 1, 34, 61, NULL, 'Tramitado por área de Propiedades.', '2022-07-19 17:31:44', NULL, 1, NULL);
INSERT INTO `tramite` VALUES (455, 310, NULL, 'PENDIENTE', '2022-07-19 17:50:42', 1, 29, 61, NULL, '', '2022-07-19 17:50:42', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (456, 311, NULL, 'PENDIENTE', '2022-07-19 17:52:23', 1, 29, 61, NULL, '', '2022-07-19 17:52:23', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (457, 312, NULL, 'PENDIENTE', '2022-07-21 10:07:37', 1, 28, 61, NULL, '', '2022-07-21 10:07:37', NULL, 6, NULL);
INSERT INTO `tramite` VALUES (458, 313, NULL, 'PENDIENTE', '2022-07-25 09:39:44', 1, 39, 61, NULL, 'PRUEBA', '2022-07-25 09:39:44', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (459, 314, NULL, 'RECIBIDO', '2022-07-25 16:03:39', 1, 37, 61, NULL, 'Documento físico entregado a Victor Galicia', '2022-07-25 15:59:57', NULL, 12, NULL);
INSERT INTO `tramite` VALUES (460, 315, NULL, 'PENDIENTE', '2022-07-26 11:41:28', 1, 34, 61, NULL, '', '2022-07-26 11:41:28', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (461, 316, NULL, 'RECIBIDO', '2022-08-02 14:35:23', 1, 29, 61, NULL, 'Entregado al Sr. Germán Mejía', '2022-08-02 14:32:31', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (462, 317, NULL, 'ARCHIVADO', '2022-08-05 11:36:54', 1, 2, 61, NULL, 'Entregado al Sr. Edgar Quiroz', '2022-08-05 11:09:08', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (463, 318, NULL, 'RECIBIDO', '2022-08-05 11:16:13', 1, 37, 61, NULL, 'Documento físico entregado a Carlos Gómez.', '2022-08-05 11:13:47', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (464, 319, NULL, 'ARCHIVADO', '2022-08-09 15:56:29', 1, 34, 61, NULL, 'Tramitado por Sra. Isabel Orozco', '2022-08-09 15:55:43', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (465, 320, NULL, 'PENDIENTE', '2022-08-09 18:13:20', 1, 42, 61, NULL, 'Adjunto Link con expediente, enviado por correo.', '2022-08-09 18:13:20', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (466, 320, NULL, 'RECIBIDO', '2022-08-10 09:53:26', 1, 3, 61, NULL, 'Adjunto Link con expediente, enviado por correo.', '2022-08-09 23:13:23', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (467, 321, NULL, 'PENDIENTE', '2022-08-11 12:50:09', 1, 30, 61, NULL, '', '2022-08-11 12:50:09', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (468, 321, NULL, 'PENDIENTE', '2022-08-11 17:50:12', 1, 29, 61, NULL, 'Nota: Documento entregado al área de Legal', '2022-08-11 17:50:12', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (469, 322, NULL, 'DERIVADO', '2022-08-15 15:06:32', 1, 30, 61, NULL, 'Entregado a Dra. Jessica Lopez', '2022-08-15 10:03:02', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (470, 322, NULL, 'PENDIENTE', '2022-08-15 15:03:12', 1, 29, 61, NULL, 'Documento entregado al área de Legal', '2022-08-15 15:03:12', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (471, 322, NULL, 'PENDIENTE', '2022-08-15 10:06:16', 30, 29, 94, NULL, 'GERMAN MEJIA.', '2022-08-15 10:06:16', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (472, 322, NULL, 'PENDIENTE', '2022-08-15 10:06:19', 30, 29, 94, NULL, 'GERMAN MEJIA.', '2022-08-15 10:06:19', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (473, 322, NULL, 'PENDIENTE', '2022-08-15 10:06:23', 30, 29, 94, NULL, 'GERMAN MEJIA.', '2022-08-15 10:06:23', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (474, 322, NULL, 'PENDIENTE', '2022-08-15 10:06:26', 30, 29, 94, NULL, 'GERMAN MEJIA.', '2022-08-15 10:06:26', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (475, 322, NULL, 'PENDIENTE', '2022-08-15 10:06:29', 30, 29, 94, NULL, 'GERMAN MEJIA.', '2022-08-15 10:06:29', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (476, 323, NULL, 'RECIBIDO', '2022-08-16 11:27:47', 1, 3, 61, NULL, 'Documento físico entregado a Erika Cruz', '2022-08-16 11:17:54', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (477, 324, NULL, 'RECIBIDO', '2022-08-18 11:09:54', 1, 34, 61, NULL, 'Documento físico entregado a la Srta. LIZETTE AGUILAR', '2022-08-18 11:05:01', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (478, 325, NULL, 'PENDIENTE', '2022-08-22 12:07:07', 1, 34, 61, NULL, 'Documento físico entregado a Srta. Lizzete Aguilar', '2022-08-22 12:07:07', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (479, 326, NULL, 'RECIBIDO', '2022-08-22 12:14:33', 1, 30, 61, NULL, 'Documento físico entregado al Dr. Cárcamo', '2022-08-22 12:10:21', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (480, 327, NULL, 'PENDIENTE', '2022-08-23 17:51:30', 1, 34, 61, NULL, 'Documento físico entregado a Srta. Lizzete Aguilar', '2022-08-23 17:51:30', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (481, 328, NULL, 'RECIBIDO', '2022-08-26 12:46:24', 1, 30, 61, NULL, 'Documento entregado a Dra. Jessica Lopez', '2022-08-26 12:13:56', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (482, 329, NULL, 'RECIBIDO', '2022-09-02 10:49:07', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-09-01 12:25:08', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (483, 330, NULL, 'RECIBIDO', '2022-09-02 10:48:50', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-09-02 10:47:27', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (484, 331, NULL, 'RECIBIDO', '2022-10-03 09:19:50', 1, 3, 61, NULL, '', '2022-09-05 17:42:39', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (485, 331, NULL, 'PENDIENTE', '2022-09-05 22:42:59', 1, 42, 61, NULL, 'Enviado por correo el link con el expediente.', '2022-09-05 22:42:59', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (486, 332, NULL, 'PENDIENTE', '2022-09-06 13:11:21', 1, 41, 61, NULL, '', '2022-09-06 13:11:21', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (487, 332, NULL, 'PENDIENTE', '2022-09-06 18:11:25', 1, 42, 61, NULL, '', '2022-09-06 18:11:25', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (488, 333, NULL, 'RECIBIDO', '2022-09-07 14:38:20', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-09-07 11:24:52', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (489, 334, NULL, 'RECIBIDO', '2022-09-08 11:52:00', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-09-08 11:38:28', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (490, 335, NULL, 'RECIBIDO', '2022-09-14 11:43:04', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-09-14 11:40:07', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (491, 336, NULL, 'RECIBIDO', '2022-09-15 14:09:26', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-09-15 10:46:42', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (492, 337, NULL, 'RECIBIDO', '2022-09-21 12:08:40', 1, 30, 61, NULL, 'Documento entregado a Dra. Jessica López ', '2022-09-21 11:25:52', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (493, 337, NULL, 'PENDIENTE', '2022-09-21 16:25:55', 1, 29, 61, NULL, '', '2022-09-21 16:25:55', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (494, 338, NULL, 'RECIBIDO', '2022-09-23 12:53:48', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-09-23 11:46:40', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (495, 339, NULL, 'PENDIENTE', '2022-09-26 16:00:10', 1, 42, 61, NULL, '', '2022-09-26 16:00:10', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (496, 339, NULL, 'ARCHIVADO', '2022-09-28 17:36:25', 1, 3, 61, NULL, 'Envío correo con link adjunto.', '2022-09-26 21:00:14', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (497, 340, NULL, 'PENDIENTE', '2022-09-27 15:46:15', 1, 29, 61, NULL, '', '2022-09-27 15:46:15', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (498, 340, NULL, 'PENDIENTE', '2022-09-27 20:46:19', 1, 29, 61, NULL, 'Documento entregado a Dra. Gabriela Laos', '2022-09-27 20:46:19', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (499, 341, NULL, 'RECIBIDO', '2022-09-28 17:35:49', 1, 3, 61, NULL, 'Documento entregado a Erika Cruz', '2022-09-28 17:31:11', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (500, 342, NULL, 'RECIBIDO', '2022-09-28 17:43:42', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-09-28 17:34:25', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (501, 343, NULL, 'RECIBIDO', '2022-09-29 18:14:34', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-09-29 15:04:38', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (502, 344, NULL, 'RECIBIDO', '2022-10-03 09:19:39', 1, 3, 61, NULL, '', '2022-09-30 18:03:59', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (503, 344, NULL, 'PENDIENTE', '2022-09-30 23:04:04', 1, 30, 61, NULL, '', '2022-09-30 23:04:04', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (504, 345, NULL, 'RECIBIDO', '2022-10-03 12:15:22', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-10-03 11:40:47', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (505, 346, NULL, 'PENDIENTE', '2022-10-03 11:49:12', 1, 30, 61, NULL, '', '2022-10-03 11:49:12', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (506, 346, NULL, 'PENDIENTE', '2022-10-03 16:49:16', 1, 29, 61, NULL, 'Documento entregado al Sr. Cárcamo', '2022-10-03 16:49:16', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (507, 347, NULL, 'RECIBIDO', '2022-10-06 16:53:29', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-10-06 16:47:50', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (508, 348, NULL, 'RECIBIDO', '2022-10-07 16:45:49', 1, 3, 61, NULL, '', '2022-10-06 17:05:04', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (509, 349, NULL, 'PENDIENTE', '2022-10-06 17:07:16', 1, 29, 61, NULL, '', '2022-10-06 17:07:16', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (510, 350, NULL, 'PENDIENTE', '2022-10-06 17:08:49', 1, 29, 61, NULL, '', '2022-10-06 17:08:49', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (511, 351, NULL, 'RECIBIDO', '2022-10-10 10:12:41', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-10-07 11:28:27', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (512, 352, NULL, 'RECIBIDO', '2022-10-19 11:18:18', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-10-19 11:14:12', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (513, 353, NULL, 'RECIBIDO', '2022-10-21 11:35:51', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-10-21 11:34:20', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (514, 354, NULL, 'RECIBIDO', '2022-10-21 11:45:36', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-10-21 11:36:20', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (515, 355, NULL, 'RECIBIDO', '2022-10-21 11:45:44', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-10-21 11:37:48', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (516, 356, NULL, 'RECIBIDO', '2022-10-25 14:49:56', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-10-25 14:20:33', NULL, 20, NULL);
INSERT INTO `tramite` VALUES (517, 357, NULL, 'PENDIENTE', '2022-10-26 16:30:51', 1, 34, 61, NULL, '', '2022-10-26 16:30:51', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (518, 358, NULL, 'RECIBIDO', '2022-11-02 17:47:14', 1, 30, 61, NULL, 'Documento entregado al Dr. Cárcamo', '2022-11-02 17:43:39', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (519, 359, NULL, 'DERIVADO', '2022-11-04 16:08:27', 1, 2, 61, NULL, 'Documento entregado a Edgar Quiroz', '2022-11-03 15:18:40', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (520, 360, NULL, 'ARCHIVADO', '2022-11-04 09:52:32', 1, 30, 61, NULL, 'Documento entregado al Dr. George Cárcamo', '2022-11-04 09:48:15', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (521, 359, NULL, 'RECIBIDO', '2022-11-04 11:27:23', 2, 30, 56, NULL, '', '2022-11-04 11:08:24', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (522, 361, NULL, 'PENDIENTE', '2022-11-04 14:38:03', 1, 34, 61, NULL, '', '2022-11-04 14:38:03', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (523, 362, NULL, 'PENDIENTE', '2022-11-04 16:08:47', 1, 48, 61, NULL, '', '2022-11-04 16:08:47', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (524, 363, NULL, 'PENDIENTE', '2022-11-07 11:14:34', 1, 46, 61, NULL, 'Documento entregado a Srta. Lizzete Aguilar', '2022-11-07 11:14:34', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (525, 364, NULL, 'PENDIENTE', '2022-11-07 11:16:31', 1, 37, 61, NULL, 'Documento entregado a Carlos Gomez', '2022-11-07 11:16:31', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (526, 365, NULL, 'RECIBIDO', '2022-11-09 18:28:57', 1, 34, 61, NULL, 'Documento entregado a Srta. L. Aguilar', '2022-11-09 17:39:16', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (527, 366, NULL, 'RECIBIDO', '2022-11-09 18:28:55', 1, 34, 61, NULL, 'Documento entregado a Srta. L. Aguilar', '2022-11-09 17:40:35', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (528, 367, NULL, 'RECIBIDO', '2022-11-09 18:28:53', 1, 34, 61, NULL, 'Documento entregado a Srta. L.Aguilar', '2022-11-09 17:41:42', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (529, 368, NULL, 'RECIBIDO', '2022-11-09 18:28:51', 1, 34, 61, NULL, 'Documento entregado a Srta. L. Aguilar', '2022-11-09 17:42:39', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (530, 369, NULL, 'PENDIENTE', '2022-11-11 15:14:06', 1, 30, 61, NULL, 'Expediente físico entregado al Dr. Cárcamo', '2022-11-11 15:14:06', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (531, 370, NULL, 'RECIBIDO', '2022-11-18 12:04:10', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete A.', '2022-11-18 11:31:12', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (532, 371, NULL, 'RECIBIDO', '2022-11-24 14:43:48', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizette Aguilar.', '2022-11-24 12:35:48', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (533, 372, NULL, 'PENDIENTE', '2022-12-06 15:01:49', 1, 30, 61, NULL, 'Documento entregado con cargo', '2022-12-06 15:01:49', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (534, 373, NULL, 'RECIBIDO', '2022-12-07 12:26:20', 1, 34, 61, NULL, 'Entregado a Srta. Lizzete Aguilar', '2022-12-07 12:19:41', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (535, 374, NULL, 'RECIBIDO', '2022-12-07 12:26:25', 1, 34, 61, NULL, '', '2022-12-07 12:22:17', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (536, 375, NULL, 'PENDIENTE', '2022-12-21 10:53:41', 1, 35, 61, NULL, 'Documento entregado a Eleana S.', '2022-12-21 10:53:41', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (537, 376, NULL, 'RECIBIDO', '2022-12-26 15:28:19', 1, 31, 61, NULL, 'Entregado a Ivan Silva', '2022-12-26 15:22:55', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (538, 377, NULL, 'DERIVADO', '2022-12-26 22:08:52', 1, 39, 61, NULL, 'Documento entregado a Ivan Silva', '2022-12-26 15:24:51', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (539, 377, NULL, 'RECIBIDO', '2022-12-26 17:10:59', 39, 31, 1, NULL, '', '2022-12-26 17:08:43', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (540, 377, NULL, 'PENDIENTE', '2022-12-26 17:08:48', 39, 31, 1, NULL, '', '2022-12-26 17:08:48', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (541, 378, NULL, 'PENDIENTE', '2022-12-29 13:03:18', 1, 48, 61, NULL, 'Presentación de Carta del 04.11.2022', '2022-12-29 13:03:18', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (542, 379, NULL, 'PENDIENTE', '2023-01-12 09:31:29', 1, 29, 61, NULL, 'Documento físico entregado a Germán Mejía.', '2023-01-12 09:31:29', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (543, 379, NULL, 'PENDIENTE', '2023-01-12 14:31:36', 1, 30, 61, NULL, '', '2023-01-12 14:31:36', NULL, 19, NULL);
INSERT INTO `tramite` VALUES (544, 380, NULL, 'PENDIENTE', '2023-01-12 17:58:36', 1, 31, 61, NULL, 'Documento recibido y comunicado por correo el 09.01.2023\r\nContabilidad - Erika Cruz-Pedro Puente-Ivan Silva', '2023-01-12 17:58:36', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (545, 381, NULL, 'DERIVADO', '2023-01-30 22:41:09', 1, 30, 61, NULL, 'Documento entregado a Dra. Lopez', '2023-01-30 15:47:22', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (546, 381, NULL, 'PENDIENTE', '2023-01-30 20:47:28', 1, 29, 61, NULL, '', '2023-01-30 20:47:28', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (547, 381, NULL, 'PENDIENTE', '2023-01-30 17:41:05', 30, 29, 105, NULL, '', '2023-01-30 17:41:05', NULL, 14, '2023/1/30/oficio-n-0101-2023-exp-0069-2022-descuento-judicialpdf-224109.pdf');
INSERT INTO `tramite` VALUES (548, 382, NULL, 'RECIBIDO', '2023-02-14 17:08:48', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete A.', '2023-02-14 13:05:36', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (549, 383, NULL, 'RECIBIDO', '2023-02-14 17:08:46', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete A.', '2023-02-14 13:07:28', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (550, 384, NULL, 'RECIBIDO', '2023-02-14 17:08:43', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete A.', '2023-02-14 13:09:11', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (551, 385, NULL, 'RECIBIDO', '2023-02-14 17:08:41', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete A.', '2023-02-14 13:10:18', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (552, 386, NULL, 'RECIBIDO', '2023-02-21 14:04:29', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizzete A.', '2023-02-20 17:14:31', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (553, 387, NULL, 'PENDIENTE', '2023-02-21 12:22:07', 1, 30, 61, NULL, 'Documento físico entregado al Dr. Cárcamo', '2023-02-21 12:22:07', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (554, 388, NULL, 'RECIBIDO', '2023-02-28 11:43:17', 1, 34, 61, NULL, 'FISICO ENTREGADO A SRTA. LIZZETE A.', '2023-02-28 11:39:53', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (555, 389, NULL, 'RECIBIDO', '2023-02-28 11:43:15', 1, 34, 61, NULL, 'FISICO ENTREGADO A SRTA. LIZZETE A.', '2023-02-28 11:41:18', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (556, 390, NULL, 'RECIBIDO', '2023-03-07 18:54:05', 1, 34, 61, NULL, 'Documento digital recibido con fecha 03-03-2023', '2023-03-07 12:46:39', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (557, 391, NULL, 'RECIBIDO', '2023-03-14 11:57:20', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizette A.', '2023-03-14 10:47:34', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (558, 392, NULL, 'PENDIENTE', '2023-03-22 18:08:06', 1, 49, 61, NULL, '', '2023-03-22 18:08:06', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (559, 393, NULL, 'PENDIENTE', '2023-03-27 10:24:41', 1, 49, 61, NULL, 'Documento dejado en sobre cerrado el día sábado 25-03\r\nFigura antigua dirección (Av. La Encalada 1420)', '2023-03-27 10:24:41', NULL, 20, NULL);
INSERT INTO `tramite` VALUES (560, 394, NULL, 'PENDIENTE', '2023-03-27 16:31:53', 1, 29, 61, NULL, 'Documentos entregados a German Mejía', '2023-03-27 16:31:53', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (561, 395, NULL, 'RECIBIDO', '2023-03-28 11:23:25', 1, 34, 61, NULL, 'Documentos entregados a Srta. Lizette Aguilar.', '2023-03-28 11:14:49', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (562, 396, NULL, 'PENDIENTE', '2023-03-31 11:38:05', 1, 49, 61, NULL, 'Sobre entregado con cargo N° 424', '2023-03-31 11:38:05', NULL, 7, NULL);
INSERT INTO `tramite` VALUES (563, 397, NULL, 'RECIBIDO', '2023-04-03 14:58:59', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizette A.', '2023-04-03 12:02:51', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (564, 398, NULL, 'PENDIENTE', '2023-04-03 12:59:30', 1, 30, 61, NULL, '', '2023-04-03 12:59:30', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (565, 398, NULL, 'PENDIENTE', '2023-04-03 17:59:34', 1, 29, 61, NULL, 'Documento entregado con cargo al área legal.', '2023-04-03 17:59:34', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (566, 399, NULL, 'RECIBIDO', '2023-04-05 14:15:14', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizette Aguilar.', '2023-04-05 12:08:20', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (567, 400, NULL, 'ARCHIVADO', '2023-05-02 14:56:01', 1, 30, 61, NULL, 'Documentos entregados a la Dra. Jessica Lopez.', '2023-05-02 12:24:14', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (568, 400, NULL, 'PENDIENTE', '2023-05-02 17:24:18', 1, 29, 61, NULL, '', '2023-05-02 17:24:18', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (569, 400, NULL, 'FINALIZADO', '2023-05-02 14:56:01', 30, 30, 93, NULL, '', '2023-05-02 14:56:01', NULL, NULL, NULL);
INSERT INTO `tramite` VALUES (570, 401, NULL, 'RECIBIDO', '2023-05-05 10:30:06', 1, 37, 61, NULL, 'Documento entregado a Miguel Cabrera', '2023-05-05 10:13:30', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (571, 402, NULL, 'RECIBIDO', '2023-05-08 16:32:46', 1, 34, 61, NULL, 'Documento entregado a Srta. Lizette Aguilar', '2023-05-08 16:01:26', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (572, 403, NULL, 'PENDIENTE', '2023-05-09 09:54:03', 1, 37, 61, NULL, 'DOCUMENTOS ENTREGADOS A MIGUEL CABRERA', '2023-05-09 09:54:03', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (573, 404, NULL, 'DERIVADO', '2023-05-11 20:35:51', 1, 30, 61, NULL, 'Documento entregado a Srta. Stefanía Torres', '2023-05-11 14:45:49', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (574, 404, NULL, 'ARCHIVADO', '2023-05-18 15:10:33', 1, 29, 61, NULL, '', '2023-05-11 19:45:58', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (575, 404, NULL, 'ARCHIVADO', '2023-05-18 15:11:12', 30, 29, 105, NULL, '', '2023-05-11 15:35:40', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (576, 404, NULL, 'PENDIENTE', '2023-05-11 15:35:48', 30, 29, 105, NULL, '', '2023-05-11 15:35:48', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (577, 405, NULL, 'PENDIENTE', '2023-05-15 10:34:11', 1, 48, 61, NULL, 'Carta entregado a Sra. Rosario Ocampo', '2023-05-15 10:34:11', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (578, 406, NULL, 'RECIBIDO', '2023-05-18 12:15:23', 1, 30, 61, NULL, 'Documento entregado a Dra. Jessica Lopez', '2023-05-18 10:25:57', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (579, 404, NULL, 'FINALIZADO', '2023-05-18 15:11:12', 29, 29, 63, NULL, '', '2023-05-18 15:11:12', NULL, NULL, NULL);
INSERT INTO `tramite` VALUES (580, 407, NULL, 'PENDIENTE', '2023-05-19 17:45:48', 1, 29, 61, NULL, 'Documento entregado a Germán Mejía', '2023-05-19 17:45:48', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (581, 408, NULL, 'PENDIENTE', '2023-05-25 16:26:53', 1, 31, 61, NULL, 'Documento entregado a Iván Silva', '2023-05-25 16:26:53', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (582, 409, NULL, 'PENDIENTE', '2023-05-25 16:30:09', 1, 29, 61, NULL, 'Documento entregado con cargo, STD se encontraba en mantenimiento', '2023-05-25 16:30:09', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (583, 410, NULL, 'PENDIENTE', '2023-05-25 18:10:23', 1, 50, 61, NULL, 'COMUNICADO AL DESTINATARIO: KARINA FEBRES', '2023-05-25 18:10:23', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (584, 411, NULL, 'RECIBIDO', '2023-05-26 10:04:41', 1, 30, 61, NULL, 'ADJUNTA EXPEDIENTE: 05803-2023-0-1801-JR-LA-11 (534 FOLIOS), ENTREGADO POR CARPETA COMPARTIDA AL DR. CÁRCAMO.', '2023-05-26 09:59:49', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (585, 412, NULL, 'PENDIENTE', '2023-05-31 17:23:19', 1, 30, 61, NULL, 'Documento entregado al Dr. Cárcamo', '2023-05-31 17:23:19', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (586, 413, NULL, 'PENDIENTE', '2023-06-02 10:08:32', 1, 37, 61, NULL, 'Documento registrado a solicitud de Permisos Ambientales (Miguel Cabrera) el 02/06/2023', '2023-06-02 10:08:32', NULL, 14, NULL);
INSERT INTO `tramite` VALUES (587, 414, NULL, 'RECIBIDO', '2023-06-05 16:07:21', 1, 30, 61, NULL, 'Documento entregado a Srta. Stefanía Torres', '2023-06-05 16:04:36', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (588, 415, NULL, 'PENDIENTE', '2023-06-06 16:45:20', 1, 37, 61, NULL, 'Documento entregado a Miguel Cabrera', '2023-06-06 16:45:20', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (589, 416, NULL, 'PENDIENTE', '2023-06-06 16:46:47', 1, 37, 61, NULL, 'Documento entregado a Miguel Cabrera', '2023-06-06 16:46:47', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (590, 417, NULL, 'PENDIENTE', '2023-06-08 16:37:31', 1, 4, 61, NULL, 'Documento físico entregado con cargo', '2023-06-08 16:37:31', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (591, 418, NULL, 'RECIBIDO', '2023-06-12 11:12:07', 1, 34, 61, NULL, 'Documento entregado a Lizette Aguilar', '2023-06-12 11:08:43', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (592, 419, NULL, 'RECIBIDO', '2023-06-15 11:40:48', 1, 34, 61, NULL, 'Documento entregado a Lizette Aguilar', '2023-06-15 11:36:32', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (593, 420, NULL, 'RECIBIDO', '2023-06-20 17:44:44', 1, 34, 61, NULL, 'Documento entregado a Lizette Aguilar', '2023-06-20 11:08:28', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (594, 421, NULL, 'PENDIENTE', '2023-06-21 14:37:25', 1, 30, 61, NULL, 'Físico entregado con cargo', '2023-06-21 14:37:25', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (595, 422, NULL, 'PENDIENTE', '2023-06-28 11:28:19', 1, 42, 61, NULL, 'Documento entregado con cargo N°468', '2023-06-28 11:28:19', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (596, 423, NULL, 'PENDIENTE', '2023-06-28 18:24:41', 1, 30, 61, NULL, 'Documento recibido por Gerencia Legal el 27/06/2023', '2023-06-28 18:24:41', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (597, 424, NULL, 'RECIBIDO', '2023-06-30 12:53:47', 1, 34, 61, NULL, 'Documento entregado a Lizette Aguilar', '2023-06-30 12:52:05', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (598, 425, NULL, 'PENDIENTE', '2023-07-11 16:57:25', 1, 31, 61, NULL, 'Físico entregado a Ivan Silva', '2023-07-11 16:57:25', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (599, 425, NULL, 'PENDIENTE', '2023-07-11 21:57:32', 1, 49, 61, NULL, '', '2023-07-11 21:57:32', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (600, 426, NULL, 'RECIBIDO', '2023-07-12 12:01:08', 1, 34, 61, NULL, 'Entregado a Lizette Aguilar', '2023-07-12 11:54:27', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (601, 427, NULL, 'RECIBIDO', '2023-07-12 12:01:20', 1, 34, 61, NULL, 'Entregado a Lizette Aguilar', '2023-07-12 11:55:58', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (602, 428, NULL, 'DERIVADO', '2023-07-17 18:00:32', 1, 30, 61, NULL, 'Documento físico entregado con cargo', '2023-07-17 12:35:35', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (603, 428, NULL, 'PENDIENTE', '2023-07-17 17:35:39', 1, 29, 61, NULL, 'Copiado para conocimiento', '2023-07-17 17:35:39', NULL, 4, NULL);
INSERT INTO `tramite` VALUES (604, 428, NULL, 'PENDIENTE', '2023-07-17 13:00:29', 30, 29, 105, NULL, '-', '2023-07-17 13:00:29', NULL, 9, '2023/7/17/csjll-oficio-n825-2023-exp895-2022-0-1608-jp-fc-01-cjvo-110723pdf-180032.pdf');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `usua_id` int NOT NULL AUTO_INCREMENT,
  `usua_ofic_id` int NULL DEFAULT NULL,
  `usua_nombres` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usua_apellidos` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usua_user` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usua_password` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usua_dni` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usua_email` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usua_movil` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usua_tipo` enum('ADMINISTRADOR','NORMAL') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `usua_intento` int NOT NULL DEFAULT 0,
  `usua_ultimoip` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `usua_estado` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`usua_id`) USING BTREE,
  INDEX `usua_ofic_id`(`usua_ofic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (1, 39, 'ADMINISTRADOR', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', '123456', '', '', 'ADMINISTRADOR', 0, '192.168.100.21', '1');
INSERT INTO `usuario` VALUES (54, 39, 'JUAN CARLOS', 'PORTOCARRERO ALONZO', 'jportocarrero', '0d0728d2fb729d8943a89bc5b7ed283b', '70372143', 'jportocarrero@summagold.com', '983791299', 'ADMINISTRADOR', 0, '192.168.100.21', '0');
INSERT INTO `usuario` VALUES (56, 2, 'EDGAR JESUS', 'QUIROZ PONTE', 'equiroz', '4ab8aff1ce49e0bfe4dc0e3037f2c392', '10817016', 'equiroz@summagold.com', '983791377', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (57, 2, 'ELIDA LIZBETH', 'POMACHAGUA SALAZAR', 'epomachagua', '31246cf6207ca42bd722ddb15663f069', '45525551', 'epomachagua@summagold.com', '961764831', 'NORMAL', 1, '192.168.100.65', '1');
INSERT INTO `usuario` VALUES (59, 2, 'ELITA MARLENE', 'ESPINOZA PEREZ', 'eespinoza', 'bd66f2095005a60c1927373f3c3cf487', '06665888', 'eespinoza@summagold.com', '958781686', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (60, 39, 'FRANKLIN ', 'ALFARO', 'falfaro', '7796197770a913e8ad8defcd36470c3d', '28066340', 'falfaro@summagold.com', '943753314', 'ADMINISTRADOR', 0, '', '1');
INSERT INTO `usuario` VALUES (61, 1, 'JULIANA INES', 'AREVALO ORDOÑEZ ', 'jarevalo', '69d01e5dbb1b28dbba212694d8d5822e', '40335834', 'jarevalo@summagold.com', '932553421', 'NORMAL', 0, '192.168.100.71', '1');
INSERT INTO `usuario` VALUES (63, 29, 'GERMAN', 'MEJIA DOMINGUEZ', 'gmejia', '2dd99972b3dcd77be4fb8bc94f608d79', '15845167', 'gmejia@summagold.com', '943773609', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (64, 31, 'IVAN', 'SILVA CAMIZAN', 'isilva', '16baf95f8cb35979d55a144c2be73360', '40781637', 'isilva@summagold.com', '942266072', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (65, 31, 'JUAN CARLOS', 'CISNEROS QUISPE', 'jcisneros', 'f86dfcef22583851f7ad2a1754941939', '42899775', 'jcisneros@summagold.com', '986989103', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (67, 3, 'ERIKA LISSET', 'CRUZ CARPIO', 'ecruz', 'c7341abb1f99a927822988cf11ac53c0', '41641037', 'ecruz@summagold.com', '966327884', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (68, 3, 'CARLA MAGALY', 'PRINCIPE FLORES ', 'cprincipe', '8c4df120465d57bded374ec9634e6c35', '10677163', 'cprincipe@summagold.com', '946840244', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (69, 33, 'PEDRO ARMANDO', 'PUENTE TORRES ', 'ppuente', 'a5e3cda1ad85b1e9a5b3467cb4bc07ae', '40598722', 'ppuente@summagold.com', '964315037', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (70, 3, 'ROSARIO ELIZABETH', 'OCAMPO OVIEDO', 'rocampo', '0d2af7aadfc093280526d0586a47938b', '09137131', 'rocampo@summagold.com', '941520266', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (71, 3, 'PAMELA JUDITH PRISCILA', 'DEL SOLAR PEDROZO', 'pdelsolar', '3a091c1b6271bc09abe7e685569b01be', '45611749', 'pdelsolar@summagold.com', '967725584', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (72, 34, 'ISABEL', 'OROZCO', 'morozco', '7a61b7351c33d5c014d777c0adead7dc', '10248567', 'MOROZCO@SUMMAGOLD.COM', '', 'NORMAL', 0, '192.168.100.32', '1');
INSERT INTO `usuario` VALUES (73, 47, 'ELEANA JANET', 'SABA CAZORLA', 'esaba', '7a0a2416cf2f14d7fc84edaf55b05610', '70486515', 'esaba@summagold.com', '964252053', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (76, 37, 'CECILIA KARINA', 'MELGAREJO MENDEZ', 'cmelgarejo', 'ff9fe97d8e156e24d06177514ceacb89', '40193498', 'cmelgarejo@summagold.com', '949139045', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (77, 30, 'GABRIELA', 'LAOS AYALA', 'glaos', '111f2928218b0b118ada022cf510bb2a', '70579786', 'glaos@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (79, 37, 'CARLOS AUGUSTO', 'GOMEZ PACHECO', 'cgomez', 'd31be23728e2f717dcf574b5b74faa75', '45578967', 'cgomez@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (80, 39, 'ADMIN TI', 'SUMMAGOLD', 'adminti', '3f06a3e8b61fab2c787eee6caf98de99', '', 'adminti@summagold.com', '', 'ADMINISTRADOR', 0, '', '1');
INSERT INTO `usuario` VALUES (82, 37, 'VICTOR JESUS ', 'GALICIA TORALVA', 'vgalicia', 'c321811c50ef3dd8240c585d216f1389', '72025927', 'vgalicia@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (83, 3, 'LUIS MIGUEL ', 'CRUZ CONTRERAS', 'lcruz', '98dbca4d5cd97a4a11807284c1173f71', '75201259', 'lcruz@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (84, 29, 'MARIELA ALEJANDRINA', 'TRUJILLO CEDAMANOS', 'mtrujillo', '409f41d396325efa453b823663fdee16', '74932212', 'mtrujillo@summagold.com', '', 'NORMAL', 0, '192.168.100.102', '1');
INSERT INTO `usuario` VALUES (85, 39, 'GUSTAVO', 'ESCOBAR MORENO', 'gescobarm', 'c59a96f2acc9833c5757dbd2566678a8', '74356279', 'gescobarm@summagold.com', '976548464', 'ADMINISTRADOR', 5, '192.168.100.21', '1');
INSERT INTO `usuario` VALUES (86, 41, 'WILIAM', 'YACTAYO', 'wyactayo', '710d52f15d05de82ab47428f641170ae', '08144874', 'wyactayo@summagold.com', '969331455', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (88, 49, 'FRANCISCO', 'MEDINA', 'fmedina', '756747657302eeea32faa12b68838f10', '09382399', 'fmedina@summagold.com', '973116086', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (90, 39, 'MARLENI', 'TOVAR ', 'mtovar', '564abb9f50b4cc5aed8740705e263ec1', '73431864', 'mtovar@summagold.com', '926638381', 'ADMINISTRADOR', 0, '', '1');
INSERT INTO `usuario` VALUES (91, 35, 'JAIME', 'POLAR PAREDES ', 'jpolar', '03ba0e004ea668284e380e29cebee65a', '06038942', 'jpolar@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (92, 35, 'LORENA PAOLA', 'ESPINOZA RAMOS', 'lespinoza', '183c89bf96edb1e9d5699e3eb51f840f', '73135322', 'lespinoza@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (93, 30, 'GEORGE LUIS', 'CARCAMO GOTTSCHALG', 'gcarcamo', '98b4fbf0be5e644395070f4ee4ad3015', '40569413', 'gcarcamo@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (94, 30, 'JESSICA ESTEFANIA', 'LOPEZ MORI', 'jlopez', '966860d5b002b8ee5fd05bf0d73f8560', '47759323', 'jlopez@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (95, 30, 'MIGUEL', 'REYES ARRESE', 'mreyes', '236282fae4a0da7ed9351bce5d6c9c8f', '40936918', 'mreyes@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (96, 2, 'ANTHONY JOEL', 'MONTES BARRERA', 'amontes', 'a9a52b9eff592391a924d386a2d1e5f0', '72668587', 'amontes@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (97, 2, 'RODDY DENNIS', 'VELARDE LAZARTE', 'dvelarde', 'b983239de4a7504db240db44e3e7b2f0', '29352280', 'dvelarde@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (98, 2, 'CLAUDIO', 'RAFFO CALDERON', 'craffo', 'ae384f14ebae2f0835dd160505c69900', '07857763', 'craffo@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (99, 37, 'ADYURI NADESHA', 'TORRES VIVAR', 'atorres', '01167c009ce4006761f2145a9985363c', '48281098', 'atorres@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (100, 41, 'JOSE MARTIN', 'YARLEQUE NEYRA', 'myarleque', '97c930fcfa759625beda27d50471233e', '06775989', 'myarleque@summagold.com', '932420229', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (101, 34, 'MANUEL ALEX', 'OLIVERA ESPINOZA', 'aolivera', 'f015041a86dc7970a4b0ded57eb1702f', '09344725', 'aolivera@summagold.com', '998494187', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (102, 46, 'MARCO ANTONIO', 'GUILLEN PACHAS', 'mguillen', '1ff94f922f6a678f699ef5ddb4687b7e', '40398663', 'mguillen@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (103, 48, 'JUAN CARLOS', 'MILJANOVICH COLUNGE', 'jmiljanovich', '140805b354ad868f8e64d1440687e3c4', '09335238', 'jmiljanovich@summagold.com', '942713390', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (104, 34, 'LIZETTE ILEANA', 'AGUILAR DIAZ', 'laguilar', 'db946e272329c86918cd6e38d3473bee', '73176336', 'laguilar@summagold.com', '', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (105, 30, 'STEFANIA RAQUEL', 'TORRES ESPINOZA', 'storres', '7ff1a19c7f7afae63269e8b47b627518', '73124532', 'storres@summagold.com', '940578868', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (106, 37, 'MIGUEL', 'CABRERA', 'mcabrera', 'cee144e4fd7c2100801e14765d6bb2a9', '74060669', 'mcabrera@summagold.com', '921706229', 'NORMAL', 0, '', '1');
INSERT INTO `usuario` VALUES (107, 50, 'KARINA ALEXANDRA', 'FEBRES REYES', 'kfebres', '9d439ebdde3f12ceb8a030e141a0633a', '76858491', 'kfebres@summagold.com', '963758351', 'NORMAL', 0, '', '1');

SET FOREIGN_KEY_CHECKS = 1;
