-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: cacti
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.19.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aggregate_graph_templates`
--

DROP TABLE IF EXISTS `aggregate_graph_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graph_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `graph_template_id` int(10) unsigned NOT NULL,
  `gprint_prefix` varchar(64) NOT NULL,
  `graph_type` int(10) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `total_type` int(10) unsigned NOT NULL,
  `total_prefix` varchar(64) NOT NULL,
  `order_type` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Template Definitions for Aggregate Graphs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graph_templates`
--

LOCK TABLES `aggregate_graph_templates` WRITE;
/*!40000 ALTER TABLE `aggregate_graph_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graph_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_graph_templates_graph`
--

DROP TABLE IF EXISTS `aggregate_graph_templates_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graph_templates_graph` (
  `aggregate_template_id` int(10) unsigned NOT NULL,
  `t_image_format_id` char(2) DEFAULT '',
  `image_format_id` tinyint(1) NOT NULL DEFAULT '0',
  `t_height` char(2) DEFAULT '',
  `height` mediumint(8) NOT NULL DEFAULT '0',
  `t_width` char(2) DEFAULT '',
  `width` mediumint(8) NOT NULL DEFAULT '0',
  `t_upper_limit` char(2) DEFAULT '',
  `upper_limit` varchar(20) NOT NULL DEFAULT '0',
  `t_lower_limit` char(2) DEFAULT '',
  `lower_limit` varchar(20) NOT NULL DEFAULT '0',
  `t_vertical_label` char(2) DEFAULT '',
  `vertical_label` varchar(200) DEFAULT '',
  `t_slope_mode` char(2) DEFAULT '',
  `slope_mode` char(2) DEFAULT 'on',
  `t_auto_scale` char(2) DEFAULT '',
  `auto_scale` char(2) DEFAULT '',
  `t_auto_scale_opts` char(2) DEFAULT '',
  `auto_scale_opts` tinyint(1) NOT NULL DEFAULT '0',
  `t_auto_scale_log` char(2) DEFAULT '',
  `auto_scale_log` char(2) DEFAULT '',
  `t_scale_log_units` char(2) DEFAULT '',
  `scale_log_units` char(2) DEFAULT '',
  `t_auto_scale_rigid` char(2) DEFAULT '',
  `auto_scale_rigid` char(2) DEFAULT '',
  `t_auto_padding` char(2) DEFAULT '',
  `auto_padding` char(2) DEFAULT '',
  `t_base_value` char(2) DEFAULT '',
  `base_value` mediumint(8) NOT NULL DEFAULT '0',
  `t_grouping` char(2) DEFAULT '',
  `grouping` char(2) NOT NULL DEFAULT '',
  `t_unit_value` char(2) DEFAULT '',
  `unit_value` varchar(20) DEFAULT '',
  `t_unit_exponent_value` char(2) DEFAULT '',
  `unit_exponent_value` varchar(5) NOT NULL DEFAULT '',
  `t_alt_y_grid` char(2) DEFAULT '',
  `alt_y_grid` char(2) DEFAULT NULL,
  `t_right_axis` char(2) DEFAULT '',
  `right_axis` varchar(20) DEFAULT NULL,
  `t_right_axis_label` char(2) DEFAULT '',
  `right_axis_label` varchar(200) DEFAULT NULL,
  `t_right_axis_format` char(2) DEFAULT '',
  `right_axis_format` mediumint(8) DEFAULT NULL,
  `t_right_axis_formatter` char(2) DEFAULT '',
  `right_axis_formatter` varchar(10) DEFAULT NULL,
  `t_left_axis_formatter` char(2) DEFAULT '',
  `left_axis_formatter` varchar(10) DEFAULT NULL,
  `t_no_gridfit` char(2) DEFAULT '',
  `no_gridfit` char(2) DEFAULT NULL,
  `t_unit_length` char(2) DEFAULT '',
  `unit_length` varchar(10) DEFAULT NULL,
  `t_tab_width` char(2) DEFAULT '',
  `tab_width` varchar(20) DEFAULT '30',
  `t_dynamic_labels` char(2) DEFAULT '',
  `dynamic_labels` char(2) DEFAULT NULL,
  `t_force_rules_legend` char(2) DEFAULT '',
  `force_rules_legend` char(2) DEFAULT NULL,
  `t_legend_position` char(2) DEFAULT '',
  `legend_position` varchar(10) DEFAULT NULL,
  `t_legend_direction` char(2) DEFAULT '',
  `legend_direction` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`aggregate_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Aggregate Template Graph Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graph_templates_graph`
--

LOCK TABLES `aggregate_graph_templates_graph` WRITE;
/*!40000 ALTER TABLE `aggregate_graph_templates_graph` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graph_templates_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_graph_templates_item`
--

DROP TABLE IF EXISTS `aggregate_graph_templates_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graph_templates_item` (
  `aggregate_template_id` int(10) unsigned NOT NULL,
  `graph_templates_item_id` int(10) unsigned NOT NULL,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `color_template` int(11) NOT NULL,
  `t_graph_type_id` char(2) DEFAULT '',
  `graph_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `t_cdef_id` char(2) DEFAULT '',
  `cdef_id` mediumint(8) unsigned DEFAULT NULL,
  `item_skip` char(2) NOT NULL,
  `item_total` char(2) NOT NULL,
  PRIMARY KEY (`aggregate_template_id`,`graph_templates_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Aggregate Template Graph Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graph_templates_item`
--

LOCK TABLES `aggregate_graph_templates_item` WRITE;
/*!40000 ALTER TABLE `aggregate_graph_templates_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graph_templates_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_graphs`
--

DROP TABLE IF EXISTS `aggregate_graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graphs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aggregate_template_id` int(10) unsigned NOT NULL,
  `template_propogation` char(2) NOT NULL DEFAULT '',
  `local_graph_id` int(10) unsigned NOT NULL,
  `title_format` varchar(128) NOT NULL,
  `graph_template_id` int(10) unsigned NOT NULL,
  `gprint_prefix` varchar(64) NOT NULL,
  `graph_type` int(10) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `total_type` int(10) unsigned NOT NULL,
  `total_prefix` varchar(64) NOT NULL,
  `order_type` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aggregate_template_id` (`aggregate_template_id`),
  KEY `local_graph_id` (`local_graph_id`),
  KEY `title_format` (`title_format`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Aggregate Graph Definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graphs`
--

LOCK TABLES `aggregate_graphs` WRITE;
/*!40000 ALTER TABLE `aggregate_graphs` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_graphs_graph_item`
--

DROP TABLE IF EXISTS `aggregate_graphs_graph_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graphs_graph_item` (
  `aggregate_graph_id` int(10) unsigned NOT NULL,
  `graph_templates_item_id` int(10) unsigned NOT NULL,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `color_template` int(11) unsigned NOT NULL,
  `t_graph_type_id` char(2) DEFAULT '',
  `graph_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `t_cdef_id` char(2) DEFAULT '',
  `cdef_id` mediumint(8) unsigned DEFAULT NULL,
  `item_skip` char(2) NOT NULL,
  `item_total` char(2) NOT NULL,
  PRIMARY KEY (`aggregate_graph_id`,`graph_templates_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Aggregate Graph Graph Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graphs_graph_item`
--

LOCK TABLES `aggregate_graphs_graph_item` WRITE;
/*!40000 ALTER TABLE `aggregate_graphs_graph_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graphs_graph_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_graphs_items`
--

DROP TABLE IF EXISTS `aggregate_graphs_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graphs_items` (
  `aggregate_graph_id` int(10) unsigned NOT NULL,
  `local_graph_id` int(10) unsigned NOT NULL,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aggregate_graph_id`,`local_graph_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Aggregate Graph Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graphs_items`
--

LOCK TABLES `aggregate_graphs_items` WRITE;
/*!40000 ALTER TABLE `aggregate_graphs_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graphs_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arqs_testbedims`
--

DROP TABLE IF EXISTS `arqs_testbedims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arqs_testbedims` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arquitectura` varchar(50) DEFAULT NULL,
  `dominio` varchar(50) NOT NULL,
  `activo` varchar(1) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `id_tree` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `dominio` (`dominio`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arqs_testbedims`
--

LOCK TABLES `arqs_testbedims` WRITE;
/*!40000 ALTER TABLE `arqs_testbedims` DISABLE KEYS */;
INSERT INTO `arqs_testbedims` VALUES (10,'testbed1','60.60.6.0','V','libre','54654','aio.png','30'),(11,'testbed2','2.20.20.0','V','rubengutierrez@unicauca.edu.co','456','aio.png','31');
/*!40000 ALTER TABLE `arqs_testbedims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_devices`
--

DROP TABLE IF EXISTS `automation_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_devices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `network_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(17) NOT NULL DEFAULT '',
  `snmp_community` varchar(100) NOT NULL DEFAULT '',
  `snmp_version` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `snmp_port` mediumint(5) unsigned NOT NULL DEFAULT '161',
  `snmp_username` varchar(50) DEFAULT NULL,
  `snmp_password` varchar(50) DEFAULT NULL,
  `snmp_auth_protocol` char(6) DEFAULT '',
  `snmp_priv_passphrase` varchar(200) DEFAULT '',
  `snmp_priv_protocol` char(6) DEFAULT '',
  `snmp_context` varchar(64) DEFAULT '',
  `snmp_engine_id` varchar(64) DEFAULT '',
  `sysName` varchar(100) NOT NULL DEFAULT '',
  `sysLocation` varchar(255) NOT NULL DEFAULT '',
  `sysContact` varchar(255) NOT NULL DEFAULT '',
  `sysDescr` varchar(255) NOT NULL DEFAULT '',
  `sysUptime` int(32) NOT NULL DEFAULT '0',
  `os` varchar(64) NOT NULL DEFAULT '',
  `snmp` tinyint(4) NOT NULL DEFAULT '0',
  `known` tinyint(4) NOT NULL DEFAULT '0',
  `up` tinyint(4) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `hostname` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table of Discovered Devices';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_devices`
--

LOCK TABLES `automation_devices` WRITE;
/*!40000 ALTER TABLE `automation_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `automation_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_graph_rule_items`
--

DROP TABLE IF EXISTS `automation_graph_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_graph_rule_items` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sequence` smallint(3) unsigned NOT NULL DEFAULT '0',
  `operation` smallint(3) unsigned NOT NULL DEFAULT '0',
  `field` varchar(255) NOT NULL DEFAULT '',
  `operator` smallint(3) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Automation Graph Rule Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_graph_rule_items`
--

LOCK TABLES `automation_graph_rule_items` WRITE;
/*!40000 ALTER TABLE `automation_graph_rule_items` DISABLE KEYS */;
INSERT INTO `automation_graph_rule_items` VALUES (1,1,1,0,'ifOperStatus',7,'Up'),(2,1,2,1,'ifIP',16,''),(3,1,3,1,'ifHwAddr',16,''),(4,2,1,0,'ifOperStatus',7,'Up'),(5,2,2,1,'ifIP',16,''),(6,2,3,1,'ifHwAddr',16,'');
/*!40000 ALTER TABLE `automation_graph_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_graph_rules`
--

DROP TABLE IF EXISTS `automation_graph_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_graph_rules` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `snmp_query_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `graph_type_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` char(2) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Automation Graph Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_graph_rules`
--

LOCK TABLES `automation_graph_rules` WRITE;
/*!40000 ALTER TABLE `automation_graph_rules` DISABLE KEYS */;
INSERT INTO `automation_graph_rules` VALUES (1,'Traffic 64 bit Server',1,12,''),(2,'Traffic 64 bit Server Linux',1,12,''),(3,'Disk Space',3,17,'');
/*!40000 ALTER TABLE `automation_graph_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_ips`
--

DROP TABLE IF EXISTS `automation_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_ips` (
  `ip_address` varchar(20) NOT NULL DEFAULT '',
  `hostname` varchar(100) DEFAULT NULL,
  `network_id` int(10) unsigned DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `thread` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ip_address`),
  KEY `pid` (`pid`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='List of discoverable ip addresses used for scanning';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_ips`
--

LOCK TABLES `automation_ips` WRITE;
/*!40000 ALTER TABLE `automation_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `automation_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_match_rule_items`
--

DROP TABLE IF EXISTS `automation_match_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_match_rule_items` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_type` smallint(3) unsigned NOT NULL DEFAULT '0',
  `sequence` smallint(3) unsigned NOT NULL DEFAULT '0',
  `operation` smallint(3) unsigned NOT NULL DEFAULT '0',
  `field` varchar(255) NOT NULL DEFAULT '',
  `operator` smallint(3) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='Automation Match Rule Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_match_rule_items`
--

LOCK TABLES `automation_match_rule_items` WRITE;
/*!40000 ALTER TABLE `automation_match_rule_items` DISABLE KEYS */;
INSERT INTO `automation_match_rule_items` VALUES (1,1,1,1,0,'h.description',14,''),(2,1,1,2,1,'h.snmp_version',12,'2'),(3,1,3,1,0,'ht.name',1,'Linux'),(4,2,1,1,0,'ht.name',1,'Linux'),(5,2,1,2,1,'h.snmp_version',12,'2'),(6,2,3,1,0,'ht.name',1,'SNMP'),(7,2,3,2,1,'gt.name',1,'Traffic');
/*!40000 ALTER TABLE `automation_match_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_networks`
--

DROP TABLE IF EXISTS `automation_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_networks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poller_id` int(10) unsigned DEFAULT '1',
  `site_id` int(10) unsigned DEFAULT '1',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name for this network',
  `subnet_range` varchar(1024) NOT NULL DEFAULT '' COMMENT 'Defined subnet ranges for discovery',
  `dns_servers` varchar(128) NOT NULL DEFAULT '' COMMENT 'DNS Servers to use for name resolution',
  `enabled` char(2) DEFAULT '',
  `snmp_id` int(10) unsigned DEFAULT NULL,
  `enable_netbios` char(2) DEFAULT '',
  `add_to_cacti` char(2) DEFAULT '',
  `total_ips` int(10) unsigned DEFAULT '0',
  `up_hosts` int(10) unsigned NOT NULL DEFAULT '0',
  `snmp_hosts` int(10) unsigned NOT NULL DEFAULT '0',
  `ping_method` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The ping method (ICMP:TCP:UDP)',
  `ping_port` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'For TCP:UDP the port to ping',
  `ping_timeout` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The ping timeout in seconds',
  `ping_retries` int(10) unsigned DEFAULT '0',
  `sched_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Schedule type: manual or automatic',
  `threads` int(10) unsigned DEFAULT '1',
  `run_limit` int(10) unsigned DEFAULT '0' COMMENT 'The maximum runtime for the discovery',
  `start_at` varchar(20) DEFAULT NULL,
  `next_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recur_every` int(10) unsigned DEFAULT '1',
  `day_of_week` varchar(45) DEFAULT NULL COMMENT 'The days of week to run in crontab format',
  `month` varchar(45) DEFAULT NULL COMMENT 'The months to run in crontab format',
  `day_of_month` varchar(45) DEFAULT NULL COMMENT 'The days of month to run in crontab format',
  `monthly_week` varchar(45) DEFAULT NULL,
  `monthly_day` varchar(45) DEFAULT NULL,
  `last_runtime` double NOT NULL DEFAULT '0' COMMENT 'The last runtime for discovery',
  `last_started` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the discovery last started',
  `last_status` varchar(128) NOT NULL DEFAULT '' COMMENT 'The last exit message if any',
  `rerun_data_queries` char(2) DEFAULT NULL COMMENT 'Rerun data queries or not for existing hosts',
  PRIMARY KEY (`id`),
  KEY `poller_id` (`poller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Stores scanning subnet definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_networks`
--

LOCK TABLES `automation_networks` WRITE;
/*!40000 ALTER TABLE `automation_networks` DISABLE KEYS */;
INSERT INTO `automation_networks` VALUES (1,1,1,'Test Network','192.168.1.0/24','','',1,'on','',254,14,8,2,22,400,1,2,10,1200,'2015-05-17 16:15','2019-08-16 21:15:00',2,'4','1,2,6','1,2,3,4,6,7,11,12,14,15,17,19,26,32','','',40.178689002991,'2015-05-19 07:23:22','','on');
/*!40000 ALTER TABLE `automation_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_processes`
--

DROP TABLE IF EXISTS `automation_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_processes` (
  `pid` int(8) unsigned NOT NULL,
  `poller_id` int(10) unsigned DEFAULT '1',
  `network_id` int(10) unsigned NOT NULL DEFAULT '0',
  `task` varchar(20) DEFAULT '',
  `status` varchar(20) DEFAULT NULL,
  `command` varchar(20) DEFAULT NULL,
  `up_hosts` int(10) unsigned DEFAULT '0',
  `snmp_hosts` int(10) unsigned DEFAULT '0',
  `heartbeat` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`pid`,`network_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='Table tracking active poller processes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_processes`
--

LOCK TABLES `automation_processes` WRITE;
/*!40000 ALTER TABLE `automation_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `automation_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_snmp`
--

DROP TABLE IF EXISTS `automation_snmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_snmp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Group of SNMP Option Sets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_snmp`
--

LOCK TABLES `automation_snmp` WRITE;
/*!40000 ALTER TABLE `automation_snmp` DISABLE KEYS */;
INSERT INTO `automation_snmp` VALUES (1,'Default Option Set');
/*!40000 ALTER TABLE `automation_snmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_snmp_items`
--

DROP TABLE IF EXISTS `automation_snmp_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_snmp_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `snmp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sequence` int(10) unsigned NOT NULL DEFAULT '0',
  `snmp_version` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `snmp_community` varchar(100) NOT NULL,
  `snmp_port` mediumint(5) unsigned NOT NULL DEFAULT '161',
  `snmp_timeout` int(10) unsigned NOT NULL DEFAULT '500',
  `snmp_retries` tinyint(11) unsigned NOT NULL DEFAULT '3',
  `max_oids` int(12) unsigned DEFAULT '10',
  `snmp_username` varchar(50) DEFAULT NULL,
  `snmp_password` varchar(50) DEFAULT NULL,
  `snmp_auth_protocol` char(6) DEFAULT '',
  `snmp_priv_passphrase` varchar(200) DEFAULT '',
  `snmp_priv_protocol` char(6) DEFAULT '',
  `snmp_context` varchar(64) DEFAULT '',
  `snmp_engine_id` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`,`snmp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Set of SNMP Options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_snmp_items`
--

LOCK TABLES `automation_snmp_items` WRITE;
/*!40000 ALTER TABLE `automation_snmp_items` DISABLE KEYS */;
INSERT INTO `automation_snmp_items` VALUES (1,1,1,2,'public',161,1000,3,10,'admin','baseball','MD5','','DES','',''),(2,1,2,2,'private',161,1000,3,10,'admin','baseball','MD5','','DES','','');
/*!40000 ALTER TABLE `automation_snmp_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_templates`
--

DROP TABLE IF EXISTS `automation_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_templates` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `host_template` int(8) NOT NULL DEFAULT '0',
  `availability_method` int(10) unsigned DEFAULT '2',
  `sysDescr` varchar(255) DEFAULT '',
  `sysName` varchar(255) DEFAULT '',
  `sysOid` varchar(60) DEFAULT '',
  `sequence` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Templates of SNMP Sys variables used for automation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_templates`
--

LOCK TABLES `automation_templates` WRITE;
/*!40000 ALTER TABLE `automation_templates` DISABLE KEYS */;
INSERT INTO `automation_templates` VALUES (1,3,2,'Linux','','',2),(2,1,2,'HP ETHERNET','','',1);
/*!40000 ALTER TABLE `automation_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_tree_rule_items`
--

DROP TABLE IF EXISTS `automation_tree_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_tree_rule_items` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sequence` smallint(3) unsigned NOT NULL DEFAULT '0',
  `field` varchar(255) NOT NULL DEFAULT '',
  `sort_type` smallint(3) unsigned NOT NULL DEFAULT '0',
  `propagate_changes` char(2) DEFAULT '',
  `search_pattern` varchar(255) NOT NULL DEFAULT '',
  `replace_pattern` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Automation Tree Rule Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_tree_rule_items`
--

LOCK TABLES `automation_tree_rule_items` WRITE;
/*!40000 ALTER TABLE `automation_tree_rule_items` DISABLE KEYS */;
INSERT INTO `automation_tree_rule_items` VALUES (1,1,1,'ht.name',1,'','^(.*)\\s*Linux\\s*(.*)$','${1}\\n${2}'),(2,1,2,'h.hostname',1,'','^(\\w*)\\s*(\\w*)\\s*(\\w*).*$',''),(3,2,1,'0',2,'on','Traffic',''),(4,2,2,'gtg.title_cache',1,'','^(.*)\\s*-\\s*Traffic -\\s*(.*)$','${1}\\n${2}');
/*!40000 ALTER TABLE `automation_tree_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_tree_rules`
--

DROP TABLE IF EXISTS `automation_tree_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_tree_rules` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `tree_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `tree_item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `leaf_type` smallint(3) unsigned NOT NULL DEFAULT '0',
  `host_grouping_type` smallint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` char(2) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Automation Tree Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_tree_rules`
--

LOCK TABLES `automation_tree_rules` WRITE;
/*!40000 ALTER TABLE `automation_tree_rules` DISABLE KEYS */;
INSERT INTO `automation_tree_rules` VALUES (1,'New Device',1,0,3,0,''),(2,'New Graph',1,0,2,0,'');
/*!40000 ALTER TABLE `automation_tree_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdef`
--

DROP TABLE IF EXISTS `cdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdef` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `system` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdef`
--

LOCK TABLES `cdef` WRITE;
/*!40000 ALTER TABLE `cdef` DISABLE KEYS */;
INSERT INTO `cdef` VALUES (2,'73f95f8b77b5508157d64047342c421e',0,'Turn Bytes into Bits'),(3,'3d352eed9fa8f7b2791205b3273708c7',0,'Make Stack Negative'),(4,'e961cc8ec04fda6ed4981cf5ad501aa5',0,'Make Per 5 Minutes'),(12,'f1ac79f05f255c02f914c920f1038c54',0,'Total All Data Sources'),(14,'634a23af5e78af0964e8d33b1a4ed26b',0,'Multiply by 1024'),(15,'068984b5ccdfd2048869efae5166f722',0,'Total All Data Sources, Multiply by 1024'),(16,'2edaef75ae74a4919e6774fdcc51231d',0,'Net-SNMP - IO Wait'),(17,'551f401b7345d62439832e7e7c722d53',0,'Convert Data Source to Data Rate');
/*!40000 ALTER TABLE `cdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdef_items`
--

DROP TABLE IF EXISTS `cdef_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdef_items` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `cdef_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cdef_id_sequence` (`cdef_id`,`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdef_items`
--

LOCK TABLES `cdef_items` WRITE;
/*!40000 ALTER TABLE `cdef_items` DISABLE KEYS */;
INSERT INTO `cdef_items` VALUES (7,'9bbf6b792507bb9bb17d2af0970f9be9',2,1,4,'CURRENT_DATA_SOURCE'),(8,'caa4e023ac2d7b1c4b4c8c4adfd55dfe',2,3,2,'3'),(9,'a4b8eb2c3bf4920a3ef571a7a004be53',2,2,6,'8'),(10,'c888c9fe6b62c26c4bfe23e18991731d',3,1,4,'CURRENT_DATA_SOURCE'),(11,'1e1d0b29a94e08b648c8f053715442a0',3,3,2,'3'),(12,'4355c197998c7f8b285be7821ddc6da4',3,2,6,'-1'),(13,'40bb7a1143b0f2e2efca14eb356236de',4,1,4,'CURRENT_DATA_SOURCE'),(14,'42686ea0925c0220924b7d333599cd67',4,3,2,'3'),(15,'faf1b148b2c0e0527362ed5b8ca1d351',4,2,6,'300'),(16,'0ef6b8a42dc83b4e43e437960fccd2ea',12,1,4,'ALL_DATA_SOURCES_NODUPS'),(18,'86370cfa0008fe8c56b28be80ee39a40',14,1,4,'CURRENT_DATA_SOURCE'),(19,'9a35cc60d47691af37f6fddf02064e20',14,2,6,'1024'),(20,'5d7a7941ec0440b257e5598a27dd1688',14,3,2,'3'),(21,'44fd595c60539ff0f5817731d9f43a85',15,1,4,'ALL_DATA_SOURCES_NODUPS'),(22,'aa38be265e5ac31783e57ce6f9314e9a',15,2,6,'1024'),(23,'204423d4b2598f1f7252eea19458345c',15,3,2,'3'),(24,'a96e5ae6dcdf2ca5ef1e2f9706b62ff0',16,1,6,'100'),(25,'ae2da3b8309debcc90d58fd3a7652315',16,2,4,'ALL_DATA_SOURCES_NODUPS'),(26,'56c946373bc51a86c631660a68aa7361',16,3,2,'2'),(27,'769be0527605b501381a54272d1da3e9',17,1,4,'CURRENT_DATA_SOURCE'),(28,'83663603689f36b7ba80f63e6f26f64d',17,2,4,'CURRENT_DATA_SOURCE_PI'),(29,'dfbec091d7792d2409e9310e58c7055c',17,3,2,'4');
/*!40000 ALTER TABLE `cdef_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color_template_items`
--

DROP TABLE IF EXISTS `color_template_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color_template_items` (
  `color_template_item_id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `color_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `color_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`color_template_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1 COMMENT='Color Items for Color Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color_template_items`
--

LOCK TABLES `color_template_items` WRITE;
/*!40000 ALTER TABLE `color_template_items` DISABLE KEYS */;
INSERT INTO `color_template_items` VALUES (1,1,4,1),(2,1,24,2),(3,1,98,3),(4,1,25,4),(5,2,25,1),(6,2,29,2),(7,2,30,3),(8,2,31,4),(9,2,33,5),(10,2,35,6),(11,2,41,7),(12,2,9,8),(13,3,15,1),(14,3,31,2),(15,3,28,3),(16,3,8,4),(17,3,34,5),(18,3,33,6),(19,3,35,7),(20,3,41,8),(21,3,36,9),(22,3,42,10),(23,3,44,11),(24,3,48,12),(25,3,9,13),(26,3,49,14),(27,3,51,15),(28,3,52,16),(29,4,76,1),(30,4,84,2),(31,4,89,3),(32,4,17,4),(33,4,86,5),(34,4,88,6),(35,4,90,7),(36,4,94,8),(37,4,96,9),(38,4,93,10),(39,4,91,11),(40,4,22,12),(41,4,12,13),(42,4,95,14),(43,4,6,15),(44,4,92,16);
/*!40000 ALTER TABLE `color_template_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color_templates`
--

DROP TABLE IF EXISTS `color_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color_templates` (
  `color_template_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`color_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Color Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color_templates`
--

LOCK TABLES `color_templates` WRITE;
/*!40000 ALTER TABLE `color_templates` DISABLE KEYS */;
INSERT INTO `color_templates` VALUES (1,'Yellow: light -> dark, 4 colors'),(2,'Red: light yellow > dark red, 8 colors'),(3,'Red: light -> dark, 16 colors'),(4,'Green: dark -> light, 16 colors');
/*!40000 ALTER TABLE `color_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT '',
  `hex` varchar(6) NOT NULL DEFAULT '',
  `read_only` char(2) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hex` (`hex`)
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'Black','000000','on'),(2,'White','FFFFFF','on'),(4,'','FAFD9E',''),(5,'','C0C0C0',''),(6,'','74C366',''),(7,'','6DC8FE',''),(8,'','EA8F00',''),(9,'Red','FF0000','on'),(10,'','4444FF',''),(11,'Magenta','FF00FF','on'),(12,'Green','00FF00','on'),(13,'','8D85F3',''),(14,'','AD3B6E',''),(15,'','EACC00',''),(16,'','12B3B5',''),(17,'','157419',''),(18,'','C4FD3D',''),(19,'','817C4E',''),(20,'','002A97',''),(21,'','0000FF',''),(22,'','00CF00',''),(24,'','F9FD5F',''),(25,'','FFF200',''),(26,'','CCBB00',''),(27,'','837C04',''),(28,'','EAAF00',''),(29,'','FFD660',''),(30,'','FFC73B',''),(31,'','FFAB00',''),(33,'','FF7D00',''),(34,'','ED7600',''),(35,'','FF5700',''),(36,'','EE5019',''),(37,'','B1441E',''),(38,'','FFC3C0',''),(39,'','FF897C',''),(40,'','FF6044',''),(41,'','FF4105',''),(42,'','DA4725',''),(43,'','942D0C',''),(44,'','FF3932',''),(45,'','862F2F',''),(46,'','FF5576',''),(47,'','562B29',''),(48,'','F51D30',''),(49,'','DE0056',''),(50,'','ED5394',''),(51,'','B90054',''),(52,'','8F005C',''),(53,'','F24AC8',''),(54,'','E8CDEF',''),(55,'','D8ACE0',''),(56,'','A150AA',''),(57,'','750F7D',''),(58,'','8D00BA',''),(59,'','623465',''),(60,'','55009D',''),(61,'','3D168B',''),(62,'','311F4E',''),(63,'','D2D8F9',''),(64,'','9FA4EE',''),(65,'','6557D0',''),(66,'','4123A1',''),(67,'','4668E4',''),(68,'','0D006A',''),(69,'','00004D',''),(70,'','001D61',''),(71,'','00234B',''),(72,'','002A8F',''),(73,'','2175D9',''),(74,'','7CB3F1',''),(75,'','005199',''),(76,'','004359',''),(77,'','00A0C1',''),(78,'','007283',''),(79,'','00BED9',''),(80,'','AFECED',''),(81,'','55D6D3',''),(82,'','00BBB4',''),(83,'','009485',''),(84,'','005D57',''),(85,'','008A77',''),(86,'','008A6D',''),(87,'','00B99B',''),(88,'','009F67',''),(89,'','00694A',''),(90,'','00A348',''),(91,'','00BF47',''),(92,'','96E78A',''),(93,'','00BD27',''),(94,'','35962B',''),(95,'','7EE600',''),(96,'','6EA100',''),(97,'','CAF100',''),(98,'','F5F800',''),(99,'','CDCFC4',''),(100,'','BCBEB3',''),(101,'','AAABA1',''),(102,'','8F9286',''),(103,'','797C6E',''),(104,'','2E3127',''),(105,'Night','0C090A','on'),(106,'Gunmetal','2C3539','on'),(107,'Midnight','2B1B17','on'),(108,'Charcoal','34282C','on'),(109,'Dark Slate Grey','25383C','on'),(110,'Oil','3B3131','on'),(111,'Black Cat','413839','on'),(112,'Iridium','3D3C3A','on'),(113,'Black Eel','463E3F','on'),(114,'Black Cow','4C4646','on'),(115,'Gray Wolf','504A4B','on'),(116,'Vampire Gray','565051','on'),(117,'Gray Dolphin','5C5858','on'),(118,'Carbon Gray','625D5D','on'),(119,'Ash Gray','666362','on'),(120,'Cloudy Gray','6D6968','on'),(121,'Smokey Gray','726E6D','on'),(122,'Gray','736F6E','on'),(123,'Granite','837E7C','on'),(124,'Battleship Gray','848482','on'),(125,'Gray Cloud','B6B6B4','on'),(126,'Gray Goose','D1D0CE','on'),(127,'Platinum','E5E4E2','on'),(128,'Metallic Silver','BCC6CC','on'),(129,'Blue Gray','98AFC7','on'),(130,'Light Slate Gray','6D7B8D','on'),(131,'Slate Gray','657383','on'),(132,'Jet Gray','616D7E','on'),(133,'Mist Blue','646D7E','on'),(134,'Marble Blue','566D7E','on'),(135,'Slate Blue','737CA1','on'),(136,'Steel Blue','4863A0','on'),(137,'Blue Jay','2B547E','on'),(138,'Dark Slate Blue','2B3856','on'),(139,'Midnight Blue','151B54','on'),(140,'Navy Blue','000080','on'),(141,'Blue Whale','342D7E','on'),(142,'Lapis Blue','15317E','on'),(143,'Cornflower Blue','151B8D','on'),(144,'Earth Blue','0000A0','on'),(145,'Cobalt Blue','0020C2','on'),(146,'Blueberry Blue','0041C2','on'),(147,'Sapphire Blue','2554C7','on'),(148,'Blue Eyes','1569C7','on'),(149,'Royal Blue','2B60DE','on'),(150,'Blue Orchid','1F45FC','on'),(151,'Blue Lotus','6960EC','on'),(152,'Light Slate Blue','736AFF','on'),(153,'Slate Blue','357EC7','on'),(154,'Glacial Blue Ice','368BC1','on'),(155,'Silk Blue','488AC7','on'),(156,'Blue Ivy','3090C7','on'),(157,'Blue Koi','659EC7','on'),(158,'Columbia Blue','87AFC7','on'),(159,'Baby Blue','95B9C7','on'),(160,'Light Steel Blue','728FCE','on'),(161,'Ocean Blue','2B65EC','on'),(162,'Blue Ribbon','306EFF','on'),(163,'Blue Dress','157DEC','on'),(164,'Dodger Blue','1589FF','on'),(165,'Cornflower Blue','6495ED','on'),(166,'Sky Blue','6698FF','on'),(167,'Butterfly Blue','38ACEC','on'),(168,'Iceberg','56A5EC','on'),(169,'Crystal Blue','5CB3FF','on'),(170,'Deep Sky Blue','3BB9FF','on'),(171,'Denim Blue','79BAEC','on'),(172,'Light Sky Blue','82CAFA','on'),(173,'Day Sky Blue','82CAFF','on'),(174,'Jeans Blue','A0CFEC','on'),(175,'Blue Angel','B7CEEC','on'),(176,'Pastel Blue','B4CFEC','on'),(177,'Sea Blue','C2DFFF','on'),(178,'Powder Blue','C6DEFF','on'),(179,'Coral Blue','AFDCEC','on'),(180,'Light Blue','ADDFFF','on'),(181,'Robin Egg Blue','BDEDFF','on'),(182,'Pale Blue Lily','CFECEC','on'),(183,'Light Cyan','E0FFFF','on'),(184,'Water','EBF4FA','on'),(185,'Alice Blue','F0F8FF','on'),(186,'Azure','F0FFFF','on'),(187,'Light Slate','CCFFFF','on'),(188,'Light Aquamarine','93FFE8','on'),(189,'Electric Blue','9AFEFF','on'),(190,'Aquamarine','7FFFD4','on'),(191,'Cyan or Aqua','00FFFF','on'),(192,'Tron Blue','7DFDFE','on'),(193,'Blue Zircon','57FEFF','on'),(194,'Blue Lagoon','8EEBEC','on'),(195,'Celeste','50EBEC','on'),(196,'Blue Diamond','4EE2EC','on'),(197,'Tiffany Blue','81D8D0','on'),(198,'Cyan Opaque','92C7C7','on'),(199,'Blue Hosta','77BFC7','on'),(200,'Northern Lights Blue','78C7C7','on'),(201,'Medium Turquoise','48CCCD','on'),(202,'Turquoise','43C6DB','on'),(203,'Jellyfish','46C7C7','on'),(204,'Macaw Blue Green','43BFC7','on'),(205,'Light Sea Green','3EA99F','on'),(206,'Dark Turquoise','3B9C9C','on'),(207,'Sea Turtle Green','438D80','on'),(208,'Medium Aquamarine','348781','on'),(209,'Greenish Blue','307D7E','on'),(210,'Grayish Turquoise','5E7D7E','on'),(211,'Beetle Green','4C787E','on'),(212,'Teal','008080','on'),(213,'Sea Green','4E8975','on'),(214,'Camouflage Green','78866B','on'),(215,'Sage Green','848b79','on'),(216,'Hazel Green','617C58','on'),(217,'Venom Green','728C00','on'),(218,'Fern Green','667C26','on'),(219,'Dark Forrest Green','254117','on'),(220,'Medium Sea Green','306754','on'),(221,'Medium Forest Green','347235','on'),(222,'Seaweed Green','437C17','on'),(223,'Pine Green','387C44','on'),(224,'Jungle Green','347C2C','on'),(225,'Shamrock Green','347C17','on'),(226,'Medium Spring Green','348017','on'),(227,'Forest Green','4E9258','on'),(228,'Green Onion','6AA121','on'),(229,'Spring Green','4AA02C','on'),(230,'Lime Green','41A317','on'),(231,'Clover Green','3EA055','on'),(232,'Green Snake','6CBB3C','on'),(233,'Alien Green','6CC417','on'),(234,'Green Apple','4CC417','on'),(235,'Yellow Green','52D017','on'),(236,'Kelly Green','4CC552','on'),(237,'Zombie Green','54C571','on'),(238,'Frog Green','99C68E','on'),(239,'Green Peas','89C35C','on'),(240,'Dollar Bill Green','85BB65','on'),(241,'Dark Sea Green','8BB381','on'),(242,'Iguana Green','9CB071','on'),(243,'Avocado Green','B2C248','on'),(244,'Pistachio Green','9DC209','on'),(245,'Salad Green','A1C935','on'),(246,'Hummingbird Green','7FE817','on'),(247,'Nebula Green','59E817','on'),(248,'Stoplight Go Green','57E964','on'),(249,'Algae Green','64E986','on'),(250,'Jade Green','5EFB6E','on'),(251,'Emerald Green','5FFB17','on'),(252,'Lawn Green','87F717','on'),(253,'Chartreuse','8AFB17','on'),(254,'Dragon Green','6AFB92','on'),(255,'Mint green','98FF98','on'),(256,'Green Thumb','B5EAAA','on'),(257,'Light Jade','C3FDB8','on'),(258,'Tea Green','CCFB5D','on'),(259,'Green Yellow','B1FB17','on'),(260,'Slime Green','BCE954','on'),(261,'Goldenrod','EDDA74','on'),(262,'Harvest Gold','EDE275','on'),(263,'Sun Yellow','FFE87C','on'),(264,'Yellow','FFFF00','on'),(265,'Corn Yellow','FFF380','on'),(266,'Parchment','FFFFC2','on'),(267,'Cream','FFFFCC','on'),(268,'Lemon Chiffon','FFF8C6','on'),(269,'Cornsilk','FFF8DC','on'),(270,'Beige','F5F5DC','on'),(271,'Blonde','FBF6D9','on'),(272,'Antique White','FAEBD7','on'),(273,'Champagne','F7E7CE','on'),(274,'Blanched Almond','FFEBCD','on'),(275,'Vanilla','F3E5AB','on'),(276,'Tan Brown','ECE5B6','on'),(277,'Peach','FFE5B4','on'),(278,'Mustard','FFDB58','on'),(279,'Rubber Ducky Yellow','FFD801','on'),(280,'Bright Gold','FDD017','on'),(281,'Golden Brown','EAC117','on'),(282,'Macaroni and Cheese','F2BB66','on'),(283,'Saffron','FBB917','on'),(284,'Beer','FBB117','on'),(285,'Cantaloupe','FFA62F','on'),(286,'Bee Yellow','E9AB17','on'),(287,'Brown Sugar','E2A76F','on'),(288,'BurlyWood','DEB887','on'),(289,'Deep Peach','FFCBA4','on'),(290,'Ginger Brown','C9BE62','on'),(291,'School Bus Yellow','E8A317','on'),(292,'Sandy Brown','EE9A4D','on'),(293,'Fall Leaf Brown','C8B560','on'),(294,'Orange Gold','D4A017','on'),(295,'Sand','C2B280','on'),(296,'Cookie Brown','C7A317','on'),(297,'Caramel','C68E17','on'),(298,'Brass','B5A642','on'),(299,'Khaki','ADA96E','on'),(300,'Camel Brown','C19A6B','on'),(301,'Bronze','CD7F32','on'),(302,'Tiger Orange','C88141','on'),(303,'Cinnamon','C58917','on'),(304,'Bullet Shell','AF9B60','on'),(305,'Dark Goldenrod','AF7817','on'),(306,'Copper','B87333','on'),(307,'Wood','966F33','on'),(308,'Oak Brown','806517','on'),(309,'Moccasin','827839','on'),(310,'Army Brown','827B60','on'),(311,'Sandstone','786D5F','on'),(312,'Mocha','493D26','on'),(313,'Taupe','483C32','on'),(314,'Coffee','6F4E37','on'),(315,'Brown Bear','835C3B','on'),(316,'Red Dirt','7F5217','on'),(317,'Sepia','7F462C','on'),(318,'Orange Salmon','C47451','on'),(319,'Rust','C36241','on'),(320,'Red Fox','C35817','on'),(321,'Chocolate','C85A17','on'),(322,'Sedona','CC6600','on'),(323,'Papaya Orange','E56717','on'),(324,'Halloween Orange','E66C2C','on'),(325,'Pumpkin Orange','F87217','on'),(326,'Construction Cone Orange','F87431','on'),(327,'Sunrise Orange','E67451','on'),(328,'Mango Orange','FF8040','on'),(329,'Dark Orange','F88017','on'),(330,'Coral','FF7F50','on'),(331,'Basket Ball Orange','F88158','on'),(332,'Light Salmon','F9966B','on'),(333,'Tangerine','E78A61','on'),(334,'Dark Salmon','E18B6B','on'),(335,'Light Coral','E77471','on'),(336,'Bean Red','F75D59','on'),(337,'Valentine Red','E55451','on'),(338,'Shocking Orange','E55B3C','on'),(339,'Scarlet','FF2400','on'),(340,'Ruby Red','F62217','on'),(341,'Ferrari Red','F70D1A','on'),(342,'Fire Engine Red','F62817','on'),(343,'Lava Red','E42217','on'),(344,'Love Red','E41B17','on'),(345,'Grapefruit','DC381F','on'),(346,'Chestnut Red','C34A2C','on'),(347,'Cherry Red','C24641','on'),(348,'Mahogany','C04000','on'),(349,'Chilli Pepper','C11B17','on'),(350,'Cranberry','9F000F','on'),(351,'Red Wine','990012','on'),(352,'Burgundy','8C001A','on'),(353,'Chestnut','954535','on'),(354,'Blood Red','7E3517','on'),(355,'Sienna','8A4117','on'),(356,'Sangria','7E3817','on'),(357,'Firebrick','800517','on'),(358,'Maroon','810541','on'),(359,'Plum Pie','7D0541','on'),(360,'Velvet Maroon','7E354D','on'),(361,'Plum Velvet','7D0552','on'),(362,'Rosy Finch','7F4E52','on'),(363,'Puce','7F5A58','on'),(364,'Dull Purple','7F525D','on'),(365,'Rosy Brown','B38481','on'),(366,'Khaki Rose','C5908E','on'),(367,'Pink Bow','C48189','on'),(368,'Lipstick Pink','C48793','on'),(369,'Rose','E8ADAA','on'),(370,'Desert Sand','EDC9AF','on'),(371,'Pig Pink','FDD7E4','on'),(372,'Cotton Candy','FCDFFF','on'),(373,'Pink Bubblegum','FFDFDD','on'),(374,'Misty Rose','FBBBB9','on'),(375,'Pink','FAAFBE','on'),(376,'Light Pink','FAAFBA','on'),(377,'Flamingo Pink','F9A7B0','on'),(378,'Pink Rose','E7A1B0','on'),(379,'Pink Daisy','E799A3','on'),(380,'Cadillac Pink','E38AAE','on'),(381,'Carnation Pink','F778A1','on'),(382,'Blush Red','E56E94','on'),(383,'Hot Pink','F660AB','on'),(384,'Watermelon Pink','FC6C85','on'),(385,'Violet Red','F6358A','on'),(386,'Deep Pink','F52887','on'),(387,'Pink Cupcake','E45E9D','on'),(388,'Pink Lemonade','E4287C','on'),(389,'Neon Pink','F535AA','on'),(390,'Dimorphotheca Magenta','E3319D','on'),(391,'Bright Neon Pink','F433FF','on'),(392,'Pale Violet Red','D16587','on'),(393,'Tulip Pink','C25A7C','on'),(394,'Medium Violet Red','CA226B','on'),(395,'Rogue Pink','C12869','on'),(396,'Burnt Pink','C12267','on'),(397,'Bashful Pink','C25283','on'),(398,'Carnation Pink','C12283','on'),(399,'Plum','B93B8F','on'),(400,'Viola Purple','7E587E','on'),(401,'Purple Iris','571B7E','on'),(402,'Plum Purple','583759','on'),(403,'Indigo','4B0082','on'),(404,'Purple Monster','461B7E','on'),(405,'Purple Haze','4E387E','on'),(406,'Eggplant','614051','on'),(407,'Grape','5E5A80','on'),(408,'Purple Jam','6A287E','on'),(409,'Dark Orchid','7D1B7E','on'),(410,'Purple Flower','A74AC7','on'),(411,'Medium Orchid','B048B5','on'),(412,'Purple Amethyst','6C2DC7','on'),(413,'Dark Violet','842DCE','on'),(414,'Violet','8D38C9','on'),(415,'Purple Sage Bush','7A5DC7','on'),(416,'Lovely Purple','7F38EC','on'),(417,'Purple','8E35EF','on'),(418,'Aztech Purple','893BFF','on'),(419,'Medium Purple','8467D7','on'),(420,'Jasmine Purple','A23BEC','on'),(421,'Purple Daffodil','B041FF','on'),(422,'Tyrian Purple','C45AEC','on'),(423,'Crocus Purple','9172EC','on'),(424,'Purple Mimosa','9E7BFF','on'),(425,'Heliotrope Purple','D462FF','on'),(426,'Crimson','E238EC','on'),(427,'Purple Dragon','C38EC7','on'),(428,'Lilac','C8A2C8','on'),(429,'Blush Pink','E6A9EC','on'),(430,'Mauve','E0B0FF','on'),(431,'Wisteria Purple','C6AEC7','on'),(432,'Blossom Pink','F9B7FF','on'),(433,'Thistle','D2B9D3','on'),(434,'Periwinkle','E9CFEC','on'),(435,'Lavender Pinocchio','EBDDE2','on'),(436,'Lavender Blue','E3E4FA','on'),(437,'Pearl','FDEEF4','on'),(438,'SeaShell','FFF5EE','on'),(439,'Milk White','FEFCFF','on');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_info_page`
--

DROP TABLE IF EXISTS `content_info_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_info_page` (
  `id_content` int(11) NOT NULL AUTO_INCREMENT,
  `id_title` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_content`),
  KEY `id_title` (`id_title`),
  CONSTRAINT `content_info_page_ibfk_1` FOREIGN KEY (`id_title`) REFERENCES `title_info_page` (`id_title`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_info_page`
--

LOCK TABLES `content_info_page` WRITE;
/*!40000 ALTER TABLE `content_info_page` DISABLE KEYS */;
INSERT INTO `content_info_page` VALUES (7,0,'text','asdfasdfasd'),(8,0,'text','eeee'),(9,0,'text','chavis es perrita'),(14,3,'img','2019-06-04 19:53:56Captura de pantalla de 2019-05-23 09-47-40.png'),(15,3,'sub','jghjghj'),(16,3,'text','El gran texto'),(17,3,'sub','666'),(18,4,'text','Agregar contenido al titulo'),(19,1,'text','Agregar contenido al titulo');
/*!40000 ALTER TABLE `content_info_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_domain`
--

DROP TABLE IF EXISTS `core_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_domain` (
  `id_server` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `type_domain` varchar(50) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  `vcpus` varchar(50) DEFAULT NULL,
  `disk` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_server` (`id_server`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_domain`
--

LOCK TABLES `core_domain` WRITE;
/*!40000 ALTER TABLE `core_domain` DISABLE KEYS */;
INSERT INTO `core_domain` VALUES ('','5.5.1.0','aio',NULL,NULL,NULL),('7e9509a5-31f4-4fea-9e23-2603c20d69bd','2.2.2.0','aio',NULL,NULL,NULL),('8fdafabd-5a22-4a6a-a431-35d3e62b8204','33.3.3.0','aio',NULL,NULL,NULL),('6cd309a3-b0e9-448d-8e9d-88e084939640','22.22.2.0','aio',NULL,NULL,NULL),('7803db38-a7d6-4877-b797-9b2d9c859068','5.5.5.0','aio',NULL,NULL,NULL),('682e50a9-330d-486f-bb35-bf7c1f3bc6e1','9.9.9.0','aio',NULL,NULL,NULL),('67c91468-67df-4310-a671-bdf0fe23e8a1','4.4.4.0','aio',NULL,NULL,NULL),('d92f13ad-e20f-4bab-8674-d301d29f02f0','10.1.1.0','aio',NULL,NULL,NULL),('f6affbad-9b04-43c7-ab55-424cd9d03c77','1.2.3.0','aio',NULL,NULL,NULL),('66eebe1b-1cf2-4410-95d2-851b823d6f1b','90.90.1.0','aio',NULL,NULL,NULL),('aa13e3d8-28c9-4c8e-8857-564564d2fec9','80.1.2.0','aio',NULL,NULL,NULL),('b0c93fb6-095f-4d40-9ebb-006d53497ace','40.1.1.0','aio',NULL,NULL,NULL),('8370d81c-6834-41bc-bf69-12d79b10f533','50.1.1.0','aio','','',''),('48e0600d-c285-497c-8ec3-38bbec3094cb','60.1.1.0','aio','1024','1','10'),('a566bc79-455f-4481-a217-02da11926ec4','50.50.1.0','aio','1024','1','10'),('a9bf3faf-eaad-46df-b603-d9366fc99c61','111.55.20.0','aio','1024','1','10'),('1563efd1-fb27-44cd-8250-555ef207c0da','5.1.1.0','aio','1024','1','10'),('c158171c-b3b0-4fff-9628-a4418f8a67c9','20.20.3.0','aio','1024','1','10'),('7c80d194-c9cf-46b3-affb-be5e6501ca09','20.20.30.2','aio','1024','1','10'),('85379939-d671-4753-8541-f16d2c7d3f89','60.60.50.0','aio','1024','1','10'),('6e4f0c0f-7636-4f23-b78a-83b7281ce550','40.40.40.0','aio','1024','1','10'),('43afecad-e38b-41b0-aa57-a245f278fb40','20.20.20.0','aio','1024','1','10'),('3fbd21d6-bb25-4c82-80cd-df458f8c34eb','3.3.3.0','aio','1024','1','10'),('bb7a58e9-9ff2-4e9b-96b8-51a48a44e33b','4.4.4.0','aio','1024','1','10'),('3330ebdb-5f96-46ca-a655-91737b6b130e','54.54.54.0','aio','1024','1','10'),('aee72ea9-441e-471c-afed-9369695c4ae3','60.60.60.0','aio','1024','1','10'),('6d8b319e-ed0e-4080-8dc1-b787fd81d1fb','60.60.6.0','aio','1024','1','10'),('e2f80f31-2a0e-4de8-b51b-d5f15d60980f','2.20.20.0','aio','1024','1','10');
/*!40000 ALTER TABLE `core_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_debug`
--

DROP TABLE IF EXISTS `data_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_debug` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `started` int(11) NOT NULL DEFAULT '0',
  `done` int(11) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL DEFAULT '0',
  `datasource` int(11) NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `issue` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `done` (`done`),
  KEY `datasource` (`datasource`),
  KEY `started` (`started`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Datasource Debugger Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_debug`
--

LOCK TABLES `data_debug` WRITE;
/*!40000 ALTER TABLE `data_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_input`
--

DROP TABLE IF EXISTS `data_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_input` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `input_string` varchar(512) DEFAULT NULL,
  `type_id` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name_type_id` (`name`(171),`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_input`
--

LOCK TABLES `data_input` WRITE;
/*!40000 ALTER TABLE `data_input` DISABLE KEYS */;
INSERT INTO `data_input` VALUES (1,'3eb92bb845b9660a7445cf9740726522','Get SNMP Data','',2),(2,'bf566c869ac6443b0c75d1c32b5a350e','Get SNMP Data (Indexed)','',3),(3,'274f4685461170b9eb1b98d22567ab5e','Unix - Get Free Disk Space','<path_cacti>/scripts/diskfree.sh <partition>',1),(4,'95ed0993eb3095f9920d431ac80f4231','Unix - Get Load Average','perl <path_cacti>/scripts/loadavg_multi.pl',1),(5,'79a284e136bb6b061c6f96ec219ac448','Unix - Get Logged In Users','perl <path_cacti>/scripts/unix_users.pl <username>',1),(6,'362e6d4768937c4f899dd21b91ef0ff8','Linux - Get Memory Usage','perl <path_cacti>/scripts/linux_memory.pl <grepstr>',1),(7,'a637359e0a4287ba43048a5fdf202066','Unix - Get System Processes','perl <path_cacti>/scripts/unix_processes.pl',1),(8,'47d6bfe8be57a45171afd678920bd399','Unix - Get TCP Connections','perl <path_cacti>/scripts/unix_tcp_connections.pl <grepstr>',1),(9,'cc948e4de13f32b6aea45abaadd287a3','Unix - Get Web Hits','perl <path_cacti>/scripts/webhits.pl <log_path>',1),(10,'8bd153aeb06e3ff89efc73f35849a7a0','Unix - Ping Host','perl <path_cacti>/scripts/ping.pl <hostname>',1),(11,'80e9e4c4191a5da189ae26d0e237f015','Get Script Data (Indexed)','',4),(12,'332111d8b54ac8ce939af87a7eac0c06','Get Script Server Data (Indexed)','',6),(13,'65b66ec906cd11d474d3588a223ab7b3','Net-SNMP - Combined SCSI Disk I/O','<path_cacti>/scripts/ss_net_snmp_disk_io.php ss_net_snmp_disk_io <hostname>',5),(14,'d58b9cad6311a6b9652d49c0066e0582','Net-SNMP - Combined SCSI Disk Bytes','<path_cacti>/scripts/ss_net_snmp_disk_bytes.php ss_net_snmp_disk_bytes <hostname>',5);
/*!40000 ALTER TABLE `data_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_input_data`
--

DROP TABLE IF EXISTS `data_input_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_input_data` (
  `data_input_field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data_template_data_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `t_value` char(2) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`data_input_field_id`,`data_template_data_id`),
  KEY `t_value` (`t_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_input_data`
--

LOCK TABLES `data_input_data` WRITE;
/*!40000 ALTER TABLE `data_input_data` DISABLE KEYS */;
INSERT INTO `data_input_data` VALUES (1,4,'',''),(1,5,'',''),(1,6,'',''),(1,13,'',''),(1,14,'',''),(1,15,'',''),(1,16,'',''),(1,17,'',''),(1,18,'',''),(1,19,'',''),(1,20,'',''),(1,21,'',''),(1,22,'',''),(1,23,'',''),(1,24,'',''),(1,25,'',''),(1,26,'',''),(1,27,'',''),(1,30,'',''),(1,31,'',''),(1,32,'',''),(1,33,'',''),(1,600,'',''),(1,601,'',''),(1,602,'',''),(1,603,'',''),(1,606,'',''),(1,610,NULL,'127.0.0.1'),(2,4,'',''),(2,5,'',''),(2,6,'',''),(2,13,'',''),(2,14,'',''),(2,15,'',''),(2,16,'',''),(2,17,'',''),(2,18,'',''),(2,19,'',''),(2,20,'',''),(2,21,'',''),(2,22,'',''),(2,23,'',''),(2,24,'',''),(2,25,'',''),(2,26,'',''),(2,27,'',''),(2,30,'',''),(2,31,'',''),(2,32,'',''),(2,33,'',''),(2,600,'',''),(2,601,'',''),(2,602,'',''),(2,603,'',''),(2,606,'',''),(2,610,NULL,'public'),(3,4,'',''),(3,5,'',''),(3,6,'',''),(3,13,'',''),(3,14,'',''),(3,15,'',''),(3,16,'',''),(3,17,'',''),(3,18,'',''),(3,19,'',''),(3,20,'',''),(3,21,'',''),(3,22,'',''),(3,23,'',''),(3,24,'',''),(3,25,'',''),(3,26,'',''),(3,27,'',''),(3,30,'',''),(3,33,'',''),(3,600,'',''),(3,601,'',''),(3,603,'',''),(3,606,'',''),(3,610,NULL,''),(4,13,'',''),(4,14,'',''),(4,15,'',''),(4,16,'',''),(4,17,'',''),(4,18,'',''),(4,19,'',''),(4,20,'',''),(4,21,'',''),(4,22,'',''),(4,23,'',''),(4,24,'',''),(4,25,'',''),(4,26,'',''),(4,33,'',''),(4,610,NULL,''),(5,13,'',''),(5,14,'',''),(5,15,'',''),(5,16,'',''),(5,17,'',''),(5,18,'',''),(5,19,'',''),(5,20,'',''),(5,21,'',''),(5,22,'',''),(5,23,'',''),(5,24,'',''),(5,25,'',''),(5,26,'',''),(5,33,'',''),(5,610,NULL,'2'),(6,8,'on',''),(6,13,'','.1.3.6.1.4.1.2021.10.1.3.1'),(6,14,'','.1.3.6.1.4.1.2021.10.1.3.2'),(6,15,'','.1.3.6.1.4.1.2021.10.1.3.3'),(6,16,'','.1.3.6.1.4.1.2021.4.14.0'),(6,17,'','.1.3.6.1.4.1.2021.4.6.0'),(6,18,'','.1.3.6.1.4.1.2021.4.15.0'),(6,19,'','.1.3.6.1.4.1.2021.4.5.0'),(6,20,'','.1.3.6.1.2.1.25.1.5.0'),(6,21,'','.1.3.6.1.2.1.25.1.6.0'),(6,22,'','.1.3.6.1.4.1.2021.11.10.0'),(6,23,'','.1.3.6.1.4.1.2021.11.9.0'),(6,24,'','.1.3.6.1.4.1.2021.11.11.0'),(6,25,'','.1.3.6.1.4.1.2021.11.7.0'),(6,26,'','.1.3.6.1.4.1.2021.11.8.0'),(6,33,'','.1.3.6.1.4.1.9.2.1.58.0'),(6,610,'','.1.3.6.1.2.1.25.1.5.0'),(7,9,'',''),(7,10,'',''),(7,11,'',''),(7,12,'',''),(7,29,'',''),(7,32,'',''),(7,604,NULL,'127.0.0.1'),(7,605,NULL,'127.0.0.1'),(7,608,NULL,'127.0.0.1'),(7,609,NULL,'127.0.0.1'),(7,611,NULL,'127.0.0.1'),(8,9,'',''),(8,10,'',''),(8,11,'',''),(8,12,'',''),(8,29,'',''),(8,32,'',''),(8,604,NULL,'public'),(8,605,NULL,'public'),(8,608,NULL,'public'),(8,609,NULL,'public'),(8,611,NULL,'public'),(9,9,'',''),(9,10,'',''),(9,11,'',''),(9,12,'',''),(9,29,'',''),(9,32,'',''),(9,604,NULL,''),(9,605,NULL,''),(9,608,NULL,''),(9,609,NULL,''),(9,611,NULL,''),(10,9,'',''),(10,10,'',''),(10,11,'',''),(10,12,'',''),(10,29,'',''),(10,32,'',''),(10,604,NULL,''),(10,605,NULL,''),(10,608,NULL,''),(10,609,NULL,''),(10,611,NULL,''),(11,9,'',''),(11,10,'',''),(11,11,'',''),(11,12,'',''),(11,29,'',''),(11,32,'',''),(11,604,NULL,'2'),(11,605,NULL,'2'),(11,608,NULL,'2'),(11,609,NULL,'2'),(11,611,NULL,'2'),(12,9,'on',''),(12,10,'on',''),(12,11,'on',''),(12,12,'on',''),(12,29,'on',''),(12,32,'on',''),(12,604,'on',''),(12,605,'on',''),(12,608,'on',''),(12,609,'on',''),(12,611,'on',''),(13,9,'on',''),(13,10,'on',''),(13,11,'on',''),(13,12,'on',''),(13,29,'on',''),(13,32,'on',''),(13,604,'on',''),(13,605,'on',''),(13,608,'on',''),(13,609,'on',''),(13,611,'on',''),(14,9,'on',''),(14,10,'on',''),(14,11,'on',''),(14,12,'on',''),(14,29,'on',''),(14,32,'on',''),(14,604,'on',''),(14,605,'on',''),(14,608,'on',''),(14,609,'on',''),(14,611,'on',''),(20,3,'',''),(22,4,'','MemFree:'),(22,5,'','SwapFree:'),(22,600,'','MemFree:'),(22,601,'','SwapFree:'),(29,7,'',''),(29,607,NULL,'127.0.0.1'),(31,6,'on',''),(31,606,'on',''),(32,6,'on',''),(32,606,'on',''),(33,6,'on',''),(33,606,'on',''),(35,30,'on',''),(35,31,'on',''),(35,602,'on',''),(35,603,'on',''),(36,30,'on',''),(36,31,'on',''),(36,602,'on',''),(36,603,'on',''),(37,30,'on',''),(37,31,'on',''),(37,602,'on',''),(37,603,'on',''),(39,9,'',''),(39,10,'',''),(39,11,'',''),(39,12,'',''),(39,29,'',''),(39,604,NULL,'161'),(39,605,NULL,'161'),(39,608,NULL,'161'),(39,609,NULL,'161'),(39,611,NULL,'161'),(40,13,'',''),(40,14,'',''),(40,15,'',''),(40,16,'',''),(40,17,'',''),(40,18,'',''),(40,19,'',''),(40,22,'',''),(40,23,'',''),(40,24,'',''),(40,25,'',''),(40,26,'',''),(40,33,'',''),(41,13,'',''),(41,14,'',''),(41,15,'',''),(41,16,'',''),(41,17,'',''),(41,18,'',''),(41,19,'',''),(41,22,'',''),(41,23,'',''),(41,24,'',''),(41,25,'',''),(41,26,'',''),(41,33,'',''),(42,13,'',''),(42,14,'',''),(42,15,'',''),(42,16,'',''),(42,17,'',''),(42,18,'',''),(42,19,'',''),(42,22,'',''),(42,23,'',''),(42,24,'',''),(42,25,'',''),(42,26,'',''),(42,33,'',''),(43,13,'',''),(43,14,'',''),(43,15,'',''),(43,16,'',''),(43,17,'',''),(43,18,'',''),(43,19,'',''),(43,22,'',''),(43,23,'',''),(43,24,'',''),(43,25,'',''),(43,26,'',''),(43,33,'',''),(44,9,'',''),(44,29,'',''),(44,604,NULL,''),(44,605,NULL,''),(44,609,NULL,''),(44,611,NULL,''),(45,9,'',''),(45,29,'',''),(45,604,NULL,''),(45,605,NULL,''),(45,609,NULL,''),(45,611,NULL,''),(46,9,'',''),(46,29,'',''),(46,604,NULL,''),(46,605,NULL,''),(46,609,NULL,''),(46,611,NULL,''),(47,27,'',''),(50,28,'','');
/*!40000 ALTER TABLE `data_input_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_input_fields`
--

DROP TABLE IF EXISTS `data_input_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_input_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `data_input_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `data_name` varchar(50) NOT NULL DEFAULT '',
  `input_output` char(3) NOT NULL DEFAULT '',
  `update_rra` char(2) DEFAULT '0',
  `sequence` smallint(5) NOT NULL DEFAULT '0',
  `type_code` varchar(40) DEFAULT NULL,
  `regexp_match` varchar(200) DEFAULT NULL,
  `allow_nulls` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_input_id` (`data_input_id`),
  KEY `input_output` (`input_output`),
  KEY `type_code_data_input_id` (`type_code`,`data_input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_input_fields`
--

LOCK TABLES `data_input_fields` WRITE;
/*!40000 ALTER TABLE `data_input_fields` DISABLE KEYS */;
INSERT INTO `data_input_fields` VALUES (1,'92f5906c8dc0f964b41f4253df582c38',1,'SNMP IP Address','management_ip','in','',0,'hostname','',''),(2,'32285d5bf16e56c478f5e83f32cda9ef',1,'SNMP Community','snmp_community','in','',0,'snmp_community','',''),(3,'ad14ac90641aed388139f6ba86a2e48b',1,'SNMP Username','snmp_username','in','',0,'snmp_username','','on'),(4,'9c55a74bd571b4f00a96fd4b793278c6',1,'SNMP Password','snmp_password','in','',0,'snmp_password','','on'),(5,'012ccb1d3687d3edb29c002ea66e72da',1,'SNMP Version (1, 2, or 3)','snmp_version','in','',0,'snmp_version','','on'),(6,'4276a5ec6e3fe33995129041b1909762',1,'OID','oid','in','',0,'snmp_oid','',''),(7,'617cdc8a230615e59f06f361ef6e7728',2,'SNMP IP Address','management_ip','in','',0,'hostname','',''),(8,'acb449d1451e8a2a655c2c99d31142c7',2,'SNMP Community','snmp_community','in','',0,'snmp_community','',''),(9,'f4facc5e2ca7ebee621f09bc6d9fc792',2,'SNMP Username (v3)','snmp_username','in','',0,'snmp_username','','on'),(10,'1cc1493a6781af2c478fa4de971531cf',2,'SNMP Password (v3)','snmp_password','in','',0,'snmp_password','','on'),(11,'b5c23f246559df38662c255f4aa21d6b',2,'SNMP Version (1, 2, or 3)','snmp_version','in','',0,'snmp_version','',''),(12,'6027a919c7c7731fbe095b6f53ab127b',2,'Index Type','index_type','in','',0,'index_type','',''),(13,'cbbe5c1ddfb264a6e5d509ce1c78c95f',2,'Index Value','index_value','in','',0,'index_value','','on'),(14,'e6deda7be0f391399c5130e7c4a48b28',2,'Output Type ID','output_type','in','',0,'output_type','',''),(15,'edfd72783ad02df128ff82fc9324b4b9',3,'Disk Partition','partition','in','',1,'','',''),(16,'8b75fb61d288f0b5fc0bd3056af3689b',3,'Kilobytes Free','kilobytes','out','on',0,'','',''),(17,'363588d49b263d30aecb683c52774f39',4,'1 Minute Average','1min','out','on',0,'','',''),(18,'ad139a9e1d69881da36fca07889abf58',4,'5 Minute Average','5min','out','on',0,'','',''),(19,'5db9fee64824c08258c7ff6f8bc53337',4,'10 Minute Average','10min','out','on',0,'','',''),(20,'c0cfd0beae5e79927c5a360076706820',5,'Username (Optional)','username','in','',1,'','','on'),(21,'52c58ad414d9a2a83b00a7a51be75a53',5,'Logged In Users','users','out','on',0,'','',''),(22,'05eb5d710f0814871b8515845521f8d7',6,'Grep String','grepstr','in','',1,'','',''),(23,'86cb1cbfde66279dbc7f1144f43a3219',6,'Result (in Kilobytes)','kilobytes','out','on',0,'','',''),(24,'d5a8dd5fbe6a5af11667c0039af41386',7,'Number of Processes','proc','out','on',0,'','',''),(25,'8848cdcae831595951a3f6af04eec93b',8,'Grep String','grepstr','in','',1,'','','on'),(26,'3d1288d33008430ce354e8b9c162f7ff',8,'Connections','connections','out','on',0,'','',''),(27,'c6af570bb2ed9c84abf32033702e2860',9,'(Optional) Log Path','log_path','in','',1,'','','on'),(28,'f9389860f5c5340c9b27fca0b4ee5e71',9,'Web Hits','webhits','out','on',0,'','',''),(29,'5fbadb91ad66f203463c1187fe7bd9d5',10,'IP Address','hostname','in','',1,'hostname','',''),(30,'6ac4330d123c69067d36a933d105e89a',10,'Milliseconds','out_ms','out','on',0,'','',''),(31,'d39556ecad6166701bfb0e28c5a11108',11,'Index Type','index_type','in','',0,'index_type','',''),(32,'3b7caa46eb809fc238de6ef18b6e10d5',11,'Index Value','index_value','in','',0,'index_value','',''),(33,'74af2e42dc12956c4817c2ef5d9983f9',11,'Output Type ID','output_type','in','',0,'output_type','',''),(34,'8ae57f09f787656bf4ac541e8bd12537',11,'Output Value','output','out','on',0,'','',''),(35,'172b4b0eacee4948c6479f587b62e512',12,'Index Type','index_type','in','',0,'index_type','',''),(36,'30fb5d5bcf3d66bb5abe88596f357c26',12,'Index Value','index_value','in','',0,'index_value','',''),(37,'31112c85ae4ff821d3b288336288818c',12,'Output Type ID','output_type','in','',0,'output_type','',''),(38,'5be8fa85472d89c621790b43510b5043',12,'Output Value','output','out','on',0,'','',''),(39,'c1f36ee60c3dc98945556d57f26e475b',2,'SNMP Port','snmp_port','in','',0,'snmp_port','',''),(40,'fc64b99742ec417cc424dbf8c7692d36',1,'SNMP Port','snmp_port','in','',0,'snmp_port','',''),(41,'20832ce12f099c8e54140793a091af90',1,'SNMP Authenticaion Protocol (v3)','snmp_auth_protocol','in','',0,'snmp_auth_protocol','',''),(42,'c60c9aac1e1b3555ea0620b8bbfd82cb',1,'SNMP Privacy Passphrase (v3)','snmp_priv_passphrase','in','',0,'snmp_priv_passphrase','',''),(43,'feda162701240101bc74148415ef415a',1,'SNMP Privacy Protocol (v3)','snmp_priv_protocol','in','',0,'snmp_priv_protocol','',''),(44,'2cf7129ad3ff819a7a7ac189bee48ce8',2,'SNMP Authenticaion Protocol (v3)','snmp_auth_protocol','in','',0,'snmp_auth_protocol','',''),(45,'6b13ac0a0194e171d241d4b06f913158',2,'SNMP Privacy Passphrase (v3)','snmp_priv_passphrase','in','',0,'snmp_priv_passphrase','',''),(46,'3a33d4fc65b8329ab2ac46a36da26b72',2,'SNMP Privacy Protocol (v3)','snmp_priv_protocol','in','',0,'snmp_priv_protocol','',''),(47,'5cdc32e66ef7b8619de77a274b6f7355',13,'The ID of the Host','hostname','in','',0,'hostname','',''),(48,'029b16559b8383de29dc640ba62f66f1',13,'Disk Reads in 5 Minutes','reads','out','on',0,'','',''),(49,'ff52a1a082547eaee254c3532e4c7487',13,'Disk Writes in 5 Minutes','writes','out','on',0,'','',''),(50,'3603877fa56213764cddd6ce7f126a4a',14,'The name of the host','hostname','in','',0,'hostname','',''),(51,'5560a408549e41f7f130e3d8e99505d0',14,'The number of bytes read in last 5 minutes','bytesread','out','on',0,'','',''),(52,'a9a85ecb0c17bf44cd5eee62a561c611',14,'The number of bytes written in last 5 minutes','byteswritten','out','on',0,'','','');
/*!40000 ALTER TABLE `data_input_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_local`
--

DROP TABLE IF EXISTS `data_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_local` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `snmp_query_id` mediumint(8) NOT NULL DEFAULT '0',
  `snmp_index` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `data_template_id` (`data_template_id`),
  KEY `snmp_query_id` (`snmp_query_id`),
  KEY `snmp_index` (`snmp_index`(191)),
  KEY `host_id_snmp_query_id` (`host_id`,`snmp_query_id`)
) ENGINE=InnoDB AUTO_INCREMENT=579 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_local`
--

LOCK TABLES `data_local` WRITE;
/*!40000 ALTER TABLE `data_local` DISABLE KEYS */;
INSERT INTO `data_local` VALUES (567,4,48,0,''),(568,5,48,0,''),(569,31,48,0,''),(570,30,48,0,''),(571,29,48,0,''),(572,9,48,0,''),(573,6,48,0,''),(574,7,48,0,''),(575,10,48,0,''),(576,9,48,0,''),(577,20,48,0,''),(578,9,48,0,'');
/*!40000 ALTER TABLE `data_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_profiles`
--

DROP TABLE IF EXISTS `data_source_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_profiles` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `step` int(10) unsigned NOT NULL DEFAULT '300',
  `heartbeat` int(10) unsigned NOT NULL DEFAULT '600',
  `x_files_factor` double DEFAULT '0.5',
  `default` char(2) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Stores Data Source Profiles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_profiles`
--

LOCK TABLES `data_source_profiles` WRITE;
/*!40000 ALTER TABLE `data_source_profiles` DISABLE KEYS */;
INSERT INTO `data_source_profiles` VALUES (1,'d62c52891f4f9688729a5bc9fad91b18','System Default',300,600,0.5,'on'),(2,'c0dd0e46b9ca268e7ed4162d329f9215','High Collection Rate',30,1200,0.5,'');
/*!40000 ALTER TABLE `data_source_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_profiles_cf`
--

DROP TABLE IF EXISTS `data_source_profiles_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_profiles_cf` (
  `data_source_profile_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `consolidation_function_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`data_source_profile_id`,`consolidation_function_id`),
  KEY `data_source_profile_id` (`data_source_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Maps the Data Source Profile Consolidation Functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_profiles_cf`
--

LOCK TABLES `data_source_profiles_cf` WRITE;
/*!40000 ALTER TABLE `data_source_profiles_cf` DISABLE KEYS */;
INSERT INTO `data_source_profiles_cf` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4);
/*!40000 ALTER TABLE `data_source_profiles_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_profiles_rra`
--

DROP TABLE IF EXISTS `data_source_profiles_rra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_profiles_rra` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `data_source_profile_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `steps` int(10) unsigned DEFAULT '1',
  `rows` int(10) unsigned NOT NULL DEFAULT '700',
  `timespan` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `data_source_profile_id` (`data_source_profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='Stores RRA Definitions for Data Source Profiles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_profiles_rra`
--

LOCK TABLES `data_source_profiles_rra` WRITE;
/*!40000 ALTER TABLE `data_source_profiles_rra` DISABLE KEYS */;
INSERT INTO `data_source_profiles_rra` VALUES (1,1,'Daily (5 Minute Average)',1,600,86400),(2,1,'Weekly (30 Minute Average)',6,700,604800),(3,1,'Monthly (2 Hour Average)',24,775,2618784),(4,1,'Yearly (1 Day Average)',288,797,31536000),(5,2,'30 Second Samples',1,1500,86400),(6,2,'15 Minute Average',30,1346,604800),(7,2,'1 Hour Average',120,1445,2618784),(8,2,'4 Hour Average',480,4380,31536000);
/*!40000 ALTER TABLE `data_source_profiles_rra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_purge_action`
--

DROP TABLE IF EXISTS `data_source_purge_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_purge_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='RRD Cleaner File Actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_purge_action`
--

LOCK TABLES `data_source_purge_action` WRITE;
/*!40000 ALTER TABLE `data_source_purge_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_purge_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_purge_temp`
--

DROP TABLE IF EXISTS `data_source_purge_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_purge_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_cache` varchar(255) NOT NULL DEFAULT '',
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `last_mod` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `in_cacti` tinyint(4) NOT NULL DEFAULT '0',
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `local_data_id` (`local_data_id`),
  KEY `in_cacti` (`in_cacti`),
  KEY `data_template_id` (`data_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='RRD Cleaner File Repository';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_purge_temp`
--

LOCK TABLES `data_source_purge_temp` WRITE;
/*!40000 ALTER TABLE `data_source_purge_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_purge_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_daily`
--

DROP TABLE IF EXISTS `data_source_stats_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_daily` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_daily`
--

LOCK TABLES `data_source_stats_daily` WRITE;
/*!40000 ALTER TABLE `data_source_stats_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_stats_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_hourly`
--

DROP TABLE IF EXISTS `data_source_stats_hourly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_hourly` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_hourly`
--

LOCK TABLES `data_source_stats_hourly` WRITE;
/*!40000 ALTER TABLE `data_source_stats_hourly` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_stats_hourly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_hourly_cache`
--

DROP TABLE IF EXISTS `data_source_stats_hourly_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_hourly_cache` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`time`,`rrd_name`),
  KEY `time` (`time`) USING BTREE
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_hourly_cache`
--

LOCK TABLES `data_source_stats_hourly_cache` WRITE;
/*!40000 ALTER TABLE `data_source_stats_hourly_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_stats_hourly_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_hourly_last`
--

DROP TABLE IF EXISTS `data_source_stats_hourly_last`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_hourly_last` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `value` double DEFAULT NULL,
  `calculated` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_hourly_last`
--

LOCK TABLES `data_source_stats_hourly_last` WRITE;
/*!40000 ALTER TABLE `data_source_stats_hourly_last` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_stats_hourly_last` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_monthly`
--

DROP TABLE IF EXISTS `data_source_stats_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_monthly` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_monthly`
--

LOCK TABLES `data_source_stats_monthly` WRITE;
/*!40000 ALTER TABLE `data_source_stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_stats_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_weekly`
--

DROP TABLE IF EXISTS `data_source_stats_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_weekly` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_weekly`
--

LOCK TABLES `data_source_stats_weekly` WRITE;
/*!40000 ALTER TABLE `data_source_stats_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_stats_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_yearly`
--

DROP TABLE IF EXISTS `data_source_stats_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_yearly` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_yearly`
--

LOCK TABLES `data_source_stats_yearly` WRITE;
/*!40000 ALTER TABLE `data_source_stats_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_stats_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_template`
--

DROP TABLE IF EXISTS `data_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_template` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_template`
--

LOCK TABLES `data_template` WRITE;
/*!40000 ALTER TABLE `data_template` DISABLE KEYS */;
INSERT INTO `data_template` VALUES (1,'9b8c92d3c32703900ff7dd653bfc9cd8','Unix - Processes'),(2,'9e72511e127de200733eb502eb818e1d','Unix - Load Average'),(3,'c221c2164c585b6da378013a7a6a2c13','Unix - Logged in Users'),(4,'dc33aa9a8e71fb7c61ec0e7a6da074aa','Linux - Memory - Free'),(5,'41f55087d067142d702dd3c73c98f020','Linux - Memory - Free Swap'),(6,'e4ac6919d4f6f21ec5b281a1d6ac4d4e','Unix - Hard Drive Space'),(7,'a30a81cb1de65b52b7da542c8df3f188','Unix - Ping Host'),(8,'d429e4a6019c91e6e84562593c1968ca','SNMP - Generic OID Template'),(9,'6632e1e0b58a565c135d7ff90440c335','Interface - Traffic'),(10,'36335cd98633963a575b70639cd2fdad','Interface - Errors/Discards'),(11,'2f654f7d69ac71a5d56b1db8543ccad3','Interface - Unicast Packets'),(12,'c84e511401a747409053c90ba910d0fe','Interface - Non-Unicast Packets'),(13,'9b82d44eb563027659683765f92c9757','Net-SNMP - Load Average - 1 Minute'),(14,'87847714d19f405ff3c74f3341b3f940','Net-SNMP - Load Average - 5 Minute'),(15,'308ac157f24e2763f8cd828a80b3e5ff','Net-SNMP - Load Average - 15 Minute'),(16,'797a3e92b0039841b52e441a2823a6fb','Net-SNMP - Memory - Buffers'),(17,'fa15932d3cab0da2ab94c69b1a9f5ca7','Net-SNMP - Memory - Free'),(18,'a274deec1f78654dca6c446ba75ebca4','Net-SNMP - Memory - Cache'),(19,'728f3b41490e37c1697b6567fb661571','Net-SNMP - Memory - Total'),(20,'2ef027cc76d75720ee5f7a528f0f1fda','Host MIB - Logged in Users'),(21,'f383db441d1c246cff8482f15e184e5f','Host MIB - Processes'),(22,'a62bcd64c0904d1e239a129f6e3d7edf','Net-SNMP - CPU - System'),(23,'95946b5f47886771421a40dcc2d6d13c','Net-SNMP - CPU - User'),(24,'565b2c6597b96995ecc93083e625d6bf','Net-SNMP - CPU - Idle'),(25,'5cd3c67ceec2e04bd4f9173b79ddbc3c','Net-SNMP - Interrupts'),(26,'430e64b44e8c906747d00d8390011cc2','Net-SNMP - Context Switches'),(27,'f459faf705e1dfa06a609d390e87d265','Net-SNMP - Combined SCSI Disk I/O'),(28,'4b809fe1bacb0f92c5cdc6d1346ed251','Net-SNMP - Combined SCSI Disk Bytes'),(29,'c8a8f50f5f4a465368222594c5709ede','Net-SNMP - Hard Drive Space'),(30,'d814fa3b79bd0f8933b6e0834d3f16d0','Host MIB - Hard Drive Space'),(31,'f6e7d21c19434666bbdac00ccef9932f','Host MIB - CPU Utilization'),(32,'520349abb0429ae09302de76d090204b','Net-SNMP - Device I/O'),(33,'e9def3a0e409f517cb804dfeba4ccd90','Cisco Router - 5 Minute CPU');
/*!40000 ALTER TABLE `data_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_template_data`
--

DROP TABLE IF EXISTS `data_template_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_template_data` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `local_data_template_data_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data_input_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `t_name` char(2) DEFAULT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `name_cache` varchar(255) NOT NULL DEFAULT '',
  `data_source_path` varchar(255) DEFAULT '',
  `t_active` char(2) DEFAULT '',
  `active` char(2) DEFAULT NULL,
  `t_rrd_step` char(2) DEFAULT '',
  `rrd_step` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `t_data_source_profile_id` char(2) DEFAULT '',
  `data_source_profile_id` mediumint(8) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `local_data_id` (`local_data_id`),
  KEY `data_template_id` (`data_template_id`),
  KEY `data_input_id` (`data_input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=612 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_template_data`
--

LOCK TABLES `data_template_data` WRITE;
/*!40000 ALTER TABLE `data_template_data` DISABLE KEYS */;
INSERT INTO `data_template_data` VALUES (1,0,0,1,7,'','|host_description| - Processes','','','','on','',300,'on',1),(2,0,0,2,4,'','|host_description| - Load Average','','','','on','',300,'',1),(3,0,0,3,5,'','|host_description| - Logged in Users','','','','on','',300,'',1),(4,0,0,4,6,'','|host_description| - Memory - Free','','','','on','',300,'',1),(5,0,0,5,6,'','|host_description| - Memory - Free Swap','','','','on','',300,'',1),(6,0,0,6,11,'on','|host_description| - Hard Drive Space','','','','on','',300,'',1),(7,0,0,7,10,'','|host_description| - Ping Host','','','','on','',300,'',1),(8,0,0,8,1,'on','|host_description| -','','','','on','',300,'',1),(9,0,0,9,2,'on','|host_description| - Traffic','','','','on','',300,'',1),(10,0,0,10,2,'on','|host_description| - Errors/Discards','','','','on','',300,'',1),(11,0,0,11,2,'on','|host_description| - Unicast Packets','','','','on','',300,'',1),(12,0,0,12,2,'on','|host_description| - Non-Unicast Packets','','','','on','',300,'',1),(13,0,0,13,1,'','|host_description| - Load Average - 1 Minute','','','','on','',300,'',1),(14,0,0,14,1,'','|host_description| - Load Average - 5 Minute','','','','on','',300,'',1),(15,0,0,15,1,'','|host_description| - Load Average - 15 Minute','','','','on','',300,'',1),(16,0,0,16,1,'','|host_description| - Memory - Buffers','','','','on','',300,'',1),(17,0,0,17,1,'','|host_description| - Memory - Free','','','','on','',300,'',1),(18,0,0,18,1,'','|host_description| - Memory - Cache','','','','on','',300,'',1),(19,0,0,19,1,'','|host_description| - Memory - Total','','','','on','',300,'',1),(20,0,0,20,1,'','|host_description| - Logged in Users','','','','on','',300,'',1),(21,0,0,21,1,'','|host_description| - Processes','','','','on','',300,'',1),(22,0,0,22,1,'','|host_description| - CPU - System','','','','on','',300,'',1),(23,0,0,23,1,'','|host_description| - CPU - User','','','','on','',300,'',1),(24,0,0,24,1,'','|host_description| - CPU - Idle','','','','on','',300,'',1),(25,0,0,25,1,'','|host_description| - Interrupts','','','','on','',300,'',1),(26,0,0,26,1,'','|host_description| - Context Switches','','','','on','',300,'',1),(27,0,0,27,13,'','|host_description| - Combined SCSI Disk I/O','','','','on','',300,'',1),(28,0,0,28,14,'','|host_description| - Combined SCSI Disk Bytes','','','','on','',300,'',1),(29,0,0,29,2,'on','|host_description| - Hard Drive Space','','','','on','',300,'',1),(30,0,0,30,12,'','|host_description| - Hard Drive Space','','','','on','',300,'',1),(31,0,0,31,12,'','|host_description| - CPU Utilization','','','','on','',300,'on',1),(32,0,0,32,2,'','|host_description| - Device I/O -|query_diskIODevice|','','','','on','',300,'',1),(33,0,0,33,1,'','|host_description| - 5 Minute CPU','','','','on','',300,'',1),(600,4,567,4,6,NULL,'|host_description| - Memory - Free','127.0.0.1 - Memory - Free','<path_rra>/127_0_0_1_mem_buffers_567.rrd','','on','',300,'',1),(601,5,568,5,6,NULL,'|host_description| - Memory - Free Swap','127.0.0.1 - Memory - Free Swap','<path_rra>/127_0_0_1_mem_swap_568.rrd','','on','',300,'',1),(602,31,569,31,12,NULL,'|host_description| - CPU Utilization','127.0.0.1 - CPU Utilization','<path_rra>/127_0_0_1_cpu_569.rrd','','on','',300,'',1),(603,30,570,30,12,NULL,'|host_description| - Hard Drive Space','127.0.0.1 - Hard Drive Space','<path_rra>/127_0_0_1_hdd_used_570.rrd','','on','',300,'',1),(604,29,571,29,2,NULL,'|host_description| - Hard Drive Space','127.0.0.1 - Hard Drive Space','<path_rra>/127_0_0_1_hdd_free_571.rrd','','on','',300,'',1),(605,9,572,9,2,NULL,'|host_description| - Traffic','127.0.0.1 - Traffic','<path_rra>/127_0_0_1_traffic_in_572.rrd','','on','',300,'',1),(606,6,573,6,11,NULL,'|host_description| - Hard Drive Space','127.0.0.1 - Hard Drive Space','<path_rra>/127_0_0_1_hdd_free_573.rrd','','on','',300,'',1),(607,7,574,7,10,NULL,'|host_description| - Ping Host','127.0.0.1 - Ping Host','<path_rra>/127_0_0_1_ping_574.rrd','','on','',300,'',1),(608,10,575,10,2,NULL,'|host_description| - Errors/Discards','127.0.0.1 - Errors/Discards','<path_rra>/127_0_0_1_errors_in_575.rrd','','on','',300,'',1),(609,9,576,9,2,NULL,'|host_description| - Traffic','127.0.0.1 - Traffic','<path_rra>/127_0_0_1_traffic_in_576.rrd','','on','',300,'',1),(610,20,577,20,1,NULL,'|host_description| - Logged in Users','127.0.0.1 - Logged in Users','<path_rra>/127_0_0_1_users_577.rrd','','on','',300,'',1),(611,9,578,9,2,NULL,'|host_description| - Traffic','127.0.0.1 - Traffic','<path_rra>/127_0_0_1_traffic_in_578.rrd','','on','',300,'',1);
/*!40000 ALTER TABLE `data_template_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_template_rrd`
--

DROP TABLE IF EXISTS `data_template_rrd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_template_rrd` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `local_data_template_rrd_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `t_rrd_maximum` char(2) DEFAULT NULL,
  `rrd_maximum` varchar(20) NOT NULL DEFAULT '0',
  `t_rrd_minimum` char(2) DEFAULT NULL,
  `rrd_minimum` varchar(20) NOT NULL DEFAULT '0',
  `t_rrd_heartbeat` char(2) DEFAULT NULL,
  `rrd_heartbeat` mediumint(6) NOT NULL DEFAULT '0',
  `t_data_source_type_id` char(2) DEFAULT NULL,
  `data_source_type_id` smallint(5) NOT NULL DEFAULT '0',
  `t_data_source_name` char(2) DEFAULT NULL,
  `data_source_name` varchar(19) NOT NULL DEFAULT '',
  `t_data_input_field_id` char(2) DEFAULT NULL,
  `data_input_field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `duplicate_dsname_contraint` (`local_data_id`,`data_source_name`,`data_template_id`),
  KEY `local_data_id` (`local_data_id`),
  KEY `data_template_id` (`data_template_id`),
  KEY `local_data_template_rrd_id` (`local_data_template_rrd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=850 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_template_rrd`
--

LOCK TABLES `data_template_rrd` WRITE;
/*!40000 ALTER TABLE `data_template_rrd` DISABLE KEYS */;
INSERT INTO `data_template_rrd` VALUES (1,'f1ba3a5b17b95825021241398bb0f277',0,0,1,'','1000','','0','',600,'',1,'','proc','',24),(2,'8175ca431c8fe50efff5a1d3ae51b55d',0,0,2,'','500','','0','',600,'',1,'','load_1min','',17),(3,'a2eeb8acd6ea01cd0e3ac852965c0eb6',0,0,2,'','500','','0','',600,'',1,'','load_5min','',18),(4,'9f951b7fb3b19285a411aebb5254a831',0,0,2,'','500','','0','',600,'',1,'','load_15min','',19),(5,'46a5afe8e6c0419172c76421dc9e304a',0,0,3,'','500','','0','',600,'',1,'','users','',21),(6,'a4df3de5238d3beabee1a2fe140d3d80',0,0,4,'','0','','0','',600,'',1,'','mem_buffers','',23),(7,'7fea6acc9b1a19484b4cb4cef2b6c5da',0,0,5,'','0','','0','',600,'',1,'','mem_swap','',23),(8,'4c82df790325d789d304e6ee5cd4ab7d',0,0,6,'','0','','0','',600,'',1,'','hdd_free','',0),(9,'07175541991def89bd02d28a215f6fcc',0,0,6,'','0','','0','',600,'',1,'','hdd_used','',0),(10,'962fd1994fe9cae87fb36436bdb8a742',0,0,7,'','5000','','0','',600,'',1,'','ping','',30),(11,'224b83ea73f55f8a861bcf4c9bea0472',0,0,8,'on','100','','0','',600,'on',1,'','snmp_oid','',0),(12,'2df25c57022b0c7e7d0be4c035ada1a0',0,0,9,'on','100000000000','','0','',600,'',2,'','traffic_in','',0),(13,'721c0794526d1ac1c359f27dc56faa49',0,0,9,'on','100000000000','','0','',600,'',2,'','traffic_out','',0),(14,'c802e2fd77f5b0a4c4298951bf65957c',0,0,10,'','10000000','','0','',600,'',2,'','errors_in','',0),(15,'4e2a72240955380dc8ffacfcc8c09874',0,0,10,'','10000000','','0','',600,'',2,'','discards_in','',0),(16,'13ebb33f9cbccfcba828db1075a8167c',0,0,10,'','10000000','','0','',600,'',2,'','discards_out','',0),(17,'31399c3725bee7e09ec04049e3d5cd17',0,0,10,'','10000000','','0','',600,'',2,'','errors_out','',0),(18,'636672962b5bb2f31d86985e2ab4bdfe',0,0,11,'','1000000000','','0','',600,'',2,'','unicast_in','',0),(19,'18ce92c125a236a190ee9dd948f56268',0,0,11,'','1000000000','','0','',600,'',2,'','unicast_out','',0),(20,'7be68cbc4ee0b2973eb9785f8c7a35c7',0,0,12,'','1000000000','','0','',600,'',2,'','nonunicast_out','',0),(21,'93e2b6f59b10b13f2ddf2da3ae98b89a',0,0,12,'','1000000000','','0','',600,'',2,'','nonunicast_in','',0),(22,'ed44c2438ef7e46e2aeed2b6c580815c',0,0,13,'','0','','0','',600,'',1,'','load_1min','',0),(23,'9b3a00c9e3530d9e58895ac38271361e',0,0,14,'','0','','0','',600,'',1,'','load_5min','',0),(24,'6746c2ed836ecc68a71bbddf06b0e5d9',0,0,15,'','0','','0','',600,'',1,'','load_15min','',0),(25,'9835d9e1a8c78aa2475d752e8fa74812',0,0,16,'','0','','0','',600,'',1,'','mem_buffers','',0),(26,'9c78dc1981bcea841b8c827c6dc0d26c',0,0,17,'','0','','0','',600,'',1,'','mem_free','',0),(27,'7a6ca455bbeff99ca891371bc77d5cf9',0,0,18,'','0','','0','',600,'',1,'','mem_cache','',0),(28,'129128c4c4769a74adfccf3bfa2eac32',0,0,19,'','0','','0',NULL,600,'',1,'','mem_total','',0),(29,'9464c91bcff47f23085ae5adae6ab987',0,0,20,'','0','','0','',600,'',1,'','users','',0),(30,'50ccbe193c6c7fc29fb9f726cd6c48ee',0,0,21,'','0','','0','',600,'',1,'','proc','',0),(31,'f7fc3e802831391ccd92c05b680da27c',0,0,22,'','0','','0','',600,'',1,'','ssCpuSystem','',0),(32,'93d64a9d12a9929013cd9e970a5d333c',0,0,23,'','0','','0','',600,'',1,'','ssCpuUser','',0),(33,'3d13e790d0eedbeaa9601dcd8c49be31',0,0,24,'','0','','0','',600,'',1,'','ssCpuIdle','',0),(34,'6f3c1f1706df1e20976bd5d616f63d1d',0,0,25,'','0','','0','',600,'',1,'','ssSysInterrupts','',0),(35,'4faab1acdeb03e2bad23d3b80cf9455f',0,0,26,'','0','','0','',600,'',1,'','ssSysContext','',0),(36,'9a925659fc657e446d8623fae0ee9bfa',0,0,27,'','0','','0','',600,'',1,'','reads','',48),(37,'67f8e5f269e7d77818cdb11a9639b561',0,0,27,'','0','','0','',600,'',1,'','writes','',49),(38,'1e2ceb5261d92b3b668b1b8b6c1c4d5f',0,0,28,'','0','','0','',600,'',1,'','bytesread','',51),(39,'dc830e6d271690a7d323199b00b09836',0,0,28,'','0','','0','',600,'',1,'','byteswritten','',52),(40,'2d53f9c76767a2ae8909f4152fd473a4',0,0,29,'','0','','0','',600,'',1,'','hdd_free','',0),(41,'93d91aa7a3cc5473e7b195d5d6e6e675',0,0,29,'','0','','0','',600,'',1,'','hdd_used','',0),(42,'0ee6bb54957f6795a5369a29f818d860',0,0,30,'','0','','0','',600,'',1,'','hdd_used','',0),(43,'165a0da5f461561c85d092dfe96b9551',0,0,30,'','0','','0','',600,'',1,'','hdd_total','',0),(44,'9825aaf7c0bdf1554c5b4b86680ac2c0',0,0,31,'','0','','0','',600,'',1,'','cpu','',0),(45,'bd02243964326257af313861ed5dbd68',0,0,32,'','0','','0','',600,'',2,'','Device_Reads','',0),(46,'0810b7d392b044e5947e324942a6c6dc',0,0,32,'','0','','0','',600,'',2,'','Bytes_Written','',0),(47,'5caf6f213e9e828efc9f8f9b2ed76d3d',0,0,32,'','0','','0','',600,'',2,'','Device_Writes','',0),(48,'15f554db4748ed584449fe6d3cddb38e',0,0,32,'','100','','0','',600,'',1,'','1Min_LoadAvg','',0),(49,'c7d3c107a9598f2a1209ed0fccd2527c',0,0,32,'','100','','0','',600,'',1,'','5Min_LoadAvg','',0),(50,'8aa93b5eb1db402622935784e9bce232',0,0,32,'','100','','0','',600,'',1,'','15Min_LoadAvg','',0),(51,'569d9564a56dfe030df1fec5b596a6eb',0,0,32,'','0','','0','',600,'',2,'','Bytes_Read','',0),(52,'3c0fd1a188b64a662dfbfa985648397b',0,0,33,'','100','','0','',600,'',1,'','5min_cpu','',0),(829,'',6,567,4,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'mem_buffers',NULL,23),(830,'',7,568,5,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'mem_swap',NULL,23),(831,'',44,569,31,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'cpu',NULL,0),(832,'',42,570,30,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_used',NULL,0),(833,'',43,570,30,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_total',NULL,0),(834,'',40,571,29,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_free',NULL,0),(835,'',41,571,29,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_used',NULL,0),(836,'',12,572,9,NULL,'100000000000',NULL,'0',NULL,600,NULL,2,NULL,'traffic_in',NULL,0),(837,'',13,572,9,NULL,'100000000000',NULL,'0',NULL,600,NULL,2,NULL,'traffic_out',NULL,0),(838,'',8,573,6,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_free',NULL,0),(839,'',9,573,6,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_used',NULL,0),(840,'',10,574,7,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(841,'',14,575,10,NULL,'10000000',NULL,'0',NULL,600,NULL,2,NULL,'errors_in',NULL,0),(842,'',15,575,10,NULL,'10000000',NULL,'0',NULL,600,NULL,2,NULL,'discards_in',NULL,0),(843,'',16,575,10,NULL,'10000000',NULL,'0',NULL,600,NULL,2,NULL,'discards_out',NULL,0),(844,'',17,575,10,NULL,'10000000',NULL,'0',NULL,600,NULL,2,NULL,'errors_out',NULL,0),(845,'',12,576,9,NULL,'100000000000',NULL,'0',NULL,600,NULL,2,NULL,'traffic_in',NULL,0),(846,'',13,576,9,NULL,'100000000000',NULL,'0',NULL,600,NULL,2,NULL,'traffic_out',NULL,0),(847,'',29,577,20,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'users',NULL,0),(848,'',12,578,9,NULL,'100000000000',NULL,'0',NULL,600,NULL,2,NULL,'traffic_in',NULL,0),(849,'',13,578,9,NULL,'100000000000',NULL,'0',NULL,600,NULL,2,NULL,'traffic_out',NULL,0);
/*!40000 ALTER TABLE `data_template_rrd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_testbedims`
--

DROP TABLE IF EXISTS `data_testbedims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_testbedims` (
  `id_data` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(50) DEFAULT NULL,
  `value_info` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_data` (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_testbedims`
--

LOCK TABLES `data_testbedims` WRITE;
/*!40000 ALTER TABLE `data_testbedims` DISABLE KEYS */;
INSERT INTO `data_testbedims` VALUES (1,'number of testbeds to user','4'),(2,'day of asignation','1');
/*!40000 ALTER TABLE `data_testbedims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_links`
--

DROP TABLE IF EXISTS `external_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `enabled` char(2) DEFAULT 'on',
  `contentfile` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(20) NOT NULL DEFAULT '',
  `style` varchar(10) NOT NULL DEFAULT '',
  `extendedstyle` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains external links that are embedded into Cacti';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_links`
--

LOCK TABLES `external_links` WRITE;
/*!40000 ALTER TABLE `external_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flavor_openstack`
--

DROP TABLE IF EXISTS `flavor_openstack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flavor_openstack` (
  `id_flavor` varchar(50) DEFAULT NULL,
  `name_flavor` varchar(50) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `disk` int(11) DEFAULT NULL,
  `vcpus` int(11) DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `id_instance` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_flavor` (`id_flavor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flavor_openstack`
--

LOCK TABLES `flavor_openstack` WRITE;
/*!40000 ALTER TABLE `flavor_openstack` DISABLE KEYS */;
INSERT INTO `flavor_openstack` VALUES ('0d70fb10-b8bf-45c5-be4a-d8381880cf2c','minimet',16384,40,8,1,'33'),('0fd36db1-5057-4d8e-8da2-b4e647234151','1024201',1024,20,1,1,'33'),('1','m1.tiny',512,1,1,1,'33'),('2','m1.small',2048,20,1,1,'33'),('288a9c0d-9b61-4a99-a98c-04267996a72d','512202',512,20,2,1,'33'),('3','m1.medium',4096,40,2,1,'33'),('4','m1.large',8192,80,4,1,'33'),('42','m1.nano',64,1,1,1,'33'),('49f21699-6c1e-494d-a99c-77021a1fd6e2','testbed',2048,20,2,0,'33'),('5','m1.xlarge',16384,160,8,1,'33'),('54413c1b-a250-4654-850c-b06e7c395b5f','512201',512,20,1,1,'33'),('754283e0-e9a3-485d-9311-a8a488bea533','101010',10,10,10,1,'33'),('84','m1.micro',128,1,1,1,'33'),('8e4b65be-b1bf-4f80-a7ff-91503ce37ff7','odl',16384,99,8,1,'33'),('a9479fdf-c4e7-4815-b58c-d095af506594','6421',64,2,1,1,'33'),('b99683e0-1b3c-4936-9024-a9fcad457f2e','202020',20,20,20,1,'33'),('c1','cirros256',256,1,1,1,'33'),('d1','ds512M',512,5,1,1,'33'),('d2','ds1G',1024,10,1,1,'33'),('d3','ds2G',2048,10,2,1,'33'),('d4','ds4G',4096,20,4,1,'33');
/*!40000 ALTER TABLE `flavor_openstack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flotantIp_openstack`
--

DROP TABLE IF EXISTS `flotantIp_openstack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flotantIp_openstack` (
  `id_floatingip` varchar(50) DEFAULT NULL,
  `ip_float` varchar(50) DEFAULT NULL,
  `float_net` varchar(50) DEFAULT NULL,
  `ip_local` varchar(50) DEFAULT NULL,
  `id_port` varchar(50) DEFAULT NULL,
  `float_status` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_floatingip` (`id_floatingip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flotantIp_openstack`
--

LOCK TABLES `flotantIp_openstack` WRITE;
/*!40000 ALTER TABLE `flotantIp_openstack` DISABLE KEYS */;
INSERT INTO `flotantIp_openstack` VALUES ('24330dfb-6361-4b8f-9dbc-b04c64689ab5','192.168.40.186','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.1.17','c1f1046b-632a-4885-9653-f848351a3498','ACTIVE'),('3ee616c6-1db9-4e2f-84a2-5d97d1f5d4e9','192.168.40.101','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.1.11','786e4de7-dc03-4ef4-ad67-89116130454e','ACTIVE'),('3fd75f58-7410-4704-acda-c3728d53a59c','192.168.40.160','08cac388-5c54-4718-8403-57334d5ec8bd','','','DOWN'),('4242ba9a-5ad9-4605-b24e-5ba447f2b0c3','192.168.40.106','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.1.15','fae1a79a-af10-4f4a-aaa2-0e21acff2efd','ACTIVE'),('49c3ed4f-ec3f-4a09-a043-1decdc868b74','192.168.40.234','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.1.13','88492c58-f205-4ea8-ae5b-aa008c8956de','ACTIVE'),('4a15d214-a030-40b7-8f47-cdb00abf9e61','192.168.40.103','08cac388-5c54-4718-8403-57334d5ec8bd','','','DOWN'),('69ec7845-73bf-4ff4-89d1-1a0c24bf3ace','192.168.40.31','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.1.52','b51a3385-5ac7-49f5-9c24-6081a758889a','ACTIVE'),('6edb0afd-4963-4ad0-a783-d0294a2040c4','192.168.40.116','08cac388-5c54-4718-8403-57334d5ec8bd','','','DOWN'),('747b0a13-80bf-43c7-9fae-b0cf13444ec4','192.168.40.219','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.5.75','cd583e1f-e3fe-402a-90dd-8b92a6005f00','ACTIVE'),('795cdb11-2350-403c-8e22-c42917051740','192.168.40.42','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.1.12','1cb60794-7db5-4b46-a924-3d8cb1b5386d','ACTIVE'),('85804ba0-0a0e-4e57-9423-ac67d123bd41','192.168.40.172','08cac388-5c54-4718-8403-57334d5ec8bd','','','DOWN'),('95f6d37b-2a43-48c5-b6d0-3cf67a28045c','192.168.40.74','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.1.16','650a3f1d-e4fa-4089-9bb9-c70ae242d48a','ACTIVE'),('9e565fda-f42a-48cd-b744-92505f04e363','192.168.40.50','08cac388-5c54-4718-8403-57334d5ec8bd','','','DOWN'),('a663b8ab-627e-4c8a-876c-5eac37bc979b','192.168.40.220','08cac388-5c54-4718-8403-57334d5ec8bd','','','DOWN'),('a738112f-2528-4b24-a876-6d082ad37b78','192.168.40.173','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.2.11','0b56bd66-ef45-4860-be8f-cc5584fca92b','ACTIVE'),('afdbb18b-179d-4466-b9af-bf45868e2000','192.168.40.231','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.1.14','43181e6e-61b6-429e-b646-f5fa6d512145','ACTIVE'),('d16fba05-7cb0-4d17-98ea-8b63a5ab56b2','192.168.40.144','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.5.59','514a0302-ccb1-4d9b-956c-6dc99bf1fc05','ACTIVE'),('f98dc72b-d43c-48cd-9398-8dddc2e719d6','192.168.40.162','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.3.10','2aa67e94-6b4d-4d5f-b1e6-22fae59ecbb8','ACTIVE'),('fc8a6a1c-df51-4ab9-9762-b7891c93c916','192.168.40.91','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.2.10','6118d6fd-2a6f-4b34-87c5-80342dd12437','ACTIVE');
/*!40000 ALTER TABLE `flotantIp_openstack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_local`
--

DROP TABLE IF EXISTS `graph_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_local` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `snmp_query_id` mediumint(8) NOT NULL DEFAULT '0',
  `snmp_query_graph_id` mediumint(8) NOT NULL DEFAULT '0',
  `snmp_index` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `host_id` (`host_id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `snmp_query_id` (`snmp_query_id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`),
  KEY `snmp_index` (`snmp_index`(191))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Creates a relationship for each item in a custom graph.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_local`
--

LOCK TABLES `graph_local` WRITE;
/*!40000 ALTER TABLE `graph_local` DISABLE KEYS */;
/*!40000 ALTER TABLE `graph_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_template_input`
--

DROP TABLE IF EXISTS `graph_template_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_template_input` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `column_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1 COMMENT='Stores the names for graph item input groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_template_input`
--

LOCK TABLES `graph_template_input` WRITE;
/*!40000 ALTER TABLE `graph_template_input` DISABLE KEYS */;
INSERT INTO `graph_template_input` VALUES (1,'592cedd465877bc61ab549df688b0b2a',1,'Processes Data Source','','task_item_id'),(2,'1d51dbabb200fcea5c4b157129a75410',1,'Legend Color','','color_id'),(3,'8cb8ed3378abec21a1819ea52dfee6a3',2,'1 Minute Data Source','','task_item_id'),(4,'5dfcaf9fd771deb8c5430bce1562e371',2,'5 Minute Data Source','','task_item_id'),(5,'6f3cc610315ee58bc8e0b1f272466324',2,'15 Minute Data Source','','task_item_id'),(6,'b457a982bf46c6760e6ef5f5d06d41fb',3,'Logged in Users Data Source','','task_item_id'),(7,'bd4a57adf93c884815b25a8036b67f98',3,'Legend Color','','color_id'),(8,'6273c71cdb7ed4ac525cdbcf6180918c',4,'Free Data Source','','task_item_id'),(9,'5e62dbea1db699f1bda04c5863e7864d',4,'Swap Data Source','','task_item_id'),(10,'940beb0f0344e37f4c6cdfc17d2060bc',5,'Available Disk Space Data Source','','task_item_id'),(11,'7b0674dd447a9badf0d11bec688028a8',5,'Used Disk Space Data Source','','task_item_id'),(12,'433f328369f9569446ddc59555a63eb8',6,'Ping Host Data Source','','task_item_id'),(13,'a1a91c1514c65152d8cb73522ea9d4e6',6,'Legend Color','','color_id'),(14,'2fb4deb1448379b27ddc64e30e70dc42',6,'Legend Text','','text_format'),(15,'2dca37011521501b9c2b705d080db750',7,'Data Source [snmp_oid]','','task_item_id'),(16,'b8d8ade5f5f3dd7b12f8cc56bbb4083e',7,'Legend Color','','color_id'),(17,'ac2355b4895c37e14df827f969f31c12',7,'Legend Text','','text_format'),(18,'e9d4191277fdfd7d54171f153da57fb0',8,'Inbound Data Source','','task_item_id'),(19,'7b361722a11a03238ee8ab7ce44a1037',8,'Outbound Data Source','','task_item_id'),(20,'fa83cd3a3b4271b644cb6459ea8c35dc',9,'Discards In Data Source','','task_item_id'),(21,'7946e8ee1e38a65462b85e31a15e35e5',9,'Errors In Data Source','','task_item_id'),(22,'e5acdd5368137c408d56ecf55b0e077c',9,'Discards Out Data Source','','task_item_id'),(23,'a028e586e5fae667127c655fe0ac67f0',9,'Errors Out Data Source','','task_item_id'),(24,'00ae916640272f5aca54d73ae34c326b',10,'Unicast Packets Out Data Source','','task_item_id'),(25,'1bc1652f82488ebfb7242c65d2ffa9c7',10,'Unicast Packets In Data Source','','task_item_id'),(26,'e3177d0e56278de320db203f32fb803d',11,'Non-Unicast Packets In Data Source','','task_item_id'),(27,'4f20fba2839764707f1c3373648c5fef',11,'Non-Unicast Packets Out Data Source','','task_item_id'),(28,'2764a4f142ba9fd95872106a1b43541e',12,'Inbound Data Source','','task_item_id'),(29,'f73f7ddc1f4349356908122093dbfca2',12,'Outbound Data Source','','task_item_id'),(30,'562726cccdb67d5c6941e9e826ef4ef5',13,'Inbound Data Source','','task_item_id'),(31,'82426afec226f8189c8928e7f083f80f',13,'Outbound Data Source','','task_item_id'),(32,'69a23877302e7d142f254b208c58b596',14,'Inbound Data Source','','task_item_id'),(33,'f28013abf8e5813870df0f4111a5e695',14,'Outbound Data Source','','task_item_id'),(34,'8644b933b6a09dde6c32ff24655eeb9a',15,'Outbound Data Source','','task_item_id'),(35,'49c4b4800f3e638a6f6bb681919aea80',15,'Inbound Data Source','','task_item_id'),(36,'a29d473b1bbc98a1c032237622ea0837',16,'Multicast Packets Out Data Source','','task_item_id'),(37,'cc896ba8b616aa6a66a1ba1ce802e68e',16,'Multicast Packets In Data Source','','task_item_id'),(38,'a5c3743e175afaa77f6fa1f452f72c32',17,'Non-Unicast Packets In Data Source','','task_item_id'),(39,'30e4a03de4ed9d772a0bbe93830b8b73',17,'Non-Unicast Packets Out Data Source','','task_item_id'),(40,'d7cdb63500c576e0f9f354de42c6cf3a',18,'1 Minute Data Source','','task_item_id'),(41,'a23152f5ec02e7762ca27608c0d89f6c',18,'5 Minute Data Source','','task_item_id'),(42,'2cc5d1818da577fba15115aa18f64d85',18,'15 Minute Data Source','','task_item_id'),(43,'f45def7cad112b450667aa67262258cb',19,'Memory Free Data Source','','task_item_id'),(44,'f8c361a8c8b7ad80e8be03ba7ea5d0d6',19,'Memory Buffers Data Source','','task_item_id'),(45,'e0b395be8db4f7b938d16df7ae70065f',19,'Cache Memory Data Source','','task_item_id'),(46,'eb76da0d29135bac17f898c44ec279cb',19,'Data Source [mem_total]','','task_item_id'),(47,'37d09fb7ce88ecec914728bdb20027f3',20,'Logged in Users Data Source','','task_item_id'),(48,'699bd7eff7ba0c3520db3692103a053d',20,'Legend Color','','color_id'),(49,'df905e159d13a5abed8a8a7710468831',21,'Processes Data Source','','task_item_id'),(50,'8ca9e3c65c080dbf74a59338d64b0c14',21,'Legend Color','','color_id'),(51,'41f360e2e5c7038bd6502495fc42064e',22,'Data Source [ssCpuIdle]','','task_item_id'),(52,'059853124cd1649493af05c24594bc8d',22,'Data Source [ssCpuUser]','','task_item_id'),(53,'e280d373dd8d0aecd1b26781ed7a5977',22,'Data Source [ssCpuSystem]','','task_item_id'),(54,'e147ef9f5bc72229fe46508904d1e820',23,'Data Source [ssSysInterrupts]','','task_item_id'),(55,'d57f74ec1b11fc2037d197417c7f187d',24,'Data Source [ssSysContext]','','task_item_id'),(56,'a9ac261a6344d2ce06373174f2fb91ec',25,'Data Source [reads]','','task_item_id'),(57,'90cecf239de8d0c8dbff22529dbb03ae',25,'Data Source [writes]','','task_item_id'),(58,'50955e0bcf20cbeb8fcde95c1ad26522',26,'Data Source [bytesread]','','task_item_id'),(59,'4ce2aaa9d1550ac38072302ed101655d',26,'Data Source [byteswritten]','','task_item_id'),(60,'b33eb27833614056e06ee5952c3e0724',27,'Available Disk Space Data Source','','task_item_id'),(61,'ef8799e63ee00e8904bcc4228015784a',27,'Used Disk Space Data Source','','task_item_id'),(62,'86bd8819d830a81d64267761e1fd8ec4',28,'Total Disk Space Data Source','','task_item_id'),(63,'6c8967850102202de166951e4411d426',28,'Used Disk Space Data Source','','task_item_id'),(64,'bdad718851a52b82eca0a310b0238450',29,'CPU Utilization Data Source','','task_item_id'),(65,'e7b578e12eb8a82627557b955fd6ebd4',29,'Legend Color','','color_id'),(66,'65126c24617c23b64079ba555751da3f',30,'Data Source [Bytes_Read]','','task_item_id'),(67,'7ea0ac64ce0aba0c2b392cc6d7034515',30,'Data Source [Bytes_Written]','','task_item_id'),(68,'30d6aa3a34630bec2a143ac063a76907',31,'Data Source [15Min_LoadAvg]','','task_item_id'),(69,'456e79bda9a2e0f370f7b077d0ce9ad4',31,'Data Source [1Min_LoadAvg]','','task_item_id'),(70,'f930429ea76fd8a8ea9af5461f738357',31,'Data Source [5Min_LoadAvg]','','task_item_id'),(71,'e0ab1b0794eb8ad54e549c363b3b9409',32,'Data Source [Device_Writes]','','task_item_id'),(72,'3e0edbee4c2f152e69f0912e379d303f',32,'Data Source [Device_Reads]','','task_item_id'),(73,'bb9d83a02261583bc1f92d9e66ea705d',33,'CPU Usage Data Source','','task_item_id'),(74,'51196222ed37b44236d9958116028980',33,'Legend Color','','color_id');
/*!40000 ALTER TABLE `graph_template_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_template_input_defs`
--

DROP TABLE IF EXISTS `graph_template_input_defs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_template_input_defs` (
  `graph_template_input_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `graph_template_item_id` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`graph_template_input_id`,`graph_template_item_id`),
  KEY `graph_template_input_id` (`graph_template_input_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the relationship for what graph items are associated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_template_input_defs`
--

LOCK TABLES `graph_template_input_defs` WRITE;
/*!40000 ALTER TABLE `graph_template_input_defs` DISABLE KEYS */;
INSERT INTO `graph_template_input_defs` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(3,5),(3,6),(3,7),(3,8),(3,18),(4,9),(4,10),(4,11),(4,12),(4,19),(5,13),(5,14),(5,15),(5,16),(5,20),(6,21),(6,22),(6,23),(6,24),(6,25),(7,21),(8,26),(8,27),(8,28),(8,29),(9,30),(9,31),(9,32),(9,33),(10,38),(10,39),(10,40),(10,41),(10,47),(11,34),(11,35),(11,36),(11,37),(11,46),(12,48),(12,49),(12,50),(12,51),(12,52),(13,49),(14,49),(15,53),(15,54),(15,55),(15,56),(16,53),(17,53),(18,57),(18,58),(18,59),(18,60),(18,61),(19,62),(19,63),(19,64),(19,65),(19,66),(20,67),(20,68),(20,69),(20,70),(21,71),(21,72),(21,73),(21,74),(22,75),(22,76),(22,77),(22,78),(23,79),(23,80),(23,81),(23,82),(24,87),(24,88),(24,89),(24,90),(24,92),(25,83),(25,84),(25,85),(25,86),(25,91),(26,93),(26,94),(26,95),(26,96),(26,101),(27,97),(27,98),(27,99),(27,100),(27,102),(28,103),(28,104),(28,105),(28,106),(28,107),(29,108),(29,109),(29,110),(29,111),(29,112),(30,113),(30,114),(30,115),(30,116),(30,117),(31,118),(31,119),(31,120),(31,121),(31,122),(31,124),(31,125),(32,126),(32,127),(32,128),(32,129),(32,130),(32,131),(33,132),(33,133),(33,134),(33,135),(33,136),(33,137),(34,144),(34,145),(34,146),(34,147),(34,148),(34,149),(35,138),(35,139),(35,140),(35,141),(35,142),(35,143),(36,154),(36,155),(36,156),(36,157),(36,159),(37,150),(37,151),(37,152),(37,153),(37,158),(38,160),(38,161),(38,162),(38,163),(38,168),(39,164),(39,165),(39,166),(39,167),(39,169),(40,170),(40,171),(40,172),(40,173),(40,182),(41,174),(41,175),(41,176),(41,177),(41,183),(42,178),(42,179),(42,180),(42,181),(42,184),(43,197),(43,198),(43,199),(43,200),(43,204),(44,189),(44,190),(44,191),(44,192),(44,202),(45,193),(45,194),(45,195),(45,196),(45,203),(46,185),(46,186),(46,187),(46,188),(46,201),(47,205),(47,206),(47,207),(47,208),(47,209),(48,205),(49,210),(49,211),(49,212),(49,213),(49,214),(50,210),(51,223),(51,224),(51,225),(51,226),(52,219),(52,220),(52,221),(52,222),(53,215),(53,216),(53,217),(53,218),(54,231),(54,232),(54,233),(54,234),(54,235),(55,236),(55,237),(55,238),(55,239),(55,240),(56,241),(56,242),(56,243),(56,244),(56,249),(57,245),(57,246),(57,247),(57,248),(57,250),(58,251),(58,252),(58,253),(58,254),(58,259),(59,255),(59,256),(59,257),(59,258),(59,260),(60,265),(60,266),(60,267),(60,268),(60,274),(61,261),(61,262),(61,263),(61,264),(61,273),(62,275),(62,276),(62,277),(62,278),(62,283),(63,279),(63,280),(63,281),(63,282),(63,284),(64,285),(64,286),(64,287),(64,288),(64,289),(65,285),(66,290),(66,291),(66,292),(66,293),(66,298),(67,294),(67,295),(67,296),(67,297),(67,299),(68,308),(68,309),(68,310),(68,311),(68,314),(69,300),(69,301),(69,302),(69,303),(69,312),(70,304),(70,305),(70,306),(70,307),(70,313),(71,320),(71,321),(71,322),(71,323),(71,324),(71,326),(72,315),(72,316),(72,317),(72,318),(72,319),(72,325),(73,327),(73,328),(73,329),(73,330),(74,327);
/*!40000 ALTER TABLE `graph_template_input_defs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates`
--

DROP TABLE IF EXISTS `graph_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_templates` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` char(32) NOT NULL DEFAULT '',
  `name` char(255) NOT NULL DEFAULT '',
  `multiple` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `multiple_name` (`multiple`,`name`(171)),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COMMENT='Contains each graph template name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_templates`
--

LOCK TABLES `graph_templates` WRITE;
/*!40000 ALTER TABLE `graph_templates` DISABLE KEYS */;
INSERT INTO `graph_templates` VALUES (1,'9fe8b4da353689d376b99b2ea526cc6b','Unix - Processes',''),(2,'fe5edd777a76d48fc48c11aded5211ef','Unix - Load Average',''),(3,'63610139d44d52b195cc375636653ebd','Unix - Logged in Users',''),(4,'6992ed4df4b44f3d5595386b8298f0ec','Linux - Memory Usage',''),(5,'8e7c8a511652fe4a8e65c69f3d34779d','Unix - Available Disk Space',''),(6,'cf96dfb22b58e08bf101ca825377fa4b','Unix - Ping Latency',''),(7,'010b90500e1fc6a05abfd542940584d0','SNMP - Generic OID Template',''),(8,'5deb0d66c81262843dce5f3861be9966','Interface - Traffic (bits/sec)',''),(9,'06621cd4a9289417cadcb8f9b5cfba80','Interface - Errors/Discards',''),(10,'e0d1625a1f4776a5294583659d5cee15','Interface - Unicast Packets',''),(11,'10ca5530554da7b73dc69d291bf55d38','Interface - Non-Unicast Packets',''),(12,'df244b337547b434b486662c3c5c7472','Interface - Traffic (bytes/sec)',''),(13,'1742b2066384637022d178cc5072905a','Interface - Traffic (bits/sec, 95th Percentile)',''),(14,'13b47e10b2d5db45707d61851f69c52b','Interface - Traffic (bits/sec, Total Bandwidth)',''),(15,'8ad6790c22b693680e041f21d62537ac','Interface - Traffic (bytes/sec, Total Bandwidth)',''),(16,'d4dff05337bbf42c70cb6f73647d0d2a','Interface - Multicast Packets (Legacy)',''),(17,'ed3f434a9ebd2f23ab9bc173d608b3d7','Interface - Broadcast Packets (Legacy)',''),(18,'5107ec0206562e77d965ce6b852ef9d4','Net-SNMP - Load Average',''),(19,'be275639d5680e94c72c0ebb4e19056d','Net-SNMP - Memory Usage',''),(20,'e8462bbe094e4e9e814d4e681671ea82','Host MIB - Logged in Users',''),(21,'62205afbd4066e5c4700338841e3901e','Host MIB - Processes',''),(22,'eee71ec20dc7b44635ab185bbf924dc4','Net-SNMP - CPU Utilization',''),(23,'4d2bdea3c52db05896b0d9323076613d','Net-SNMP - Interrupts',''),(24,'a9a2ce15df48242361bea33f786de6ee','Net-SNMP - Context Switches',''),(25,'8eeff0b956240da5625c05d4cdbfbe7f','Net-SNMP - Combined SCSI Disk I/O',''),(26,'cf044e8a7a9d21229564265d2fa2d80c','Net-SNMP - Combined SCSI Disk Bytes',''),(27,'abb5e813c9f1e8cd6fc1e393092ef8cb','Net-SNMP - Available Disk Space',''),(28,'7489e44466abee8a7d8636cb2cb14a1a','Host MIB - Available Disk Space',''),(29,'c6bb62bedec4ab97f9db9fd780bd85a6','Host MIB - CPU Utilization',''),(30,'30cbb1cfd3602413d84757642b71666a','Net-SNMP - Device I/O - Bytes Read/Written',''),(31,'aa2984e39e8c1a1a417e4de3a06be822','Net-SNMP - Device I/O - Load Averages',''),(32,'9ac598676e55dfc08efe6e4ec7c51a0a','Net-SNMP - Device I/O - Reads/Writes',''),(33,'9a5e6d7781cc1bd6cf24f64dd6ffb423','Cisco - CPU Usage','');
/*!40000 ALTER TABLE `graph_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates_gprint`
--

DROP TABLE IF EXISTS `graph_templates_gprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_templates_gprint` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `gprint_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_templates_gprint`
--

LOCK TABLES `graph_templates_gprint` WRITE;
/*!40000 ALTER TABLE `graph_templates_gprint` DISABLE KEYS */;
INSERT INTO `graph_templates_gprint` VALUES (2,'e9c43831e54eca8069317a2ce8c6f751','Normal','%8.2lf %s'),(3,'19414480d6897c8731c7dc6c5310653e','Exact Numbers','%8.0lf'),(4,'304a778405392f878a6db435afffc1e9','Load Average','%4.2lf'),(5,'4e72328b57f5f2bb08a83a477b6cd10c','Percent','%8.1lf %%');
/*!40000 ALTER TABLE `graph_templates_gprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates_graph`
--

DROP TABLE IF EXISTS `graph_templates_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_templates_graph` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `local_graph_template_graph_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `local_graph_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `t_image_format_id` char(2) DEFAULT '',
  `image_format_id` tinyint(1) NOT NULL DEFAULT '0',
  `t_title` char(2) DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_cache` varchar(255) NOT NULL DEFAULT '',
  `t_height` char(2) DEFAULT '',
  `height` mediumint(8) NOT NULL DEFAULT '0',
  `t_width` char(2) DEFAULT '',
  `width` mediumint(8) NOT NULL DEFAULT '0',
  `t_upper_limit` char(2) DEFAULT '',
  `upper_limit` varchar(20) NOT NULL DEFAULT '0',
  `t_lower_limit` char(2) DEFAULT '',
  `lower_limit` varchar(20) NOT NULL DEFAULT '0',
  `t_vertical_label` char(2) DEFAULT '',
  `vertical_label` varchar(200) DEFAULT NULL,
  `t_slope_mode` char(2) DEFAULT '',
  `slope_mode` char(2) DEFAULT 'on',
  `t_auto_scale` char(2) DEFAULT '',
  `auto_scale` char(2) DEFAULT NULL,
  `t_auto_scale_opts` char(2) DEFAULT '',
  `auto_scale_opts` tinyint(1) NOT NULL DEFAULT '0',
  `t_auto_scale_log` char(2) DEFAULT '',
  `auto_scale_log` char(2) DEFAULT NULL,
  `t_scale_log_units` char(2) DEFAULT '',
  `scale_log_units` char(2) DEFAULT NULL,
  `t_auto_scale_rigid` char(2) DEFAULT '',
  `auto_scale_rigid` char(2) DEFAULT NULL,
  `t_auto_padding` char(2) DEFAULT '',
  `auto_padding` char(2) DEFAULT NULL,
  `t_base_value` char(2) DEFAULT '',
  `base_value` mediumint(8) NOT NULL DEFAULT '0',
  `t_grouping` char(2) DEFAULT '',
  `grouping` char(2) NOT NULL DEFAULT '',
  `t_unit_value` char(2) DEFAULT '',
  `unit_value` varchar(20) DEFAULT NULL,
  `t_unit_exponent_value` char(2) DEFAULT '',
  `unit_exponent_value` varchar(5) NOT NULL DEFAULT '',
  `t_alt_y_grid` char(2) DEFAULT '',
  `alt_y_grid` char(2) DEFAULT NULL,
  `t_right_axis` char(2) DEFAULT '',
  `right_axis` varchar(20) DEFAULT NULL,
  `t_right_axis_label` char(2) DEFAULT '',
  `right_axis_label` varchar(200) DEFAULT NULL,
  `t_right_axis_format` char(2) DEFAULT '',
  `right_axis_format` mediumint(8) DEFAULT NULL,
  `t_right_axis_formatter` char(2) DEFAULT '',
  `right_axis_formatter` varchar(10) DEFAULT NULL,
  `t_left_axis_formatter` char(2) DEFAULT '',
  `left_axis_formatter` varchar(10) DEFAULT NULL,
  `t_no_gridfit` char(2) DEFAULT '',
  `no_gridfit` char(2) DEFAULT NULL,
  `t_unit_length` char(2) DEFAULT '',
  `unit_length` varchar(10) DEFAULT NULL,
  `t_tab_width` char(2) DEFAULT '',
  `tab_width` varchar(20) DEFAULT '30',
  `t_dynamic_labels` char(2) DEFAULT '',
  `dynamic_labels` char(2) DEFAULT NULL,
  `t_force_rules_legend` char(2) DEFAULT '',
  `force_rules_legend` char(2) DEFAULT NULL,
  `t_legend_position` char(2) DEFAULT '',
  `legend_position` varchar(10) DEFAULT NULL,
  `t_legend_direction` char(2) DEFAULT '',
  `legend_direction` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `local_graph_id` (`local_graph_id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `title_cache` (`title_cache`(191))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COMMENT='Stores the actual graph data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_templates_graph`
--

LOCK TABLES `graph_templates_graph` WRITE;
/*!40000 ALTER TABLE `graph_templates_graph` DISABLE KEYS */;
INSERT INTO `graph_templates_graph` VALUES (1,0,0,1,'',1,'','|host_description| - Processes','','',200,'',700,'','100','','0','','processes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(2,0,0,2,'',1,'','|host_description| - Load Average','','',200,'',700,'','100','','0','','run que length','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','0','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(3,0,0,3,'',1,'','|host_description| - Logged in Users','','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(4,0,0,4,'',1,'','|host_description| - Memory Usage','','',200,'',700,'','100','','0','','kilobytes','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(5,0,0,5,'',1,'on','|host_description| - Available Disk Space','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(6,0,0,6,'',1,'','|host_description| - Ping Latency','','',200,'',700,'','100','','0','','milliseconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(7,0,0,7,'',1,'on','|host_description| -','','',200,'',700,'','100','','0','on','','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(8,0,0,8,'',1,'on','|host_description| - Traffic','','',200,'',700,'','100','','0','','bits per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(9,0,0,9,'',1,'on','|host_description| - Errors/Discards','','',200,'',700,'','100','','0','','errors/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(10,0,0,10,'',1,'on','|host_description| - Unicast Packets','','',200,'',700,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(11,0,0,11,'',1,'on','|host_description| - Non-Unicast Packets','','',200,'',700,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(12,0,0,12,'',1,'on','|host_description| - Traffic','','',200,'',700,'','100','','0','','bytes per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(13,0,0,13,'',1,'on','|host_description| - Traffic','','',200,'',700,'','100','','0','','bits per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(14,0,0,14,'',1,'on','|host_description| - Traffic','','',200,'',700,'','100','','0','','bits per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(15,0,0,15,'',1,'on','|host_description| - Traffic','','',200,'',700,'','100','','0','','bytes per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(16,0,0,16,'',1,'on','|host_description| - Multicast Packets','','',200,'',700,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(17,0,0,17,'',1,'on','|host_description| - Broadcast Packets','','',200,'',700,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(18,0,0,18,'',1,'','|host_description| - Load Average','','',200,'',700,'','100','','0','','run queue','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(19,0,0,19,'',1,'','|host_description| - Memory Usage','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(20,0,0,20,'',1,'','|host_description| - Logged in Users','','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(21,0,0,21,'',1,'','|host_description| - Processes','','',200,'',700,'','100','','0','','processes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(22,0,0,22,'',1,'','|host_description| - CPU Utilization','','',200,'',700,'','100','','0','','percent','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(23,0,0,23,'',1,'','|host_description| - Interrupts','','',200,'',700,'','100','','0','','Interrupts','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(24,0,0,24,'',1,'','|host_description| - Context Switches','','',200,'',700,'','100','','0','','Context Switches','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(25,0,0,25,'',1,'','|host_description| - Combined SCSI Disk I/O','','',200,'',700,'','100','','0','','operations/second','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(26,0,0,26,'',1,'','|host_description| - Combined SCSI Disk Bytes','','',200,'',700,'','100','','0','','bytes/second','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(27,0,0,27,'',1,'on','|host_description| - Hard Drive Space','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(28,0,0,28,'',1,'on','|host_description| - Available Disk Space','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(29,0,0,29,'',1,'on','|host_description| - CPU Utilization','','',200,'',700,'','110','','0','','percent','','on','','','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(30,0,0,30,'',1,'','|host_description| - Device I/O - Bytes Read/Written |query_diskIODevice|','','',200,'',700,'','0','','0','','Bytes Read/Written','','on','','on','',2,'','','','','','','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(31,0,0,31,'',1,'','|host_description| - Device I/O - Load Averages - |query_diskIODevice|','','',200,'',700,'','100','','0','','Load Average','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(32,0,0,32,'',1,'','|host_description| - Device I/O - Reads/Writes |query_diskIODevice|','','',200,'',700,'','0','','0','','Reads/Writes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(33,0,0,33,'',1,'','|host_description| - CPU Usage','','',200,'',700,'','100','','0','','percent','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0');
/*!40000 ALTER TABLE `graph_templates_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates_item`
--

DROP TABLE IF EXISTS `graph_templates_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_templates_item` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `local_graph_template_item_id` int(12) unsigned NOT NULL DEFAULT '0',
  `local_graph_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `task_item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `color_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `alpha` char(2) DEFAULT 'FF',
  `graph_type_id` tinyint(3) NOT NULL DEFAULT '0',
  `line_width` decimal(4,2) DEFAULT '0.00',
  `dashes` varchar(20) DEFAULT NULL,
  `dash_offset` mediumint(4) DEFAULT NULL,
  `cdef_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vdef_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `shift` char(2) DEFAULT NULL,
  `consolidation_function_id` tinyint(2) NOT NULL DEFAULT '0',
  `textalign` varchar(10) DEFAULT NULL,
  `text_format` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `hard_return` char(2) DEFAULT NULL,
  `gprint_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `local_graph_id_sequence` (`local_graph_id`,`sequence`),
  KEY `task_item_id` (`task_item_id`),
  KEY `lgi_gti` (`local_graph_id`,`graph_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=latin1 COMMENT='Stores the actual graph item data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_templates_item`
--

LOCK TABLES `graph_templates_item` WRITE;
/*!40000 ALTER TABLE `graph_templates_item` DISABLE KEYS */;
INSERT INTO `graph_templates_item` VALUES (1,'ba00ecd28b9774348322ff70a96f2826',0,0,1,1,48,'7F',7,0.00,'',0,0,0,'',1,'','Running Processes<>','','',2,1),(2,'304244ca63d5b09e62a94c8ec6fbda8d',0,0,1,1,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(3,'da1ba71a93d2ed4a2a00d54592b14157',0,0,1,1,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(4,'5b4f05b04f704a24c663998293fa8848',0,0,1,1,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(5,'93ad2f2803b5edace85d86896620b9da',0,0,2,2,15,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute Average','','',2,1),(6,'fa1570f2b111da3555e165c7873a376b',0,0,2,2,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,2),(7,'16675723e5e9885489c2ccbbcee82ef0',0,0,2,2,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,3),(8,'31aab74f1dc7d1bf540da8cc19203944',0,0,2,2,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,4),(9,'bbdfa13adc00398eed132b1ccb4337d2',0,0,2,3,8,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute Average','','',2,5),(10,'0f5158874901e0ecfba9b4dc9a4f3afd',0,0,2,3,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,6),(11,'e8425ef97ba1b5d98a84bda5ea42c0e8',0,0,2,3,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,7),(12,'760f184ddf2c4f10d26f1b1eec68f579',0,0,2,3,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,8),(13,'9cf6ed48a6a54b9644a1de8c9929bd4e',0,0,2,4,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute Average','','',2,9),(14,'0dd3ea1600ef0749b7895f349de650a0',0,0,2,4,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,10),(15,'15ac9644211ac78240154a0eb3cd8b29',0,0,2,4,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,11),(16,'c45aeff75d805220a7798f46324381f6',0,0,2,4,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,12),(17,'fa1bc4eff128c4da70f5247d55b8a444',0,0,2,0,1,'FF',4,0.00,'',0,12,0,'',1,'','','','on',2,13),(18,'cf0848f7482b56ea746453f90881d05e',0,0,2,2,15,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,14),(19,'ebb3b6d41faaf7338fd640b8ff720cb3',0,0,2,3,8,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(20,'f995fe7d096e2ef4b33608328ebc0843',0,0,2,4,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,16),(21,'5c94ac24bc0d6d2712cc028fa7d4c7d2',0,0,3,5,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(22,'8bc7f905526f62df7d5c2d8c27c143c1',0,0,3,5,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(23,'cd074cd2b920aab70d480c020276d45b',0,0,3,5,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(24,'415630f25f5384ba0c82adbdb05fe98b',0,0,3,5,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(25,'c55914240f7e1d4f881ea598d4de9196',0,0,3,5,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(26,'5fa7c2317f19440b757ab2ea1cae6abc',0,0,4,6,41,'FF',7,0.00,'',0,14,0,'',1,'','Free','','',2,9),(27,'b1d18060bfd3f68e812c508ff4ac94ed',0,0,4,6,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,10),(28,'780b6f0850aaf9431d1c246c55143061',0,0,4,6,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,11),(29,'2d54a7e7bb45e6c52d97a09e24b7fba7',0,0,4,6,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,12),(30,'40206367a3c192b836539f49801a0b15',0,0,4,7,30,'FF',8,0.00,'',0,14,0,'',1,'','Swap','','',2,13),(31,'7ee72e2bb3722d4f8a7f9c564e0dd0d0',0,0,4,7,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,14),(32,'c8af33b949e8f47133ee25e63c91d4d0',0,0,4,7,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,15),(33,'568128a16723d1195ce6a234d353ce00',0,0,4,7,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,16),(34,'6ca2161c37b0118786dbdb46ad767e5d',0,0,5,9,48,'7F',7,0.00,'',0,14,0,'',1,'','Used','','',2,1),(35,'8ef3e7fb7ce962183f489725939ea40f',0,0,5,9,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,2),(36,'3b13eb2e542fe006c9bf86947a6854fa',0,0,5,9,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,3),(37,'a751838f87068e073b95be9555c57bde',0,0,5,9,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,4),(38,'5d6dff9c14c71dc1ebf83e87f1c25695',0,0,5,8,20,'7F',8,0.00,'',0,14,0,'',1,'','Available','','',2,5),(39,'b27cb9a158187d29d17abddc6fdf0f15',0,0,5,8,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(40,'6c0555013bb9b964e51d22f108dae9b0',0,0,5,8,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(41,'42ce58ec17ef5199145fbf9c6ee39869',0,0,5,8,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(42,'9bdff98f2394f666deea028cbca685f3',0,0,5,0,1,'FF',5,0.00,'',0,15,0,'',1,'','Total','','',2,9),(43,'fb831fefcf602bc31d9d24e8e456c2e6',0,0,5,0,0,'FF',9,0.00,'',0,15,0,'',4,'','Current:','','',2,10),(44,'5a958d56785a606c08200ef8dbf8deef',0,0,5,0,0,'FF',9,0.00,'',0,15,0,'',1,'','Average:','','',2,11),(45,'5ce67a658cec37f526dc84ac9e08d6e7',0,0,5,0,0,'FF',9,0.00,'',0,15,0,'',3,'','Maximum:','','on',2,12),(46,'ac0ffc9f0f2cb7f8c6cb9eb8fa73b390',0,0,5,9,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(47,'d9fc8b516374885c6c45153803e5b90a',0,0,5,8,20,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(48,'8b693a3303345abdc5ad9798895bc6c4',0,0,6,10,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,1),(49,'80e0aa956f50c261e5143273da58b8a3',0,0,6,10,25,'7F',7,0.00,'',0,0,0,'',1,'','','','',2,2),(50,'48fdcae893a7b7496e1a61efc3453599',0,0,6,10,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(51,'22f43e5fa20f2716666ba9ed9a7d1727',0,0,6,10,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(52,'3e86d497bcded7af7ab8408e4908e0d8',0,0,6,10,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(53,'41316670b1a36171de2bda91a0cc2364',0,0,7,11,98,'FF',7,0.00,'',0,0,0,'',1,'','','','',2,1),(54,'c9e8cbdca0215b434c902e68755903ea',0,0,7,11,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(55,'dab91d7093e720841393feea5bdcba85',0,0,7,11,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(56,'03e5bd2151fea3c90843eb1130b84458',0,0,7,11,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(57,'67b03eadc8e1d948a23326b7c6e225aa',0,0,8,12,22,'FF',4,0.00,'',0,2,0,'',3,'','','','',2,1),(58,'0470b2427dbfadb6b8346e10a71268fa',0,0,8,12,22,'7F',7,0.00,'',0,2,0,'',1,'','Inbound','','',2,2),(59,'84a5fe0db518550266309823f994ce9c',0,0,8,12,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,3),(60,'2f222f28084085cd06a1f46e4449c793',0,0,8,12,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,4),(61,'55acbcc33f46ee6d754e8e81d1b54808',0,0,8,12,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','on',2,5),(62,'d71b8ba294f057e0f135cc4c644e6b0d',0,0,8,13,20,'FF',4,0.00,'',0,2,0,'',3,'','','','',2,6),(63,'fdaf2321fc890e355711c2bffc07d036',0,0,8,13,20,'7F',7,0.00,'',0,2,0,'',1,'','Outbound','','',2,7),(64,'768318f42819217ed81196d2179d3e1b',0,0,8,13,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,8),(65,'cb3aa6256dcb3acd50d4517b77a1a5c3',0,0,8,13,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,9),(66,'671e989be7cbf12c623b4e79d91c7bed',0,0,8,13,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','on',2,10),(67,'7e04a041721df1f8828381a9ea2f2154',0,0,9,15,31,'FF',4,0.00,'',0,0,0,'',1,'','Discards In','','',2,1),(68,'afc8bca6b1b3030a6d71818272336c6c',0,0,9,15,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(69,'6ac169785f5aeaf1cc5cdfd38dfcfb6c',0,0,9,15,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(70,'178c0a0ce001d36a663ff6f213c07505',0,0,9,15,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(71,'8e3268c0abde7550616bff719f10ee2f',0,0,9,14,48,'FF',4,0.00,'',0,0,0,'',1,'','Errors In','','',2,5),(72,'18891392b149de63b62c4258a68d75f8',0,0,9,14,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(73,'dfc9d23de0182c9967ae3dabdfa55a16',0,0,9,14,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(74,'c47ba64e2e5ea8bf84aceec644513176',0,0,9,14,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(75,'617d10dff9bbc3edd9d733d9c254da76',0,0,9,16,18,'FF',4,0.00,'',0,0,0,'',1,'','Discards Out','','',2,9),(76,'9269a66502c34d00ac3c8b1fcc329ac6',0,0,9,16,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,10),(77,'d45deed7e1ad8350f3b46b537ae0a933',0,0,9,16,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,11),(78,'2f64cf47dc156e8c800ae03c3b893e3c',0,0,9,16,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,12),(79,'57434bef8cb21283c1a73f055b0ada19',0,0,9,17,89,'FF',4,0.00,'',0,0,0,'',1,'','Errors Out','','',2,13),(80,'660a1b9365ccbba356fd142faaec9f04',0,0,9,17,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,14),(81,'28c5297bdaedcca29acf245ef4bbed9e',0,0,9,17,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,15),(82,'99098604fd0c78fd7dabac8f40f1fb29',0,0,9,17,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,16),(83,'d4e5f253f01c3ea77182c5a46418fc44',0,0,10,18,25,'7F',7,0.00,'',0,0,0,'',1,'','Unicast Packets In','','',2,1),(84,'526a96add143da021c5f00d8764a6c12',0,0,10,18,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(85,'81eeb46f451212f00fd7caee42a81c0b',0,0,10,18,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(86,'089e4d1c3faeb00fd5dcc9622b06d656',0,0,10,18,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(87,'9d052e7d632c479737fbfaced0821f79',0,0,10,19,71,'7F',7,0.00,'',0,0,0,'',1,'','Unicast Packets Out','','',2,5),(88,'9b9fa6268571b6a04fa4411d8e08c730',0,0,10,19,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(89,'8e8f2fbeb624029cbda1d2a6ddd991ba',0,0,10,19,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(90,'c76495beb1ed01f0799838eb8a893124',0,0,10,19,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(91,'042d90f1a390c15509ae208bd97aa885',0,0,10,18,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(92,'3641f6b8e83ea26e73d41ceccf38b131',0,0,10,19,71,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,10),(93,'fe66cb973966d22250de073405664200',0,0,11,21,25,'7F',7,0.00,'',0,0,0,'',1,'','Non-Unicast Packets In','','',2,1),(94,'1ba3fc3466ad32fdd2669cac6cad6faa',0,0,11,21,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(95,'f810154d3a934c723c21659e66199cdf',0,0,11,21,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(96,'98a161df359b01304346657ff1a9d787',0,0,11,21,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(97,'d5e55eaf617ad1f0516f6343b3f07c5e',0,0,11,20,71,'7F',7,0.00,'',0,0,0,'',1,'','Non-Unicast Packets Out','','',2,5),(98,'9fde6b8c84089b9f9044e681162e7567',0,0,11,20,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(99,'9a3510727c3d9fa7e2e7a015783a99b3',0,0,11,20,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(100,'451afd23f2cb59ab9b975fd6e2735815',0,0,11,20,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(101,'c72c76b0c6d9066a4feea17ca032b3cd',0,0,11,21,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(102,'8b281ba233f7a382f8d9094f2019ec94',0,0,11,20,71,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,10),(103,'b276e28b10447b11ee289f78e0c1ed82',0,0,12,12,22,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,1),(104,'de3eefd6d6c58afabdabcaf6c0168378',0,0,12,12,22,'7F',7,0.00,'',0,0,0,'',1,'','Inbound','','',2,2),(105,'1a80fa108f5c46eecb03090c65bc9a12',0,0,12,12,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(106,'fe458892e7faa9d232e343d911e845f3',0,0,12,12,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(107,'175c0a68689bebc38aad2fbc271047b3',0,0,12,12,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(108,'f9da7d4c2da9636f2f3e37f4781954db',0,0,12,13,20,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,6),(109,'1bf2283106510491ddf3b9c1376c0b31',0,0,12,13,20,'7F',4,0.00,'',0,0,0,'',1,'','Outbound','','',2,7),(110,'c5202f1690ffe45600c0d31a4a804f67',0,0,12,13,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,8),(111,'eb9794e3fdafc2b74f0819269569ed40',0,0,12,13,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,9),(112,'6bcedd61e3ccf7518ca431940c93c439',0,0,12,13,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,10),(113,'11d87688979b97cf026809f75cef30be',0,0,13,12,22,'FF',4,1.00,'',0,2,0,'',3,'','','','',2,1),(114,'918e6e7d41bb4bae0ea2937b461742a4',0,0,13,12,22,'7F',7,0.00,'',0,2,0,'',1,'','Inbound','','',2,2),(115,'f19fbd06c989ea85acd6b4f926e4a456',0,0,13,12,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,3),(116,'fc150a15e20c57e11e8d05feca557ef9',0,0,13,12,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,4),(117,'ccbd86e03ccf07483b4d29e63612fb18',0,0,13,12,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','on',2,5),(118,'75796e3f885739c2d7229fd25babf30d',0,0,13,13,20,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,6),(119,'964c5c30cd05eaf5a49c0377d173de86',0,0,13,13,20,'7F',7,0.00,'',0,2,0,'',1,'','Outbound','','',2,7),(120,'b1a6fb775cf62e79e1c4bc4933c7e4ce',0,0,13,13,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,8),(121,'721038182a872ab266b5cf1bf7f7755c',0,0,13,13,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,9),(122,'2302f80c2c70b897d12182a1fc11ecd6',0,0,13,13,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','on',2,10),(123,'4ffc7af8533d103748316752b70f8e3c',0,0,13,0,0,'FF',1,0.00,'',0,0,0,'',1,'','','','on',2,11),(124,'64527c4b6eeeaf627acc5117ff2180fd',0,0,13,13,9,'FF',2,0.00,'',0,0,0,'',1,'','95th Percentile','|95:bits:0:max:2|','',2,12),(125,'d5bbcbdbf83ae858862611ac6de8fc62',0,0,13,13,0,'FF',1,0.00,'',0,0,0,'',1,'','(|95:bits:6:max:2| mbit in+out)','','',2,13),(126,'9ee6db2f910144bc95760876d0a16a62',0,0,14,12,22,'FF',4,1.00,'',0,2,0,'',3,'','','','',2,1),(127,'1995d8c23e7d8e1efa2b2c55daf3c5a7',0,0,14,12,22,'7F',7,0.00,'',0,2,0,'',1,'','Inbound','','',2,2),(128,'55083351cd728b82cc4dde68eb935700',0,0,14,12,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,3),(129,'54782f71929e7d1734ed5ad4b8dda50d',0,0,14,12,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,4),(130,'88d3094d5dc2164cbf2f974aeb92f051',0,0,14,12,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','',2,5),(131,'5b43e4102600ad75379c5afd235099c4',0,0,14,12,0,'FF',1,0.00,'',0,0,0,'',1,'','Total In:  |sum:auto:current:2:auto|','','on',2,6),(132,'c4886a8552ee60c6559de8ab16c2dcf2',0,0,14,13,20,'FF',4,1.00,'',0,2,0,'',3,'','','','',2,7),(133,'4a381a8e87d4db1ac99cf8d9078266d3',0,0,14,13,20,'7F',7,0.00,'',0,2,0,'',1,'','Outbound','','',2,8),(134,'5bff63207c7bf076d76ff3036b5dad54',0,0,14,13,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,9),(135,'979fff9d691ca35e3f4b3383d9cae43f',0,0,14,13,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,10),(136,'0e715933830112c23c15f7e3463f77b6',0,0,14,13,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','',2,11),(137,'db7c15d253ca666601b3296f2574edc9',0,0,14,13,0,'FF',1,0.00,'',0,0,0,'',1,'','Total Out: |sum:auto:current:2:auto|','','on',2,12),(138,'3baa47b136f8c36ccea69196b0285a6c',0,0,15,12,22,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,1),(139,'3ff8dba1ca6279692b3fcabed0bc2631',0,0,15,12,22,'7F',7,0.00,'',0,0,0,'',1,'','Inbound','','',2,2),(140,'66bfdb701c8eeadffe55e926d6e77e71',0,0,15,12,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(141,'777aa88fb0a79b60d081e0e3759f1cf7',0,0,15,12,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(142,'de265acbbfa99eb4b3e9f7e90c7feeda',0,0,15,12,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','',2,5),(143,'76ae747365553a02313a2d8a0dd55c8a',0,0,15,12,0,'FF',1,0.00,'',0,0,0,'',1,'','Total In:  |sum:auto:current:2:auto|','','on',2,6),(144,'43a2cef12147952c703fc0fc473dec7a',0,0,15,13,20,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,7),(145,'cf8c9f69878f0f595d583eac109a9be1',0,0,15,13,20,'7F',7,0.00,'',0,0,0,'',1,'','Outbound','','',2,8),(146,'54e3971b3dd751dd2509f62721c12b41',0,0,15,13,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,9),(147,'6824d29c3f13fe1e849f1dbb8377d3f1',0,0,15,13,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,10),(148,'fdaec5b9227522c758ad55882c483a83',0,0,15,13,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','',2,11),(149,'d6041d14f9c8fb9b7ddcf3556f763c03',0,0,15,13,0,'FF',1,0.00,'',0,0,0,'',1,'','Total Out: |sum:auto:current:2:auto|','','on',2,12),(150,'34a594c6b419427329b10f73f40e85f7',0,0,16,18,25,'7F',7,0.00,'',0,0,0,'',1,'','Multicast Packets In','','',2,1),(151,'1540d561f6ab4b55ac810661fb0c93ee',0,0,16,18,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(152,'e9e41de3845454688f838662e4c34aa7',0,0,16,18,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(153,'350ebb1cd31fb46d9997bc21a00d36b1',0,0,16,18,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(154,'16f958e2b047113d38c7550c76ef04c8',0,0,16,19,71,'7F',7,0.00,'',0,0,0,'',1,'','Multicast Packets Out','','',2,5),(155,'a393430c1db0d9da48dca3098022cf50',0,0,16,19,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(156,'3f73834149d86814a4dbbfa4052fdb14',0,0,16,19,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(157,'07164e2d5ebe685b622a97250dab9cc2',0,0,16,19,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(158,'2a19f1c71b1ff8edea69af3f1825cec0',0,0,16,18,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(159,'e9625f33db3635e39e206334da9f99ef',0,0,16,19,71,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,10),(160,'ea54bfaa4bad2b6862165840418f5fd4',0,0,17,21,25,'7F',7,0.00,'',0,0,0,'',1,'','Broadcast Packets In','','',2,1),(161,'a2508ab1f57dff7b143433ab81ff7a3e',0,0,17,21,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(162,'cab434df67b94a93728ab794b1d0f6fb',0,0,17,21,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(163,'29d51e734ad14bcdb3a9b7a640f2c4a3',0,0,17,21,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(164,'725d97e3666c2417241ca7bb67a8c902',0,0,17,20,71,'7F',7,0.00,'',0,0,0,'',1,'','Broadcast Packets Out','','',2,5),(165,'b01f45a155e10f49d640d13b50aa61a5',0,0,17,20,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(166,'eb37825efbb281484cdb1e896764b73a',0,0,17,20,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(167,'b18b67ef2779d5ff43843cac220d9bb9',0,0,17,20,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(168,'56ea543140aa516299ba202b313fc822',0,0,17,21,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(169,'ce17bd1ed1efaa2f7eb2b1fef7354d8d',0,0,17,20,71,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,10),(170,'d77d2050be357ab067666a9485426e6b',0,0,18,22,15,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute Average','','',2,1),(171,'664b23027b847964b9cf92e16538ee66',0,0,18,22,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,2),(172,'2832fe3cb648e0c7a0905d04c39e7093',0,0,18,22,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,3),(173,'12b7126f3ced07574b1e5f8bf3f1b4bc',0,0,18,22,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,4),(174,'8580230d31d2851ec667c296a665cbf9',0,0,18,23,8,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute Average','','',2,5),(175,'48099998fd7cddeab6685b6e3bf07b1a',0,0,18,23,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,6),(176,'af5b1e90e9ad3e2a5ce0e0cd58bdb76b',0,0,18,23,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,7),(177,'28953315320fc3bea62f8a9a094825e3',0,0,18,23,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,8),(178,'2ec10edf4bfaa866b7efd544d4c3f446',0,0,18,24,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute Average','','',2,9),(179,'efc200ea9c770725ffed0f5b75976035',0,0,18,24,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,10),(180,'b81c4fba7c56fb91f722b41c806d3fe8',0,0,18,24,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,11),(181,'520a2b1fed006bf79bd81c30b7478781',0,0,18,24,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,12),(182,'f1e343e458e95676cb4fa98ccfa89be2',0,0,18,22,15,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(183,'401fc06aff694aef1333b2aeaafc598e',0,0,18,23,8,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(184,'96698209a56e2765d6b31c6a15cef66b',0,0,18,24,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(185,'5dcf25ffb22516593f0989c350e23976',0,0,19,28,142,'7F',7,1.00,'',0,14,0,'',1,'','Memory Total','','',2,1),(186,'4813c1df025417d45dd0fb5062d4f095',0,0,19,28,0,'FF',9,1.00,'',0,14,0,'',4,'','Current:','','',2,2),(187,'749d182a551ada29c6db6992cd791dbd',0,0,19,28,0,'FF',9,1.00,'',0,14,0,'',1,'','Average:','','',2,3),(188,'68beff095c894bf5336982459f8763e3',0,0,19,28,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(189,'95d6e4e5110b456f34324f7941d08318',0,0,19,25,35,'7F',7,0.00,'',0,14,0,'',1,'','Memory Buffers','','',2,5),(190,'0c631bfc0785a9cca68489ea87a6c3da',0,0,19,25,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(191,'3468579d3b671dfb788696df7dcc1ec9',0,0,19,25,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(192,'c3ddfdaa65449f99b7f1a735307f9abe',0,0,19,25,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(193,'8a1b44ab97d3b56207d0e9e77a035d25',0,0,19,27,30,'7F',8,0.00,'',0,14,0,'',1,'','Cache Memory','','',2,9),(194,'6db3f439e9764941ff43fbaae348f5dc',0,0,19,27,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,10),(195,'cc9b2fe7acf0820caa61c1519193f65e',0,0,19,27,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,11),(196,'9eea140bdfeaa40d50c5cdcd1f23f72d',0,0,19,27,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,12),(197,'7517a40d478e28ed88ba2b2a65e16b57',0,0,19,26,52,'7F',8,0.00,'',0,14,0,'',1,'','Memory Free','','',2,13),(198,'df0c8b353d26c334cb909dc6243957c5',0,0,19,26,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,14),(199,'c41a4cf6fefaf756a24f0a9510580724',0,0,19,26,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,15),(200,'9efa8f01c6ed11364a21710ff170f422',0,0,19,26,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,16),(201,'2cc00941cd1690789f952f5c9976db1a',0,0,19,28,143,'FF',4,1.00,'',0,14,0,'',3,'','','','',2,17),(202,'479deb05c1b4bc8491ddca5cdb4801a4',0,0,19,25,35,'FF',4,1.00,'',0,14,0,'',3,'','','','',2,18),(203,'876c3723c5dbd6654d13259e5976dfd0',0,0,19,27,30,'FF',20,1.00,'',0,14,0,'',3,'','','','',2,19),(204,'d35384da14f3df0baf3f276a9140661a',0,0,19,26,52,'FF',20,1.00,'',0,14,0,'',3,'','','','',2,20),(205,'38f6891b0db92aa8950b4ce7ae902741',0,0,20,29,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(206,'af13152956a20aa894ef4a4067b88f63',0,0,20,29,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(207,'1b2388bbede4459930c57dc93645284e',0,0,20,29,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(208,'6407dc226db1d03be9730f4d6f3eeccf',0,0,20,29,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(209,'26b0e9922e1e4c1961b9120e90881985',0,0,20,29,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(210,'fca6a530c8f37476b9004a90b42ee988',0,0,21,30,48,'7F',7,0.00,'',0,0,0,'',1,'','Running Processes','','',2,1),(211,'5acebbde3dc65e02f8fda03955852fbe',0,0,21,30,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(212,'311079ffffac75efaab2837df8123122',0,0,21,30,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(213,'724d27007ebf31016cfa5530fee1b867',0,0,21,30,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','',3,4),(214,'aa2be4ba323b0ded621b3e34737b26a1',0,0,21,30,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(215,'53c9b0999e402a4a7cbeface3ea84479',0,0,22,31,48,'7F',7,0.00,'',0,0,0,'',1,'','System:','','',2,1),(216,'23ce25454b19d116c2665f36276178cd',0,0,22,31,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,2),(217,'8f8f596cda649b141e6fb33753328441',0,0,22,31,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,3),(218,'f64a0489181fca04c3ab9756d599cd2a',0,0,22,31,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,4),(219,'444155b1d39f0414b8f7536d05725f10',0,0,22,32,6,'7F',8,0.00,'',0,0,0,'',1,'','User:','','',2,5),(220,'ff1636dec0cf9582770ebc8d41f8ad92',0,0,22,32,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,6),(221,'a9814713bdd7982063ede15294e44353',0,0,22,32,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,7),(222,'b74446b41339040c50769c528f140afc',0,0,22,32,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,8),(223,'7a8fd8ba66b859e766b4b5f4f634dbce',0,0,22,33,112,'7F',8,0.00,'',0,0,0,'',1,'','Idle:','','',2,9),(224,'073b77aec68c56fb703c95e4999a99a6',0,0,22,33,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,10),(225,'3c0f7af8872c51acbf79b71b79f0bad5',0,0,22,33,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,11),(226,'ca50f081abe0f8718977f2982f2209f1',0,0,22,33,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,12),(227,'709a9acaaab34bc6976eb8499f1828ce',0,0,22,0,69,'7F',8,0.00,'',0,16,0,'',1,'','IO Wait:','','',2,13),(228,'7d4a7f4d52491c0b25dcbbe2222d0f0d',0,0,22,0,0,'FF',9,0.00,'',0,16,0,'',4,'','Current:','','',5,14),(229,'75390a70fc7589c23295d9ed45aa7614',0,0,22,0,0,'FF',9,0.00,'',0,16,0,'',1,'','Average:','','',5,15),(230,'ee981253aa7b49d9761a80ec0ad1541a',0,0,22,0,0,'FF',9,0.00,'',0,16,0,'',3,'','Maximum:','','on',5,16),(231,'857bb546882bc5049e673c4188cdda8b',0,0,23,34,46,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,1),(232,'e7261d3093976dbe63de4937296a9a96',0,0,23,34,46,'7F',7,0.00,'',0,0,0,'',1,'','Interrupts:','','',2,2),(233,'959854c407cfa371240c0744d44618a6',0,0,23,34,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,3),(234,'1fbdf8aef7acfbc90ba7d24b6644e432',0,0,23,34,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(235,'2df153e12b5db6ae3dea51df70f73651',0,0,23,34,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(236,'0b502e0b5d0228d17d3c30f5a04c7083',0,0,24,35,65,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,1),(237,'64c92d07fe3877e99dcc3b570ee90966',0,0,24,35,65,'7F',7,0.00,'',0,0,0,'',1,'','Context Switches:','','',2,2),(238,'72c6b8ab332e09e2894f18bcf5ba92fe',0,0,24,35,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,3),(239,'37f9956018cb4615de77aec4695fbb0c',0,0,24,35,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(240,'1d7fe63be7b044229b79b6203298e506',0,0,24,35,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(241,'c6034b9950f1eedb9623215773ac4c0e',0,0,25,36,67,'7F',7,0.00,'',0,17,0,'',1,'','Reads:','','',2,1),(242,'fc50e9a07b1662f659e87807228fcd50',0,0,25,36,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',3,2),(243,'fe48830387c7065ec8411d7509d4d387',0,0,25,36,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',3,3),(244,'f003813991610aa5f6889a2e5a526cca',0,0,25,36,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',3,4),(245,'822b07e6f130a6ea9c4e56b745d456bb',0,0,25,37,41,'7F',8,0.00,'',0,17,0,'',1,'','Writes:','','',2,5),(246,'9cca58312cb9a95693e7e2a2d36de347',0,0,25,37,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',3,6),(247,'b51a340cee28a09462ff313592a69a72',0,0,25,37,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',3,7),(248,'818864becb9866cf3a2121c5d4478d80',0,0,25,37,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',3,8),(249,'4a1e068ffc8c910ee9c5307d779c2db8',0,0,25,36,67,'FF',4,1.00,'',0,17,0,'',3,'','','','',2,9),(250,'f066a69f356fc13e266d4c7b737f8c0b',0,0,25,37,41,'FF',20,1.00,'',0,17,0,'',3,'','','','',2,10),(251,'46d2518edca9b8c584eb56da6e0d8591',0,0,26,38,60,'7F',7,0.00,'',0,17,0,'',1,'','Bytes Read:','','',2,1),(252,'278e15e34511ac2901776a5b2f57d86a',0,0,26,38,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',2,2),(253,'af0663bb419f274a0ed0136d4bd72367',0,0,26,38,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',2,3),(254,'bf1430f6ead0841deedd0453863d6f12',0,0,26,38,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',2,4),(255,'0d501ca8ba8d40edaaf84251ce59c423',0,0,26,39,31,'7F',8,0.00,'',0,17,0,'',1,'','Bytes Written:','','',2,5),(256,'214d9cdbf3964e6b96b3040a9d346cd1',0,0,26,39,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',2,6),(257,'9cc55857c9a94c366c7530a0c04aebe4',0,0,26,39,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',2,7),(258,'9e0b34da9be24a05c4e35d199158d7a8',0,0,26,39,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',2,8),(259,'aa49ac76638f30cd1e4b873155bdb1c1',0,0,26,38,60,'FF',4,1.00,'',0,17,0,'',3,'','','','',2,9),(260,'684c38d947eb1b9b64d718ab7a3552f3',0,0,26,39,31,'FF',20,1.00,'',0,17,0,'',3,'','','','',2,10),(261,'b561ed15b3ba66d277e6d7c1640b86f7',0,0,27,41,48,'7F',7,0.00,'',0,14,0,'',1,'','Used','','',2,1),(262,'99ef051057fa6adfa6834a7632e9d8a2',0,0,27,41,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,2),(263,'3986695132d3f4716872df4c6fbccb65',0,0,27,41,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,3),(264,'0444300017b368e6257f010dca8bbd0d',0,0,27,41,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,4),(265,'4d6a0b9063124ca60e2d1702b3e15e41',0,0,27,40,20,'7F',8,0.00,'',0,14,0,'',1,'','Available','','',2,5),(266,'181b08325e4d00cd50b8cdc8f8ae8e77',0,0,27,40,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(267,'bba0a9ff1357c990df50429d64314340',0,0,27,40,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(268,'d4a67883d53bc1df8aead21c97c0bc52',0,0,27,40,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(269,'253c9ec2d66905245149c1c2dc8e536e',0,0,27,0,1,'FF',5,0.00,'',0,15,0,'',1,'','Total','','',2,9),(270,'ea9ea883383f4eb462fec6aa309ba7b5',0,0,27,0,0,'FF',9,0.00,'',0,15,0,'',4,'','Current:','','',2,10),(271,'83b746bcaba029eeca170a9f77ec4864',0,0,27,0,0,'FF',9,0.00,'',0,15,0,'',1,'','Average:','','',2,11),(272,'82e01dd92fd37887c0696192efe7af65',0,0,27,0,0,'FF',9,0.00,'',0,15,0,'',3,'','Maximum:','','on',2,12),(273,'a198acfb7af4b149e97b2eeae05f7854',0,0,27,41,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(274,'fa2011b811862c238b476b5cd1d648e4',0,0,27,40,20,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(275,'d80e4a4901ab86ee39c9cc613e13532f',0,0,28,43,20,'7F',7,0.00,'',0,0,0,'',1,'','Total','','',2,1),(276,'567c2214ee4753aa712c3d101ea49a5d',0,0,28,43,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(277,'ba0b6a9e316ef9be66abba68b80f7587',0,0,28,43,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(278,'4b8e4a6bf2757f04c3e3a088338a2f7a',0,0,28,43,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(279,'16d6a9a7f608762ad65b0841e5ef4e9c',0,0,28,42,48,'7F',7,0.00,'',0,0,0,'',1,'','Used','','',2,5),(280,'2c35b5cae64c5f146a55fcb416dd14b5',0,0,28,42,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(281,'36fa8063df3b07cece878d54443db727',0,0,28,42,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(282,'b7b381d47972f836785d338a3bef6661',0,0,28,42,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(283,'fd1f89bda6ca439507b8b10a6895ef83',0,0,28,43,20,'FF',4,1.00,'',0,0,0,'',1,'','','','',2,9),(284,'204c34152b67dada375e7a147ebe7b3f',0,0,28,42,344,'FF',4,1.00,'',0,0,0,'',1,'','','','',2,10),(285,'42537599b5fb8ea852240b58a58633de',0,0,29,44,9,'7F',7,0.00,'',0,0,0,'',1,'','CPU Utilization','','',2,1),(286,'d478a76de1df9edf896c9ce51506c483',0,0,29,44,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(287,'8536e034ab5268a61473f1ff2f6bd88f',0,0,29,44,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(288,'87e10f9942b625aa323a0f39b60058e7',0,0,29,44,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(289,'309fd90f1a335fc13383a332a06504f1',0,0,29,44,9,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(290,'5f1c879abc0726777fca0fc789389c83',0,0,30,51,81,'7F',7,0.00,'',0,0,0,'',1,'','Bytes Read','','',2,1),(291,'51c0118319b44f47189ae31f0309f9f0',0,0,30,51,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(292,'0f89b5078bf70f0af2bf78234b23f00d',0,0,30,51,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(293,'0120d481227fa168959c10bb270caa18',0,0,30,51,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(294,'e73e2f5934a93891e7cbc573904bd6b4',0,0,30,46,31,'7F',8,0.00,'',0,0,0,'',1,'','Bytes Written','','',2,5),(295,'1c6656d52338c4abb6dadf149bfed8bf',0,0,30,46,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(296,'e37e7851de6f4fbcb7d56a154a105e87',0,0,30,46,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(297,'70eee256f03cfc9b2c94b79764c919f7',0,0,30,46,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(298,'bdca605f97fdfba3d40218f3fd1c6cb2',0,0,30,51,81,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(299,'592330a782c1e3234b068ba5c654b27e',0,0,30,46,31,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,10),(300,'2f92441bafd3b0ac3d8a7b8f14f7e7f4',0,0,31,48,25,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute:','','',2,1),(301,'95c77bfdeab8864b3308a8ddae8a16d6',0,0,31,48,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',2,2),(302,'3742a4866a8778864fc50f1f9ae10b06',0,0,31,48,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',2,3),(303,'aaaaa65c1525d22a62fd821c2b2ed7c5',0,0,31,48,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(304,'0a493360ea80b6c42fab0a25a4035ac9',0,0,31,49,31,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute:','','',2,5),(305,'b60da656f73dc1d11635625c2e6ef8c1',0,0,31,49,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',2,6),(306,'d44df4adf7c34dc15e76ab871c0f7ce6',0,0,31,49,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',2,7),(307,'e087987a73b788ff5661f66a9874fa59',0,0,31,49,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(308,'c970fc901877e404e96c0f5e3ff294b5',0,0,31,50,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute:','','',2,9),(309,'3794dae61e4e3edbdede2cb237154dc6',0,0,31,50,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',2,10),(310,'e585d22bc3d118452e586f731769954e',0,0,31,50,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',2,11),(311,'31e471174c77bdb8c2b88f126732e2ea',0,0,31,50,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,12),(312,'de8cc8b4d0b3bce5a15e0332abcc89f3',0,0,31,48,25,'FF',4,1.00,'',0,0,0,'',4,'','','','',2,13),(313,'9ab1319b03c5582751de0e918d27ba36',0,0,31,49,31,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(314,'5642ca20de5f7a517d4fe1b32c67d05f',0,0,31,50,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(315,'6b85618a4561027dc8dcb67583fdca53',0,0,32,45,21,'7F',7,0.00,'',0,0,0,'',1,'','Device Reads:','','',3,1),(316,'44c288205e20b2728a49386848edef0b',0,0,32,45,0,'FF',9,0.00,'',0,0,0,'',4,'','Last:','','',3,2),(317,'582b30daf33cec747505d4aa1b5beab3',0,0,32,45,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',3,3),(318,'0e1db768b3c884e7b70ef9c5f1b5c299',0,0,32,45,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(319,'d22a3018c9394f9c72e6a39535facd0d',0,0,32,45,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(320,'169f60ae37d15d6981fca7ab5b5899bb',0,0,32,47,9,'7F',8,0.00,'',0,0,0,'',1,'','Device Writes:','','',3,6),(321,'36692ccb814a0c7d7c1c4ed1fa51a185',0,0,32,47,0,'FF',9,0.00,'',0,0,0,'',4,'','Last:','','',3,7),(322,'8a880165df484c71ab809559158e2a15',0,0,32,47,0,'FF',9,0.00,'',0,0,0,'',2,'','Minumum:','','',3,8),(323,'634c71aa9ed03895176a26aceb375d83',0,0,32,47,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,9),(324,'168911021bc829a8abf4d4bfeacbe1d3',0,0,32,47,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,10),(325,'ce2b53b34a50ce8c54c8849b1c8baf9e',0,0,32,45,21,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,11),(326,'7675101daedceb6fd63d927e304f6273',0,0,32,47,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,12),(327,'098b10c13a5701ddb7d4d1d2e2b0fdb7',0,0,33,52,9,'FF',7,0.00,'',0,0,0,'',1,'','CPU Usage','','',2,1),(328,'1dbda412a9926b0ee5c025aa08f3b230',0,0,33,52,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(329,'725c45917146807b6a4257fc351f2bae',0,0,33,52,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(330,'4e336fdfeb84ce65f81ded0e0159a5e0',0,0,33,52,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4);
/*!40000 ALTER TABLE `graph_templates_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_tree`
--

DROP TABLE IF EXISTS `graph_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_tree` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `enabled` char(2) DEFAULT 'on',
  `locked` tinyint(4) DEFAULT '0',
  `locked_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sort_type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(10) unsigned DEFAULT '1',
  `user_id` int(10) unsigned DEFAULT '1',
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `sequence` (`sequence`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_tree`
--

LOCK TABLES `graph_tree` WRITE;
/*!40000 ALTER TABLE `graph_tree` DISABLE KEYS */;
INSERT INTO `graph_tree` VALUES (18,'on',0,'0000-00-00 00:00:00',1,'3.3.3.0',1,1,'0000-00-00 00:00:00',1),(19,'on',1,'2019-08-07 03:24:24',1,'default_tree',1,1,'2019-08-07 04:24:45',1),(20,'on',0,'0000-00-00 00:00:00',1,'6.6.60.0',1,1,'0000-00-00 00:00:00',1),(21,'on',0,'0000-00-00 00:00:00',1,'2.2.2.0',1,1,'0000-00-00 00:00:00',1),(22,'on',0,'0000-00-00 00:00:00',1,'9.9.9.0',1,1,'0000-00-00 00:00:00',1),(23,'on',0,'0000-00-00 00:00:00',1,'20.20.30.2',1,1,'0000-00-00 00:00:00',1),(24,'on',0,'0000-00-00 00:00:00',1,'60.60.50.0',1,1,'0000-00-00 00:00:00',1),(25,'on',0,'0000-00-00 00:00:00',1,'40.40.40.0',1,1,'0000-00-00 00:00:00',1),(26,'on',0,'0000-00-00 00:00:00',1,'20.20.20.0',1,1,'0000-00-00 00:00:00',1),(27,'on',0,'0000-00-00 00:00:00',1,'4.4.4.0',1,1,'0000-00-00 00:00:00',1),(28,'on',0,'0000-00-00 00:00:00',1,'54.54.54.0',1,1,'0000-00-00 00:00:00',1),(29,'on',0,'0000-00-00 00:00:00',1,'60.60.60.0',1,1,'0000-00-00 00:00:00',1),(30,'on',0,'0000-00-00 00:00:00',1,'60.60.6.0',1,1,'0000-00-00 00:00:00',1),(31,'on',0,'0000-00-00 00:00:00',1,'2.20.20.0',1,1,'0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `graph_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_tree_items`
--

DROP TABLE IF EXISTS `graph_tree_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_tree_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent` bigint(20) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `graph_tree_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `local_graph_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `site_id` int(10) unsigned DEFAULT '0',
  `host_grouping_type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sort_children_type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `graph_regex` varchar(60) DEFAULT '',
  `host_regex` varchar(60) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `graph_tree_id` (`graph_tree_id`),
  KEY `host_id` (`host_id`),
  KEY `site_id` (`site_id`),
  KEY `local_graph_id` (`local_graph_id`),
  KEY `parent_position` (`parent`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_tree_items`
--

LOCK TABLES `graph_tree_items` WRITE;
/*!40000 ALTER TABLE `graph_tree_items` DISABLE KEYS */;
INSERT INTO `graph_tree_items` VALUES (47,0,1,18,0,'',48,0,1,2,'','');
/*!40000 ALTER TABLE `graph_tree_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `poller_id` int(10) unsigned NOT NULL DEFAULT '1',
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `host_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `description` varchar(150) NOT NULL DEFAULT '',
  `hostname` varchar(100) DEFAULT NULL,
  `notes` text,
  `external_id` varchar(40) DEFAULT NULL,
  `snmp_community` varchar(100) DEFAULT NULL,
  `snmp_version` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `snmp_username` varchar(50) DEFAULT NULL,
  `snmp_password` varchar(50) DEFAULT NULL,
  `snmp_auth_protocol` char(6) DEFAULT '',
  `snmp_priv_passphrase` varchar(200) DEFAULT '',
  `snmp_priv_protocol` char(6) DEFAULT '',
  `snmp_context` varchar(64) DEFAULT '',
  `snmp_engine_id` varchar(64) DEFAULT '',
  `snmp_port` mediumint(5) unsigned NOT NULL DEFAULT '161',
  `snmp_timeout` mediumint(8) unsigned NOT NULL DEFAULT '500',
  `snmp_sysDescr` varchar(300) NOT NULL DEFAULT '',
  `snmp_sysObjectID` varchar(128) NOT NULL DEFAULT '',
  `snmp_sysUpTimeInstance` int(10) unsigned NOT NULL DEFAULT '0',
  `snmp_sysContact` varchar(300) NOT NULL DEFAULT '',
  `snmp_sysName` varchar(300) NOT NULL DEFAULT '',
  `snmp_sysLocation` varchar(300) NOT NULL DEFAULT '',
  `availability_method` smallint(5) unsigned NOT NULL DEFAULT '1',
  `ping_method` smallint(5) unsigned DEFAULT '0',
  `ping_port` int(12) unsigned DEFAULT '0',
  `ping_timeout` int(12) unsigned DEFAULT '500',
  `ping_retries` int(12) unsigned DEFAULT '2',
  `max_oids` int(12) unsigned DEFAULT '10',
  `device_threads` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `disabled` char(2) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `status_event_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status_fail_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_rec_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_last_error` varchar(255) DEFAULT '',
  `min_time` decimal(10,5) DEFAULT '9.99999',
  `max_time` decimal(10,5) DEFAULT '0.00000',
  `cur_time` decimal(10,5) DEFAULT '0.00000',
  `avg_time` decimal(10,5) DEFAULT '0.00000',
  `polling_time` double DEFAULT '0',
  `total_polls` int(12) unsigned DEFAULT '0',
  `failed_polls` int(12) unsigned DEFAULT '0',
  `availability` decimal(8,5) NOT NULL DEFAULT '100.00000',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `poller_id_disabled` (`poller_id`,`disabled`),
  KEY `site_id` (`site_id`),
  KEY `external_id` (`external_id`),
  KEY `disabled` (`disabled`),
  KEY `status` (`status`),
  KEY `hostname` (`hostname`),
  KEY `poller_id_last_updated` (`poller_id`,`last_updated`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (48,1,0,3,'127.0.0.1','127.0.0.1','','','public',2,'','','','','','','',161,500,'Linux ruben-Lenovo-Z50-75 5.0.0-23-generic #24-Ubuntu SMP Mon Jul 29 15:36:44 UTC 2019 x86_64','OID: .1.3.6.1.4.1.8072.3.2.10',4785410,'Me me@example.org','ruben-Lenovo-Z50-75','Sitting on the Dock of the Bay',1,2,23,400,1,10,1,'',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',0.64500,37.48000,1.30500,1.57658,0,418,0,100.00000,'2019-08-14 09:10:03'),(49,1,0,1,'localhost','192.168.0.13','','','public',2,'','','','','','','',161,500,'','',0,'','','',2,1,23,400,1,10,1,'',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',9.99999,0.00000,0.00000,0.00000,0,0,0,100.00000,'2019-08-08 22:21:38');
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_graph`
--

DROP TABLE IF EXISTS `host_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_graph` (
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`host_id`,`graph_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_graph`
--

LOCK TABLES `host_graph` WRITE;
/*!40000 ALTER TABLE `host_graph` DISABLE KEYS */;
INSERT INTO `host_graph` VALUES (48,1),(48,2),(48,3),(48,4),(48,5),(48,6),(48,7),(48,8),(48,9),(48,10),(48,11),(48,12),(48,13),(48,14),(48,15),(48,16),(48,17),(48,18),(48,19),(48,20),(48,21),(48,22),(48,23),(48,24),(48,25),(48,26),(48,27),(48,28),(48,29),(48,30),(48,31),(48,32),(48,33),(49,1),(49,2),(49,3),(49,4);
/*!40000 ALTER TABLE `host_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_snmp_cache`
--

DROP TABLE IF EXISTS `host_snmp_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_snmp_cache` (
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `snmp_query_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(50) NOT NULL DEFAULT '',
  `field_value` varchar(512) DEFAULT NULL,
  `snmp_index` varchar(191) NOT NULL DEFAULT '',
  `oid` text NOT NULL,
  `present` tinyint(4) NOT NULL DEFAULT '1',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`host_id`,`snmp_query_id`,`field_name`,`snmp_index`),
  KEY `host_id` (`host_id`,`field_name`),
  KEY `snmp_index` (`snmp_index`),
  KEY `field_name` (`field_name`),
  KEY `field_value` (`field_value`(191)),
  KEY `snmp_query_id` (`snmp_query_id`),
  KEY `last_updated` (`last_updated`),
  KEY `present` (`present`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_snmp_cache`
--

LOCK TABLES `host_snmp_cache` WRITE;
/*!40000 ALTER TABLE `host_snmp_cache` DISABLE KEYS */;
INSERT INTO `host_snmp_cache` VALUES (48,1,'dskDevice','/dev/loop0','/dev/loop0','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop1','/dev/loop1','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop10','/dev/loop10','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop11','/dev/loop11','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop12','/dev/loop12','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop13','/dev/loop13','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop14','/dev/loop14','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop15','/dev/loop15','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop16','/dev/loop16','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop17','/dev/loop17','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop18','/dev/loop18','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop19','/dev/loop19','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop2','/dev/loop2','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop20','/dev/loop20','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop21','/dev/loop21','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop3','/dev/loop3','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop4','/dev/loop4','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop5','/dev/loop5','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop6','/dev/loop6','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop7','/dev/loop7','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop8','/dev/loop8','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/loop9','/dev/loop9','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/sda1','/dev/sda1','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/sda2','/dev/sda2','',1,'2019-08-14 09:10:04'),(48,1,'dskDevice','/dev/sda6','/dev/sda6','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/chromium/821','/dev/loop0','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gnome-chess/31','/dev/loop1','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/chromium/817','/dev/loop10','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gnome-system-monitor/100','/dev/loop11','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gnome-logs/61','/dev/loop12','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gtk-common-themes/1313','/dev/loop13','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gnome-characters/296','/dev/loop14','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/code/11','/dev/loop15','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gnome-calculator/406','/dev/loop16','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gnome-3-28-1804/67','/dev/loop17','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/core/7396','/dev/loop18','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/core/7270','/dev/loop19','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/p7zip-desktop/220','/dev/loop2','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/android-studio/77','/dev/loop20','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gtk-common-themes/1198','/dev/loop21','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gnome-3-28-1804/71','/dev/loop3','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/core18/1066','/dev/loop4','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/code/12','/dev/loop5','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gnome-system-monitor/77','/dev/loop6','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gnome-characters/254','/dev/loop7','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/gtk2-common-themes/5','/dev/loop8','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/snap/core18/1074','/dev/loop9','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/media/ruben/B430F2A530F26E2C','/dev/sda1','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/media/ruben/01D2CAB7A886FB10','/dev/sda2','',1,'2019-08-14 09:10:04'),(48,1,'dskMount','/','/dev/sda6','',1,'2019-08-14 09:10:04'),(49,1,'dskDevice','/dev/loop0','/dev/loop0','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop1','/dev/loop1','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop10','/dev/loop10','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop11','/dev/loop11','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop12','/dev/loop12','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop13','/dev/loop13','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop14','/dev/loop14','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop15','/dev/loop15','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop16','/dev/loop16','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop17','/dev/loop17','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop18','/dev/loop18','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop19','/dev/loop19','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop2','/dev/loop2','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop20','/dev/loop20','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop21','/dev/loop21','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop3','/dev/loop3','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop4','/dev/loop4','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop5','/dev/loop5','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop6','/dev/loop6','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop7','/dev/loop7','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop8','/dev/loop8','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/loop9','/dev/loop9','',1,'2019-08-08 22:21:38'),(49,1,'dskDevice','/dev/sda6','/dev/sda6','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gtk-common-themes/1198','/dev/loop0','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/chromium/813','/dev/loop1','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gnome-3-28-1804/67','/dev/loop10','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/p7zip-desktop/220','/dev/loop11','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/code/11','/dev/loop12','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gnome-system-monitor/77','/dev/loop13','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gnome-chess/31','/dev/loop14','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gnome-calculator/406','/dev/loop15','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/android-studio/77','/dev/loop16','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gnome-characters/254','/dev/loop17','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/chromium/817','/dev/loop18','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gnome-3-28-1804/31','/dev/loop19','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gtk-common-themes/1313','/dev/loop2','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/core18/1066','/dev/loop20','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/code/12','/dev/loop21','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/core18/1074','/dev/loop3','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gnome-system-monitor/100','/dev/loop4','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gtk2-common-themes/5','/dev/loop5','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gnome-characters/296','/dev/loop6','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/core/6673','/dev/loop7','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/core/7270','/dev/loop8','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/snap/gnome-logs/61','/dev/loop9','',1,'2019-08-08 22:21:38'),(49,1,'dskMount','/','/dev/sda6','',1,'2019-08-08 22:21:38');
/*!40000 ALTER TABLE `host_snmp_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_snmp_query`
--

DROP TABLE IF EXISTS `host_snmp_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_snmp_query` (
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `snmp_query_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sort_field` varchar(50) NOT NULL DEFAULT '',
  `title_format` varchar(50) NOT NULL DEFAULT '',
  `reindex_method` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`host_id`,`snmp_query_id`),
  KEY `host_id` (`host_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_snmp_query`
--

LOCK TABLES `host_snmp_query` WRITE;
/*!40000 ALTER TABLE `host_snmp_query` DISABLE KEYS */;
INSERT INTO `host_snmp_query` VALUES (1,1,'','',1),(11,1,'','',1),(48,1,'dskDevice','|query_dskDevice|',1),(48,2,'','',1),(48,3,'','',1),(48,4,'','',1),(48,5,'','',1),(48,6,'','',1),(49,1,'dskDevice','|query_dskDevice|',1);
/*!40000 ALTER TABLE `host_snmp_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_template`
--

DROP TABLE IF EXISTS `host_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_template` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_template`
--

LOCK TABLES `host_template` WRITE;
/*!40000 ALTER TABLE `host_template` DISABLE KEYS */;
INSERT INTO `host_template` VALUES (1,'2d3e47f416738c2d22c87c40218cc55e','Local Linux Machine'),(2,'4855b0e3e553085ed57219690285f91f','Generic SNMP Device'),(3,'07d3fe6a52915f99e642d22e27d967a4','Net-SNMP Device'),(4,'cae6a879f86edacb2471055783bec6d0','Cisco Router');
/*!40000 ALTER TABLE `host_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_template_graph`
--

DROP TABLE IF EXISTS `host_template_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_template_graph` (
  `host_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`host_template_id`,`graph_template_id`),
  KEY `host_template_id` (`host_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_template_graph`
--

LOCK TABLES `host_template_graph` WRITE;
/*!40000 ALTER TABLE `host_template_graph` DISABLE KEYS */;
INSERT INTO `host_template_graph` VALUES (1,1),(1,2),(1,3),(1,4),(2,6),(2,7),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(4,33);
/*!40000 ALTER TABLE `host_template_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_template_snmp_query`
--

DROP TABLE IF EXISTS `host_template_snmp_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_template_snmp_query` (
  `host_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `snmp_query_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`host_template_id`,`snmp_query_id`),
  KEY `host_template_id` (`host_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_template_snmp_query`
--

LOCK TABLES `host_template_snmp_query` WRITE;
/*!40000 ALTER TABLE `host_template_snmp_query` DISABLE KEYS */;
INSERT INTO `host_template_snmp_query` VALUES (1,1),(2,2),(3,2),(3,3),(3,4),(3,5),(3,6),(4,2);
/*!40000 ALTER TABLE `host_template_snmp_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_openstack`
--

DROP TABLE IF EXISTS `image_openstack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_openstack` (
  `id_image` varchar(50) DEFAULT NULL,
  `name_image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_openstack`
--

LOCK TABLES `image_openstack` WRITE;
/*!40000 ALTER TABLE `image_openstack` DISABLE KEYS */;
INSERT INTO `image_openstack` VALUES ('04dabb9c-743c-4949-ab06-ef94b9603af5','mininet',0),('74b8e000-1069-4d57-b2ef-1288ec219c3a','mininet',0),('a01850df-b581-485a-a29b-f57f384605ce','mininetOVF',0),('0f42bfab-8a0c-4066-84d5-098399d9a7cf','ubuntu 16-server',0),('512a25a4-b509-440f-a9a3-140494549b90','testsdsfafsdf',0),('40c61f24-11ed-4d45-b9ef-1c5a9674fdbe','newvm1',0),('a8489e6d-dde0-46d4-869b-503abe68feef','allInOne',0),('ffd93b55-858c-4ca2-9f0b-0e7890966392','ubuntu-server-14',0),('ac5ca085-1372-4d3d-b3c9-53457435e18c','cirros-0.4.0-x86_64-disk',0);
/*!40000 ALTER TABLE `image_openstack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_arq_testbedims`
--

DROP TABLE IF EXISTS `info_arq_testbedims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_arq_testbedims` (
  `id_info` int(11) NOT NULL AUTO_INCREMENT,
  `dominio` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `ip_bono` varchar(50) DEFAULT NULL,
  `ip_sprout` varchar(50) DEFAULT NULL,
  `ip_ellis` varchar(50) DEFAULT NULL,
  `ip_homer` varchar(50) DEFAULT NULL,
  `ip_vellum` varchar(50) DEFAULT NULL,
  `ip_dime` varchar(50) DEFAULT NULL,
  `ip_ibcf` varchar(50) DEFAULT NULL,
  `ip_pstn` varchar(50) DEFAULT NULL,
  `fist_number_pstn` varchar(50) DEFAULT NULL,
  `amount_extensions_pstn` varchar(50) DEFAULT NULL,
  `fist_number_ims` varchar(50) DEFAULT NULL,
  `amount_extensions_ims` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_info` (`id_info`),
  UNIQUE KEY `dominio` (`dominio`),
  CONSTRAINT `info_arq_testbedims_ibfk_1` FOREIGN KEY (`dominio`) REFERENCES `arqs_testbedims` (`dominio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_arq_testbedims`
--

LOCK TABLES `info_arq_testbedims` WRITE;
/*!40000 ALTER TABLE `info_arq_testbedims` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_arq_testbedims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instant_images_openstack`
--

DROP TABLE IF EXISTS `instant_images_openstack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instant_images_openstack` (
  `id_instant` varchar(50) DEFAULT NULL,
  `name_instant` varchar(50) DEFAULT NULL,
  `id_server` varchar(50) DEFAULT NULL,
  `status_instant` varchar(50) DEFAULT NULL,
  `disk_format` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_instant` (`id_instant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instant_images_openstack`
--

LOCK TABLES `instant_images_openstack` WRITE;
/*!40000 ALTER TABLE `instant_images_openstack` DISABLE KEYS */;
INSERT INTO `instant_images_openstack` VALUES ('b009e58a-9570-4acf-8978-21010f697649','testjklj','2c0d996e-68e8-4acf-9187-f27e8417ebcd',NULL,NULL,NULL),('7a6d8cec-0459-4e7d-97c6-dbbc734a56b6','allInOne','a566bc79-455f-4481-a217-02da11926ec4',NULL,NULL,NULL),('2c427e54-5dcd-415d-9c05-6691f46d806e','testtgggg','a3eb457d-82d7-4618-8a70-1f506f5a03e4',NULL,NULL,NULL);
/*!40000 ALTER TABLE `instant_images_openstack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_openstack`
--

DROP TABLE IF EXISTS `network_openstack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_openstack` (
  `id_net` varchar(50) DEFAULT NULL,
  `name_net` varchar(50) DEFAULT NULL,
  `description_net` varchar(1000) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  UNIQUE KEY `id_net` (`id_net`),
  KEY `domain` (`domain`),
  CONSTRAINT `network_openstack_ibfk_1` FOREIGN KEY (`domain`) REFERENCES `arqs_testbedims` (`dominio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_openstack`
--

LOCK TABLES `network_openstack` WRITE;
/*!40000 ALTER TABLE `network_openstack` DISABLE KEYS */;
INSERT INTO `network_openstack` VALUES ('2300c260-7411-40f7-8b1a-9f0127165bd0','testbed1','54654','60.60.6.0',0),('5a09745c-f76c-4d8f-9d71-2508e79b8d9e','testbed2','456','2.20.20.0',0);
/*!40000 ALTER TABLE `network_openstack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_test_testbedims`
--

DROP TABLE IF EXISTS `option_test_testbedims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_test_testbedims` (
  `id_option` int(11) NOT NULL AUTO_INCREMENT,
  `id_test` int(11) DEFAULT NULL,
  `options` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `description_option` varchar(150) DEFAULT NULL,
  UNIQUE KEY `id_option` (`id_option`),
  KEY `id_test` (`id_test`),
  CONSTRAINT `option_test_testbedims_ibfk_1` FOREIGN KEY (`id_test`) REFERENCES `test_testbedims` (`id_test`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_test_testbedims`
--

LOCK TABLES `option_test_testbedims` WRITE;
/*!40000 ALTER TABLE `option_test_testbedims` DISABLE KEYS */;
INSERT INTO `option_test_testbedims` VALUES (3,NULL,'op1','op1','op1'),(8,NULL,'1','1','1');
/*!40000 ALTER TABLE `option_test_testbedims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_config`
--

DROP TABLE IF EXISTS `plugin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `directory` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `author` varchar(64) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `directory` (`directory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_config`
--

LOCK TABLES `plugin_config` WRITE;
/*!40000 ALTER TABLE `plugin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_db_changes`
--

DROP TABLE IF EXISTS `plugin_db_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_db_changes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(16) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `column` varchar(64) NOT NULL,
  `method` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `plugin` (`plugin`),
  KEY `method` (`method`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_db_changes`
--

LOCK TABLES `plugin_db_changes` WRITE;
/*!40000 ALTER TABLE `plugin_db_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_db_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_hooks`
--

DROP TABLE IF EXISTS `plugin_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_hooks` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `hook` varchar(64) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `function` varchar(128) NOT NULL DEFAULT '',
  `status` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hook` (`hook`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_hooks`
--

LOCK TABLES `plugin_hooks` WRITE;
/*!40000 ALTER TABLE `plugin_hooks` DISABLE KEYS */;
INSERT INTO `plugin_hooks` VALUES (1,'internal','config_arrays','','plugin_config_arrays',1),(2,'internal','draw_navigation_text','','plugin_draw_navigation_text',1);
/*!40000 ALTER TABLE `plugin_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_realms`
--

DROP TABLE IF EXISTS `plugin_realms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_realms` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(32) NOT NULL DEFAULT '',
  `file` text NOT NULL,
  `display` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `plugin` (`plugin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_realms`
--

LOCK TABLES `plugin_realms` WRITE;
/*!40000 ALTER TABLE `plugin_realms` DISABLE KEYS */;
INSERT INTO `plugin_realms` VALUES (1,'internal','plugins.php','Plugin Management');
/*!40000 ALTER TABLE `plugin_realms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller`
--

DROP TABLE IF EXISTS `poller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `disabled` char(2) DEFAULT '',
  `name` varchar(30) DEFAULT NULL,
  `notes` varchar(1024) DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `dbdefault` varchar(20) NOT NULL DEFAULT 'cacti',
  `dbhost` varchar(64) NOT NULL DEFAULT 'cacti',
  `dbuser` varchar(20) NOT NULL DEFAULT '',
  `dbpass` varchar(64) NOT NULL DEFAULT '',
  `dbport` int(10) unsigned DEFAULT '3306',
  `dbssl` char(3) DEFAULT '',
  `total_time` double DEFAULT '0',
  `snmp` mediumint(8) unsigned DEFAULT '0',
  `script` mediumint(8) unsigned DEFAULT '0',
  `server` mediumint(8) unsigned DEFAULT '0',
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_status` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `disabled` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Pollers for Cacti';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller`
--

LOCK TABLES `poller` WRITE;
/*!40000 ALTER TABLE `poller` DISABLE KEYS */;
INSERT INTO `poller` VALUES (1,'','Main Poller','',1,'ruben-Lenovo-Z50-75','cacti','cacti','','',3306,'',1.4225,1,3,0,'2019-08-14 09:10:03','2019-08-15 01:10:01');
/*!40000 ALTER TABLE `poller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_command`
--

DROP TABLE IF EXISTS `poller_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_command` (
  `poller_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `command` varchar(191) NOT NULL DEFAULT '',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`poller_id`,`action`,`command`),
  KEY `poller_id_last_updated` (`poller_id`,`last_updated`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_command`
--

LOCK TABLES `poller_command` WRITE;
/*!40000 ALTER TABLE `poller_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_data_template_field_mappings`
--

DROP TABLE IF EXISTS `poller_data_template_field_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_data_template_field_mappings` (
  `data_template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `data_name` varchar(40) NOT NULL DEFAULT '',
  `data_source_names` varchar(125) NOT NULL DEFAULT '',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_template_id`,`data_name`,`data_source_names`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tracks mapping of Data Templates to their Data Source Names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_data_template_field_mappings`
--

LOCK TABLES `poller_data_template_field_mappings` WRITE;
/*!40000 ALTER TABLE `poller_data_template_field_mappings` DISABLE KEYS */;
INSERT INTO `poller_data_template_field_mappings` VALUES (1,'proc','proc','2019-03-01 17:34:22'),(2,'10min','load_15min','2019-03-01 17:34:22'),(2,'1min','load_1min','2019-03-01 17:34:22'),(2,'5min','load_5min','2019-03-01 17:34:22'),(3,'users','users','2019-03-01 17:34:22'),(4,'kilobytes','mem_buffers','2019-03-01 17:34:23'),(5,'kilobytes','mem_swap','2019-03-01 17:34:23'),(7,'out_ms','ping','2019-03-01 17:34:31'),(27,'reads','reads','2019-03-01 17:35:06'),(27,'writes','writes','2019-03-01 17:35:06'),(28,'bytesread','bytesread','2019-03-01 17:35:06'),(28,'byteswritten','byteswritten','2019-03-01 17:35:06');
/*!40000 ALTER TABLE `poller_data_template_field_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_item`
--

DROP TABLE IF EXISTS `poller_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_item` (
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poller_id` int(10) unsigned NOT NULL DEFAULT '1',
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `present` tinyint(4) NOT NULL DEFAULT '1',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `snmp_community` varchar(100) NOT NULL DEFAULT '',
  `snmp_version` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `snmp_username` varchar(50) NOT NULL DEFAULT '',
  `snmp_password` varchar(50) NOT NULL DEFAULT '',
  `snmp_auth_protocol` char(6) NOT NULL DEFAULT '',
  `snmp_priv_passphrase` varchar(200) NOT NULL DEFAULT '',
  `snmp_priv_protocol` char(6) NOT NULL DEFAULT '',
  `snmp_context` varchar(64) DEFAULT '',
  `snmp_engine_id` varchar(64) DEFAULT '',
  `snmp_port` mediumint(5) unsigned NOT NULL DEFAULT '161',
  `snmp_timeout` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rrd_name` varchar(19) NOT NULL DEFAULT '',
  `rrd_path` varchar(255) NOT NULL DEFAULT '',
  `rrd_num` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rrd_step` mediumint(8) NOT NULL DEFAULT '300',
  `rrd_next_step` mediumint(8) NOT NULL DEFAULT '0',
  `arg1` text,
  `arg2` varchar(255) DEFAULT NULL,
  `arg3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`),
  KEY `host_id` (`host_id`),
  KEY `action` (`action`),
  KEY `present` (`present`),
  KEY `poller_id_host_id` (`poller_id`,`host_id`),
  KEY `poller_id_rrd_next_step` (`poller_id`,`rrd_next_step`),
  KEY `poller_id_action` (`poller_id`,`action`),
  KEY `poller_id_last_updated` (`poller_id`,`last_updated`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_item`
--

LOCK TABLES `poller_item` WRITE;
/*!40000 ALTER TABLE `poller_item` DISABLE KEYS */;
INSERT INTO `poller_item` VALUES (567,1,48,1,1,'2019-08-14 09:10:02','127.0.0.1','public',2,'','','','','','','',161,500,'mem_buffers','/var/www/html/telco/rra/127_0_0_1_mem_buffers_567.rrd',1,300,0,'perl /var/www/html/telco/scripts/linux_memory.pl \'MemFree:\'','',''),(568,1,48,1,1,'2019-08-14 09:10:02','127.0.0.1','public',2,'','','','','','','',161,500,'mem_swap','/var/www/html/telco/rra/127_0_0_1_mem_swap_568.rrd',1,300,0,'perl /var/www/html/telco/scripts/linux_memory.pl \'SwapFree:\'','',''),(574,1,48,1,1,'2019-08-14 09:10:02','127.0.0.1','public',2,'','','','','','','',161,500,'ping','/var/www/html/telco/rra/127_0_0_1_ping_574.rrd',1,300,0,'perl /var/www/html/telco/scripts/ping.pl \'127.0.0.1\'','',''),(577,1,48,0,1,'2019-08-14 09:10:02','127.0.0.1','public',2,'','','','','','','',161,500,'users','/var/www/html/telco/rra/127_0_0_1_users_577.rrd',1,300,0,'.1.3.6.1.2.1.25.1.5.0','','');
/*!40000 ALTER TABLE `poller_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output`
--

DROP TABLE IF EXISTS `poller_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_output` (
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rrd_name` varchar(19) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `output` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`local_data_id`,`rrd_name`,`time`) USING BTREE
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_output`
--

LOCK TABLES `poller_output` WRITE;
/*!40000 ALTER TABLE `poller_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output_boost`
--

DROP TABLE IF EXISTS `poller_output_boost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_output_boost` (
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rrd_name` varchar(19) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `output` varchar(512) NOT NULL,
  PRIMARY KEY (`local_data_id`,`time`,`rrd_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_output_boost`
--

LOCK TABLES `poller_output_boost` WRITE;
/*!40000 ALTER TABLE `poller_output_boost` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output_boost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output_boost_processes`
--

DROP TABLE IF EXISTS `poller_output_boost_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_output_boost_processes` (
  `sock_int_value` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sock_int_value`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_output_boost_processes`
--

LOCK TABLES `poller_output_boost_processes` WRITE;
/*!40000 ALTER TABLE `poller_output_boost_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output_boost_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output_realtime`
--

DROP TABLE IF EXISTS `poller_output_realtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_output_realtime` (
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rrd_name` varchar(19) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `output` text NOT NULL,
  `poller_id` varchar(256) NOT NULL DEFAULT '1',
  PRIMARY KEY (`local_data_id`,`rrd_name`,`time`),
  KEY `poller_id` (`poller_id`(191)),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_output_realtime`
--

LOCK TABLES `poller_output_realtime` WRITE;
/*!40000 ALTER TABLE `poller_output_realtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output_realtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_reindex`
--

DROP TABLE IF EXISTS `poller_reindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_reindex` (
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data_query_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `present` tinyint(4) NOT NULL DEFAULT '1',
  `op` char(1) NOT NULL DEFAULT '',
  `assert_value` varchar(100) NOT NULL DEFAULT '',
  `arg1` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`host_id`,`data_query_id`),
  KEY `present` (`present`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_reindex`
--

LOCK TABLES `poller_reindex` WRITE;
/*!40000 ALTER TABLE `poller_reindex` DISABLE KEYS */;
INSERT INTO `poller_reindex` VALUES (48,1,0,1,'<','4785578','.1.3.6.1.2.1.1.3.0'),(49,1,0,1,'<','3965598','.1.3.6.1.2.1.1.3.0');
/*!40000 ALTER TABLE `poller_reindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_resource_cache`
--

DROP TABLE IF EXISTS `poller_resource_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_resource_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_type` varchar(20) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contents` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Caches all scripts, resources files, and plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_resource_cache`
--

LOCK TABLES `poller_resource_cache` WRITE;
/*!40000 ALTER TABLE `poller_resource_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_resource_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_time`
--

DROP TABLE IF EXISTS `poller_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_time` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `poller_id` int(10) unsigned NOT NULL DEFAULT '1',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `poller_id_end_time` (`poller_id`,`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_time`
--

LOCK TABLES `poller_time` WRITE;
/*!40000 ALTER TABLE `poller_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ports_openstack`
--

DROP TABLE IF EXISTS `ports_openstack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ports_openstack` (
  `id_port` varchar(50) DEFAULT NULL,
  `fixed_ip` varchar(50) DEFAULT NULL,
  `id_subnet` varchar(50) DEFAULT NULL,
  `status_port` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_port` (`id_port`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ports_openstack`
--

LOCK TABLES `ports_openstack` WRITE;
/*!40000 ALTER TABLE `ports_openstack` DISABLE KEYS */;
INSERT INTO `ports_openstack` VALUES ('022f8efd-249e-4f1b-b4e9-13dffc00410b','192.168.40.166','807bfac4-46a4-4654-b4df-faf0361c5a6b','ACTIVE'),('0347a44a-d04a-49c1-a96b-27e7c14404f5','192.168.40.234','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('08ad11e3-4dca-4e11-9518-e28eaf41c2f1','192.168.3.1','39b3074f-e04e-4c84-9b53-1db825d6777f','ACTIVE'),('0b56bd66-ef45-4860-be8f-cc5584fca92b','192.168.2.11','d3691393-9439-46bd-8382-e922a9835e20','ACTIVE'),('137009bb-d41e-4bcb-a8c7-12fd12d642f0','192.168.40.101','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('1c733be8-3030-41bf-b17e-8fc4ec77ec7e','10.0.0.2','424ec853-a9d2-4011-9958-215016166ee1','ACTIVE'),('1cb60794-7db5-4b46-a924-3d8cb1b5386d','192.168.1.12','8d7fcec0-00d5-4996-87cd-4c0c6d842ca9','ACTIVE'),('28c37333-7d7d-417c-b87b-dcb6b8fdf130','192.168.40.59','807bfac4-46a4-4654-b4df-faf0361c5a6b','ACTIVE'),('2aa67e94-6b4d-4d5f-b1e6-22fae59ecbb8','192.168.3.10','39b3074f-e04e-4c84-9b53-1db825d6777f','ACTIVE'),('345c058b-ba1d-471f-897a-ac795e498021','192.168.40.220','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('34ceface-5faf-4afa-834e-f506144a0cfd','192.168.40.116','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('3b2ad3b1-829f-4348-85b0-eb1368ced421','192.168.40.173','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('3c56c3ad-9806-46c8-855e-4e873f85a043','192.168.40.31','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('3e9ee294-3abe-4051-b870-5cf8e393920d','fdd4:2cad:3754::1','04e6fb52-7260-4df9-98ad-356fd8a742d8','ACTIVE'),('41913fef-6f7e-4952-88a8-8fc6c25d91b5','192.168.2.2','d3691393-9439-46bd-8382-e922a9835e20','ACTIVE'),('43181e6e-61b6-429e-b646-f5fa6d512145','192.168.1.14','8d7fcec0-00d5-4996-87cd-4c0c6d842ca9','ACTIVE'),('452a29e4-1d2f-4370-8c90-4b1f525740a5','192.168.40.106','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('46462713-8cc3-46cf-ac17-241de37f7585','192.168.1.1','8d7fcec0-00d5-4996-87cd-4c0c6d842ca9','ACTIVE'),('4a4c2f83-b402-44a2-a5de-92440a4acb8f','192.168.40.219','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('4aa7a8a9-ee2a-4069-b2e8-5488e5fcb031','192.168.40.74','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('4ffe7946-a3d4-4ba3-9deb-a3b81580fc81','192.168.40.186','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('514a0302-ccb1-4d9b-956c-6dc99bf1fc05','192.168.5.59','c9f2ca2f-a601-4d60-b759-489b40c2fd30','ACTIVE'),('5bdf9209-94b6-4c7a-969a-90d596f68dac','192.168.40.172','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('6118d6fd-2a6f-4b34-87c5-80342dd12437','192.168.2.10','d3691393-9439-46bd-8382-e922a9835e20','ACTIVE'),('650a3f1d-e4fa-4089-9bb9-c70ae242d48a','192.168.1.16','8d7fcec0-00d5-4996-87cd-4c0c6d842ca9','ACTIVE'),('786e4de7-dc03-4ef4-ad67-89116130454e','192.168.1.11','8d7fcec0-00d5-4996-87cd-4c0c6d842ca9','ACTIVE'),('78acf653-ecf3-4bad-814a-0df2588b4412','192.168.40.8','807bfac4-46a4-4654-b4df-faf0361c5a6b','ACTIVE'),('8058df54-8d57-4274-a48c-2ed41f968644','192.168.3.2','39b3074f-e04e-4c84-9b53-1db825d6777f','ACTIVE'),('85c26dcd-6714-4b52-9cae-17b2e4a1ade0','192.168.40.144','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('88492c58-f205-4ea8-ae5b-aa008c8956de','192.168.1.13','8d7fcec0-00d5-4996-87cd-4c0c6d842ca9','ACTIVE'),('9fb390ca-158c-466c-98d4-20fe74449fab','192.168.40.78','807bfac4-46a4-4654-b4df-faf0361c5a6b','ACTIVE'),('a1029329-3080-4c0a-8344-2e5626c58b13','10.0.0.1','424ec853-a9d2-4011-9958-215016166ee1','ACTIVE'),('a6049033-a995-47e1-ba55-06295a86518b','192.168.1.2','8d7fcec0-00d5-4996-87cd-4c0c6d842ca9','ACTIVE'),('a8c28e7b-97e6-44ca-bdea-0cbd2389ddd6','192.168.40.103','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('af7a1dc8-cd75-4acf-9226-8acbbf87f197','192.168.40.91','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('b03d4ce2-fcf1-46ef-ae83-fa20b5e42811','192.168.5.1','c9f2ca2f-a601-4d60-b759-489b40c2fd30','ACTIVE'),('b51a3385-5ac7-49f5-9c24-6081a758889a','192.168.1.52','8d7fcec0-00d5-4996-87cd-4c0c6d842ca9','ACTIVE'),('c1f1046b-632a-4885-9653-f848351a3498','192.168.1.17','8d7fcec0-00d5-4996-87cd-4c0c6d842ca9','ACTIVE'),('c2b48ff0-8439-4d10-b72d-dcc8d55f2f02','192.168.40.15','807bfac4-46a4-4654-b4df-faf0361c5a6b','ACTIVE'),('c80ad452-4eca-4ef4-8c5d-56d375f5a51f','192.168.2.1','d3691393-9439-46bd-8382-e922a9835e20','ACTIVE'),('cabf9beb-eba0-43d1-82c3-e5d2d7933aff','192.168.40.231','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('cd583e1f-e3fe-402a-90dd-8b92a6005f00','192.168.5.75','c9f2ca2f-a601-4d60-b759-489b40c2fd30','ACTIVE'),('dfb1f35e-4e68-498b-bb54-fa93c85f0b07','192.168.40.160','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('dfc09dd8-b19f-4ef2-99d4-592d1a309aaf','192.168.5.2','c9f2ca2f-a601-4d60-b759-489b40c2fd30','ACTIVE'),('e87c7ff5-695f-4854-9e3e-86df83cfada8','192.168.233.2','06c13e3d-95b6-40e1-920f-368f1a6b815d','ACTIVE'),('ec7a6c21-f975-4bbd-8f98-0769db3e0cf7','192.168.40.50','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('f4bac8bb-ad32-47cb-bd39-4b6da3edc257','192.168.40.42','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('f8c4f25f-726a-4db7-abbf-e51700041ac1','192.168.40.162','807bfac4-46a4-4654-b4df-faf0361c5a6b','N/A'),('fae1a79a-af10-4f4a-aaa2-0e21acff2efd','192.168.1.15','8d7fcec0-00d5-4996-87cd-4c0c6d842ca9','ACTIVE'),('1cbb7462-6117-4c28-8c2e-eebf8b996625','60.60.6.48','503dd905-9ba5-4f6d-9678-1eb529b313ef','ACTIVE'),('89ae5e5e-a835-4b94-b6ee-f0fe9638df14','192.168.40.244','807bfac4-46a4-4654-b4df-faf0361c5a6b','ACTIVE'),('a4d0cb09-f356-4a3d-a028-ea28f339a797','60.60.6.2','503dd905-9ba5-4f6d-9678-1eb529b313ef','ACTIVE'),('f5f6dd42-9129-48c6-b2ae-c9eab60c8003','60.60.6.1','503dd905-9ba5-4f6d-9678-1eb529b313ef','ACTIVE'),('0d629c03-0011-430f-bd2b-a2237561718e','2.20.20.2','37aacf4b-d74e-4e2c-a255-b15581b43e19','ACTIVE'),('6a71cffd-81d3-47cd-b218-eff26e8ba39d','192.168.40.155','807bfac4-46a4-4654-b4df-faf0361c5a6b','ACTIVE'),('822917fd-5e9b-4f7b-865e-a5445fcd5022','2.20.20.176','37aacf4b-d74e-4e2c-a255-b15581b43e19','ACTIVE'),('e5553c7e-e103-4ef5-b308-0edfd161d29a','2.20.20.1','37aacf4b-d74e-4e2c-a255-b15581b43e19','ACTIVE');
/*!40000 ALTER TABLE `ports_openstack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `cformat` char(2) NOT NULL DEFAULT '',
  `format_file` varchar(255) NOT NULL DEFAULT '',
  `font_size` smallint(2) unsigned NOT NULL DEFAULT '0',
  `alignment` smallint(2) unsigned NOT NULL DEFAULT '0',
  `graph_linked` char(2) NOT NULL DEFAULT '',
  `intrvl` smallint(2) unsigned NOT NULL DEFAULT '0',
  `count` smallint(2) unsigned NOT NULL DEFAULT '0',
  `offset` int(12) unsigned NOT NULL DEFAULT '0',
  `mailtime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(64) NOT NULL DEFAULT '',
  `from_name` varchar(40) NOT NULL,
  `from_email` text NOT NULL,
  `email` text NOT NULL,
  `bcc` text NOT NULL,
  `attachment_type` smallint(2) unsigned NOT NULL DEFAULT '1',
  `graph_height` smallint(2) unsigned NOT NULL DEFAULT '0',
  `graph_width` smallint(2) unsigned NOT NULL DEFAULT '0',
  `graph_columns` smallint(2) unsigned NOT NULL DEFAULT '0',
  `thumbnails` char(2) NOT NULL DEFAULT '',
  `lastsent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `enabled` char(2) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mailtime` (`mailtime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cacri Reporting Reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_items`
--

DROP TABLE IF EXISTS `reports_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tree_id` int(10) unsigned NOT NULL DEFAULT '0',
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tree_cascade` char(2) NOT NULL DEFAULT '',
  `graph_name_regexp` varchar(128) NOT NULL DEFAULT '',
  `host_template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `host_id` int(10) unsigned NOT NULL DEFAULT '0',
  `graph_template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `local_graph_id` int(10) unsigned NOT NULL DEFAULT '0',
  `timespan` int(10) unsigned NOT NULL DEFAULT '0',
  `align` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `item_text` text NOT NULL,
  `font_size` smallint(2) unsigned NOT NULL DEFAULT '10',
  `sequence` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cacti Reporting Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_items`
--

LOCK TABLES `reports_items` WRITE;
/*!40000 ALTER TABLE `reports_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restriction_domain`
--

DROP TABLE IF EXISTS `restriction_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restriction_domain` (
  `id_restriction` int(11) NOT NULL AUTO_INCREMENT,
  `name_restriction` varchar(50) DEFAULT NULL,
  `limit_restriction` varchar(50) DEFAULT NULL,
  `state_restriction` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_restriction` (`id_restriction`),
  KEY `domain` (`domain`),
  CONSTRAINT `restriction_domain_ibfk_1` FOREIGN KEY (`domain`) REFERENCES `arqs_testbedims` (`dominio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restriction_domain`
--

LOCK TABLES `restriction_domain` WRITE;
/*!40000 ALTER TABLE `restriction_domain` DISABLE KEYS */;
INSERT INTO `restriction_domain` VALUES (33,'max_ram','20','0','60.60.6.0'),(34,'max_disk','20','0','60.60.6.0'),(35,'max_vcpu','20','0','60.60.6.0'),(36,'max_vm','20','0','60.60.6.0'),(37,'max_ram','20','0','2.20.20.0'),(38,'max_disk','20','0','2.20.20.0'),(39,'max_vcpu','20','0','2.20.20.0'),(40,'max_vm','20','0','2.20.20.0');
/*!40000 ALTER TABLE `restriction_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `router_openstack`
--

DROP TABLE IF EXISTS `router_openstack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `router_openstack` (
  `id_router` varchar(255) DEFAULT NULL,
  `name_router` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `sub_net` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id_router` (`id_router`),
  KEY `domain` (`domain`),
  CONSTRAINT `router_openstack_ibfk_1` FOREIGN KEY (`domain`) REFERENCES `arqs_testbedims` (`dominio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `router_openstack`
--

LOCK TABLES `router_openstack` WRITE;
/*!40000 ALTER TABLE `router_openstack` DISABLE KEYS */;
INSERT INTO `router_openstack` VALUES ('d864b781-1cf9-4351-9bfc-a8ab4314f72c','testbed1','60.60.6.0',NULL),('c042d23b-1e8e-4ee3-b4c7-c1d5aaf2e789','testbed2','2.20.20.0',NULL);
/*!40000 ALTER TABLE `router_openstack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_openstack`
--

DROP TABLE IF EXISTS `server_openstack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_openstack` (
  `id_server` varchar(50) DEFAULT NULL,
  `name_server` varchar(50) DEFAULT NULL,
  `id_image` varchar(50) DEFAULT NULL,
  `ip_local` varchar(50) DEFAULT NULL,
  `ip_public` varchar(50) DEFAULT NULL,
  `id_flavor` varchar(50) DEFAULT NULL,
  `key_name` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `name_security_group` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_server` (`id_server`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_openstack`
--

LOCK TABLES `server_openstack` WRITE;
/*!40000 ALTER TABLE `server_openstack` DISABLE KEYS */;
INSERT INTO `server_openstack` VALUES ('e2f80f31-2a0e-4de8-b51b-d5f15d60980f','allInOne','ffd93b55-858c-4ca2-9f0b-0e7890966392','2.20.20.176','','d2','Testbed_vIMS','ACTIVE','default'),('6d8b319e-ed0e-4080-8dc1-b787fd81d1fb','allInOne','ffd93b55-858c-4ca2-9f0b-0e7890966392','60.60.6.48','','d2','Testbed_vIMS','ACTIVE','default'),('1831f27c-4bab-4a07-b66d-0e8711671a85','DNS-1','ffd93b55-858c-4ca2-9f0b-0e7890966392','192.168.1.52','192.168.40.31','49f21699-6c1e-494d-a99c-77021a1fd6e2','Testbed_vIMS','ACTIVE','default'),('fc780992-5bc7-4934-8dee-4e81a895e4f7','ibcf','ffd93b55-858c-4ca2-9f0b-0e7890966392','192.168.1.17','192.168.40.186','49f21699-6c1e-494d-a99c-77021a1fd6e2','Testbed_vIMS','ACTIVE','default'),('d1259f81-ebcc-42fe-ab98-194f4f5fc43b','dime','ffd93b55-858c-4ca2-9f0b-0e7890966392','192.168.1.16','192.168.40.74','49f21699-6c1e-494d-a99c-77021a1fd6e2','Testbed_vIMS','ACTIVE','default'),('9106cf9f-c9c4-465f-8c39-df199e60f4d1','vellum','ffd93b55-858c-4ca2-9f0b-0e7890966392','192.168.1.15','192.168.40.106','49f21699-6c1e-494d-a99c-77021a1fd6e2','Testbed_vIMS','ACTIVE','default'),('078f05d7-0729-4a77-8cab-034a2d2b875a','homer','ffd93b55-858c-4ca2-9f0b-0e7890966392','192.168.1.14','192.168.40.231','49f21699-6c1e-494d-a99c-77021a1fd6e2','Testbed_vIMS','ACTIVE','default'),('7c9ede63-3208-4617-9bec-1f6fc9284706','ellis','ffd93b55-858c-4ca2-9f0b-0e7890966392','192.168.1.13','192.168.40.234','49f21699-6c1e-494d-a99c-77021a1fd6e2','Testbed_vIMS','ACTIVE','default'),('ec610228-ac95-434f-a3cb-4fe9ff102009','sprout','ffd93b55-858c-4ca2-9f0b-0e7890966392','192.168.1.12','192.168.40.42','49f21699-6c1e-494d-a99c-77021a1fd6e2','Testbed_vIMS','ACTIVE','default'),('29e3a183-d285-4e11-8a8a-abb2f63b0eb8','bono','ffd93b55-858c-4ca2-9f0b-0e7890966392','192.168.1.11','192.168.40.101','49f21699-6c1e-494d-a99c-77021a1fd6e2','Testbed_vIMS','ACTIVE','default'),('4903d5fd-13f0-45bf-93ca-b3b99693f028','SIPP','ffd93b55-858c-4ca2-9f0b-0e7890966392','192.168.2.11','192.168.40.173','49f21699-6c1e-494d-a99c-77021a1fd6e2','Testbed_vIMS','ACTIVE','default'),('79d9ef74-6287-4f99-b8c7-ee87ce0aa9c0','CW-2','ffd93b55-858c-4ca2-9f0b-0e7890966392','192.168.3.10','192.168.40.162','49f21699-6c1e-494d-a99c-77021a1fd6e2','Testbed_vIMS','ACTIVE','default'),('4daff1fb-e4a4-4817-b19b-fbb88b59e836','CW-1','ffd93b55-858c-4ca2-9f0b-0e7890966392','192.168.2.10','192.168.40.91','49f21699-6c1e-494d-a99c-77021a1fd6e2','Testbed_vIMS','ACTIVE','default');
/*!40000 ALTER TABLE `server_openstack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(32) NOT NULL,
  `remote_addr` varchar(25) NOT NULL DEFAULT '',
  `access` int(10) unsigned DEFAULT NULL,
  `data` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Used for Database based Session Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('date','2019-08-14 21:10:01'),('path_cactilog','/var/log/cacti/cacti.log'),('path_php_binary','/usr/bin/php'),('path_rrdtool','/usr/bin/rrdtool'),('path_snmpbulkwalk','/usr/bin/snmpbulkwalk'),('path_snmpget','/usr/bin/snmpget'),('path_snmpgetnext','/usr/bin/snmpgetnext'),('path_snmptrap','/usr/bin/snmptrap'),('path_snmpwalk','/usr/bin/snmpwalk'),('path_spine','/usr/sbin/spine'),('path_spine_config','/etc/cacti/spine.conf'),('path_webroot','/usr/share/cacti/site'),('poller_lastrun_1','1565831401'),('poller_replicate_data_input_crc','05626fc0e6f0ab0ea86bf52b5e49f23763b2edde'),('poller_replicate_data_input_fields_crc','b02d312882f6618d5998238d7eedbc4e67c043e1'),('poller_replicate_data_source_cache_crc_1','8302c4318a619addb0b5b184d30e30f859b2ce88'),('poller_replicate_device_cache_crc_1','40670ee386bdab4b9a0611277d5ceb588f12064b'),('poller_replicate_snmp_query_crc','94cbf049bd82461cf2102139c65fee7394a21146'),('rrdtool_version','rrd-1.7.x'),('selected_theme','classic'),('selective_device_debug','3'),('stats_poller','Time:0.1649 Method:cmd.php Processes:1 Threads:N/A Hosts:-1 HostsPerProcess:-1 DataSources:4 RRDsProcessed:0'),('stats_recache_1','RecacheTime:0.0 DevicesRecached:0');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_tree`
--

DROP TABLE IF EXISTS `settings_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_tree` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `graph_tree_item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`graph_tree_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_tree`
--

LOCK TABLES `settings_tree` WRITE;
/*!40000 ALTER TABLE `settings_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_user`
--

DROP TABLE IF EXISTS `settings_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_user` (
  `user_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_user`
--

LOCK TABLES `settings_user` WRITE;
/*!40000 ALTER TABLE `settings_user` DISABLE KEYS */;
INSERT INTO `settings_user` VALUES (5,'default_timeshift','7'),(5,'default_timespan','7'),(5,'graph_template_id','0'),(5,'num_columns_tree','2'),(5,'thumbnail_section_tree_2',''),(5,'treeview_graphs_per_page','10');
/*!40000 ALTER TABLE `settings_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_user_group`
--

DROP TABLE IF EXISTS `settings_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_user_group` (
  `group_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`group_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the Default User Group Graph Settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_user_group`
--

LOCK TABLES `settings_user_group` WRITE;
/*!40000 ALTER TABLE `settings_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `address1` varchar(100) DEFAULT '',
  `address2` varchar(100) DEFAULT '',
  `city` varchar(50) DEFAULT '',
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT '',
  `country` varchar(30) DEFAULT '',
  `timezone` varchar(40) DEFAULT '',
  `latitude` decimal(13,10) NOT NULL DEFAULT '0.0000000000',
  `longitude` decimal(13,10) NOT NULL DEFAULT '0.0000000000',
  `alternate_id` varchar(30) DEFAULT '',
  `notes` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `city` (`city`),
  KEY `state` (`state`),
  KEY `postal_code` (`postal_code`),
  KEY `country` (`country`),
  KEY `alternate_id` (`alternate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains information about customer sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query`
--

DROP TABLE IF EXISTS `snmp_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_query` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `xml_path` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data_input_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmp_query`
--

LOCK TABLES `snmp_query` WRITE;
/*!40000 ALTER TABLE `snmp_query` DISABLE KEYS */;
INSERT INTO `snmp_query` VALUES (1,'8ffa36c1864124b38bcda2ae9bd61f46','<path_cacti>/resource/script_queries/unix_disk.xml','Unix - Get Mounted Partitions','Queries a list of mounted partitions on a unix-based host with the',0,11),(2,'d75e406fdeca4fcef45b8be3a9a63cbc','<path_cacti>/resource/snmp_queries/interface.xml','SNMP - Interface Statistics','Queries a host for a list of monitorable interfaces',0,2),(3,'3c1b27d94ad208a0090f293deadde753','<path_cacti>/resource/snmp_queries/net-snmp_disk.xml','Net-SNMP -  Get Monitored Partitions','Retrieves a list of monitored partitions/disks from a net-snmp enabled host.',0,2),(4,'9343eab1f4d88b0e61ffc9d020f35414','<path_cacti>/resource/script_server/host_disk.xml','SNMP - Get Mounted Partitions','Gets a list of partitions using SNMP',0,12),(5,'0d1ab53fe37487a5d0b9e1d3ee8c1d0d','<path_cacti>/resource/script_server/host_cpu.xml','SNMP - Get Processor Information','Gets usage for each processor in the system using the host MIB.',0,12),(6,'edb9fb7e6656f44e34652960625032b5','<path_cacti>/resource/snmp_queries/net-snmp_devio.xml','Net-SNMP - Get Device I/O','Retrieves the I/O for all disk and memory devices',0,2);
/*!40000 ALTER TABLE `snmp_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph`
--

DROP TABLE IF EXISTS `snmp_query_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_query_graph` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `snmp_query_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `graph_template_id_name` (`graph_template_id`,`name`),
  KEY `snmp_query_id_name` (`snmp_query_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmp_query_graph`
--

LOCK TABLES `snmp_query_graph` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph` DISABLE KEYS */;
INSERT INTO `snmp_query_graph` VALUES (1,'a0b3e7b63c2e66f9e1ea24a16ff245fc',1,'Available Disk Space',5),(2,'a4b829746fb45e35e10474c36c69c0cf',2,'In/Out Errors/Discarded Packets',9),(3,'01e33224f8b15997d3d09d6b1bf83e18',2,'In/Out Non-Unicast Packets',11),(4,'1e6edee3115c42d644dbd014f0577066',2,'In/Out Unicast Packets',10),(5,'ab93b588c29731ab15db601ca0bc9dec',2,'In/Out Bytes (64-bit Counters)',12),(6,'ae34f5f385bed8c81a158bf3030f1089',2,'In/Out Bits',8),(7,'1e16a505ddefb40356221d7a50619d91',2,'In/Out Bits (64-bit Counters)',8),(8,'d1e0d9b8efd4af98d28ce2aad81a87e7',2,'In/Out Bytes',12),(9,'ed7f68175d7bb83db8ead332fc945720',2,'In/Out Bits with 95th Percentile',13),(10,'f85386cd2fc94634ef167c7f1e5fbcd0',2,'In/Out Bits with Total Bandwidth',14),(11,'7d309bf200b6e3cdb59a33493c2e58e0',2,'In/Out Bytes with Total Bandwidth',15),(12,'a06c23783baa5022299706f5ff2a56e7',2,'In/Out Bits (64-bit Counters) with 95th Percentile',13),(13,'1e24c56421c50a2114c15afd159a538c',2,'In/Out Bits (64-bit Counters) with Total Bandwidth',14),(14,'fefe4ae1ec313b6875d6502319f08cde',2,'In/Out Bytes (64-bit Counters) with Total Bandwidth',15),(15,'c5792b18bf1263b5bf3826f9196376d9',2,'Interface - Broadcast Packets (Legacy)',17),(16,'524e65b03f12b772f5c5bdad3f9dd783',2,'Interface - Multicast Packets (Legacy)',16),(17,'da43655bf1f641b07579256227806977',3,'Available/Used Disk Space',27),(18,'46c4ee688932cf6370459527eceb8ef3',4,'Available Disk Space',28),(19,'4a515b61441ea5f27ab7dee6c3cb7818',5,'Get Processor Utilization',29),(20,'a9290ce34d38bb09074ee5d96679694b',6,'Net-SNMP - Device I/O - Bytes Read/Written',30),(21,'44735d5afb573d8a19af9d0d85d07c4d',6,'Net-SNMP - Device I/O - Load Averages',31),(22,'2bb111ab931b86766db8e67150a6b5a2',6,'Net-SNMP - Device I/O - Reads/Writes',32);
/*!40000 ALTER TABLE `snmp_query_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph_rrd`
--

DROP TABLE IF EXISTS `snmp_query_graph_rrd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_query_graph_rrd` (
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data_template_rrd_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `snmp_field_name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`snmp_query_graph_id`,`data_template_id`,`data_template_rrd_id`),
  KEY `data_template_rrd_id` (`data_template_rrd_id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmp_query_graph_rrd`
--

LOCK TABLES `snmp_query_graph_rrd` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph_rrd` DISABLE KEYS */;
INSERT INTO `snmp_query_graph_rrd` VALUES (1,6,8,'dskAvailable'),(1,6,9,'dskUsed'),(2,10,14,'ifInErrors'),(2,10,15,'ifInDiscards'),(2,10,16,'ifOutDiscards'),(2,10,17,'ifOutErrors'),(3,12,20,'ifOutNUcastPkts'),(3,12,21,'ifInNUcastPkts'),(4,11,18,'ifInUcastPkts'),(4,11,19,'ifOutUcastPkts'),(5,9,12,'ifHCInOctets'),(5,9,13,'ifHCOutOctets'),(6,9,12,'ifInOctets'),(6,9,13,'ifOutOctets'),(7,9,12,'ifHCInOctets'),(7,9,13,'ifHCOutOctets'),(8,9,12,'ifInOctets'),(8,9,13,'ifOutOctets'),(9,9,12,'ifInOctets'),(9,9,13,'ifOutOctets'),(10,9,12,'ifInOctets'),(10,9,13,'ifOutOctets'),(11,9,12,'ifInOctets'),(11,9,13,'ifOutOctets'),(12,9,12,'ifHCInOctets'),(12,9,13,'ifHCOutOctets'),(13,9,12,'ifHCInOctets'),(13,9,13,'ifHCOutOctets'),(14,9,12,'ifHCInOctets'),(14,9,13,'ifHCOutOctets'),(15,12,20,'ifOutBroadcastPkts'),(15,12,21,'ifInBroadcastPkts'),(16,11,18,'ifInMulticastPkts'),(16,11,19,'ifOutMulticastPkts'),(17,29,40,'dskAvail'),(17,29,41,'dskUsed'),(18,30,42,'hrStorageUsed'),(18,30,43,'hrStorageSize'),(19,31,44,'hrProcessorLoad'),(20,32,46,'diskIONWritten'),(20,32,51,'diskIONRead'),(21,32,48,'diskIOLA1'),(21,32,49,'diskIOLA5'),(21,32,50,'diskIOLA15'),(22,32,45,'diskIOReads'),(22,32,47,'diskIOWrites');
/*!40000 ALTER TABLE `snmp_query_graph_rrd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph_rrd_sv`
--

DROP TABLE IF EXISTS `snmp_query_graph_rrd_sv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_query_graph_rrd_sv` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`),
  KEY `data_template_id` (`data_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmp_query_graph_rrd_sv`
--

LOCK TABLES `snmp_query_graph_rrd_sv` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph_rrd_sv` DISABLE KEYS */;
INSERT INTO `snmp_query_graph_rrd_sv` VALUES (1,'cb09784ba05e401a3f1450126ed1e395',1,6,1,'name','|host_description| - Free Space - |query_dskDevice|'),(2,'6537b3209e0697fbec278e94e7317b52',2,10,1,'name','|host_description| - Errors - |query_ifIP| - |query_ifName|'),(3,'6d3f612051016f48c951af8901720a1c',2,10,2,'name','|host_description| - Errors - |query_ifName|'),(4,'62bc981690576d0b2bd0041ec2e4aa6f',2,10,3,'name','|host_description| - Errors - |query_ifIP|/|query_ifDescr|'),(5,'adb270d55ba521d205eac6a21478804a',2,10,4,'name','|host_description| - Errors - |query_ifDescr|'),(6,'77065435f3bbb2ff99bc3b43b81de8fe',3,12,1,'name','|host_description| - Non-Unicast Packets - |query_ifIP| - |query_ifName|'),(7,'240d8893092619c97a54265e8d0b86a1',3,12,2,'name','|host_description| - Non-Unicast Packets - |query_ifName|'),(8,'4b200ecf445bdeb4c84975b74991df34',3,12,3,'name','|host_description| - Non-Unicast Packets - |query_ifIP|/|query_ifDescr|'),(9,'d6da3887646078e4d01fe60a123c2179',3,12,4,'name','|host_description| - Non-Unicast Packets - |query_ifDescr|'),(10,'ce7769b97d80ca31d21f83dc18ba93c2',4,11,1,'name','|host_description| - Unicast Packets - |query_ifIP| - |query_ifName|'),(11,'1ee1f9717f3f4771f7f823ca5a8b83dd',4,11,2,'name','|host_description| - Unicast Packets - |query_ifName|'),(12,'a7dbd54604533b592d4fae6e67587e32',4,11,3,'name','|host_description| - Unicast Packets - |query_ifIP|/|query_ifDescr|'),(13,'b148fa7199edcf06cd71c89e5c5d7b63',4,11,4,'name','|host_description| - Unicast Packets - |query_ifDescr|'),(14,'c582d3b37f19e4a703d9bf4908dc6548',5,9,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(15,'ce0b9c92a15759d3ddbd7161d26a98b7',5,9,1,'rrd_maximum','|query_ifSpeed|'),(16,'e1be83d708ed3c0b8715ccb6517a0365',5,9,2,'name','|host_description| - Traffic - |query_ifName|'),(17,'57a9ae1f197498ca8dcde90194f61cbc',5,9,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(18,'0110e120981c7ff15304e4a85cb42cbe',5,9,4,'name','|host_description| - Traffic - |query_ifDescr|'),(19,'87a659326af8c75158e5142874fd74b0',6,9,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(20,'7e093c535fa3d810fa76fc3d8c80c94b',6,9,1,'rrd_maximum','|query_ifSpeed|'),(21,'14aa2dead86bbad0f992f1514722c95e',6,9,2,'name','|host_description| - Traffic - |query_ifName|'),(22,'70390712158c3c5052a7d830fb456489',6,9,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(23,'084efd82bbddb69fb2ac9bd0b0f16ac6',6,9,4,'name','|host_description| - Traffic - |query_ifDescr|'),(24,'2e8b27c63d98249096ad5bc320787f43',7,9,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(25,'e85ddc56efa677b70448f9e931360b77',7,9,1,'rrd_maximum','|query_ifSpeed|'),(26,'8d820d091ec1a9683cfa74a462f239ee',7,9,2,'name','|host_description| - Traffic - |query_ifName|'),(27,'62a47c18be10f273a5f5a13a76b76f54',7,9,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(28,'37bb8c5b38bb7e89ec88ea7ccacf44d4',7,9,4,'name','|host_description| - Traffic - |query_ifDescr|'),(29,'db6547fe6d8a04e7d007eb8aab9d4ec5',7,9,5,'name','|host_description| - Traffic - |query_ifAlias|'),(30,'c7ee2110bf81639086d2da03d9d88286',8,9,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(31,'27eb220995925e1a5e0e41b2582a2af6',8,9,1,'rrd_maximum','|query_ifSpeed|'),(32,'8ef8ae2ef548892ab95bb6c9f0b3170e',8,9,2,'name','|host_description| - Traffic - |query_ifName|'),(33,'3a0f707d1c8fd0e061b70241541c7e2e',8,9,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(34,'2347e9f53564a54d43f3c00d4b60040d',8,9,4,'name','|host_description| - Traffic - |query_ifDescr|'),(35,'7e87efd0075caba9908e2e6e569b25b0',9,9,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(36,'3b018f789ff72cc5693ef79e3a794370',9,9,1,'rrd_maximum','|query_ifSpeed|'),(37,'dd28d96a253ab86846aedb25d1cca712',9,9,2,'name','|host_description| - Traffic - |query_ifName|'),(38,'ce425fed4eb3174e4f1cde9713eeafa0',9,9,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(39,'d0d05156ddb2c65181588db4b64d3907',9,9,4,'name','|host_description| - Traffic - |query_ifDescr|'),(40,'b225229dbbb48c1766cf90298674ceed',10,9,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(41,'e9ab404a294e406c20fdd30df766161f',10,9,1,'rrd_maximum','|query_ifSpeed|'),(42,'c79248ddbbd195907260887b021a055d',10,9,2,'name','|host_description| - Traffic - |query_ifName|'),(43,'12a6750d973b7f14783f205d86220082',10,9,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(44,'25b151fcfe093812cb5c208e36dd697e',10,9,4,'name','|host_description| - Traffic - |query_ifDescr|'),(45,'119578a4f01ab47e820b0e894e5e5bb3',11,9,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(46,'fdc4cb976c4b9053bfa2af791a21c5b5',11,9,1,'rrd_maximum','|query_ifSpeed|'),(47,'940e57d24b2623849c77b59ed05931b9',11,9,2,'name','|host_description| - Traffic - |query_ifName|'),(48,'0f045eab01bbc4437b30da568ed5cb03',11,9,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(49,'bd70bf71108d32f0bf91b24c85b87ff0',11,9,4,'name','|host_description| - Traffic - |query_ifDescr|'),(50,'af8c10bb98e3d96d7aeed76069f5d8f6',12,9,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName| '),(51,'d5fe4ab8a8049c76715b11367544a77b',12,9,1,'rrd_maximum','|query_ifSpeed|'),(52,'eb9aa71f654327ecea55af11c6ff06ac',12,9,2,'name','|host_description| - Traffic - |query_ifName|'),(53,'afe143588235f0465993fd642dbc2ad9',12,9,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(54,'424ebeaaef4a5cbffdc4611beeb7c19c',12,9,4,'name','|host_description| - Traffic - |query_ifDescr|'),(55,'694c4ef8e495357d8303d1c127d0c55e',13,9,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(56,'0a772cfb504e15d7e784dd0e73ced97a',13,9,1,'rrd_maximum','|query_ifSpeed|'),(57,'114c55114ede9f492d84b1c79d3bbae6',13,9,2,'name','|host_description| - Traffic - |query_ifName| '),(58,'8aa4f743291cd2afdea20a4180e6eb42',13,9,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(59,'3d4ba44d5e6a7bbcd5a448b9ef113c59',13,9,4,'name','|host_description| - Traffic - |query_ifDescr|'),(60,'e29d0a2547c6a48e73ce2c800e308515',14,9,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(61,'cf780d419b924d0cbbb173b9a4918208',14,9,1,'rrd_maximum','|query_ifSpeed|'),(62,'3aeeb54a14baa08beaa59a1cd6af12c8',14,9,2,'name','|host_description| - Traffic - |query_ifName|'),(63,'30aaee4b45f97ac74641442e17e4527e',14,9,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(64,'da2842ddfe7ea7d7b06266cc107169aa',14,9,4,'name','|host_description| - Traffic - |query_ifDescr|'),(65,'fc4e456b3fe4b712c943700ef1b3be80',15,12,1,'name','|host_description| - Broadcast Packets - |query_ifAlias| '),(66,'aea995fae5b2500b69819a09d20e9760',15,12,2,'name','|host_description| - Broadcast Packets - |query_ifName|'),(67,'8e07b64fa0767a318ec6d0320c3f9e2c',15,12,3,'name','|host_description| - Broadcast Packets - |query_ifIP| (|query_ifDescr|)'),(68,'9e7c0ec6d0025a509af6a510804c2488',15,12,4,'name','|host_description| - Broadcast Packets - |query_ifDescr|/|query_ifIndex|'),(69,'87418ca7ce94c355ba7bbc8625f53f92',16,11,1,'name','|host_description| - Multicast Packets - |query_ifAlias|'),(70,'ab0e5022e10f6529ac66772815be583f',16,11,2,'name','|host_description| - Multicast Packets - |query_ifName|'),(71,'27da5a787ff471f3da8bde88f6ecd4c9',16,11,3,'name','|host_description| - Multicast Packets - |query_ifIP| (|query_ifDescr|)'),(72,'3ac3c16381774c78791b5b568d06bc4f',16,11,4,'name','|host_description| - Multicast Packets - |query_ifDescr|/|query_ifIndex|'),(73,'5d3a8b2f4a454e5b0a1494e00fe7d424',17,29,1,'name','|host_description| - Partition - |query_dskDevice|'),(74,'a3f280327b1592a1a948e256380b544f',18,30,1,'name','|host_description| - Used Space - |query_hrStorageDescr|'),(75,'b5a724edc36c10891fa2a5c370d55b6f',19,31,1,'name','|host_description| - CPU Utilization - CPU|query_hrProcessorFrwID|');
/*!40000 ALTER TABLE `snmp_query_graph_rrd_sv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph_sv`
--

DROP TABLE IF EXISTS `snmp_query_graph_sv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_query_graph_sv` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmp_query_graph_sv`
--

LOCK TABLES `snmp_query_graph_sv` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph_sv` DISABLE KEYS */;
INSERT INTO `snmp_query_graph_sv` VALUES (1,'f21b23df740bc4a2d691d2d7b1b18dba',1,1,'title','|host_description| - Disk Space - |query_dskDevice|'),(2,'0180de36c2fc1b1c3d929705cdaadfc6',2,1,'title','|host_description| - Errors - |query_ifAlias|'),(3,'299d3434851fc0d5c0e105429069709d',2,2,'title','|host_description| - Errors - |query_ifName|'),(4,'8c8860b17fd67a9a500b4cb8b5e19d4b',2,3,'title','|host_description| - Errors - |query_ifIP| (|query_ifDescr|)'),(5,'d96360ae5094e5732e7e7496ceceb636',2,4,'title','|host_description| - Errors - |query_ifDescr|/|query_ifIndex|'),(6,'6a1d5e477fd0b8a4d743993be0fa2c8c',3,1,'title','|host_description| - Non-Unicast Packets - |query_ifAlias|'),(7,'750a290cadc3dc60bb682a5c5f47df16',3,2,'title','|host_description| - Non-Unicast Packets - |query_ifName|'),(8,'bde195eecc256c42ca9725f1f22c1dc0',3,3,'title','|host_description| - Non-Unicast Packets - |query_ifIP| (|query_ifDescr|)'),(9,'d9e97d22689e4ffddaca23b46f2aa306',3,4,'title','|host_description| - Non-Unicast Packets - |query_ifDescr|/|query_ifIndex|'),(10,'54f5a5508fc525a15bc2be83a880e0c9',4,1,'title','|host_description| - Unicast Packets - |query_ifAlias|'),(11,'48ceaba62e0c2671a810a7f1adc5f751',4,2,'title','|host_description| - Unicast Packets - |query_ifName|'),(12,'d6258884bed44abe46d264198adc7c5d',4,3,'title','|host_description| - Unicast Packets - |query_ifIP| (|query_ifDescr|)'),(13,'6eb58d9835b2b86222306d6ced9961d9',4,4,'title','|host_description| - Unicast Packets - |query_ifDescr|/|query_ifIndex|'),(14,'74c33dd7c052d14a8224148ab3fe23ae',5,1,'title','|host_description| - Traffic - |query_ifAlias|'),(15,'0a5eb36e98c04ad6be8e1ef66caeed3c',5,2,'title','|host_description| - Traffic - |query_ifName|'),(16,'4c4386a96e6057b7bd0b78095209ddfa',5,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(17,'fd3a384768b0388fa64119fe2f0cc113',5,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(18,'aafaab75d93c10a760d600c4ab4a742c',6,2,'title','|host_description| - Traffic - |query_ifAlias|'),(19,'bda15298139ad22bdc8a3b0952d4e3ab',6,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(20,'29e48483d0471fcd996bfb702a5960aa',6,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(21,'49dca5592ac26ff149a4fbd18d690644',6,5,'title','|host_description| - Traffic - |query_ifName|'),(22,'3f42d358965cb94ce4f708b59e04f82b',7,1,'title','|host_description| - Traffic - |query_ifName|'),(23,'69c14fbcc23aecb9920b3cdad7f89901',7,2,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(24,'a1d061ff7fb9875b29c54de4fadddcdc',7,3,'title','|host_description| - Traffic - |query_ifAlias|'),(25,'45f44b2f811ea8a8ace1cbed8ef906f1',7,4,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(26,'a5899a68c68e50959a099d7ac591873a',8,1,'title','|host_description| - Traffic - |query_ifAlias|'),(27,'7fb4a267065f960df81c15f9022cd3a4',8,2,'title','|host_description| - Traffic - |query_ifName|'),(28,'e403f5a733bf5c8401a110609683deb3',8,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(29,'809c2e80552d56b65ca496c1c2fff398',8,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(30,'1acc9985eb91a7234ff97608cb85b0f5',9,1,'title','|host_description| - Traffic - |query_ifAlias|'),(31,'f434ec853c479d424276f367e9806a75',9,2,'title','|host_description| - Traffic - |query_ifName|'),(32,'9b085245847444c5fb90ebbf4448e265',9,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(33,'5977863f28629bd8eb93a2a9cbc3e306',9,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(34,'820eb01dd91c9026fbdf667a7f25302f',10,1,'title','|host_description| - Traffic - |query_ifAlias|'),(35,'37b6711af3930c56309cf8956d8bbf14',10,2,'title','|host_description| - Traffic - |query_ifName|'),(36,'cc435c5884a75421329a9b08207c1c90',10,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(37,'82edeea1ec249c9818773e3145836492',10,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(38,'c0422682831631bf539023fc04615025',11,1,'title','|host_description| - Traffic - |query_ifAlias|'),(39,'87522150ee8a601b4d6a1f6b9e919c47',11,2,'title','|host_description| - Traffic - |query_ifName|'),(40,'993a87c04f550f1209d689d584aa8b45',11,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(41,'183bb486c92a566fddcb0585ede37865',11,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(42,'a877a37f5d0e6f49a5d9d99ac7e347f3',12,1,'title','|host_description| - Traffic - |query_ifAlias| '),(43,'9e42f7e5310653f35f977285e48ecfa5',12,2,'title','|host_description| - Traffic - |query_ifName| '),(44,'cab54d19353de5548e0151180cb7c5dd',12,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|) '),(45,'f9de6e508d7fa64d91d163d864b9f31a',12,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex| '),(46,'419c8f569d1695b86c1943f7204abf3d',13,1,'title','|host_description| - Traffic - |query_ifAlias|'),(47,'1819f9ccdb512f19acfdc4edcda425b5',13,2,'title','|host_description| - Traffic - |query_ifName|'),(48,'08310b48a18f195d941fcd2c4ed40e7b',13,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(49,'dffe8e880677480a795b1232fc1207e5',13,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(50,'9be678415c48e9ee7a16e5208e523c6d',14,1,'title','|host_description| - Traffic - |query_ifAlias|'),(51,'702b89f7db8eae17a358e246d6264d05',14,2,'title','|host_description| - Traffic - |query_ifName|'),(52,'1fc5aabb79ad301bee69e6bb0094df2c',14,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(53,'bb5bd62bcfbfc5ff765afe625b830d31',14,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(54,'6b166ed8f603998fdc51719da3478e55',15,1,'title','|host_description| - Broadcast Packets - |query_ifAlias|'),(55,'dd545c92388329c666f7e88f99618e87',15,2,'title','|host_description| - Broadcast Packets - |query_ifName|'),(56,'71574f16039ab62c26d626c113ebdab0',15,3,'title','|host_description| - Broadcast Packets - |query_ifIP| (|query_ifDescr|)'),(57,'555ae21f832f02689c7a6e2f690ec7d3',15,4,'title','|host_description| - Broadcast Packets - |query_ifDescr|/|query_ifIndex|'),(58,'c5e2bd31d661ba33d5169e505bf920b6',16,1,'title','|host_description| - Multicast Packets - |query_ifAlias|'),(59,'be5c494fd82964bd9bd267399c4f7a3b',16,2,'title','|host_description| - Multicast Packets - |query_ifName|'),(60,'ca3d99f3c6f8ee1e3849e28274be14ba',16,3,'title','|host_description| - Multicast Packets - |query_ifIP| (|query_ifDescr|)'),(61,'6f48f284918085de78181d9698fb35ad',16,4,'title','|host_description| - Multicast Packets - |query_ifDescr|/|query_ifIndex|'),(62,'437918b8dcd66a64625c6cee481fff61',17,1,'title','|host_description| - Disk Space - |query_dskPath|'),(63,'9852782792ede7c0805990e506ac9618',18,1,'title','|host_description| - Used Space - |query_hrStorageDescr|'),(64,'fa2f07ab54fce72eea684ba893dd9c95',19,1,'title','|host_description| - CPU Utilization - CPU|query_hrProcessorFrwID|');
/*!40000 ALTER TABLE `snmp_query_graph_sv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_cache`
--

DROP TABLE IF EXISTS `snmpagent_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_cache` (
  `oid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mib` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `otype` varchar(50) NOT NULL DEFAULT '',
  `kind` varchar(50) NOT NULL DEFAULT '',
  `max-access` varchar(50) NOT NULL DEFAULT 'not-accessible',
  `value` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(5000) NOT NULL DEFAULT '',
  PRIMARY KEY (`oid`),
  KEY `name` (`name`),
  KEY `mib_name` (`mib`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='SNMP MIB CACHE';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_cache`
--

LOCK TABLES `snmpagent_cache` WRITE;
/*!40000 ALTER TABLE `snmpagent_cache` DISABLE KEYS */;
INSERT INTO `snmpagent_cache` VALUES ('.1.3.6.1.4.1.23925','cacti','CACTI-MIB','','MODULE-IDENTITY','Node','not-accessible','','Initial version of this MIB module.'),('.1.3.6.1.4.1.23925.1','cactiAppl','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for Cacti application data'),('.1.3.6.1.4.1.23925.1.1.0','cactiApplLastUpdate','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1565831403','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.1.10.0','cactiApplSpineMaxThreads','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1','Represents the maximum threads allowed per process.'),('.1.3.6.1.4.1.23925.1.11.0','cactiApplSpineScriptServers','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1','Represents the maximum number of script servers a spine process is<br>allowed to run.'),('.1.3.6.1.4.1.23925.1.12.0','cactiApplSpineScriptTimeout','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','25','Describes the maximum time Cacti will wait on a script to complete.'),('.1.3.6.1.4.1.23925.1.13.0','cactiApplSpineMaxOids','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','10','The maximum number of snmp get OID\'s to issue per snmpbulkwalk<br>request.'),('.1.3.6.1.4.1.23925.1.14','cactiApplDeviceTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of registered hosts on a Cacti system.<br>The maximum number of entries is implementation dependent.'),('.1.3.6.1.4.1.23925.1.14.1','cactiApplDeviceEntry','CACTI-MIB','CactiApplDeviceEntry','OBJECT-TYPE','Row','not-accessible','','An entry in the table of registered hosts on a Cacti system. A row<br>in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.1.14.1.1','cactiApplDeviceIndex','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','A unique device identifier. This ID will be created by Cacti itself.'),('.1.3.6.1.4.1.23925.1.14.1.1.48','cactiApplDeviceIndex','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','48',''),('.1.3.6.1.4.1.23925.1.14.1.1.49','cactiApplDeviceIndex','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','49',''),('.1.3.6.1.4.1.23925.1.14.1.2','cactiApplDeviceDescription','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','A meaning description of a device.'),('.1.3.6.1.4.1.23925.1.14.1.2.48','cactiApplDeviceDescription','CACTI-MIB','DisplayString','DATA','Column Data','read-only','127.0.0.1',''),('.1.3.6.1.4.1.23925.1.14.1.2.49','cactiApplDeviceDescription','CACTI-MIB','DisplayString','DATA','Column Data','read-only','localhost',''),('.1.3.6.1.4.1.23925.1.14.1.3','cactiApplDeviceHostname','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Fully qualified devicename or IP address.'),('.1.3.6.1.4.1.23925.1.14.1.3.48','cactiApplDeviceHostname','CACTI-MIB','DisplayString','DATA','Column Data','read-only','127.0.0.1',''),('.1.3.6.1.4.1.23925.1.14.1.3.49','cactiApplDeviceHostname','CACTI-MIB','DisplayString','DATA','Column Data','read-only','192.168.0.13',''),('.1.3.6.1.4.1.23925.1.14.1.4','cactiApplDeviceStatus','CACTI-MIB','INTEGER','OBJECT-TYPE','Column','read-only','','The status a device can have within Cacti:<br>unknown(0)     - device has not been polled yet<br>down(1)        - device became unresponsive<br>recovering(2)  - device was down and became reachable again<br>up(3)          - device is reachable<br>disabled(4)    - device will not be monitored'),('.1.3.6.1.4.1.23925.1.14.1.4.48','cactiApplDeviceStatus','CACTI-MIB','INTEGER','DATA','Column Data','read-only','3',''),('.1.3.6.1.4.1.23925.1.14.1.4.49','cactiApplDeviceStatus','CACTI-MIB','INTEGER','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.1.14.1.5','cactiApplDeviceEventCount','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Total number of events registered for that device since last reset.'),('.1.3.6.1.4.1.23925.1.14.1.5.48','cactiApplDeviceEventCount','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.1.14.1.5.49','cactiApplDeviceEventCount','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.1.14.1.6','cactiApplDeviceFailDate','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Date of last fail'),('.1.3.6.1.4.1.23925.1.14.1.6.48','cactiApplDeviceFailDate','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0000-00-00 00:00:00',''),('.1.3.6.1.4.1.23925.1.14.1.6.49','cactiApplDeviceFailDate','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0000-00-00 00:00:00',''),('.1.3.6.1.4.1.23925.1.14.1.7','cactiApplDeviceRecoveryDate','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Date of lats recovery'),('.1.3.6.1.4.1.23925.1.14.1.7.48','cactiApplDeviceRecoveryDate','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0000-00-00 00:00:00',''),('.1.3.6.1.4.1.23925.1.14.1.7.49','cactiApplDeviceRecoveryDate','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0000-00-00 00:00:00',''),('.1.3.6.1.4.1.23925.1.14.1.8','cactiApplDeviceLastError','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Description of last error being detected.'),('.1.3.6.1.4.1.23925.1.14.1.8.48','cactiApplDeviceLastError','CACTI-MIB','DisplayString','DATA','Column Data','read-only','',''),('.1.3.6.1.4.1.23925.1.14.1.8.49','cactiApplDeviceLastError','CACTI-MIB','DisplayString','DATA','Column Data','read-only','',''),('.1.3.6.1.4.1.23925.1.15','cactiApplPollerTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of pollers registered on a Cacti system.<br>The maximum number of entries is implementation dependent.'),('.1.3.6.1.4.1.23925.1.15.1','cactiApplPollerEntry','CACTI-MIB','CactiApplPollerEntry','OBJECT-TYPE','Row','not-accessible','','An entry in the table of registered pollers to a Cacti system. A row<br>in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.1.15.1.1','cactiApplPollerIndex','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','A unique poller identifier. This ID will be created by Cacti itself.'),('.1.3.6.1.4.1.23925.1.15.1.2','cactiApplPollerHostname','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Name of the device where the poller is running on.'),('.1.3.6.1.4.1.23925.1.15.1.3','cactiApplPollerIpAddress','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','IP address of the poller\'s host.'),('.1.3.6.1.4.1.23925.1.15.1.4','cactiApplPollerLastUpdate','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Timestamp of last update.'),('.1.3.6.1.4.1.23925.1.16','cactiApplPluginTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of registered plugins on a Cacti system.<br>The maximum number of entries is implementation dependent.'),('.1.3.6.1.4.1.23925.1.16.1','cactiApplPluginEntry','CACTI-MIB','CactiApplPluginEntry','OBJECT-TYPE','Row','not-accessible','','An entry in the table of all installed Cacti plugins. A row<br>in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.1.16.1.1','cactiApplPluginIndex','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','A unique plugin identifier. This ID will be administrated by Cacti itself.'),('.1.3.6.1.4.1.23925.1.16.1.2','cactiApplPluginType','CACTI-MIB','INTEGER','OBJECT-TYPE','Column','read-only','','Describes whether or not the plugin has been registered as a system plugin.<br>System plugins offer a lot of functions normal Cacti plugins rely on.'),('.1.3.6.1.4.1.23925.1.16.1.3','cactiApplPluginName','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','The official name of a plugin given by its author.'),('.1.3.6.1.4.1.23925.1.16.1.4','cactiApplPluginStatus','CACTI-MIB','INTEGER','OBJECT-TYPE','Column','read-only','','The status a plugin can have within Cacti:<br>disabledold(-2)   - plugin (old PIA) is available, but has not been installed<br>activeold(-1)     - plugin (old PIA) is installed and active<br>notinstalled(0)   - plugin (new PIA) is available, but has not been installed<br>active(1)         - plugin (new PIA) is installed and active<br>setupmode(2)      - plugin (new PIA) is installed, but configuration is needed<br>disabled(4)       - plugin (new PIA) is installed, but without function'),('.1.3.6.1.4.1.23925.1.16.1.5','cactiApplPluginVersion','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Version string of the Cacti plugin being installed.'),('.1.3.6.1.4.1.23925.1.2.0','cactiApplVersion','CACTI-MIB','DisplayString','DATA','Scalar','read-only','1.1.38','Returns the version string of Cacti'),('.1.3.6.1.4.1.23925.1.3.0','cactiApplSnmpVersion','CACTI-MIB','TcCactiApplSnmpVersion','DATA','Scalar','read-only','3','Represents the type of SNMP used by Cacti:<br><br>NET-SNMP<br>UCD-SNMP<br>PHP-SNMP'),('.1.3.6.1.4.1.23925.1.4.0','cactiApplRrdtoolVersion','CACTI-MIB','DisplayString','DATA','Scalar','read-only','1.7.0','The version of RRDtool used by Cacti'),('.1.3.6.1.4.1.23925.1.5.0','cactiApplPollerEnabled','CACTI-MIB','TruthValue','DATA','Scalar','read-only','1','If Cacti polling has been enabled this object is set to true(1).'),('.1.3.6.1.4.1.23925.1.6.0','cactiApplPollerType','CACTI-MIB','TcCactiApplPollerType','DATA','Scalar','read-only','1','Describes the polling engine used by Cacti:<br><br>cmd         - php based poller<br>spine       - high performance C-based polling engine'),('.1.3.6.1.4.1.23925.1.7.0','cactiApplPollerInterval','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','300','The polling interval in seconds which determines how often<br>data sources will be checked and updated.'),('.1.3.6.1.4.1.23925.1.8.0','cactiApplPollerMaxProcesses','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1','Represents the number of maximum poller processes Cacti is allowed to<br>perform in parallel.'),('.1.3.6.1.4.1.23925.1.9.0','cactiApplPollerLoadBalance','CACTI-MIB','TruthValue','DATA','Scalar','read-only','1','If true Cacti attempt to balance the load of each poller process.'),('.1.3.6.1.4.1.23925.2','cactiStats','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for cacti statistics'),('.1.3.6.1.4.1.23925.2.1.0','cactiStatsLastUpdate','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1565831403','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.2.10','cactiStatsPollerTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of statistics for all pollers registered on a Cacti system.<br>The maximum number of entries is implementation dependent.<br>This table has a 1:1 relationship to cactiApplPollerTable.'),('.1.3.6.1.4.1.23925.2.10.1','cactiStatsPollerEntry','CACTI-MIB','CactiStatsPollerEntry','OBJECT-TYPE','Row','not-accessible','','An entry in the table of statistics for registered pollers of a Cacti system.<br>A row in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.2.10.1.1','cactiStatsPollerIndex','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','A unique poller identifier. This ID will be created by Cacti itself.'),('.1.3.6.1.4.1.23925.2.10.1.10','cactiStatsPollerRrrdsProcessed','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of RRDs being processed. This object will always return zero<br>if RRD updates will be handled by BOOST.'),('.1.3.6.1.4.1.23925.2.10.1.11','cactiStatsPollerUtilization','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','The proportion of the poller interval in percent the poller requires<br>to poll all data sources.'),('.1.3.6.1.4.1.23925.2.10.1.2','cactiStatsPollerHostname','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Name of the device where the poller is running on.'),('.1.3.6.1.4.1.23925.2.10.1.3','cactiStatsPollerRunTime','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Last poller runtime in seconds.'),('.1.3.6.1.4.1.23925.2.10.1.4','cactiStatsPollerMethod','CACTI-MIB','TcCactiApplPollerType','OBJECT-TYPE','Column','read-only','','Describes the polling engine used by Cacti:<br>cmd         - php based poller<br>spine       - high performance C-based polling engine'),('.1.3.6.1.4.1.23925.2.10.1.5','cactiStatsPollerConcurrentProcesses','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of concurrent processes.'),('.1.3.6.1.4.1.23925.2.10.1.6','cactiStatsPollerThreads','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of threads. This object will always return zero if<br>polling method is CMD.'),('.1.3.6.1.4.1.23925.2.10.1.7','cactiStatsPollerHosts','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of polled devices.'),('.1.3.6.1.4.1.23925.2.10.1.8','cactiStatsPollerHostsPerProcess','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Maximum number of hosts per process.'),('.1.3.6.1.4.1.23925.2.10.1.9','cactiStatsPollerItems','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of items being polled.'),('.1.3.6.1.4.1.23925.2.11.0','cactiStatsTotalsDeviceStatusUnknown','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1','Total number of devices that have not been polled yet.'),('.1.3.6.1.4.1.23925.2.12.0','cactiStatsTotalsDeviceStatusDown','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','0','Total number of devices being unreachable.'),('.1.3.6.1.4.1.23925.2.13.0','cactiStatsTotalsDeviceStatusRecovering','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','0','Total number of devices recovering.'),('.1.3.6.1.4.1.23925.2.14.0','cactiStatsTotalsDeviceStatusUp','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1','Total number of devices being reachable.'),('.1.3.6.1.4.1.23925.2.15.0','cactiStatsTotalsDeviceStatusDisabled','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','0','Total number of devices being reachable.'),('.1.3.6.1.4.1.23925.2.2.0','cactiStatsRecacheTime','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','','Returns the recache Time in seconds.'),('.1.3.6.1.4.1.23925.2.3.0','cactiStatsRecachedHosts','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','','The current number of recaching events being discovered.'),('.1.3.6.1.4.1.23925.2.4.0','cactiStatsLocalPollerRuntime','CACTI-MIB','DisplayString','DATA','Scalar','read-only','0.1649','Returns the runtime of the local poller in seconds.'),('.1.3.6.1.4.1.23925.2.5.0','cactiStatsTotalsDevices','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','2','Returns the total number of registered devices.'),('.1.3.6.1.4.1.23925.2.6.0','cactiStatsTotalsDataSources','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','12','Returns the total number of data sources.'),('.1.3.6.1.4.1.23925.2.7.0','cactiStatsTotalsGraphs','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','0','Returns the total number of graphs.'),('.1.3.6.1.4.1.23925.2.8','cactiStatsTotalsDeviceStatusTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of statistics for all devices registered on a Cacti system<br>in relation to their device status.<br>The maximum number of entries is limited to maximum number of<br>device stati.'),('.1.3.6.1.4.1.23925.2.8.1','cactiStatsTotalsDeviceStatusEntry','CACTI-MIB','CactiStatsTotalsDeviceStatusEntry','OBJECT-TYPE','Row','not-accessible','','A table of statistics for all devices registered on a Cacti system<br>in relation to their device status.<br>A row in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.2.8.1.1','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','OBJECT-TYPE','Column','read-only','','unknown(0)     - Total number of devices that have not been polled yet<br>down(1)        - Total number of devices being unreachable<br>recovering(2)  - Total number of devices recovering<br>up(3)          - Total number of devices being reachable<br>disabled(4)    - Total number of devices that will not be monitored'),('.1.3.6.1.4.1.23925.2.8.1.1.0','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.8.1.1.1','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','DATA','Column Data','read-only','1',''),('.1.3.6.1.4.1.23925.2.8.1.1.2','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','DATA','Column Data','read-only','2',''),('.1.3.6.1.4.1.23925.2.8.1.1.3','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','DATA','Column Data','read-only','3',''),('.1.3.6.1.4.1.23925.2.8.1.1.4','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','DATA','Column Data','read-only','4',''),('.1.3.6.1.4.1.23925.2.8.1.2','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Returns the total number of registered devices in relation to<br>cactiStatsTotalsDeviceStatusIndex.'),('.1.3.6.1.4.1.23925.2.8.1.2.0','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','1',''),('.1.3.6.1.4.1.23925.2.8.1.2.1','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.8.1.2.2','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.8.1.2.3','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','1',''),('.1.3.6.1.4.1.23925.2.8.1.2.4','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.9','cactiStatsDeviceTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of statistics for all devices registered on a Cacti system.<br>The maximum number of entries is implementation dependent.<br>This table has a 1:1 relationship to cactiApplDeviceTable.'),('.1.3.6.1.4.1.23925.2.9.1','cactiStatsDeviceEntry','CACTI-MIB','CactiStatsDeviceEntry','OBJECT-TYPE','Row','not-accessible','','An entry in the table of statistics for registered devices of a Cacti system.<br>A row in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.2.9.1.1','cactiStatsDeviceIndex','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','A unique device identifier. This ID will be created by Cacti itself.'),('.1.3.6.1.4.1.23925.2.9.1.1.48','cactiStatsDeviceIndex','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','48',''),('.1.3.6.1.4.1.23925.2.9.1.1.49','cactiStatsDeviceIndex','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','49',''),('.1.3.6.1.4.1.23925.2.9.1.2','cactiStatsDeviceHostname','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Fully qualified devicename or IP address.'),('.1.3.6.1.4.1.23925.2.9.1.2.48','cactiStatsDeviceHostname','CACTI-MIB','DisplayString','DATA','Column Data','read-only','127.0.0.1',''),('.1.3.6.1.4.1.23925.2.9.1.2.49','cactiStatsDeviceHostname','CACTI-MIB','DisplayString','DATA','Column Data','read-only','192.168.0.13',''),('.1.3.6.1.4.1.23925.2.9.1.3','cactiStatsDeviceMinTime','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Minimum response time in seconds.'),('.1.3.6.1.4.1.23925.2.9.1.3.48','cactiStatsDeviceMinTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0.64500',''),('.1.3.6.1.4.1.23925.2.9.1.3.49','cactiStatsDeviceMinTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','9.99999',''),('.1.3.6.1.4.1.23925.2.9.1.4','cactiStatsDeviceMaxTime','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Maximum response time in seconds.'),('.1.3.6.1.4.1.23925.2.9.1.4.48','cactiStatsDeviceMaxTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','37.48000',''),('.1.3.6.1.4.1.23925.2.9.1.4.49','cactiStatsDeviceMaxTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0.00000',''),('.1.3.6.1.4.1.23925.2.9.1.5','cactiStatsDeviceCurTime','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Last response time in seconds.'),('.1.3.6.1.4.1.23925.2.9.1.5.48','cactiStatsDeviceCurTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','1.30500',''),('.1.3.6.1.4.1.23925.2.9.1.5.49','cactiStatsDeviceCurTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0.00000',''),('.1.3.6.1.4.1.23925.2.9.1.6','cactiStatsDeviceAvgTime','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Average response time in seconds.'),('.1.3.6.1.4.1.23925.2.9.1.6.48','cactiStatsDeviceAvgTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','1.57658',''),('.1.3.6.1.4.1.23925.2.9.1.6.49','cactiStatsDeviceAvgTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0.00000',''),('.1.3.6.1.4.1.23925.2.9.1.7','cactiStatsDeviceTotalPolls','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of total polls against a monitored device.'),('.1.3.6.1.4.1.23925.2.9.1.7.48','cactiStatsDeviceTotalPolls','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','418',''),('.1.3.6.1.4.1.23925.2.9.1.7.49','cactiStatsDeviceTotalPolls','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.9.1.8','cactiStatsDeviceFailedPolls','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of failed polls.'),('.1.3.6.1.4.1.23925.2.9.1.8.48','cactiStatsDeviceFailedPolls','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.9.1.8.49','cactiStatsDeviceFailedPolls','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.9.1.9','cactiStatsDeviceAvailability','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Calculated availablity in percent.'),('.1.3.6.1.4.1.23925.2.9.1.9.48','cactiStatsDeviceAvailability','CACTI-MIB','DisplayString','DATA','Column Data','read-only','100.00000',''),('.1.3.6.1.4.1.23925.2.9.1.9.49','cactiStatsDeviceAvailability','CACTI-MIB','DisplayString','DATA','Column Data','read-only','100.00000',''),('.1.3.6.1.4.1.23925.3','cactiEvents','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for cacti events'),('.1.3.6.1.4.1.23925.3.1','cactiEventAttributes','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for event attributes, used as varbind for the SMNP notifications'),('.1.3.6.1.4.1.23925.3.1.1.0','cactiEventDescription','CACTI-MIB','DisplayString','DATA','Scalar','accessible-for-notify','','Contains a customized event description.'),('.1.3.6.1.4.1.23925.3.2','cactiEventNotifications','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for event notifications'),('.1.3.6.1.4.1.23925.3.2.1','cactiNotify','CACTI-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will only include varbind cactiEventDescription<br>and can be used as a simple and generic notification by plugins for example.'),('.1.3.6.1.4.1.23925.3.2.2','cactiNotifyDeviceDown','CACTI-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will be send to notification receivers if Cacti has detected<br>that a monitored device went down.'),('.1.3.6.1.4.1.23925.3.2.3','cactiNotifyDeviceRecovering','CACTI-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will be send to notification receivers if Cacti has detected<br>that a monitored device became reachable again.'),('.1.3.6.1.4.1.23925.3.2.4','cactiNotifyPollerRuntimeExceeding','CACTI-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will be send to notification receivers if a Cacti poller<br>has breached its maximum runtime.'),('.1.3.6.1.4.1.23925.3.2.5','cactiNotifyDeviceFailedPoll','CACTI-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will be send to notification receivers if Cacti<br>was unable to poll a device.'),('.1.3.6.1.4.1.23925.4','cactiPlugins','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','cactiPlugins provides a root object identifier<br>from which mibs produced by plugin developers may be<br>placed. mibs written by other developers will typically<br>be implemented with the object identifiers as defined<br>in the mib.<br>Plugin developers have to take notice of the following<br>requirements:<br><br>|MIB name: CACTI-<plugin_name>-MIB<br>|Module name: <plugin_name><br>|Architecture:<br>Plugin mibs have to reserve the first three<br>sub-trees for:<br>+<br>|-<plugin_name>Appl(1)<br>|-<plugin_name>Stats(2)<br>|-<plugin_name>Events(3)<br>|-<plugin_name>MibGroups(4)<br><br>The plugin name has to be written in lower cases only.<br><br>As reference plugin developers should take a look at<br>the CACTI-THOLD-MIB.'),('.1.3.6.1.4.1.23925.4.2','boost','CACTI-BOOST-MIB','','MODULE-IDENTITY','Node','not-accessible','','Initial version of this MIB module.'),('.1.3.6.1.4.1.23925.4.2.1','boostAppl','CACTI-BOOST-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for Boost application data'),('.1.3.6.1.4.1.23925.4.2.1.1.0','boostApplLastUpdate','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','1559173512','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.4.2.1.10.0','boostApplServerEnabled','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','','If Boost Server will be used for RRDUpdates this object is set<br>to true (1).'),('.1.3.6.1.4.1.23925.4.2.1.11.0','boostApplServerMultiprocess','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','','This object returns true (1) if Boost Server should  fork a separate<br>update process for each boost request'),('.1.3.6.1.4.1.23925.4.2.1.12.0','boostApplServerHostname','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Returns the Hostname/IP of the boost server.'),('.1.3.6.1.4.1.23925.4.2.1.13.0','boostApplServerListenPort','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Returns the TCP port the boost server will listen on.'),('.1.3.6.1.4.1.23925.4.2.1.14.0','boostApplServerTimeOuts','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Defines the maximum number of seconds a client should wait on the<br>Boost server before giving up.'),('.1.3.6.1.4.1.23925.4.2.1.15.0','boostApplImageCacheEnabled','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','2','If image caching has been enabled this object is set to true (1).'),('.1.3.6.1.4.1.23925.4.2.1.16.0','boostApplLoggingEnabled','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','2','If Boost debug logging is enabled this object will return true (1).'),('.1.3.6.1.4.1.23925.4.2.1.17.0','boostApplStorageDatabaseEngine','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Returns the database engine being used for the boost storage.'),('.1.3.6.1.4.1.23925.4.2.1.18.0','boostApplStorageMaxTableSize','CACTI-BOOST-MIB','Integer32','DATA','Scalar','read-only','','This object contains the maximum size in kbytes a boost memory (1) table<br>is allowed to have. If boostApplStorageDatabaseEngine is set to<br>myisam (2) the table size is unlimited and this object returns -1.'),('.1.3.6.1.4.1.23925.4.2.1.19.0','boostApplStorageMaxRecords','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','This object contains the estimated number of records a boost memory (1)<br>table can store. If boostApplStorageDatabaseEngine is set to<br>myisam (2) the number of maximum records is unlimited and<br>this object returns 0.'),('.1.3.6.1.4.1.23925.4.2.1.2.0','boostApplRrdUpdateEnabled','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','2','If Boost on demand RRD updating has been enabled this object is set<br>to true(1).'),('.1.3.6.1.4.1.23925.4.2.1.3.0','boostApplRrdUpdateInterval','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','60','If Boost has been enabled this interval determines when<br>RRDfiles will be updated automatically.'),('.1.3.6.1.4.1.23925.4.2.1.4.0','boostApplRrdUpdateMaxRecords','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','1000000','Represents the maximum size in records of the Boost output table.<br>If the boost output table exceeds this size, in records, an update<br>will take place.'),('.1.3.6.1.4.1.23925.4.2.1.5.0','boostApplRrdUpdateMaxRecordsPerSelect','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','50000','Defines the maximum number of data source items that should be<br>retrieved in one single pass.'),('.1.3.6.1.4.1.23925.4.2.1.6.0','boostApplRrdUpdateMaxStringLength','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','2000','Defines the maximum argument length Boost must not exceed for update<br>commands to RRDtool. This limit varies by operating system and kernel<br>level.'),('.1.3.6.1.4.1.23925.4.2.1.7.0','boostApplRrdUpdatePollerMemLimit','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','1024','Returns the maximum amount of memory for the Cacti Poller and<br>Boost\'s Poller.'),('.1.3.6.1.4.1.23925.4.2.1.8.0','boostApplRrdUpdateMaxRunTime','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','1200','Represents the maximum boot poller run time in seconds being allowed.'),('.1.3.6.1.4.1.23925.4.2.1.9.0','boostApplRrdUpdateRedirect','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','2','If direct population of poller_output_boost table by spine has been<br>enabled this object is set to true(1). This enables direct insert of<br>records into poller output boost.'),('.1.3.6.1.4.1.23925.4.2.2','boostStats','CACTI-BOOST-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for boost statistics'),('.1.3.6.1.4.1.23925.4.2.2.1.0','boostStatsLastUpdate','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.4.2.2.10.0','boostStatsTotalsRecords','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Returns the total number of records being handled by Boost.'),('.1.3.6.1.4.1.23925.4.2.2.11.0','boostStatsTotalsRecordsPending','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Total number of records marked as pending.'),('.1.3.6.1.4.1.23925.4.2.2.12.0','boostStatsTotalsRecordsArchived','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Total number of records marked as archived.'),('.1.3.6.1.4.1.23925.4.2.2.13.0','boostStatsStorageTableSize','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','This object contains the current size of the boost memory table<br>in kBytes.'),('.1.3.6.1.4.1.23925.4.2.2.14.0','boostStatsStorageAverageRecordSize','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Returns the average record size of the boost memory table in bytes.'),('.1.3.6.1.4.1.23925.4.2.2.15.0','boostStatsStorageMaxRecordLength','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Returns size of longest record within the boost memory table<br>in bytes.'),('.1.3.6.1.4.1.23925.4.2.2.16.0','boostStatsTotalsImagesCacheSize','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Represents the total number of RRD image files being<br>currently cached by Boost.'),('.1.3.6.1.4.1.23925.4.2.2.17.0','boostStatsTotalsImagesCacheReads','CACTI-BOOST-MIB','Counter64','DATA','Scalar','read-only','','Number of succesful read operations.'),('.1.3.6.1.4.1.23925.4.2.2.18.0','boostStatsTotalsImagesCacheWrites','CACTI-BOOST-MIB','Counter64','DATA','Scalar','read-only','','Indicates the number of uncached read operations.'),('.1.3.6.1.4.1.23925.4.2.2.2.0','boostStatsRrdUpdateProcessStatus','CACTI-BOOST-MIB','INTEGER','DATA','Scalar','read-only','','The status the update process of Boost can have:<br>disabled(0)    - RRD update process has been disabled.<br>neverrun(1)    - RRD update process is enabled but did not run so far<br>complete(2)    - Last RRD update process has been completed<br>running(3)     - RRD update process is still running<br>overrun(4)     - Overrun detected ?     *review*<br>timeout(5)     - Time out detected ?    *review*<br>other(6)       - Undefined state        *review*'),('.1.3.6.1.4.1.23925.4.2.2.3.0','boostStatsRrdUpdateLastRun','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Date of last run'),('.1.3.6.1.4.1.23925.4.2.2.4.0','boostStatsRrdUpdates','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Number of RRDs being updated.'),('.1.3.6.1.4.1.23925.4.2.2.5.0','boostStatsRrdUpdateDuration','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Represents the duration of the last update process in seconds.'),('.1.3.6.1.4.1.23925.4.2.2.6.0','boostStatsRrdUpdateUtilization','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','The proportion of the maximum upate frequency in percent Boost requires<br>to update all rrds.'),('.1.3.6.1.4.1.23925.4.2.2.7.0','boostStatsRrdUpdatePollerPeakMemory','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Returns the peak of memory in bytes that has been allocated by Boost<br>during the last rrd update process.'),('.1.3.6.1.4.1.23925.4.2.2.8.0','boostStatsRrdUpdateNextRun','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Date of next run'),('.1.3.6.1.4.1.23925.4.2.2.9.0','boostStatsTotalsDataSources','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Represents the total number of poller items Boost has to take care of.'),('.1.3.6.1.4.1.23925.4.2.3','boostEvents','CACTI-BOOST-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for boost events'),('.1.3.6.1.4.1.23925.4.2.4','boostMibGroups','CACTI-BOOST-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for group definitions'),('.1.3.6.1.4.1.23925.4.4','snmpagent','CACTI-SNMPAGENT-MIB','','MODULE-IDENTITY','Node','not-accessible','','Initial version of this MIB module.'),('.1.3.6.1.4.1.23925.4.4.1','snmpagentAppl','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for statistics'),('.1.3.6.1.4.1.23925.4.4.1.1.0','snmpagentApplLastUpdate','CACTI-SNMPAGENT-MIB','Unsigned32','DATA','Scalar','read-only','','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.4.4.2','snmpagentStats','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for statistics'),('.1.3.6.1.4.1.23925.4.4.2.1.0','snmpagentStatsLastUpdate','CACTI-SNMPAGENT-MIB','Unsigned32','DATA','Scalar','read-only','','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.4.4.3','snmpagentEvents','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for events'),('.1.3.6.1.4.1.23925.4.4.3.1','snmpagentEventAttributes','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for event attributes, used as varbind for the SMNP notifications'),('.1.3.6.1.4.1.23925.4.4.3.1.1.0','snmpagentEventDescription','CACTI-SNMPAGENT-MIB','DisplayString','DATA','Scalar','accessible-for-notify','','Contains a customized event description.'),('.1.3.6.1.4.1.23925.4.4.3.2','snmpagentEventNotifications','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for event notifications'),('.1.3.6.1.4.1.23925.4.4.3.2.1','snmpagentNotificationTest','CACTI-SNMPAGENT-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will only include varbind snmpagentEventDescription<br>and can be used to verify the configuration of SNMP managers.'),('.1.3.6.1.4.1.23925.4.4.4','snmpagentMibGroups','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for group definitions'),('.1.3.6.1.4.1.23925.4.4.4.1','snmpagentEventGroup','CACTI-SNMPAGENT-MIB','','OBJECT-GROUP','Group','not-accessible','','A collection of objects providing the SNMPAgent event<br>attributes.'),('.1.3.6.1.4.1.23925.4.4.4.2','snmpagentNotifyGroup','CACTI-SNMPAGENT-MIB','','NOTIFICATION-GROUP','Group','not-accessible','','The group of notifications SNMPAgent offers.'),('.1.3.6.1.4.1.23925.5','cactiMibGroups','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for group definitions'),('.1.3.6.1.4.1.23925.5.1','cactiApplPollerGroup','CACTI-MIB','','OBJECT-GROUP','Group','not-accessible','','A collection of poller settings.'),('.1.3.6.1.4.1.23925.5.2','cactiApplSpineGroup','CACTI-MIB','','OBJECT-GROUP','Group','not-accessible','','A collection of Spine specific parameters.'),('.1.3.6.1.4.1.23925.5.3','cactiStatsTotalsDeviceGroup','CACTI-MIB','','OBJECT-GROUP','Group','not-accessible','','A collection of Spine specific parameters.'),('.1.3.6.1.4.1.23925.5.4','cactiNotifyGroup','CACTI-MIB','','NOTIFICATION-GROUP','Group','not-accessible','','The group of notifications Cacti supports.');
/*!40000 ALTER TABLE `snmpagent_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_cache_notifications`
--

DROP TABLE IF EXISTS `snmpagent_cache_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_cache_notifications` (
  `name` varchar(50) NOT NULL,
  `mib` varchar(50) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `sequence_id` smallint(6) NOT NULL,
  PRIMARY KEY (`name`,`mib`,`attribute`,`sequence_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Notifcations and related attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_cache_notifications`
--

LOCK TABLES `snmpagent_cache_notifications` WRITE;
/*!40000 ALTER TABLE `snmpagent_cache_notifications` DISABLE KEYS */;
INSERT INTO `snmpagent_cache_notifications` VALUES ('cactiNotify','CACTI-MIB','cactiEventDescription',0),('cactiNotifyDeviceDown','CACTI-MIB','cactiApplDeviceDescription',2),('cactiNotifyDeviceDown','CACTI-MIB','cactiApplDeviceHostname',4),('cactiNotifyDeviceDown','CACTI-MIB','cactiApplDeviceIndex',0),('cactiNotifyDeviceDown','CACTI-MIB','cactiApplDeviceLastError',6),('cactiNotifyDeviceFailedPoll','CACTI-MIB','cactiApplDeviceDescription',2),('cactiNotifyDeviceFailedPoll','CACTI-MIB','cactiApplDeviceHostname',4),('cactiNotifyDeviceFailedPoll','CACTI-MIB','cactiApplDeviceIndex',0),('cactiNotifyDeviceFailedPoll','CACTI-MIB','cactiApplDeviceLastError',6),('cactiNotifyDeviceRecovering','CACTI-MIB','cactiApplDeviceDescription',2),('cactiNotifyDeviceRecovering','CACTI-MIB','cactiApplDeviceHostname',4),('cactiNotifyDeviceRecovering','CACTI-MIB','cactiApplDeviceIndex',0),('cactiNotifyDeviceRecovering','CACTI-MIB','cactiApplDeviceLastError',6),('cactiNotifyPollerRuntimeExceeding','CACTI-MIB','cactiApplPollerHostname',2),('cactiNotifyPollerRuntimeExceeding','CACTI-MIB','cactiApplPollerIndex',0),('cactiNotifyPollerRuntimeExceeding','CACTI-MIB','cactiApplPollerIpAddress',4),('snmpagentNotificationTest','CACTI-SNMPAGENT-MIB','snmpagentEventDescription',0);
/*!40000 ALTER TABLE `snmpagent_cache_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_cache_textual_conventions`
--

DROP TABLE IF EXISTS `snmpagent_cache_textual_conventions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_cache_textual_conventions` (
  `name` varchar(50) NOT NULL,
  `mib` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(5000) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`,`mib`,`type`),
  KEY `name` (`name`),
  KEY `mib` (`mib`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Textual conventions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_cache_textual_conventions`
--

LOCK TABLES `snmpagent_cache_textual_conventions` WRITE;
/*!40000 ALTER TABLE `snmpagent_cache_textual_conventions` DISABLE KEYS */;
INSERT INTO `snmpagent_cache_textual_conventions` VALUES ('TcCactiApplPollerType','CACTI-MIB','INTEGER','Poller types:<br />\r\n<br />\r\ncmd         - php based poller<br />\r\nspine       - high performance C-based polling engine<br />\r\n'),('TcCactiApplSnmpVersion','CACTI-MIB','INTEGER','The type of SNMP being used:<br />\r\n<br />\r\nNET-SNMP<br />\r\nUCD-SNMP<br />\r\nPHP-SNMP<br />\r\n');
/*!40000 ALTER TABLE `snmpagent_cache_textual_conventions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_managers`
--

DROP TABLE IF EXISTS `snmpagent_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_managers` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `disabled` char(2) DEFAULT NULL,
  `max_log_size` tinyint(1) NOT NULL,
  `snmp_version` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `snmp_community` varchar(100) NOT NULL DEFAULT '',
  `snmp_username` varchar(50) NOT NULL,
  `snmp_password` varchar(50) NOT NULL,
  `snmp_auth_protocol` char(6) NOT NULL,
  `snmp_priv_passphrase` varchar(200) NOT NULL,
  `snmp_priv_protocol` char(6) NOT NULL,
  `snmp_engine_id` varchar(64) DEFAULT NULL,
  `snmp_port` mediumint(5) unsigned NOT NULL DEFAULT '161',
  `snmp_message_type` tinyint(1) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `hostname` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='snmp notification receivers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_managers`
--

LOCK TABLES `snmpagent_managers` WRITE;
/*!40000 ALTER TABLE `snmpagent_managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `snmpagent_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_managers_notifications`
--

DROP TABLE IF EXISTS `snmpagent_managers_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_managers_notifications` (
  `manager_id` int(8) NOT NULL,
  `notification` varchar(50) NOT NULL,
  `mib` varchar(50) NOT NULL,
  PRIMARY KEY (`manager_id`,`notification`,`mib`),
  KEY `mib` (`mib`),
  KEY `manager_id_notification` (`manager_id`,`notification`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='snmp notifications to receivers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_managers_notifications`
--

LOCK TABLES `snmpagent_managers_notifications` WRITE;
/*!40000 ALTER TABLE `snmpagent_managers_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `snmpagent_managers_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_mibs`
--

DROP TABLE IF EXISTS `snmpagent_mibs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_mibs` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Registered MIB files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_mibs`
--

LOCK TABLES `snmpagent_mibs` WRITE;
/*!40000 ALTER TABLE `snmpagent_mibs` DISABLE KEYS */;
INSERT INTO `snmpagent_mibs` VALUES (1,'CACTI-MIB','/usr/share/cacti/site/mibs/CACTI-MIB'),(2,'CACTI-SNMPAGENT-MIB','/usr/share/cacti/site/mibs/CACTI-SNMPAGENT-MIB'),(3,'CACTI-BOOST-MIB','/usr/share/cacti/site/mibs/CACTI-BOOST-MIB');
/*!40000 ALTER TABLE `snmpagent_mibs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_notifications_log`
--

DROP TABLE IF EXISTS `snmpagent_notifications_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_notifications_log` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `time` int(24) NOT NULL,
  `severity` tinyint(1) NOT NULL,
  `manager_id` int(8) NOT NULL,
  `notification` varchar(190) NOT NULL,
  `mib` varchar(50) NOT NULL,
  `varbinds` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `severity` (`severity`),
  KEY `manager_id_notification` (`manager_id`,`notification`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='logs snmp notifications to receivers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_notifications_log`
--

LOCK TABLES `snmpagent_notifications_log` WRITE;
/*!40000 ALTER TABLE `snmpagent_notifications_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `snmpagent_notifications_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_arq`
--

DROP TABLE IF EXISTS `solicitud_arq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud_arq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_solicitud` datetime DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `arquitectura` varchar(50) DEFAULT NULL,
  `fecha_asignacion` datetime DEFAULT NULL,
  `dominio` varchar(50) DEFAULT NULL,
  `fecha_fin_asignacion` datetime DEFAULT NULL,
  `terminado` varchar(1) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_arq`
--

LOCK TABLES `solicitud_arq` WRITE;
/*!40000 ALTER TABLE `solicitud_arq` DISABLE KEYS */;
INSERT INTO `solicitud_arq` VALUES (1,'2019-03-04 15:52:01','admin','','aio','2019-03-04 15:52:01','10.55','2019-03-04 15:54:04',NULL),(2,'2019-03-04 15:55:27','admin','','aio','2019-03-04 15:55:27','10.55','2019-03-04 18:08:19',NULL),(3,'2019-03-04 15:55:37','admin','','aio','2019-03-04 18:16:19','10.55','2019-03-04 18:31:39',NULL),(4,'2019-03-04 16:42:15','admin','','1','2019-03-04 16:42:15','2','2019-03-04 18:08:21',NULL),(5,'2019-03-04 18:08:49','admin','','1','2019-03-04 18:09:27','2','2019-03-04 18:31:42',NULL),(6,'2019-03-04 18:09:27','admin','','1','2019-03-04 18:31:51','2','2019-03-07 11:09:16',NULL),(7,'2019-03-04 18:16:13','admin','','1',NULL,NULL,NULL,NULL),(8,'2019-03-04 18:16:19','admin','','aio','2019-03-04 18:32:00','10.55','2019-03-07 11:09:19',NULL),(9,'2019-03-04 18:31:51','admin','rubengutierrez@unicauca.edu.co','1',NULL,NULL,NULL,NULL),(10,'2019-03-04 18:32:00','admin','rubengutierrez@unicauca.edu.co','aio','2019-05-30 15:52:52','10.55.5.11','2019-06-02 15:52:52',NULL),(11,'2019-03-07 11:13:37','admin','rubengutierrez@unicauca.edu.co','distribuida','2019-03-07 11:14:31','10.55.5.10','2019-03-07 12:40:39',NULL),(12,'2019-03-07 11:14:31','admin','rubengutierrez@unicauca.edu.co','distribuida','2019-05-30 15:53:36','10.55.5.10','2019-06-02 15:53:36',NULL),(13,'2019-03-07 13:00:45','admin','rubengutierrez@unicauca.edu.co','',NULL,NULL,NULL,NULL),(14,'2019-05-30 15:52:41','admin','rubengutierrez@unicauca.edu.co','ims+pstn','2019-05-30 15:52:41','10.55.5.200','2019-06-26 10:16:21',NULL),(15,'2019-05-30 15:52:52','admin','rubengutierrez@unicauca.edu.co','aio','2019-06-04 19:48:59','10.55.5.12','2019-06-08 19:48:59',NULL),(16,'2019-05-30 15:53:36','admin','rubengutierrez@unicauca.edu.co','distribuida',NULL,NULL,NULL,NULL),(17,'2019-06-04 19:48:59','admin','rubengutierrez@unicauca.edu.co','aio','2019-07-02 11:47:58','10.10.1.0','2019-07-08 11:47:58',NULL),(18,'2019-06-15 14:03:55','admin','rubengutierrez@unicauca.edu.co','distribuida',NULL,NULL,NULL,NULL),(19,'2019-06-15 14:03:58','admin','rubengutierrez@unicauca.edu.co','ims+pstn',NULL,NULL,NULL,NULL),(20,'2019-06-25 13:10:37','admin','rubengutierrez@unicauca.edu.co','distribuida',NULL,NULL,NULL,NULL),(21,'2019-06-25 13:10:40','admin','rubengutierrez@unicauca.edu.co','ruben02','2019-06-25 13:10:40','1.1.1.1','2019-06-25 12:10:59',NULL),(22,'2019-06-25 13:10:44','admin','rubengutierrez@unicauca.edu.co','aio',NULL,NULL,NULL,NULL),(23,'2019-06-25 13:11:12','admin','rubengutierrez@unicauca.edu.co','distribuida',NULL,NULL,NULL,NULL),(24,'2019-06-27 08:39:38','admin','rubengutierrez@unicauca.edu.co','test1','2019-06-27 08:39:38','10.55.5.0','2019-06-27 07:39:49',NULL),(25,'2019-06-27 15:49:35','admin','rubengutierrez@unicauca.edu.co','test01','2019-06-27 15:49:36','10.10.11.0','2019-07-03 15:49:36',NULL),(26,'2019-06-27 16:04:16','admin','rubengutierrez@unicauca.edu.co','ruben','2019-06-27 16:04:16','10.5.5.0','2019-07-03 16:04:16',NULL),(27,'2019-06-28 12:12:15','admin','rubengutierrez@unicauca.edu.co','test3','2019-06-28 12:12:15','10.50.50.0','2019-07-04 12:12:15',NULL),(28,'2019-06-30 03:52:08','admin','rubengutierrez@unicauca.edu.co','test1','2019-06-30 03:52:08','10.10.1.0','2019-07-03 19:17:45',NULL),(29,'2019-07-01 22:10:09','admin','rubengutierrez@unicauca.edu.co','test2','2019-07-01 22:10:09','10.10.2.0','2019-07-02 11:05:43',NULL),(30,'2019-07-01 23:07:30','admin','rubengutierrez@unicauca.edu.co','test4000','2019-07-01 23:07:30','50.50.50.0','2019-07-02 11:45:24',NULL),(31,'2019-07-02 11:20:26','admin','rubengutierrez@unicauca.edu.co','test2','2019-07-02 11:20:26','10.10.2.0','2019-07-02 11:45:11',NULL),(32,'2019-07-02 11:47:58','admin','rubengutierrez@unicauca.edu.co','aio',NULL,NULL,NULL,NULL),(33,'2019-07-02 18:16:47','admin','rubengutierrez@unicauca.edu.co','test20','2019-07-02 18:16:47','10.50.60.0','2019-07-03 19:18:51',NULL),(34,'2019-07-04 13:03:11','admin','rubengutierrez@unicauca.edu.co','test20','2019-07-04 13:03:11','10.50.60.0','2019-07-04 13:13:00',NULL),(35,'2019-07-04 13:13:04','admin','rubengutierrez@unicauca.edu.co','test10','2019-07-04 13:13:04','10.10.50.0','2019-07-10 13:13:04',NULL),(36,'2019-07-04 21:01:33','admin','rubengutierrez@unicauca.edu.co','test5','2019-07-04 21:01:33','10.60.50.0','2019-07-08 12:13:30',NULL),(37,'2019-07-05 01:40:03','admin','rubengutierrez@unicauca.edu.co','test2','2019-07-08 13:25:10','3.3.2.0','2019-07-08 14:05:30',NULL),(38,'2019-07-08 13:15:05','admin','rubengutierrez@unicauca.edu.co','test','2019-07-08 13:15:05','3.3.3.0','2019-07-08 12:17:23',NULL),(39,'2019-07-08 13:22:25','admin','rubengutierrez@unicauca.edu.co','test','2019-07-08 13:22:25','3.3.3.0','2019-07-08 14:05:32',NULL),(40,'2019-07-08 13:24:34','admin','rubengutierrez@unicauca.edu.co','test2',NULL,NULL,NULL,NULL),(41,'2019-07-08 13:24:46','admin','rubengutierrez@unicauca.edu.co','test','2019-07-08 15:06:33','10.5.5.1','2019-07-14 15:06:33',NULL),(42,'2019-07-08 13:24:50','admin','rubengutierrez@unicauca.edu.co','test2',NULL,NULL,NULL,NULL),(43,'2019-07-08 13:25:10','admin','rubengutierrez@unicauca.edu.co','test2',NULL,NULL,NULL,NULL),(44,'2019-07-08 15:06:33','admin','rubengutierrez@unicauca.edu.co','test','2019-07-12 13:03:12','2.2.0.0','2019-07-18 13:03:12',NULL),(45,'2019-07-09 12:28:03','admin','rubengutierrez@unicauca.edu.co','test1','2019-07-09 12:28:03','5.5.1.0','2019-07-15 12:28:03',NULL),(46,'2019-07-09 12:43:15','admin','rubengutierrez@unicauca.edu.co','dfsa','2019-07-09 12:43:15','2.2.2.0','2019-07-15 12:43:15',NULL),(47,'2019-07-09 19:39:58','admin','rubengutierrez@unicauca.edu.co','test3','2019-07-09 19:39:58','33.3.3.0','2019-07-15 19:39:58',NULL),(48,'2019-07-10 21:03:22','admin','rubengutierrez@unicauca.edu.co','dfsa',NULL,NULL,NULL,NULL),(49,'2019-07-12 13:03:12','admin','rubengutierrez@unicauca.edu.co','test','2019-07-26 11:45:02','50.50.1.0','2019-08-01 11:45:02',NULL),(50,'2019-07-24 22:05:27','admin','rubengutierrez@unicauca.edu.co','preuab','2019-07-24 22:05:27','3.3.3.0','2019-07-24 21:07:07',NULL),(51,'2019-07-24 22:05:34','admin','rubengutierrez@unicauca.edu.co','prueba','2019-07-24 22:05:34','2.2.2.0','2019-07-24 21:07:05',NULL),(52,'2019-07-24 22:40:36','admin','rubengutierrez@unicauca.edu.co','test22','2019-07-24 22:40:36','22.22.2.0','2019-07-30 22:40:36',NULL),(53,'2019-07-24 23:13:36','admin','rubengutierrez@unicauca.edu.co','test5555556666','2019-07-24 23:13:36','5.5.5.0','2019-07-30 23:13:36',NULL),(54,'2019-07-25 16:47:48','admin','rubengutierrez@unicauca.edu.co','test1','2019-07-25 16:47:48','10.1.1.0','2019-07-25 20:00:00',NULL),(55,'2019-07-25 21:01:44','admin','rubengutierrez@unicauca.edu.co','test1','2019-07-25 21:01:44','1.2.3.0','2019-07-31 21:01:44',NULL),(56,'2019-07-25 22:54:48','admin','rubengutierrez@unicauca.edu.co','potatp','2019-07-25 22:54:48','60.1.1.0','2019-07-31 22:54:48',NULL),(57,'2019-07-26 11:45:02','admin','rubengutierrez@unicauca.edu.co','test','2019-08-06 22:19:17','3.3.3.0','2019-08-06 22:06:12',NULL),(58,'2019-07-30 11:10:51','admin','rubengutierrez@unicauca.edu.co','test4000','2019-07-30 11:10:52','111.55.20.0','2019-08-05 11:10:52',NULL),(59,'2019-08-01 12:05:45','admin','rubengutierrez@unicauca.edu.co','testtttttttttttt','2019-08-01 12:05:45','20.20.3.0','2019-08-05 02:46:18',NULL),(60,'2019-08-05 03:26:18','ruben','ruben--gutierrez@hotmail.com','test_fail','2019-08-05 03:26:19','20.30.30.0','2019-08-11 03:26:19',NULL),(61,'2019-08-05 03:44:50','admin','rubengutierrez@unicauca.edu.co','test_fail2','2019-08-05 03:44:50','10.10.10.0','2019-08-05 02:46:21',NULL),(62,'2019-08-05 03:47:04','ruben','ruben--gutierrez@hotmail.com','test_fail2','2019-08-05 03:47:04','10.10.10.0','2019-08-05 03:08:21',NULL),(63,'2019-08-05 03:49:45','ruben','ruben--gutierrez@hotmail.com','testok','2019-08-05 03:49:45','5.5.5.0','2019-08-05 02:54:42',NULL),(64,'2019-08-05 03:54:50','ruben','ruben--gutierrez@hotmail.com','testok','2019-08-05 03:54:50','5.5.5.0','2019-08-05 02:58:23',NULL),(65,'2019-08-05 03:58:31','ruben','ruben--gutierrez@hotmail.com','testok','2019-08-05 03:58:31','5.5.5.0','2019-08-05 03:00:56',NULL),(66,'2019-08-05 04:01:10','ruben','ruben--gutierrez@hotmail.com','testok','2019-08-05 04:01:10','5.5.5.0','2019-08-05 03:02:10',NULL),(67,'2019-08-05 04:02:13','ruben','ruben--gutierrez@hotmail.com','testok','2019-08-05 04:02:13','5.5.5.0','2019-08-05 03:08:20',NULL),(68,'2019-08-05 04:04:19','ruben','ruben--gutierrez@hotmail.com','testfail3','2019-08-05 04:04:19','6.6.6.0','2019-08-05 03:08:18',NULL),(69,'2019-08-05 04:08:25','ruben','ruben--gutierrez@hotmail.com','testfail3','2019-08-05 04:08:25','6.6.6.0','2019-08-05 04:05:52',NULL),(70,'2019-08-05 05:06:08','ruben','ruben--gutierrez@hotmail.com','testfail3','2019-08-05 05:06:09','6.6.6.0','2019-08-05 04:06:22',NULL),(71,'2019-08-05 05:06:29','ruben','ruben--gutierrez@hotmail.com','testfail3','2019-08-05 05:06:29','6.6.6.0','2019-08-06 07:12:15',NULL),(72,'2019-08-05 05:06:33','ruben','ruben--gutierrez@hotmail.com','testok','2019-08-05 05:06:33','5.5.5.0','2019-08-06 07:12:13',NULL),(73,'2019-08-06 08:11:50','admin','rubengutierrez@unicauca.edu.co','testfail3','2019-08-06 08:12:22','6.6.6.0','2019-08-06 18:29:46',NULL),(74,'2019-08-06 08:11:57','admin','rubengutierrez@unicauca.edu.co','testok',NULL,NULL,NULL,NULL),(75,'2019-08-06 08:12:22','admin','rubengutierrez@unicauca.edu.co','testfail3','2019-08-06 19:32:17','6.6.6.0','2019-08-12 19:32:17',NULL),(76,'2019-08-06 19:29:39','admin','rubengutierrez@unicauca.edu.co','testfail3',NULL,NULL,NULL,NULL),(77,'2019-08-06 19:29:49','admin','rubengutierrez@unicauca.edu.co','test_fail2','2019-08-06 19:29:50','10.10.10.0','2019-08-12 19:29:50',NULL),(78,'2019-08-06 19:32:17','ruben','ruben--gutierrez@hotmail.com','testfail3',NULL,NULL,NULL,NULL),(79,'2019-08-06 22:19:17','admin','rubengutierrez@unicauca.edu.co','test','2019-08-06 23:06:15','3.3.3.0','2019-08-06 22:22:10',NULL),(80,'2019-08-06 23:06:15','admin','rubengutierrez@unicauca.edu.co','test','2019-08-06 23:22:54','3.3.3.0','2019-08-06 22:25:20',NULL),(81,'2019-08-06 23:22:54','ruben','ruben--gutierrez@hotmail.com','test','2019-08-06 23:25:31','3.3.3.0','2019-08-08 12:50:39',NULL),(82,'2019-08-06 23:25:30','ruben','ruben--gutierrez@hotmail.com','test','2019-08-08 13:50:48','3.3.3.0','2019-08-08 18:26:25',NULL),(83,'2019-08-07 01:59:33','admin','rubengutierrez@unicauca.edu.co','test','2019-08-08 19:26:37','3.3.3.0','2019-08-09 10:29:41',NULL),(84,'2019-08-07 22:31:59','admin','rubengutierrez@unicauca.edu.co','test','2019-08-09 11:29:49','3.3.3.0','2019-08-11 17:34:52',NULL),(85,'2019-08-08 13:50:27','admin','rubengutierrez@unicauca.edu.co','test','2019-08-13 23:57:55','3.3.3.0','2019-08-14 01:30:17',NULL),(86,'2019-08-08 13:50:47','admin','rubengutierrez@unicauca.edu.co','test','2019-08-14 04:06:19','3.3.3.0','2019-08-14 03:09:48',NULL),(87,'2019-08-08 19:26:37','ruben','ruben--gutierrez@hotmail.com','test','2019-08-14 04:13:05','3.3.3.0','2019-08-14 03:14:11',NULL),(88,'2019-08-09 11:29:32','admin','rubengutierrez@unicauca.edu.co','test','2019-08-14 04:15:00','3.3.3.0','2019-08-20 04:15:00',NULL),(89,'2019-08-09 11:29:48','admin','rubengutierrez@unicauca.edu.co','test',NULL,NULL,NULL,NULL),(90,'2019-08-11 15:35:29','admin','rubengutierrez@unicauca.edu.co','test',NULL,NULL,NULL,NULL),(91,'2019-08-13 23:57:54','ruben','ruben--gutierrez@hotmail.com','test',NULL,NULL,NULL,NULL),(92,'2019-08-14 04:06:19','admin','rubengutierrez@unicauca.edu.co','test',NULL,NULL,NULL,NULL),(93,'2019-08-14 04:13:05','admin','rubengutierrez@unicauca.edu.co','test',NULL,NULL,NULL,NULL),(94,'2019-08-14 04:15:00','admin','rubengutierrez@unicauca.edu.co','test',NULL,NULL,NULL,NULL),(95,'2019-08-16 16:31:11','admin','rubengutierrez@unicauca.edu.co','arqu2','2019-08-16 16:31:11','20.20.20.0','2019-08-17 16:31:11',NULL),(96,'2019-08-16 16:50:43','admin','rubengutierrez@unicauca.edu.co','arquitectura1','2019-08-16 16:50:43','40.40.40.0','2019-08-17 16:50:43',NULL),(97,'2019-08-16 19:53:48','admin','rubengutierrez@unicauca.edu.co','testbed2','2019-08-16 19:53:48','2.20.20.0','2019-08-17 19:53:48',NULL);
/*!40000 ALTER TABLE `solicitud_arq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subnet_openstack`
--

DROP TABLE IF EXISTS `subnet_openstack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subnet_openstack` (
  `id_subnet` varchar(50) DEFAULT NULL,
  `name_subnet` varchar(50) DEFAULT NULL,
  `description_subnet` varchar(50) DEFAULT NULL,
  `id_net` varchar(50) DEFAULT NULL,
  `cidr` varchar(50) DEFAULT NULL,
  `gateway_ip_subnet` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_subnet` (`id_subnet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subnet_openstack`
--

LOCK TABLES `subnet_openstack` WRITE;
/*!40000 ALTER TABLE `subnet_openstack` DISABLE KEYS */;
INSERT INTO `subnet_openstack` VALUES ('04e6fb52-7260-4df9-98ad-356fd8a742d8','ipv6-private-subnet','','ab78b41f-34a9-4f95-8b08-57c853199331','fdd4:2cad:3754::/64','fdd4:2cad:3754::1'),('06c13e3d-95b6-40e1-920f-368f1a6b815d','shared-subnet','shared-subnet','e80ab90a-8eb0-426e-969e-0f4a8379366f','192.168.233.0/24','192.168.233.1'),('39b3074f-e04e-4c84-9b53-1db825d6777f','CW_ALL_IN_ONE_2','','d8368fe8-0751-43b8-8e58-4c16bfa2b5a7','192.168.3.0/24','192.168.3.1'),('41864a93-8df1-4370-a61e-7cc3a4c8a7d2','ipv6-public-subnet','','08cac388-5c54-4718-8403-57334d5ec8bd','2001:db8::/64','2001:db8::2'),('424ec853-a9d2-4011-9958-215016166ee1','private-subnet','','ab78b41f-34a9-4f95-8b08-57c853199331','10.0.0.0/26','10.0.0.1'),('807bfac4-46a4-4654-b4df-faf0361c5a6b','public-subnet','','08cac388-5c54-4718-8403-57334d5ec8bd','192.168.40.0/24','192.168.40.1'),('8d7fcec0-00d5-4996-87cd-4c0c6d842ca9','Testbed_vIMS','','b358472c-2ddd-4dc5-86c7-4ee773323c07','192.168.1.0/24','192.168.1.1'),('c9f2ca2f-a601-4d60-b759-489b40c2fd30','','','31c78a31-9755-4410-9916-b69afdda9527','192.168.5.0/24','192.168.5.1'),('d3691393-9439-46bd-8382-e922a9835e20','CW_ALL_IN_ONE_1','','25cb28ea-5261-4b22-bf6e-bb927ebad87a','192.168.2.0/24','192.168.2.1'),('503dd905-9ba5-4f6d-9678-1eb529b313ef','testbed1','','2300c260-7411-40f7-8b1a-9f0127165bd0','60.60.6.0/24','60.60.6.1'),('37aacf4b-d74e-4e2c-a255-b15581b43e19','testbed2','','5a09745c-f76c-4d8f-9d71-2508e79b8d9e','2.20.20.0/24','2.20.20.1');
/*!40000 ALTER TABLE `subnet_openstack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_testbedims`
--

DROP TABLE IF EXISTS `test_testbedims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_testbedims` (
  `id_test` int(11) NOT NULL AUTO_INCREMENT,
  `dominio` varchar(50) DEFAULT NULL,
  `name_test` varchar(50) DEFAULT NULL,
  `comand` varchar(50) DEFAULT NULL,
  `description_test` varchar(50) DEFAULT NULL,
  `restriction` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_test` (`id_test`),
  KEY `dominio` (`dominio`),
  CONSTRAINT `test_testbedims_ibfk_1` FOREIGN KEY (`dominio`) REFERENCES `arqs_testbedims` (`dominio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_testbedims`
--

LOCK TABLES `test_testbedims` WRITE;
/*!40000 ALTER TABLE `test_testbedims` DISABLE KEYS */;
INSERT INTO `test_testbedims` VALUES (1,NULL,'lkjlkjl','','ljlkjlkj','lkjlkjkl'),(3,NULL,'test1','','test1','test1');
/*!40000 ALTER TABLE `test_testbedims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title_info_page`
--

DROP TABLE IF EXISTS `title_info_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `title_info_page` (
  `id_title` int(11) NOT NULL AUTO_INCREMENT,
  `main_title` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id_title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title_info_page`
--

LOCK TABLES `title_info_page` WRITE;
/*!40000 ALTER TABLE `title_info_page` DISABLE KEYS */;
INSERT INTO `title_info_page` VALUES (0,'Testbed Telco'),(1,'Telco 2.0'),(3,'Segundo titulo'),(4,'titulo3');
/*!40000 ALTER TABLE `title_info_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_action`
--

DROP TABLE IF EXISTS `user_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id_action` (`id_action`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_action`
--

LOCK TABLES `user_action` WRITE;
/*!40000 ALTER TABLE `user_action` DISABLE KEYS */;
INSERT INTO `user_action` VALUES (1,1,'crear nucleo ims','2019-08-14 05:20:21'),(2,1,'borrar nucleo','2019-08-14 05:20:36'),(3,2,'crear nucleo ims','2019-08-14 05:20:44'),(4,1,'Liberar la arquitectura 3.3.3.0 del usuario libre','2019-08-14 06:30:17'),(5,1,'Modificó el número de arquitecturas por usuari oa  2','2019-08-14 07:30:08'),(6,1,'Alteró el orden en los títulos de la seccion de información','2019-08-14 07:54:06'),(7,1,'Agrego título a la seccion de información','2019-08-14 07:55:12'),(8,1,'Reservó la arquitectura  test durante 6 dias','2019-08-14 08:06:19'),(9,0,'Liberar la arquitectura 3.3.3.0 del usuario rubengutierrez@unicauca.edu.co','2019-08-14 08:09:49'),(10,1,'Reservó la arquitectura  test durante 6 dias','2019-08-14 08:13:05'),(11,1,'Liberar la arquitectura 3.3.3.0 del usuario rubengutierrez@unicauca.edu.co','2019-08-14 08:14:11'),(12,1,'Reservó la arquitectura  test durante 6 dias','2019-08-14 08:15:01'),(13,1,'Modificó el número de arquitecturas por usuario a  3','2019-08-14 09:07:42'),(14,1,'Elimino la arquitectura 3.3.3.0','2019-08-15 23:30:48'),(15,1,'Elimino la arquitectura 6.6.60.0','2019-08-15 23:30:50'),(16,1,'Actualizar las restricciones del dominio 2.2.2.0 por  Maximas maquinas adicionales: 20 Ram: 20 almacenamiento: 20 Procesadores: 20','2019-08-15 23:30:56'),(17,1,'Elimino la arquitectura 2.2.2.0','2019-08-15 23:31:07'),(18,1,'Elimino la arquitectura 9.9.9.0','2019-08-15 23:31:25'),(19,1,'Agregó Contenido de la seccion de información','2019-08-16 00:26:30'),(20,1,'Modificó el número de arquitecturas por usuario a  6','2019-08-16 17:03:10'),(21,1,'Modificó el número de arquitecturas por usuario a  5','2019-08-16 17:03:14'),(22,1,'Modificó el número de arquitecturas por usuario a  4','2019-08-16 17:03:16'),(23,1,'Modificó el número de dias de asignacion de las arquitecturas a   2','2019-08-16 17:03:18'),(24,1,'Modificó el número de dias de asignacion de las arquitecturas a   1','2019-08-16 17:03:21'),(25,1,'Modificó el número de dias de asignacion de las arquitecturas a   1','2019-08-16 17:03:24'),(26,1,'Modificó el número de dias de asignacion de las arquitecturas a   1','2019-08-16 17:03:24'),(27,1,'Modificó el número de dias de asignacion de las arquitecturas a   1','2019-08-16 17:03:25'),(28,1,'Modificó el número de dias de asignacion de las arquitecturas a   1','2019-08-16 17:03:25'),(29,1,'Modificó el número de dias de asignacion de las arquitecturas a   1','2019-08-16 17:03:26'),(30,1,'Modificó el número de dias de asignacion de las arquitecturas a   1','2019-08-16 17:03:26'),(31,1,'Modificó el número de dias de asignacion de las arquitecturas a   1','2019-08-16 17:03:27'),(32,1,'Modificó el número de dias de asignacion de las arquitecturas a   1','2019-08-16 17:03:28'),(33,1,'Modificó el número de dias de asignacion de las arquitecturas a   1','2019-08-16 17:03:28'),(34,1,'Agregó la arquitectura 20.20.30.2','2019-08-16 17:39:16'),(35,1,'Agregó la arquitectura 60.60.50.0','2019-08-16 17:42:49'),(36,1,'Elimino la arquitectura 20.20.30.2','2019-08-16 20:09:09'),(37,1,'Elimino la arquitectura 60.60.50.0','2019-08-16 20:09:12'),(38,1,'Agregó la arquitectura 40.40.40.0','2019-08-16 20:15:41'),(39,1,'Agregó la arquitectura 20.20.20.0','2019-08-16 20:19:21'),(40,1,'Reservó la arquitectura  arqu2 durante 1 dias','2019-08-16 20:31:11'),(41,1,'Reservó la arquitectura  arquitectura1 durante 1 dias','2019-08-16 20:50:43'),(42,1,'Agregó la arquitectura 3.3.3.0','2019-08-16 21:54:04'),(43,1,'Agregó la arquitectura 4.4.4.0','2019-08-16 22:18:24'),(44,1,'Elimino la arquitectura 40.40.40.0','2019-08-16 23:09:08'),(45,1,'Elimino la arquitectura ','2019-08-16 23:09:10'),(46,1,'Elimino la arquitectura 20.20.20.0','2019-08-16 23:09:12'),(47,1,'Elimino la arquitectura 3.3.3.0','2019-08-16 23:09:14'),(48,1,'Elimino la arquitectura 4.4.4.0','2019-08-16 23:09:16'),(49,1,'Agregó la arquitectura 54.54.54.0','2019-08-16 23:09:38'),(50,1,'Elimino la arquitectura 54.54.54.0','2019-08-16 23:10:08'),(51,1,'Agregó la arquitectura 60.60.60.0','2019-08-16 23:11:17'),(52,1,'Elimino la arquitectura 60.60.60.0','2019-08-16 23:11:45'),(53,1,'Agregó la arquitectura 60.60.6.0','2019-08-16 23:49:26'),(54,1,'Agregó la arquitectura 2.20.20.0','2019-08-16 23:52:25'),(55,1,'Reservó la arquitectura  testbed2 durante 1 dias','2019-08-16 23:53:48');
/*!40000 ALTER TABLE `user_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(2048) NOT NULL DEFAULT '',
  `realm` mediumint(8) NOT NULL DEFAULT '0',
  `full_name` varchar(100) DEFAULT '0',
  `email_address` varchar(128) NOT NULL,
  `must_change_password` char(2) DEFAULT NULL,
  `password_change` char(2) DEFAULT 'on',
  `show_tree` char(2) DEFAULT 'on',
  `show_list` char(2) DEFAULT 'on',
  `show_preview` char(2) NOT NULL DEFAULT 'on',
  `graph_settings` char(2) DEFAULT NULL,
  `login_opts` tinyint(1) NOT NULL DEFAULT '1',
  `policy_graphs` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `policy_trees` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `policy_hosts` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `policy_graph_templates` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enabled` char(2) NOT NULL DEFAULT 'on',
  `lastchange` int(12) NOT NULL DEFAULT '-1',
  `lastlogin` int(12) NOT NULL DEFAULT '-1',
  `password_history` varchar(4096) NOT NULL DEFAULT '-1',
  `locked` varchar(3) NOT NULL DEFAULT '',
  `failed_attempts` int(5) NOT NULL DEFAULT '0',
  `lastfail` int(12) NOT NULL DEFAULT '0',
  `reset_perms` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_address` (`email_address`),
  KEY `username` (`username`),
  KEY `realm` (`realm`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
INSERT INTO `user_auth` VALUES (1,'admin','$2y$10$16toRa/kpj4RpdkW/5L7KOfpyqZhSr5TmxvEd8hfu1pD72h0an1im',0,'Administrator','rubengutierrez@unicauca.edu.co','','on','on','on','on','on',2,1,1,1,1,'on',-1,-1,'-1','',0,0,1465876965),(3,'guest','43e9a4ab75570f5b',0,'Guest Account','','on','on','on','on','on','3',1,1,1,1,1,'',-1,-1,'-1','',0,0,0),(4,'jhonnyer','$2y$10$NRYSomDGZrxb0ZhcxIwHmOIWX2HP6n/kxryV5RoJbiPe0v4kmMF42',0,'jhonnyer','jhonnyer@hotmail.com','','on','on','on','on','on',1,1,1,1,1,'on',-1,-1,'','',0,0,3700090399),(5,'ruben','$2y$10$F72aDGFx0H7GnuU0S6OXhOykLrcNjeCuAICp3oj05N8cEiqFlRZTu',0,'ruben','ruben--gutierrez@hotmail.com','','on','on','on','on','on',1,1,2,1,1,'on',-1,-1,'','',0,0,1837218382);
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_cache`
--

DROP TABLE IF EXISTS `user_auth_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hostname` varchar(100) NOT NULL DEFAULT '',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` varchar(191) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokenkey` (`token`),
  KEY `hostname` (`hostname`),
  KEY `user_id` (`user_id`),
  KEY `last_update` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COMMENT='Caches Remember Me Details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_cache`
--

LOCK TABLES `user_auth_cache` WRITE;
/*!40000 ALTER TABLE `user_auth_cache` DISABLE KEYS */;
INSERT INTO `user_auth_cache` VALUES (7,1,'127.0.0.1','2019-07-05 07:19:48','1155ee059b154d4dd14d78fc55462ad5b8f0357f4843a2d56ab2b6dce30e71060bee5649477db971a53c5fcc7cb9199e4540f07312fc40ae1af7c669944e0990'),(12,1,'127.0.0.1','2019-07-10 13:17:29','c028512db185425715ceba9c3a8efec628fa3313e73a02d0a775bf5877803481a4743265cdb3783a192ad34cf905b36501eed0de582581bdd274bddd2e148d0f'),(17,1,'127.0.0.1','2019-07-12 16:18:38','6c80e39a274cdd359d374c21d2792f61c6fd3baab38093b27e3d3320fee9c5865d16052cd6815d44e87d83b83f8908f7454e815c4529a01de67cb3739ab31c67'),(24,1,'127.0.0.1','2019-07-29 14:47:57','cc331617288766f36584cea32d4cd94aee7ade1db4e30ac12cae29a1a9197e0fedbbc7fabb4c6c5f5096b2251f2004ce6878da878aca18b87f833b2674dde68d'),(34,1,'127.0.0.1','2019-08-01 18:54:10','32f0cf07a7d54cf5a3fa24f4231c5436229309af512ca1425c4687c9c4bc5eff2c11fca49d069308958fb5d97ce4252fbbc7125dcb08acf1bc9d40153536e9f9'),(48,1,'127.0.0.1','2019-08-12 03:25:58','be04284c247d6b85d5d8e935f5639cd0690d4c611342eca8aa3a0c5dd02a6e541b39ab64769b0b8a00edd5323cfde7ceaeaf632cd0bf54c9badc3319019f7a12'),(51,1,'127.0.0.1','2019-08-14 02:27:13','a1c7c2201bcc1473218f01ee9cc093a755b48c6f9f4f19275e0475900961ba224c2f83e6fdce33589e8237cfc59f09da94599638f0b9f3be94b67d4a140ff399');
/*!40000 ALTER TABLE `user_auth_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_group`
--

DROP TABLE IF EXISTS `user_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `graph_settings` varchar(2) DEFAULT NULL,
  `login_opts` tinyint(1) NOT NULL DEFAULT '1',
  `show_tree` varchar(2) DEFAULT 'on',
  `show_list` varchar(2) DEFAULT 'on',
  `show_preview` varchar(2) NOT NULL DEFAULT 'on',
  `policy_graphs` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `policy_trees` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `policy_hosts` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `policy_graph_templates` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enabled` char(2) NOT NULL DEFAULT 'on',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table that Contains User Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_group`
--

LOCK TABLES `user_auth_group` WRITE;
/*!40000 ALTER TABLE `user_auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_group_members`
--

DROP TABLE IF EXISTS `user_auth_group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_group_members` (
  `group_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `realm_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table that Contains User Group Members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_group_members`
--

LOCK TABLES `user_auth_group_members` WRITE;
/*!40000 ALTER TABLE `user_auth_group_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth_group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_group_perms`
--

DROP TABLE IF EXISTS `user_auth_group_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_group_perms` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`item_id`,`type`),
  KEY `group_id` (`group_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table that Contains User Group Permissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_group_perms`
--

LOCK TABLES `user_auth_group_perms` WRITE;
/*!40000 ALTER TABLE `user_auth_group_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth_group_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_group_realm`
--

DROP TABLE IF EXISTS `user_auth_group_realm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_group_realm` (
  `group_id` int(10) unsigned NOT NULL,
  `realm_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`realm_id`),
  KEY `realm_id` (`realm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table that Contains User Group Realm Permissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_group_realm`
--

LOCK TABLES `user_auth_group_realm` WRITE;
/*!40000 ALTER TABLE `user_auth_group_realm` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth_group_realm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_perms`
--

DROP TABLE IF EXISTS `user_auth_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_perms` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`item_id`,`type`),
  KEY `user_id` (`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_perms`
--

LOCK TABLES `user_auth_perms` WRITE;
/*!40000 ALTER TABLE `user_auth_perms` DISABLE KEYS */;
INSERT INTO `user_auth_perms` VALUES (1,15,2),(1,18,2),(1,25,2),(1,26,2),(1,31,2),(5,17,2);
/*!40000 ALTER TABLE `user_auth_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_realm`
--

DROP TABLE IF EXISTS `user_auth_realm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_realm` (
  `realm_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realm_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_realm`
--

LOCK TABLES `user_auth_realm` WRITE;
/*!40000 ALTER TABLE `user_auth_realm` DISABLE KEYS */;
INSERT INTO `user_auth_realm` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(20,1),(21,1),(22,1),(23,1),(100,1),(101,1),(200,1),(7,3),(7,4),(100,4),(7,5),(100,5);
/*!40000 ALTER TABLE `user_auth_realm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_domains`
--

DROP TABLE IF EXISTS `user_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_domains` (
  `domain_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(20) NOT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `enabled` char(2) NOT NULL DEFAULT 'on',
  `defdomain` tinyint(3) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to Hold Login Domains';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_domains`
--

LOCK TABLES `user_domains` WRITE;
/*!40000 ALTER TABLE `user_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_domains_ldap`
--

DROP TABLE IF EXISTS `user_domains_ldap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_domains_ldap` (
  `domain_id` int(10) unsigned NOT NULL,
  `server` varchar(128) NOT NULL,
  `port` int(10) unsigned NOT NULL,
  `port_ssl` int(10) unsigned NOT NULL,
  `proto_version` tinyint(3) unsigned NOT NULL,
  `encryption` tinyint(3) unsigned NOT NULL,
  `referrals` tinyint(3) unsigned NOT NULL,
  `mode` tinyint(3) unsigned NOT NULL,
  `dn` varchar(128) NOT NULL,
  `group_require` char(2) NOT NULL,
  `group_dn` varchar(128) NOT NULL,
  `group_attrib` varchar(128) NOT NULL,
  `group_member_type` tinyint(3) unsigned NOT NULL,
  `search_base` varchar(128) NOT NULL,
  `search_filter` varchar(128) NOT NULL,
  `specific_dn` varchar(128) NOT NULL,
  `specific_password` varchar(128) NOT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to Hold Login Domains for LDAP';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_domains_ldap`
--

LOCK TABLES `user_domains_ldap` WRITE;
/*!40000 ALTER TABLE `user_domains_ldap` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_domains_ldap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log` (
  `username` varchar(50) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `result` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`username`,`user_id`,`time`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES ('',0,'2019-06-06 23:22:42',0,'127.0.0.1'),('admin',1,'2019-03-01 17:41:32',1,'127.0.0.1'),('admin',1,'2019-03-01 19:45:14',1,'127.0.0.1'),('admin',1,'2019-03-01 19:45:35',1,'127.0.0.1'),('admin',1,'2019-03-01 19:51:53',1,'127.0.0.1'),('admin',1,'2019-03-01 20:17:03',1,'127.0.0.1'),('admin',1,'2019-03-01 20:34:12',1,'127.0.0.1'),('admin',1,'2019-03-02 19:17:08',1,'127.0.0.1'),('admin',1,'2019-03-04 19:28:43',1,'127.0.0.1'),('admin',1,'2019-03-04 19:31:24',2,'127.0.0.1'),('admin',1,'2019-03-04 19:31:31',2,'127.0.0.1'),('admin',1,'2019-03-04 19:31:39',2,'127.0.0.1'),('admin',1,'2019-03-04 19:32:17',2,'127.0.0.1'),('admin',1,'2019-03-04 19:33:36',2,'127.0.0.1'),('admin',1,'2019-03-04 20:51:51',2,'127.0.0.1'),('admin',1,'2019-03-04 20:52:01',2,'127.0.0.1'),('admin',1,'2019-03-04 20:54:04',2,'127.0.0.1'),('admin',1,'2019-03-04 20:55:27',2,'127.0.0.1'),('admin',1,'2019-03-04 20:55:37',2,'127.0.0.1'),('admin',1,'2019-03-04 21:42:15',2,'127.0.0.1'),('admin',1,'2019-03-04 23:02:56',2,'127.0.0.1'),('admin',1,'2019-03-04 23:03:40',2,'127.0.0.1'),('admin',1,'2019-03-04 23:04:24',2,'127.0.0.1'),('admin',1,'2019-03-04 23:05:58',2,'127.0.0.1'),('admin',1,'2019-03-04 23:07:32',2,'127.0.0.1'),('admin',1,'2019-03-04 23:07:55',2,'127.0.0.1'),('admin',1,'2019-03-04 23:08:19',2,'127.0.0.1'),('admin',1,'2019-03-04 23:08:21',2,'127.0.0.1'),('admin',1,'2019-03-04 23:08:49',2,'127.0.0.1'),('admin',1,'2019-03-04 23:09:18',2,'127.0.0.1'),('admin',1,'2019-03-04 23:09:27',2,'127.0.0.1'),('admin',1,'2019-03-04 23:16:12',2,'127.0.0.1'),('admin',1,'2019-03-04 23:16:19',2,'127.0.0.1'),('admin',1,'2019-03-04 23:31:39',2,'127.0.0.1'),('admin',1,'2019-03-04 23:31:42',2,'127.0.0.1'),('admin',1,'2019-03-04 23:31:51',2,'127.0.0.1'),('admin',1,'2019-03-04 23:32:00',2,'127.0.0.1'),('admin',1,'2019-03-05 15:23:01',2,'127.0.0.1'),('admin',1,'2019-03-05 15:23:21',2,'127.0.0.1'),('admin',1,'2019-03-05 16:22:18',2,'127.0.0.1'),('admin',1,'2019-03-06 00:01:14',2,'127.0.0.1'),('admin',1,'2019-03-06 19:51:18',2,'127.0.0.1'),('admin',1,'2019-03-06 19:53:11',1,'127.0.0.1'),('admin',1,'2019-03-06 21:25:23',1,'127.0.0.1'),('admin',1,'2019-03-06 21:25:43',1,'127.0.0.1'),('admin',1,'2019-03-07 04:17:19',1,'127.0.0.1'),('admin',1,'2019-03-07 13:19:33',1,'127.0.0.1'),('admin',1,'2019-03-07 15:30:56',1,'127.0.0.1'),('admin',1,'2019-03-07 16:08:49',1,'127.0.0.1'),('admin',1,'2019-03-07 17:19:17',1,'127.0.0.1'),('admin',1,'2019-03-07 19:33:39',1,'127.0.0.1'),('admin',1,'2019-03-08 03:41:09',1,'127.0.0.1'),('admin',1,'2019-03-08 23:54:14',1,'127.0.0.1'),('admin',1,'2019-03-09 19:52:45',1,'127.0.0.1'),('admin',1,'2019-03-09 20:07:36',2,'127.0.0.1'),('admin',1,'2019-03-09 20:07:43',2,'127.0.0.1'),('admin',1,'2019-03-09 20:07:54',2,'127.0.0.1'),('admin',1,'2019-03-10 00:00:04',2,'127.0.0.1'),('admin',1,'2019-05-29 23:43:11',1,'127.0.0.1'),('admin',1,'2019-05-30 12:11:48',1,'127.0.0.1'),('admin',1,'2019-05-30 13:39:55',1,'127.0.0.1'),('admin',1,'2019-05-30 15:18:30',1,'127.0.0.1'),('admin',1,'2019-05-30 16:14:27',1,'127.0.0.1'),('admin',1,'2019-05-30 19:50:51',1,'127.0.0.1'),('admin',1,'2019-05-31 01:17:25',1,'127.0.0.1'),('admin',1,'2019-05-31 03:30:06',1,'127.0.0.1'),('admin',1,'2019-05-31 19:54:53',1,'127.0.0.1'),('admin',1,'2019-06-04 23:38:38',1,'127.0.0.1'),('admin',1,'2019-06-06 20:27:12',1,'127.0.0.1'),('admin',1,'2019-06-06 23:22:45',1,'127.0.0.1'),('admin',1,'2019-06-07 00:13:33',1,'127.0.0.1'),('admin',1,'2019-06-11 16:01:46',1,'127.0.0.1'),('admin',1,'2019-06-15 17:59:22',1,'127.0.0.1'),('admin',1,'2019-06-19 22:17:53',1,'127.0.0.1'),('admin',1,'2019-06-20 16:26:56',1,'127.0.0.1'),('admin',1,'2019-06-21 14:01:07',1,'127.0.0.1'),('admin',1,'2019-06-21 16:43:17',1,'127.0.0.1'),('admin',1,'2019-06-21 20:32:12',1,'127.0.0.1'),('admin',1,'2019-06-21 21:27:24',1,'127.0.0.1'),('admin',1,'2019-06-25 12:15:34',1,'127.0.0.1'),('admin',1,'2019-06-25 14:48:28',1,'127.0.0.1'),('admin',1,'2019-06-26 15:13:15',1,'127.0.0.1'),('admin',1,'2019-06-26 19:41:19',1,'127.0.0.1'),('admin',1,'2019-06-27 12:20:48',1,'127.0.0.1'),('admin',1,'2019-06-27 17:56:40',1,'127.0.0.1'),('admin',1,'2019-06-27 19:29:51',1,'127.0.0.1'),('admin',1,'2019-06-28 10:26:09',1,'127.0.0.1'),('admin',1,'2019-06-28 12:30:32',1,'127.0.0.1'),('admin',1,'2019-06-28 16:54:32',1,'127.0.0.1'),('admin',1,'2019-06-28 23:41:09',1,'127.0.0.1'),('admin',1,'2019-06-29 01:40:28',1,'127.0.0.1'),('admin',1,'2019-06-29 21:46:00',1,'127.0.0.1'),('admin',1,'2019-06-30 01:06:14',1,'127.0.0.1'),('admin',1,'2019-06-30 02:53:48',1,'127.0.0.1'),('admin',1,'2019-06-30 06:11:10',1,'127.0.0.1'),('admin',1,'2019-07-01 23:50:33',1,'127.0.0.1'),('admin',1,'2019-07-02 12:18:00',1,'127.0.0.1'),('admin',1,'2019-07-02 15:45:44',1,'127.0.0.1'),('admin',1,'2019-07-02 21:30:57',1,'127.0.0.1'),('admin',1,'2019-07-03 01:31:58',1,'127.0.0.1'),('admin',1,'2019-07-03 02:22:38',1,'127.0.0.1'),('admin',1,'2019-07-03 11:17:38',1,'127.0.0.1'),('admin',1,'2019-07-03 15:08:16',1,'127.0.0.1'),('admin',1,'2019-07-03 20:07:46',1,'127.0.0.1'),('admin',1,'2019-07-04 01:40:17',1,'127.0.0.1'),('admin',1,'2019-07-04 13:22:27',1,'127.0.0.1'),('admin',1,'2019-07-04 17:56:40',2,'127.0.0.1'),('admin',1,'2019-07-05 01:47:39',2,'127.0.0.1'),('admin',1,'2019-07-05 03:04:10',2,'127.0.0.1'),('admin',1,'2019-07-05 04:09:52',2,'127.0.0.1'),('admin',1,'2019-07-05 06:40:14',2,'127.0.0.1'),('admin',1,'2019-07-05 07:19:48',2,'127.0.0.1'),('admin',1,'2019-07-08 22:05:17',1,'127.0.0.1'),('admin',1,'2019-07-09 13:28:23',2,'127.0.0.1'),('admin',1,'2019-07-09 20:08:13',2,'127.0.0.1'),('admin',1,'2019-07-10 01:21:34',2,'127.0.0.1'),('admin',1,'2019-07-10 13:17:29',2,'127.0.0.1'),('admin',1,'2019-07-10 20:37:57',1,'127.0.0.1'),('admin',1,'2019-07-11 02:01:03',1,'127.0.0.1'),('admin',1,'2019-07-11 18:51:19',2,'127.0.0.1'),('admin',1,'2019-07-11 21:49:36',2,'127.0.0.1'),('admin',1,'2019-07-12 16:18:39',2,'127.0.0.1'),('admin',1,'2019-07-25 01:56:00',1,'127.0.0.1'),('admin',1,'2019-07-25 05:51:55',1,'127.0.0.1'),('admin',1,'2019-07-25 19:53:26',1,'127.0.0.1'),('admin',1,'2019-07-26 00:46:39',2,'127.0.0.1'),('admin',1,'2019-07-26 02:13:10',2,'127.0.0.1'),('admin',1,'2019-07-26 15:33:52',2,'127.0.0.1'),('admin',1,'2019-07-26 15:49:52',2,'127.0.0.1'),('admin',1,'2019-07-26 17:10:20',2,'127.0.0.1'),('admin',1,'2019-07-29 14:47:57',2,'127.0.0.1'),('admin',1,'2019-07-30 12:26:09',1,'127.0.0.1'),('admin',1,'2019-07-30 18:34:40',2,'127.0.0.1'),('admin',1,'2019-07-30 19:09:52',2,'127.0.0.1'),('admin',1,'2019-07-30 19:40:24',2,'127.0.0.1'),('admin',1,'2019-07-30 22:38:37',2,'127.0.0.1'),('admin',1,'2019-07-31 19:33:24',2,'127.0.0.1'),('admin',1,'2019-07-31 19:57:21',2,'127.0.0.1'),('admin',1,'2019-07-31 23:43:59',2,'127.0.0.1'),('admin',1,'2019-08-01 15:03:19',2,'127.0.0.1'),('admin',1,'2019-08-01 18:54:10',2,'127.0.0.1'),('admin',1,'2019-08-06 11:56:00',1,'127.0.0.1'),('admin',1,'2019-08-07 01:49:49',2,'127.0.0.1'),('admin',1,'2019-08-07 05:31:38',2,'127.0.0.1'),('admin',1,'2019-08-08 02:12:14',2,'127.0.0.1'),('admin',1,'2019-08-08 13:03:49',2,'127.0.0.1'),('admin',1,'2019-08-08 14:45:06',2,'127.0.0.1'),('admin',1,'2019-08-09 02:39:02',2,'127.0.0.1'),('admin',1,'2019-08-09 15:21:27',2,'127.0.0.1'),('admin',1,'2019-08-09 16:53:38',2,'127.0.0.1'),('admin',1,'2019-08-09 18:55:46',2,'127.0.0.1'),('admin',1,'2019-08-11 14:27:26',2,'127.0.0.1'),('admin',1,'2019-08-11 16:21:00',2,'127.0.0.1'),('admin',1,'2019-08-11 19:11:51',2,'127.0.0.1'),('admin',1,'2019-08-12 03:25:58',2,'127.0.0.1'),('admin',1,'2019-08-13 21:07:25',1,'127.0.0.1'),('admin',1,'2019-08-14 00:09:42',2,'127.0.0.1'),('admin',1,'2019-08-14 02:27:13',2,'127.0.0.1'),('admin',1,'2019-08-15 00:22:18',1,'127.0.0.1'),('admin',1,'2019-08-15 20:29:40',1,'127.0.0.1'),('admin',1,'2019-08-15 23:34:30',1,'127.0.0.1'),('admin',1,'2019-08-16 17:00:31',1,'127.0.0.1'),('admin',1,'2019-08-16 20:05:45',1,'127.0.0.1'),('admin',1,'2019-08-16 21:53:29',1,'127.0.0.1'),('adminruben',0,'2019-03-01 17:41:14',0,'127.0.0.1'),('jhonnyer',0,'2019-06-21 21:25:49',0,'10.55.4.224'),('jhonnyer',0,'2019-06-21 21:26:11',0,'10.55.4.224'),('jhonnyer',0,'2019-06-21 21:26:18',0,'10.55.4.224'),('jhonnyer',0,'2019-06-21 21:26:40',0,'10.55.4.224'),('jhonnyer',0,'2019-06-21 21:26:47',0,'10.55.4.224'),('jhonnyer',0,'2019-06-21 21:26:53',0,'10.55.4.224'),('jhonnyer',4,'2019-06-21 21:29:22',1,'10.55.4.224'),('jhonnyer',4,'2019-06-21 21:29:40',1,'10.55.4.224'),('jhonnyer',4,'2019-06-21 21:31:45',1,'10.55.4.224'),('jhonnyerg',0,'2019-06-21 21:26:00',0,'10.55.4.224'),('jhonnyerg',0,'2019-06-21 21:26:32',0,'10.55.4.224'),('ruben',0,'2019-03-01 20:34:02',0,'127.0.0.1'),('ruben',0,'2019-03-01 20:34:06',0,'127.0.0.1'),('ruben',0,'2019-08-05 06:10:06',0,'::1'),('ruben',0,'2019-08-05 06:10:12',0,'::1'),('ruben',0,'2019-08-05 06:10:21',0,'::1'),('ruben',5,'2019-08-05 06:11:44',1,'::1'),('ruben',5,'2019-08-05 08:52:06',1,'::1'),('ruben',5,'2019-08-05 09:05:42',1,'::1'),('ruben',5,'2019-08-05 10:06:14',1,'::1'),('ruben',5,'2019-08-05 12:08:46',1,'::1'),('ruben',5,'2019-08-05 12:16:57',1,'::1'),('ruben',5,'2019-08-06 23:32:10',1,'::1'),('ruben',5,'2019-08-07 03:22:43',1,'::1'),('ruben',5,'2019-08-07 03:41:14',1,'::1'),('ruben',5,'2019-08-08 22:34:45',1,'::1'),('ruben',5,'2019-08-14 03:49:45',1,'::1'),('ruben',5,'2019-08-14 03:55:27',1,'::1'),('ruben',5,'2019-08-14 04:09:42',1,'::1'),('ruben',5,'2019-08-14 04:15:24',1,'::1'),('ruben',5,'2019-08-14 08:44:34',1,'::1');
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vdef`
--

DROP TABLE IF EXISTS `vdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vdef` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='vdef';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vdef`
--

LOCK TABLES `vdef` WRITE;
/*!40000 ALTER TABLE `vdef` DISABLE KEYS */;
INSERT INTO `vdef` VALUES (1,'e06ed529238448773038601afb3cf278','Maximum'),(2,'e4872dda82092393d6459c831a50dc3b','Minimum'),(3,'5ce1061a46bb62f36840c80412d2e629','Average'),(4,'06bd3cbe802da6a0745ea5ba93af554a','Last (Current)'),(5,'631c1b9086f3979d6dcf5c7a6946f104','First'),(6,'6b5335843630b66f858ce6b7c61fc493','Total: Current Data Source'),(7,'c80d12b0f030af3574da68b28826cd39','95th Percentage: Current Data Source');
/*!40000 ALTER TABLE `vdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vdef_items`
--

DROP TABLE IF EXISTS `vdef_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vdef_items` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `vdef_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `value` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `vdef_id_sequence` (`vdef_id`,`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COMMENT='vdef items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vdef_items`
--

LOCK TABLES `vdef_items` WRITE;
/*!40000 ALTER TABLE `vdef_items` DISABLE KEYS */;
INSERT INTO `vdef_items` VALUES (1,'88d33bf9271ac2bdf490cf1784a342c1',1,1,4,'CURRENT_DATA_SOURCE'),(2,'a307afab0c9b1779580039e3f7c4f6e5',1,2,1,'1'),(3,'0945a96068bb57c80bfbd726cf1afa02',2,1,4,'CURRENT_DATA_SOURCE'),(4,'95a8df2eac60a89e8a8ca3ea3d019c44',2,2,1,'2'),(5,'cc2e1c47ec0b4f02eb13708cf6dac585',3,1,4,'CURRENT_DATA_SOURCE'),(6,'a2fd796335b87d9ba54af6a855689507',3,2,1,'3'),(7,'a1d7974ee6018083a2053e0d0f7cb901',4,1,4,'CURRENT_DATA_SOURCE'),(8,'26fccba1c215439616bc1b83637ae7f3',4,2,1,'5'),(9,'a8993b265f4c5398f4a47c44b5b37a07',5,1,4,'CURRENT_DATA_SOURCE'),(10,'5a380d469d611719057c3695ce1e4eee',5,2,1,'6'),(11,'65cfe546b17175fad41fcca98c057feb',6,1,4,'CURRENT_DATA_SOURCE'),(12,'f330b5633c3517d7c62762cef091cc9e',6,2,1,'7'),(13,'f1bf2ecf54ca0565cf39c9c3f7e5394b',7,1,4,'CURRENT_DATA_SOURCE'),(14,'11a26f18feba3919be3af426670cba95',7,2,6,'95'),(15,'e7ae90275bc1efada07c19ca3472d9db',7,3,1,'8');
/*!40000 ALTER TABLE `vdef_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `cacti` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`cacti`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES ('1.1.38');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vm_aditional_testbedims`
--

DROP TABLE IF EXISTS `vm_aditional_testbedims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vm_aditional_testbedims` (
  `id_server` varchar(50) DEFAULT NULL,
  `dominio` varchar(50) DEFAULT NULL,
  `name_server` varchar(50) DEFAULT NULL,
  `ip_local` varchar(50) DEFAULT NULL,
  `ip_public` varchar(50) DEFAULT NULL,
  `Description_vm` varchar(50) DEFAULT NULL,
  `RAM` varchar(50) DEFAULT NULL,
  `disk` varchar(50) DEFAULT NULL,
  `vcpu` varchar(50) DEFAULT NULL,
  `keygen` varchar(50) DEFAULT NULL,
  `id_flavor` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id_vm` (`id_server`),
  KEY `dominio` (`dominio`),
  CONSTRAINT `vm_aditional_testbedims_ibfk_1` FOREIGN KEY (`dominio`) REFERENCES `arqs_testbedims` (`dominio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_aditional_testbedims`
--

LOCK TABLES `vm_aditional_testbedims` WRITE;
/*!40000 ALTER TABLE `vm_aditional_testbedims` DISABLE KEYS */;
INSERT INTO `vm_aditional_testbedims` VALUES ('0f9140ca-0a1f-4832-b85d-9f502851c636','','test1',NULL,NULL,NULL,'64','1','1',NULL,'42','a25c56b1-eb49-4cf6-bf09-eed2a417e703'),('','','test',NULL,NULL,NULL,'64','1','1',NULL,'42','a25c56b1-eb49-4cf6-bf09-eed2a417e703'),('1fba230c-26c8-41f8-9f19-2ada6198732a','','test2',NULL,NULL,NULL,'64','1','1',NULL,'42','a25c56b1-eb49-4cf6-bf09-eed2a417e703'),('62fc2f15-ec8c-49ca-9869-1699b5d5f73a','','root',NULL,NULL,NULL,'64','1','1',NULL,'42','a25c56b1-eb49-4cf6-bf09-eed2a417e703'),('8d3669fb-0030-4d16-9005-cad0084c0ddb','','test',NULL,NULL,NULL,'64','1','1',NULL,'42','969b2ea1-0dc1-4c4d-98fd-4a0e5f9b1e38'),('2e136c42-b656-4f89-adb8-993489b7d158','33.3.3.0','testtttttt',NULL,NULL,NULL,'64','1','1',NULL,'42','969b2ea1-0dc1-4c4d-98fd-4a0e5f9b1e38'),('7bc8d1c7-8965-4af5-b775-9065bf0cab6b','','test',NULL,NULL,NULL,'64','1','1',NULL,'42','a25c56b1-eb49-4cf6-bf09-eed2a417e703'),('56e24320-0bd4-4cb4-ad9e-c90020a67300','33.3.3.0','dsffasdff',NULL,NULL,NULL,'64','1','1',NULL,'42','a25c56b1-eb49-4cf6-bf09-eed2a417e703');
/*!40000 ALTER TABLE `vm_aditional_testbedims` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-16 19:10:37
