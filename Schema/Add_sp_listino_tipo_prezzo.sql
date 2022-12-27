-- serviceportal.sp_listino_tipo_prezzo definition
CREATE TABLE `sp_listino_tipo_prezzo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_listino` bigint(20) NOT NULL,
  `codice_tipo_prezzo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_listino_2` (`id_listino`),
  KEY `fk_codice_tipo_prezzo` (`codice_tipo_prezzo`),
  CONSTRAINT `fk_id_listino_3` FOREIGN KEY (`id_listino`) REFERENCES `sp_d_listino` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_codice_tipo_prezzo_3` FOREIGN KEY (`codice_tipo_prezzo`) REFERENCES `sp_d_tipo_prezzo` (`codice`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;