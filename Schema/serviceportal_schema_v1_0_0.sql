-- serviceportal.sp_account_staas definition
CREATE TABLE `sp_account_staas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ref_account` varchar(100) DEFAULT NULL,
  `data_inizio_associazione` date NOT NULL,
  `data_fine_associazione` date DEFAULT NULL,
  `tipologia` varchar(20) NOT NULL,
  `evs` varchar(100) DEFAULT NULL,
  `filesystem` varchar(100) DEFAULT NULL,
  `share` varchar(100) DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_categoria_news definition
CREATE TABLE `sp_categoria_news` (
  `codice` varchar(30) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_config definition
CREATE TABLE `sp_config` (
  `nome` varchar(32) NOT NULL,
  `valore` varchar(256) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_modifica` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


-- serviceportal.sp_costo_giorno definition
CREATE TABLE `sp_costo_giorno` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ref_account` varchar(100) NOT NULL,
  `data` date NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  `ref_divisione` varchar(100) DEFAULT NULL,
  `ref_organizzazione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `GIORNO-ACCOUNT` (`ref_account`,`data`),
  KEY `data_idx` (`data`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11075829 DEFAULT CHARSET=utf8;


-- serviceportal.sp_costo_giorno_fixed definition
CREATE TABLE `sp_costo_giorno_fixed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ref_account` varchar(100) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL,
  `id_metrica` bigint(20) NOT NULL,
  `qta` double(20,2) NOT NULL,
  `costo` double(20,6) NOT NULL,
  `origine` varchar(20) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `GIORNO-ACCOUNT` (`ref_account`,`data_inizio`),
  KEY `data_idx` (`data_inizio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8510966 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_remedy_impatto definition
CREATE TABLE `sp_d_remedy_impatto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valore` int(11) NOT NULL,
  `valore_remedy` varchar(50) NOT NULL,
  `descrizione` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_remedy_tipologia definition
CREATE TABLE `sp_d_remedy_tipologia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valore` varchar(16) NOT NULL,
  `descrizione` varchar(100) NOT NULL,
  `valore_remedy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_remedy_urgenza definition
CREATE TABLE `sp_d_remedy_urgenza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valore` int(11) NOT NULL,
  `valore_remedy` varchar(50) NOT NULL,
  `descrizione` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_tipo_attributo definition
CREATE TABLE `sp_d_tipo_attributo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descrizione_estesa` varchar(128) NOT NULL,
  `organizzazione` tinyint(4) DEFAULT 1,
  `divisione` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Elenco degli attributi possibili su Divisione e organizzazione';


-- serviceportal.sp_d_tipo_evento definition
CREATE TABLE `sp_d_tipo_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codice_evento` varchar(32) NOT NULL,
  `descrizione_evento` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_tipo_listino definition
CREATE TABLE `sp_d_tipo_listino` (
  `codice` varchar(20) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_tipo_prezzo definition
CREATE TABLE `sp_d_tipo_prezzo` (
  `codice` varchar(20) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`codice`),
  UNIQUE KEY `codice_UNIQUE` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_tipo_rendiconto definition
CREATE TABLE `sp_d_tipo_rendiconto` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `codice` varchar(80) NOT NULL,
  `descrizione` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_tipo_servizio definition
CREATE TABLE `sp_d_tipo_servizio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descrizione` varchar(200) NOT NULL,
  `etichetta` varchar(32) NOT NULL,
  `colore` varchar(45) DEFAULT NULL,
  `ordine` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_wbs definition

CREATE TABLE `sp_d_wbs` (
  `ewbs` varchar(50) NOT NULL,
  `id_committente` bigint(20) NOT NULL,
  `committente` varchar(200) NOT NULL,
  `id_cat_tipologia` varchar(20) NOT NULL,
  `descr_cat_tipologia` varchar(100) NOT NULL,
  `id_cat_sottotipologia` varchar(20) NOT NULL,
  `descr_cat_sottotipologia` varchar(100) NOT NULL,
  PRIMARY KEY (`ewbs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_log definition
CREATE TABLE `sp_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stored_procedure` varchar(255) NOT NULL,
  `log_testo` varchar(255) DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4854129 DEFAULT CHARSET=utf8;


-- serviceportal.sp_log_accesso_shib definition
CREATE TABLE `sp_log_accesso_shib` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `comunita_shib` varchar(100) NOT NULL,
  `data_accesso` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_ruolo definition
CREATE TABLE `sp_ruolo` (
  `ruolo` varchar(20) NOT NULL,
  `descrizione` varchar(100) NOT NULL,
  `data_inizio_validita` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `data_fine_validita` timestamp NULL DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ruolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_stato_news definition
CREATE TABLE `sp_stato_news` (
  `stato` varchar(30) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_t_consumi_staas definition
CREATE TABLE `sp_t_consumi_staas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `evs` varchar(100) DEFAULT NULL,
  `filesystem` varchar(100) DEFAULT NULL,
  `share` varchar(100) DEFAULT NULL,
  `used_gb` double(20,5) DEFAULT NULL,
  `quota_gb` double(20,5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_tmp_org_div_account definition
CREATE TABLE `sp_tmp_org_div_account` (
  `organization_uuid` varchar(50) NOT NULL,
  `division_uuid` varchar(50) NOT NULL,
  `account_uuid` varchar(50) NOT NULL,
  `organization_desc` varchar(100) DEFAULT NULL,
  `division_desc` varchar(100) DEFAULT NULL,
  `account_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`account_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_user definition
CREATE TABLE `sp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `secret_key` varchar(100) DEFAULT NULL,
  `matricola_csi` varchar(10) DEFAULT NULL,
  `cmp_username` varchar(100) DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  `attivo` tinyint(1) DEFAULT NULL,
  `attivoCMP` tinyint(1) DEFAULT NULL,
  `uuid_utente` varchar(50) DEFAULT NULL,
  `stato` varchar(100) DEFAULT 'ATTIVO',
  `usa_credenziali` tinyint(4) DEFAULT 0,
  `usa_remedy` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_login` (`username`),
  UNIQUE KEY `uuid_utente_UNIQUE` (`uuid_utente`)
) ENGINE=InnoDB AUTO_INCREMENT=1272 DEFAULT CHARSET=utf8;



-- serviceportal.sp_account_attributo definition
CREATE TABLE `sp_account_attributo` (
  `ref_account` varchar(100) NOT NULL,
  `tipo_prezzo` varchar(20) DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `division` varchar(100) DEFAULT NULL,
  `acronimo` varchar(100) DEFAULT NULL,
  `managed` varchar(100) DEFAULT NULL,
  `aggiorna_costi_giorno` tinyint(4) DEFAULT NULL,
  `data_inizio_consumi` date DEFAULT NULL,
  `person_id` varchar(32) DEFAULT NULL,
  `budget_min` int(9) unsigned DEFAULT NULL,
  `budget_max` int(9) unsigned DEFAULT NULL,
  `data_fine_consumi` date DEFAULT NULL,
  `company_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ref_account`),
  KEY `fk_importo_prezzario` (`tipo_prezzo`),
  CONSTRAINT `fk_importo_prezzario` FOREIGN KEY (`tipo_prezzo`) REFERENCES `sp_d_tipo_prezzo` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_account_wbs definition
CREATE TABLE `sp_account_wbs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ref_account` varchar(100) NOT NULL,
  `ewbs` varchar(50) NOT NULL,
  `ewbs_perc` double(5,2) NOT NULL,
  `data_inizio_associazione` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_fine_associazione` timestamp NULL DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_agente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acccwbs_wbs` (`ewbs`),
  CONSTRAINT `fk_accwbs_wbs` FOREIGN KEY (`ewbs`) REFERENCES `sp_d_wbs` (`ewbs`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5581 DEFAULT CHARSET=utf8;


-- serviceportal.sp_costo_giorno_wbs definition
CREATE TABLE `sp_costo_giorno_wbs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_costo_giorno` bigint(20) NOT NULL,
  `ewbs` varchar(50) NOT NULL,
  `costo` double(20,5) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_costo_ewbs` (`ewbs`),
  KEY `fk_costo_dettaglio_3_idx` (`id_costo_giorno`),
  CONSTRAINT `fk_costo_dettaglio_3` FOREIGN KEY (`id_costo_giorno`) REFERENCES `sp_costo_giorno` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ewbs_3` FOREIGN KEY (`ewbs`) REFERENCES `sp_d_wbs` (`ewbs`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5172405 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_listino definition
CREATE TABLE `sp_d_listino` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `data_inizio_validita` date DEFAULT NULL,
  `data_fine_validita` date DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  `tipo_listino` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_listino` (`tipo_listino`),
  CONSTRAINT `fk_tipo_listino` FOREIGN KEY (`tipo_listino`) REFERENCES `sp_d_tipo_listino` (`codice`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_read_the_docs_mapping definition
CREATE TABLE `sp_d_read_the_docs_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_label` varchar(50) NOT NULL,
  `doc_url` varchar(255) NOT NULL,
  `id_utente` bigint(20) NOT NULL,
  `data_inserimento` timestamp NOT NULL DEFAULT current_timestamp(),
  `lingua` varchar(2) NOT NULL DEFAULT 'IT',
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_label_UNIQUE` (`route_label`),
  KEY `fk_id_utente_idx` (`id_utente`),
  CONSTRAINT `fk_id_utente` FOREIGN KEY (`id_utente`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_remedy_cat_operativa definition
CREATE TABLE `sp_d_remedy_cat_operativa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tipologia` int(11) NOT NULL,
  `cod_tecnologia` varchar(50) NOT NULL,
  `livello1` varchar(64) NOT NULL,
  `livello2` varchar(64) NOT NULL,
  `livello3` varchar(64) NOT NULL,
  `tipologia_tripletta` varchar(64) NOT NULL DEFAULT 'Ripristino di servizio utente',
  PRIMARY KEY (`id`),
  KEY `fk_catope_tipologia` (`id_tipologia`),
  CONSTRAINT `fk_catope_tipologia` FOREIGN KEY (`id_tipologia`) REFERENCES `sp_d_remedy_tipologia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_sottoservizio definition
CREATE TABLE `sp_d_sottoservizio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_servizio_padre` int(10) unsigned NOT NULL,
  `nome` varchar(24) COLLATE latin1_general_ci DEFAULT NULL,
  `descrizione` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `ordine` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_servizio_padre` (`id_servizio_padre`),
  CONSTRAINT `fk_servizio_padre` FOREIGN KEY (`id_servizio_padre`) REFERENCES `sp_d_tipo_servizio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Secondo livello della catalogazione delle metriche';


-- serviceportal.sp_d_tipo_documento definition
CREATE TABLE `sp_d_tipo_documento` (
  `id` int(10) unsigned NOT NULL COMMENT 'identificativo del tipo documento',
  `tipo_documento` varchar(32) NOT NULL COMMENT '''Tipo di documento nome per la folder su S3''',
  `attivo` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Indica se è possibile inviare documenti a questa folder',
  `data_inserimento` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `tipo_documento_UNIQUE` (`tipo_documento`),
  KEY `fk_id_agente_idx` (`id_agente`),
  CONSTRAINT `fk_id_agente` FOREIGN KEY (`id_agente`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Decodifica dei tipi di documento inviabili su S3. Corrisponde ad un folder nella cartella di reportistica dell''account';


-- serviceportal.sp_d_tipo_form definition
CREATE TABLE `sp_d_tipo_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `classe_json` varchar(256) NOT NULL,
  `livello1` varchar(64) NOT NULL,
  `livello2` varchar(64) NOT NULL,
  `livello3` varchar(64) NOT NULL,
  `tipologia` varchar(64) NOT NULL,
  `id_agente` bigint(20) NOT NULL,
  `data_inserimento` datetime NOT NULL DEFAULT current_timestamp(),
  `data_modifica` datetime DEFAULT NULL,
  `categoria` varchar(24) NOT NULL DEFAULT 'INCIDENT',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  KEY `fk_utente_tipo_form_idx` (`id_agente`),
  CONSTRAINT `fk_utente_tipo_form` FOREIGN KEY (`id_agente`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_urgenza_form definition
CREATE TABLE `sp_d_urgenza_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `liv_gest_tenant_da` int(11) NOT NULL,
  `liv_gest_tenant_a` int(11) NOT NULL,
  `id_impatto` int(11) NOT NULL,
  `id_tipologia` int(11) NOT NULL,
  `id_urgenza` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_impatto_idx` (`id_impatto`),
  KEY `fk_tipologia_idx` (`id_tipologia`),
  KEY `fk_urgenza_idx` (`id_urgenza`),
  CONSTRAINT `fk_impatto` FOREIGN KEY (`id_impatto`) REFERENCES `sp_d_remedy_impatto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipologia` FOREIGN KEY (`id_tipologia`) REFERENCES `sp_d_remedy_tipologia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_urgenza` FOREIGN KEY (`id_urgenza`) REFERENCES `sp_d_remedy_urgenza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;


-- serviceportal.sp_divisione_attributo definition
CREATE TABLE `sp_divisione_attributo` (
  `id` varchar(36) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `valore` varchar(128) NOT NULL,
  `id_agente` bigint(20) NOT NULL,
  `data_inserimento` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `div_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TIPO_idx` (`id_tipo`),
  KEY `fk_utente_idx` (`id_agente`),
  CONSTRAINT `FK_TIPO` FOREIGN KEY (`id_tipo`) REFERENCES `sp_d_tipo_attributo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_utente` FOREIGN KEY (`id_agente`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_form_richieste definition
CREATE TABLE `sp_form_richieste` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `json` longtext NOT NULL,
  `ref_account` varchar(45) NOT NULL,
  `ticket_id` varchar(45) DEFAULT NULL,
  `inviato` tinyint(4) NOT NULL DEFAULT 0,
  `data_inserimento` datetime DEFAULT current_timestamp(),
  `data_modifica` datetime DEFAULT NULL,
  `data_invio` datetime DEFAULT NULL,
  `id_utente_inserimento` bigint(20) NOT NULL,
  `id_utente_modifica` bigint(20) DEFAULT NULL,
  `id_utente_invio` bigint(20) DEFAULT NULL,
  `id_tipo_form` bigint(20) NOT NULL,
  `stato` varchar(32) DEFAULT NULL,
  `ultimo_aggiornamento_stato` datetime DEFAULT NULL,
  `severity` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `scope` varchar(45) DEFAULT NULL,
  `service` varchar(45) DEFAULT NULL,
  `tecnologia` varchar(45) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `riepilogo_scelte` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_utente_inserimento_idx` (`id_utente_inserimento`),
  KEY `fk_utente_modifica_idx` (`id_utente_modifica`),
  KEY `fk_utente_invio_idx` (`id_utente_invio`),
  KEY `fk_tipo_form_idx` (`id_tipo_form`),
  KEY `fk_severita_id` (`severity`),
  CONSTRAINT `fk_severita_id` FOREIGN KEY (`severity`) REFERENCES `sp_d_remedy_urgenza` (`id`),
  CONSTRAINT `fk_tipo_form` FOREIGN KEY (`id_tipo_form`) REFERENCES `sp_d_tipo_form` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_utente_inserimento` FOREIGN KEY (`id_utente_inserimento`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_utente_invio` FOREIGN KEY (`id_utente_invio`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_utente_modifica` FOREIGN KEY (`id_utente_modifica`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1878 DEFAULT CHARSET=utf8;


-- serviceportal.sp_log_accesso_user definition
CREATE TABLE `sp_log_accesso_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `data_accesso` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_accesso_user_id_idx` (`user_id`),
  CONSTRAINT `fk_accesso_user_id` FOREIGN KEY (`user_id`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_log_azione definition
CREATE TABLE `sp_log_azione` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `oggetto` varchar(45) DEFAULT NULL,
  `azione` varchar(16) NOT NULL,
  `descrizione` varchar(128) NOT NULL,
  `account` varchar(64) DEFAULT NULL,
  `divisione` varchar(64) DEFAULT NULL,
  `organizzazione` varchar(64) DEFAULT NULL,
  `data_azione` timestamp NOT NULL DEFAULT current_timestamp(),
  `indirizzo_ip` varchar(32) DEFAULT NULL,
  `ruolo` varchar(64) NOT NULL,
  `parametri` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_azione_user_id_idx` (`user_id`),
  CONSTRAINT `fk_azione_user_id` FOREIGN KEY (`user_id`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=94056 DEFAULT CHARSET=utf8;


-- serviceportal.sp_log_invocazioni_cmp definition
CREATE TABLE `sp_log_invocazioni_cmp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `servizio_invocato` varchar(255) NOT NULL COMMENT 'Path del servizio invocato inclusivo di parametri se metodo = GET',
  `metodo` varchar(6) NOT NULL COMMENT 'Metodo HTTP della richiesta',
  `data_invocazione` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sp_user_id` bigint(20) NOT NULL,
  `headers_richiesta` text DEFAULT NULL,
  `body_richiesta` text DEFAULT NULL,
  `headers_risposta` text DEFAULT NULL,
  `body_risposta` text DEFAULT NULL,
  `http_code` varchar(3) NOT NULL,
  `http_code_description` varchar(255) DEFAULT NULL,
  `esito` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `utente_esistente_idx` (`sp_user_id`),
  CONSTRAINT `utente_esistente` FOREIGN KEY (`sp_user_id`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_mail_richiesta definition
CREATE TABLE `sp_mail_richiesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_utente` bigint(20) NOT NULL,
  `id_tipo_richiesta` int(11) NOT NULL,
  `oggetto` varchar(256) NOT NULL,
  `testo` varchar(5000) DEFAULT NULL,
  `ref_account` varchar(100) NOT NULL,
  `data_richiesta` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_sp_user_idx` (`id_utente`),
  KEY `fk_id_richiesta_idx` (`id_tipo_richiesta`),
  CONSTRAINT `fk_id_richiesta` FOREIGN KEY (`id_tipo_richiesta`) REFERENCES `sp_d_tipo_evento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sp_user` FOREIGN KEY (`id_utente`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;


-- serviceportal.sp_news definition
CREATE TABLE `sp_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(255) DEFAULT NULL,
  `contenuto` varchar(5000) DEFAULT NULL,
  `stato` varchar(30) DEFAULT NULL,
  `data_pubblicazione_inizio` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_pubblicazione_fine` timestamp NULL DEFAULT NULL,
  `codice_categoria` varchar(30) DEFAULT NULL,
  `autore_id` bigint(20) DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  `priorita` int(11) NOT NULL DEFAULT 10,
  PRIMARY KEY (`id`),
  KEY `fk_news_categoria` (`codice_categoria`),
  KEY `fk_news_stato` (`stato`),
  CONSTRAINT `fk_news_categoria` FOREIGN KEY (`codice_categoria`) REFERENCES `sp_categoria_news` (`codice`),
  CONSTRAINT `fk_news_stato` FOREIGN KEY (`stato`) REFERENCES `sp_stato_news` (`stato`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;


-- serviceportal.sp_news_user definition
CREATE TABLE `sp_news_user` (
  `news_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `data_lettura` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`news_id`,`user_id`),
  KEY `fk_news_user_user` (`user_id`),
  CONSTRAINT `fk_news_user_news` FOREIGN KEY (`news_id`) REFERENCES `sp_news` (`id`),
  CONSTRAINT `fk_news_user_user` FOREIGN KEY (`user_id`) REFERENCES `sp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_organizzazione_attributo definition
CREATE TABLE `sp_organizzazione_attributo` (
  `id` varchar(36) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `valore` varchar(128) NOT NULL,
  `id_agente` bigint(20) NOT NULL,
  `data_inserimento` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `org_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TIPO_org_idx` (`id_tipo`),
  KEY `fk_utente_org_idx` (`id_agente`),
  CONSTRAINT `FK_TIPO_org` FOREIGN KEY (`id_tipo`) REFERENCES `sp_d_tipo_attributo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_utente_org` FOREIGN KEY (`id_agente`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_r_listino_tipo_prezzo definition
CREATE TABLE `sp_r_listino_tipo_prezzo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codice_tipo_prezzo` varchar(20) NOT NULL,
  `id_listino` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_codice_tipo_prezzo_listino_idx` (`codice_tipo_prezzo`),
  KEY `fk_id_listino_associazione_tipo_prezzo_idx` (`id_listino`),
  CONSTRAINT `fk_codice_tipo_prezzo_listino_idx` FOREIGN KEY (`codice_tipo_prezzo`) REFERENCES `sp_d_tipo_prezzo` (`codice`),
  CONSTRAINT `fk_id_listino_associazione_tipo_prezzo` FOREIGN KEY (`id_listino`) REFERENCES `sp_d_listino` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;


-- serviceportal.sp_rendiconto definition
CREATE TABLE `sp_rendiconto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_rendiconto` int(1) NOT NULL,
  `id_account` varchar(50) DEFAULT NULL,
  `id_divisione` varchar(50) DEFAULT NULL,
  `id_organizzazione` varchar(50) DEFAULT NULL,
  `data_rendiconto_da` date NOT NULL,
  `data_rendiconto_a` date NOT NULL,
  `descrizione` varchar(150) DEFAULT NULL,
  `importo` double(20,2) DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `report` longblob DEFAULT NULL,
  `nota` varchar(150) DEFAULT NULL,
  `anno` smallint(6) DEFAULT NULL,
  `mese` smallint(6) DEFAULT NULL,
  `url_file` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blocca_rendiconto` (`tipo_rendiconto`,`id_account`,`anno`,`mese`),
  KEY `fk_rendiconto_tipo_rendiconto` (`tipo_rendiconto`),
  CONSTRAINT `fk_rendiconto_tipo_rendiconto` FOREIGN KEY (`tipo_rendiconto`) REFERENCES `sp_d_tipo_rendiconto` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=686955 DEFAULT CHARSET=utf8;


-- serviceportal.sp_rendiconto_servizio definition
CREATE TABLE `sp_rendiconto_servizio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_servizio` varchar(32) NOT NULL,
  `importo` decimal(10,2) NOT NULL,
  `data_inserimento` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_rendiconto` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rendiconto_idx` (`id_rendiconto`),
  CONSTRAINT `fk_rendiconto` FOREIGN KEY (`id_rendiconto`) REFERENCES `sp_rendiconto` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_user_ruolo definition
CREATE TABLE `sp_user_ruolo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `ruolo` varchar(100) NOT NULL,
  `data_inizio_validita` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `data_fine_validita` timestamp NULL DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_ruolo_user_id` (`user_id`),
  CONSTRAINT `fk_user_ruolo_user_id` FOREIGN KEY (`user_id`) REFERENCES `sp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;


-- serviceportal.sp_account_infocosto definition
CREATE TABLE `sp_account_infocosto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ref_account` varchar(100) NOT NULL,
  `tipo_listino` varchar(20) DEFAULT NULL,
  `tipo_prezzo` varchar(20) DEFAULT NULL,
  `usa_listino_specifico` varchar(1) DEFAULT 'N',
  `id_listino_specifico` bigint(20) DEFAULT NULL,
  `data_inizio_associazione` timestamp NULL DEFAULT NULL,
  `data_fine_associazione` timestamp NULL DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_agente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `idx_sp_account_infocosto_data_inizio_associazione_ref_account` (`data_inizio_associazione`,`ref_account`),
  KEY `fk_infocosto_tipoprezzo` (`tipo_prezzo`),
  KEY `fk_infocosto_tipolistino` (`tipo_listino`),
  KEY `fk_infocosto_idlistino` (`id_listino_specifico`),
  CONSTRAINT `fk_infocosto_idlistino` FOREIGN KEY (`id_listino_specifico`) REFERENCES `sp_d_listino` (`id`),
  CONSTRAINT `fk_infocosto_tipolistino` FOREIGN KEY (`tipo_listino`) REFERENCES `sp_d_tipo_listino` (`codice`),
  CONSTRAINT `fk_infocosto_tipoprezzo` FOREIGN KEY (`tipo_prezzo`) REFERENCES `sp_d_tipo_prezzo` (`codice`)
) ENGINE=InnoDB AUTO_INCREMENT=1194 DEFAULT CHARSET=utf8;


-- serviceportal.sp_assegnatario_richiesta definition
CREATE TABLE `sp_assegnatario_richiesta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `id_richiesta` bigint(20) NOT NULL,
  `data_inizio_validita` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `data_fine_validita` timestamp NULL DEFAULT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  `attivo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_assegnatario_user_assegnato` (`user_id`),
  KEY `fk_assegnatario_agente_inserimento` (`id_agente`),
  KEY `fk_form_idx` (`id_richiesta`),
  CONSTRAINT `fk_assegnatario_agente_inserimento` FOREIGN KEY (`id_agente`) REFERENCES `sp_user` (`id`),
  CONSTRAINT `fk_assegnatario_user_assegnato` FOREIGN KEY (`user_id`) REFERENCES `sp_user` (`id`),
  CONSTRAINT `fk_form` FOREIGN KEY (`id_richiesta`) REFERENCES `sp_form_richieste` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_metriche definition
CREATE TABLE `sp_d_metriche` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `udm` varchar(40) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `calc_regex` varchar(500) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `servizio` int(10) unsigned NOT NULL,
  `ordine_servizio` int(11) DEFAULT NULL,
  `is_tenant_cost` varchar(1) DEFAULT NULL,
  `id_sottoservizio` int(11) DEFAULT NULL,
  `visualizza_report` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sp_d_metriche_nome` (`nome`),
  KEY `idx_tipo` (`tipo`),
  KEY `ggg_idx` (`servizio`),
  KEY `fk_sottoservizio_idx` (`id_sottoservizio`),
  CONSTRAINT `fk_sottoservizio` FOREIGN KEY (`id_sottoservizio`) REFERENCES `sp_d_sottoservizio` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `ggg` FOREIGN KEY (`servizio`) REFERENCES `sp_d_tipo_servizio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;


-- serviceportal.sp_form_allegato definition
CREATE TABLE `sp_form_allegato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_form` bigint(20) NOT NULL,
  `log_id` varchar(45) DEFAULT NULL,
  `file` mediumblob DEFAULT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `inviato` tinyint(4) DEFAULT 0,
  `note` varchar(1024) DEFAULT NULL,
  `riepilogo` varchar(256) DEFAULT NULL,
  `id_utente_inserimento` bigint(20) NOT NULL,
  `data_inserimento` datetime NOT NULL DEFAULT current_timestamp(),
  `tipologia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_form_id_idx` (`id_form`),
  KEY `fk_form_allegato_utente_inserimento_idx` (`id_utente_inserimento`),
  CONSTRAINT `fk_form_allegato_utente_inserimento` FOREIGN KEY (`id_utente_inserimento`) REFERENCES `sp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_form_id` FOREIGN KEY (`id_form`) REFERENCES `sp_form_richieste` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8;


-- serviceportal.sp_metriche_dichiarate definition
CREATE TABLE `sp_metriche_dichiarate` (
  `id` varchar(36) NOT NULL,
  `id_metrica` bigint(20) NOT NULL,
  `ref_account` varchar(100) NOT NULL,
  `data_inizio_validita` date NOT NULL,
  `data_fine_validita` date DEFAULT NULL,
  `qta` double(20,2) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  `applica_una_tantum` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_dich_metrica` (`id_metrica`),
  CONSTRAINT `fk_dich_metrica` FOREIGN KEY (`id_metrica`) REFERENCES `sp_d_metriche` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- serviceportal.sp_costo_giorno_dettaglio definition
CREATE TABLE `sp_costo_giorno_dettaglio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_costo_giorno` bigint(20) NOT NULL,
  `id_metrica` bigint(20) NOT NULL,
  `qta` double(20,2) NOT NULL,
  `costo` double(20,6) NOT NULL,
  `origine` varchar(20) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_costo_metrica_2` (`id_metrica`),
  KEY `fk_costo_dettaglio_2_idx` (`id_costo_giorno`),
  CONSTRAINT `fk_costo_dettaglio_2` FOREIGN KEY (`id_costo_giorno`) REFERENCES `sp_costo_giorno` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_metrica_2` FOREIGN KEY (`id_metrica`) REFERENCES `sp_d_metriche` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=128322060 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_listino_dettaglio definition
CREATE TABLE `sp_d_listino_dettaglio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_listino` bigint(20) NOT NULL,
  `id_metrica` bigint(20) NOT NULL,
  `voce` varchar(100) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `udm` varchar(40) NOT NULL,
  `qta` double(20,2) NOT NULL DEFAULT 1.00,
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  `RANGE_MIN` double(20,2) DEFAULT NULL,
  `RANGE_MAX` double(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dettlist_listino` (`id_listino`),
  KEY `fk_dettlist_metrica` (`id_metrica`),
  CONSTRAINT `fk_dettlist_listino` FOREIGN KEY (`id_listino`) REFERENCES `sp_d_listino` (`id`),
  CONSTRAINT `fk_dettlist_metrica` FOREIGN KEY (`id_metrica`) REFERENCES `sp_d_metriche` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1082 DEFAULT CHARSET=utf8;


-- serviceportal.sp_d_listino_importo definition
CREATE TABLE `sp_d_listino_importo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_listino_dettaglio` bigint(20) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `importo_annuo` double(20,4) NOT NULL,
  `add_perc` double(5,1) DEFAULT NULL COMMENT 'Addizionale percentuale su totale VM, DB, Storage e Backup',
  `data_creazione` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_modifica` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_cancellazione` timestamp NULL DEFAULT NULL,
  `id_agente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_importo_listino` (`id_listino_dettaglio`),
  CONSTRAINT `fk_importo_listino` FOREIGN KEY (`id_listino_dettaglio`) REFERENCES `sp_d_listino_dettaglio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9233 DEFAULT CHARSET=utf8;


-- serviceportal.sp_v_remedy_urgenza_form source
CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `sp_v_remedy_urgenza_form` AS
select
    uuid() AS `id`,
    `i`.`valore_remedy` AS `impatto`,
    `i`.`id` AS `id_impatto`,
    `t`.`valore` AS `tipologia`,
    `t`.`id` AS `id_tipologia`,
    `uf`.`liv_gest_tenant_da` AS `liv_gest_tenant_da`,
    `uf`.`liv_gest_tenant_a` AS `liv_gest_tenant_a`,
    `u`.`valore_remedy` AS `urgenza`,
    `u`.`id` AS `id_urgenza`
from
    (((`sp_d_remedy_impatto` `i`
join `sp_d_remedy_tipologia` `t`)
join `sp_d_remedy_urgenza` `u`)
join `sp_d_urgenza_form` `uf`)
where
    `uf`.`id_impatto` = `i`.`id`
    and `uf`.`id_tipologia` = `t`.`id`
    and `uf`.`id_urgenza` = `u`.`id`;

    