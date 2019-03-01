-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: cacti
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
INSERT INTO `automation_networks` VALUES (1,1,1,'Test Network','192.168.1.0/24','','',1,'on','',254,14,8,2,22,400,1,2,10,1200,'2015-05-17 16:15','2019-02-03 20:15:00',2,'4','1,2,6','1,2,3,4,6,7,11,12,14,15,17,19,26,32','','',40.178689002991,'2015-05-19 07:23:22','','on');
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
INSERT INTO `data_input_data` VALUES (1,4,'',''),(1,5,'',''),(1,6,'',''),(1,13,'',''),(1,14,'',''),(1,15,'',''),(1,16,'',''),(1,17,'',''),(1,18,'',''),(1,19,'',''),(1,20,'',''),(1,21,'',''),(1,22,'',''),(1,23,'',''),(1,24,'',''),(1,25,'',''),(1,26,'',''),(1,27,'',''),(1,30,'',''),(1,31,'',''),(1,32,'',''),(1,33,'',''),(1,40,'',''),(1,41,'',''),(1,45,'',''),(1,49,'',''),(1,50,'',''),(1,54,'',''),(1,55,'',''),(1,56,NULL,'192.168.0.11'),(1,57,NULL,'192.168.0.11'),(1,58,NULL,'192.168.0.11'),(1,59,'',''),(1,60,'',''),(1,61,NULL,'192.168.0.11'),(1,62,NULL,'192.168.0.11'),(1,63,NULL,'192.168.0.11'),(1,64,NULL,'192.168.0.11'),(1,65,NULL,'192.168.0.11'),(1,66,NULL,'192.168.0.11'),(1,67,NULL,'192.168.0.11'),(1,68,NULL,'192.168.0.11'),(1,69,'',''),(1,70,NULL,'192.168.0.20'),(1,71,NULL,'192.168.0.20'),(2,4,'',''),(2,5,'',''),(2,6,'',''),(2,13,'',''),(2,14,'',''),(2,15,'',''),(2,16,'',''),(2,17,'',''),(2,18,'',''),(2,19,'',''),(2,20,'',''),(2,21,'',''),(2,22,'',''),(2,23,'',''),(2,24,'',''),(2,25,'',''),(2,26,'',''),(2,27,'',''),(2,30,'',''),(2,31,'',''),(2,32,'',''),(2,33,'',''),(2,40,'',''),(2,41,'',''),(2,45,'',''),(2,49,'',''),(2,50,'',''),(2,54,'',''),(2,55,'',''),(2,56,NULL,'public'),(2,57,NULL,'public'),(2,58,NULL,'public'),(2,59,'',''),(2,60,'',''),(2,61,NULL,'public'),(2,62,NULL,'public'),(2,63,NULL,'public'),(2,64,NULL,'public'),(2,65,NULL,'public'),(2,66,NULL,'public'),(2,67,NULL,'public'),(2,68,NULL,'public'),(2,69,'',''),(2,70,NULL,'public'),(2,71,NULL,'public'),(3,4,'',''),(3,5,'',''),(3,6,'',''),(3,13,'',''),(3,14,'',''),(3,15,'',''),(3,16,'',''),(3,17,'',''),(3,18,'',''),(3,19,'',''),(3,20,'',''),(3,21,'',''),(3,22,'',''),(3,23,'',''),(3,24,'',''),(3,25,'',''),(3,26,'',''),(3,27,'',''),(3,30,'',''),(3,33,'',''),(3,40,'',''),(3,41,'',''),(3,45,'',''),(3,49,'',''),(3,50,'',''),(3,54,'',''),(3,55,'',''),(3,56,NULL,''),(3,57,NULL,''),(3,58,NULL,''),(3,60,'',''),(3,61,NULL,''),(3,62,NULL,''),(3,63,NULL,''),(3,64,NULL,''),(3,65,NULL,''),(3,66,NULL,''),(3,67,NULL,''),(3,68,NULL,''),(3,69,'',''),(3,70,NULL,''),(3,71,NULL,''),(4,13,'',''),(4,14,'',''),(4,15,'',''),(4,16,'',''),(4,17,'',''),(4,18,'',''),(4,19,'',''),(4,20,'',''),(4,21,'',''),(4,22,'',''),(4,23,'',''),(4,24,'',''),(4,25,'',''),(4,26,'',''),(4,33,'',''),(4,56,NULL,''),(4,57,NULL,''),(4,58,NULL,''),(4,61,NULL,''),(4,62,NULL,''),(4,63,NULL,''),(4,64,NULL,''),(4,65,NULL,''),(4,66,NULL,''),(4,67,NULL,''),(4,68,NULL,''),(4,70,NULL,''),(4,71,NULL,''),(5,13,'',''),(5,14,'',''),(5,15,'',''),(5,16,'',''),(5,17,'',''),(5,18,'',''),(5,19,'',''),(5,20,'',''),(5,21,'',''),(5,22,'',''),(5,23,'',''),(5,24,'',''),(5,25,'',''),(5,26,'',''),(5,33,'',''),(5,56,NULL,'2'),(5,57,NULL,'2'),(5,58,NULL,'2'),(5,61,NULL,'2'),(5,62,NULL,'2'),(5,63,NULL,'2'),(5,64,NULL,'2'),(5,65,NULL,'2'),(5,66,NULL,'2'),(5,67,NULL,'2'),(5,68,NULL,'2'),(5,70,NULL,'2'),(5,71,NULL,'2'),(6,8,'on',''),(6,13,'','.1.3.6.1.4.1.2021.10.1.3.1'),(6,14,'','.1.3.6.1.4.1.2021.10.1.3.2'),(6,15,'','.1.3.6.1.4.1.2021.10.1.3.3'),(6,16,'','.1.3.6.1.4.1.2021.4.14.0'),(6,17,'','.1.3.6.1.4.1.2021.4.6.0'),(6,18,'','.1.3.6.1.4.1.2021.4.15.0'),(6,19,'','.1.3.6.1.4.1.2021.4.5.0'),(6,20,'','.1.3.6.1.2.1.25.1.5.0'),(6,21,'','.1.3.6.1.2.1.25.1.6.0'),(6,22,'','.1.3.6.1.4.1.2021.11.10.0'),(6,23,'','.1.3.6.1.4.1.2021.11.9.0'),(6,24,'','.1.3.6.1.4.1.2021.11.11.0'),(6,25,'','.1.3.6.1.4.1.2021.11.7.0'),(6,26,'','.1.3.6.1.4.1.2021.11.8.0'),(6,33,'','.1.3.6.1.4.1.9.2.1.58.0'),(6,56,'','.1.3.6.1.4.1.9.2.1.58.0'),(6,57,'','.1.3.6.1.2.1.25.1.5.0'),(6,58,'','.1.3.6.1.2.1.25.1.6.0'),(6,61,'','.1.3.6.1.4.1.2021.11.8.0'),(6,62,'','.1.3.6.1.4.1.2021.11.11.0'),(6,63,'','.1.3.6.1.4.1.2021.11.10.0'),(6,64,'','.1.3.6.1.4.1.2021.11.9.0'),(6,65,'','.1.3.6.1.4.1.2021.11.7.0'),(6,66,'','.1.3.6.1.4.1.2021.10.1.3.1'),(6,67,'','.1.3.6.1.4.1.2021.10.1.3.3'),(6,68,'','.1.3.6.1.4.1.2021.10.1.3.2'),(6,70,'','.1.3.6.1.4.1.9.2.1.58.0'),(6,71,'','.1.3.6.1.2.1.25.1.5.0'),(7,9,'',''),(7,10,'',''),(7,11,'',''),(7,12,'',''),(7,29,'',''),(7,32,'',''),(8,9,'',''),(8,10,'',''),(8,11,'',''),(8,12,'',''),(8,29,'',''),(8,32,'',''),(9,9,'',''),(9,10,'',''),(9,11,'',''),(9,12,'',''),(9,29,'',''),(9,32,'',''),(10,9,'',''),(10,10,'',''),(10,11,'',''),(10,12,'',''),(10,29,'',''),(10,32,'',''),(11,9,'',''),(11,10,'',''),(11,11,'',''),(11,12,'',''),(11,29,'',''),(11,32,'',''),(12,9,'on',''),(12,10,'on',''),(12,11,'on',''),(12,12,'on',''),(12,29,'on',''),(12,32,'on',''),(13,9,'on',''),(13,10,'on',''),(13,11,'on',''),(13,12,'on',''),(13,29,'on',''),(13,32,'on',''),(14,9,'on',''),(14,10,'on',''),(14,11,'on',''),(14,12,'on',''),(14,29,'on',''),(14,32,'on',''),(20,3,'',''),(20,43,'',''),(20,48,'',''),(20,53,'',''),(22,4,'','MemFree:'),(22,5,'','SwapFree:'),(22,40,'','MemFree:'),(22,41,'','SwapFree:'),(22,49,'','MemFree:'),(22,50,'','SwapFree:'),(22,54,'','MemFree:'),(22,55,'','SwapFree:'),(29,7,'',''),(31,6,'on',''),(31,45,'','dskDevice'),(31,69,'','dskDevice'),(32,6,'on',''),(32,45,'','/dev/sda7'),(32,69,'','/dev/sda7'),(33,6,'on',''),(33,45,'','1'),(33,69,'','1'),(35,30,'on',''),(35,31,'on',''),(36,30,'on',''),(36,31,'on',''),(37,30,'on',''),(37,31,'on',''),(39,9,'',''),(39,10,'',''),(39,11,'',''),(39,12,'',''),(39,29,'',''),(40,13,'',''),(40,14,'',''),(40,15,'',''),(40,16,'',''),(40,17,'',''),(40,18,'',''),(40,19,'',''),(40,22,'',''),(40,23,'',''),(40,24,'',''),(40,25,'',''),(40,26,'',''),(40,33,'',''),(40,56,NULL,'161'),(40,61,NULL,'161'),(40,62,NULL,'161'),(40,63,NULL,'161'),(40,64,NULL,'161'),(40,65,NULL,'161'),(40,66,NULL,'161'),(40,67,NULL,'161'),(40,68,NULL,'161'),(40,70,NULL,'161'),(41,13,'',''),(41,14,'',''),(41,15,'',''),(41,16,'',''),(41,17,'',''),(41,18,'',''),(41,19,'',''),(41,22,'',''),(41,23,'',''),(41,24,'',''),(41,25,'',''),(41,26,'',''),(41,33,'',''),(41,56,NULL,''),(41,61,NULL,''),(41,62,NULL,''),(41,63,NULL,''),(41,64,NULL,''),(41,65,NULL,''),(41,66,NULL,''),(41,67,NULL,''),(41,68,NULL,''),(41,70,NULL,''),(42,13,'',''),(42,14,'',''),(42,15,'',''),(42,16,'',''),(42,17,'',''),(42,18,'',''),(42,19,'',''),(42,22,'',''),(42,23,'',''),(42,24,'',''),(42,25,'',''),(42,26,'',''),(42,33,'',''),(42,56,NULL,''),(42,61,NULL,''),(42,62,NULL,''),(42,63,NULL,''),(42,64,NULL,''),(42,65,NULL,''),(42,66,NULL,''),(42,67,NULL,''),(42,68,NULL,''),(42,70,NULL,''),(43,13,'',''),(43,14,'',''),(43,15,'',''),(43,16,'',''),(43,17,'',''),(43,18,'',''),(43,19,'',''),(43,22,'',''),(43,23,'',''),(43,24,'',''),(43,25,'',''),(43,26,'',''),(43,33,'',''),(43,56,NULL,''),(43,61,NULL,''),(43,62,NULL,''),(43,63,NULL,''),(43,64,NULL,''),(43,65,NULL,''),(43,66,NULL,''),(43,67,NULL,''),(43,68,NULL,''),(43,70,NULL,''),(44,9,'',''),(44,29,'',''),(45,9,'',''),(45,29,'',''),(46,9,'',''),(46,29,'',''),(47,27,'',''),(47,60,NULL,'192.168.0.11'),(50,28,'',''),(50,59,NULL,'192.168.0.11');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_local`
--

LOCK TABLES `data_local` WRITE;
/*!40000 ALTER TABLE `data_local` DISABLE KEYS */;
INSERT INTO `data_local` VALUES (7,4,1,0,''),(8,5,1,0,''),(9,2,1,0,''),(10,3,1,0,''),(11,1,1,0,''),(12,6,1,1,'/dev/sda7'),(13,1,2,0,''),(14,2,2,0,''),(15,3,2,0,''),(16,4,2,0,''),(17,5,2,0,''),(18,1,3,0,''),(19,2,3,0,''),(20,3,3,0,''),(21,4,3,0,''),(22,5,3,0,''),(23,33,3,0,''),(24,20,3,0,''),(25,21,3,0,''),(26,28,3,0,''),(27,27,3,0,''),(28,26,3,0,''),(29,24,3,0,''),(30,22,3,0,''),(31,23,3,0,''),(32,25,3,0,''),(33,13,3,0,''),(34,15,3,0,''),(35,14,3,0,''),(36,6,3,1,'/dev/sda7'),(37,33,2,0,''),(38,20,2,0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_template_data`
--

LOCK TABLES `data_template_data` WRITE;
/*!40000 ALTER TABLE `data_template_data` DISABLE KEYS */;
INSERT INTO `data_template_data` VALUES (1,0,0,1,7,'','|host_description| - Processes','','','','on','',300,'on',1),(2,0,0,2,4,'','|host_description| - Load Average','','','','on','',300,'',1),(3,0,0,3,5,'','|host_description| - Logged in Users','','','','on','',300,'',1),(4,0,0,4,6,'','|host_description| - Memory - Free','','','','on','',300,'',1),(5,0,0,5,6,'','|host_description| - Memory - Free Swap','','','','on','',300,'',1),(6,0,0,6,11,'on','|host_description| - Hard Drive Space','','','','on','',300,'',1),(7,0,0,7,10,'','|host_description| - Ping Host','','','','on','',300,'',1),(8,0,0,8,1,'on','|host_description| -','','','','on','',300,'',1),(9,0,0,9,2,'on','|host_description| - Traffic','','','','on','',300,'',1),(10,0,0,10,2,'on','|host_description| - Errors/Discards','','','','on','',300,'',1),(11,0,0,11,2,'on','|host_description| - Unicast Packets','','','','on','',300,'',1),(12,0,0,12,2,'on','|host_description| - Non-Unicast Packets','','','','on','',300,'',1),(13,0,0,13,1,'','|host_description| - Load Average - 1 Minute','','','','on','',300,'',1),(14,0,0,14,1,'','|host_description| - Load Average - 5 Minute','','','','on','',300,'',1),(15,0,0,15,1,'','|host_description| - Load Average - 15 Minute','','','','on','',300,'',1),(16,0,0,16,1,'','|host_description| - Memory - Buffers','','','','on','',300,'',1),(17,0,0,17,1,'','|host_description| - Memory - Free','','','','on','',300,'',1),(18,0,0,18,1,'','|host_description| - Memory - Cache','','','','on','',300,'',1),(19,0,0,19,1,'','|host_description| - Memory - Total','','','','on','',300,'',1),(20,0,0,20,1,'','|host_description| - Logged in Users','','','','on','',300,'',1),(21,0,0,21,1,'','|host_description| - Processes','','','','on','',300,'',1),(22,0,0,22,1,'','|host_description| - CPU - System','','','','on','',300,'',1),(23,0,0,23,1,'','|host_description| - CPU - User','','','','on','',300,'',1),(24,0,0,24,1,'','|host_description| - CPU - Idle','','','','on','',300,'',1),(25,0,0,25,1,'','|host_description| - Interrupts','','','','on','',300,'',1),(26,0,0,26,1,'','|host_description| - Context Switches','','','','on','',300,'',1),(27,0,0,27,13,'','|host_description| - Combined SCSI Disk I/O','','','','on','',300,'',1),(28,0,0,28,14,'','|host_description| - Combined SCSI Disk Bytes','','','','on','',300,'',1),(29,0,0,29,2,'on','|host_description| - Hard Drive Space','','','','on','',300,'',1),(30,0,0,30,12,'','|host_description| - Hard Drive Space','','','','on','',300,'',1),(31,0,0,31,12,'','|host_description| - CPU Utilization','','','','on','',300,'on',1),(32,0,0,32,2,'','|host_description| - Device I/O -|query_diskIODevice|','','','','on','',300,'',1),(33,0,0,33,1,'','|host_description| - 5 Minute CPU','','','','on','',300,'',1),(40,4,7,4,6,NULL,'|host_description| - Memory - Free','localhost - Memory - Free','<path_rra>/localhost_mem_buffers_7.rrd','','on','',300,'',1),(41,5,8,5,6,NULL,'|host_description| - Memory - Free Swap','localhost - Memory - Free Swap','<path_rra>/localhost_mem_swap_8.rrd','','on','',300,'',1),(42,2,9,2,4,NULL,'|host_description| - Load Average','localhost - Load Average','<path_rra>/localhost_load_1min_9.rrd','','on','',300,'',1),(43,3,10,3,5,NULL,'|host_description| - Logged in Users','localhost - Logged in Users','<path_rra>/localhost_users_10.rrd','','on','',300,'',1),(44,1,11,1,7,NULL,'|host_description| - Processes','localhost - Processes','<path_rra>/localhost_proc_11.rrd','','on','',300,'',1),(45,6,12,6,11,NULL,'|host_description| - Free Space - |query_dskDevice|','localhost - Free Space - /dev/sda7','<path_rra>/localhost_hdd_free_12.rrd','','on','',300,'',1),(46,1,13,1,7,NULL,'|host_description| - Processes','vm  - Processes','<path_rra>/vm__proc_13.rrd','','on','',300,'',1),(47,2,14,2,4,NULL,'|host_description| - Load Average','vm  - Load Average','<path_rra>/vm__load_1min_14.rrd','','on','',300,'',1),(48,3,15,3,5,NULL,'|host_description| - Logged in Users','vm  - Logged in Users','<path_rra>/vm__users_15.rrd','','on','',300,'',1),(49,4,16,4,6,NULL,'|host_description| - Memory - Free','vm  - Memory - Free','<path_rra>/vm__mem_buffers_16.rrd','','on','',300,'',1),(50,5,17,5,6,NULL,'|host_description| - Memory - Free Swap','vm  - Memory - Free Swap','<path_rra>/vm__mem_swap_17.rrd','','on','',300,'',1),(51,1,18,1,7,NULL,'|host_description| - Processes','local - Processes','<path_rra>/local_proc_18.rrd','','on','',300,'',1),(52,2,19,2,4,NULL,'|host_description| - Load Average','local - Load Average','<path_rra>/local_load_1min_19.rrd','','on','',300,'',1),(53,3,20,3,5,NULL,'|host_description| - Logged in Users','local - Logged in Users','<path_rra>/local_users_20.rrd','','on','',300,'',1),(54,4,21,4,6,NULL,'|host_description| - Memory - Free','local - Memory - Free','<path_rra>/local_mem_buffers_21.rrd','','on','',300,'',1),(55,5,22,5,6,NULL,'|host_description| - Memory - Free Swap','local - Memory - Free Swap','<path_rra>/local_mem_swap_22.rrd','','on','',300,'',1),(56,33,23,33,1,NULL,'|host_description| - 5 Minute CPU','local - 5 Minute CPU','<path_rra>/local_5min_cpu_23.rrd','','on','',300,'',1),(57,20,24,20,1,NULL,'|host_description| - Logged in Users','local - Logged in Users','<path_rra>/local_users_24.rrd','','on','',300,'',1),(58,21,25,21,1,NULL,'|host_description| - Processes','local - Processes','<path_rra>/local_proc_25.rrd','','on','',300,'',1),(59,28,26,28,14,NULL,'|host_description| - Combined SCSI Disk Bytes','local - Combined SCSI Disk Bytes','<path_rra>/local_bytesread_26.rrd','','on','',300,'',1),(60,27,27,27,13,NULL,'|host_description| - Combined SCSI Disk I/O','local - Combined SCSI Disk I/O','<path_rra>/local_reads_27.rrd','','on','',300,'',1),(61,26,28,26,1,NULL,'|host_description| - Context Switches','local - Context Switches','<path_rra>/local_sssyscontext_28.rrd','','on','',300,'',1),(62,24,29,24,1,NULL,'|host_description| - CPU - Idle','local - CPU - Idle','<path_rra>/local_sscpuidle_29.rrd','','on','',300,'',1),(63,22,30,22,1,NULL,'|host_description| - CPU - System','local - CPU - System','<path_rra>/local_sscpusystem_30.rrd','','on','',300,'',1),(64,23,31,23,1,NULL,'|host_description| - CPU - User','local - CPU - User','<path_rra>/local_sscpuuser_31.rrd','','on','',300,'',1),(65,25,32,25,1,NULL,'|host_description| - Interrupts','local - Interrupts','<path_rra>/local_sssysinterrupts_32.rrd','','on','',300,'',1),(66,13,33,13,1,NULL,'|host_description| - Load Average - 1 Minute','local - Load Average - 1 Minute','<path_rra>/local_load_1min_33.rrd','','on','',300,'',1),(67,15,34,15,1,NULL,'|host_description| - Load Average - 15 Minute','local - Load Average - 15 Minute','<path_rra>/local_load_15min_34.rrd','','on','',300,'',1),(68,14,35,14,1,NULL,'|host_description| - Load Average - 5 Minute','local - Load Average - 5 Minute','<path_rra>/local_load_5min_35.rrd','','on','',300,'',1),(69,6,36,6,11,NULL,'|host_description| - Free Space - |query_dskDevice|','local - Free Space - /dev/sda7','<path_rra>/local_hdd_free_36.rrd','','on','',300,'',1),(70,33,37,33,1,NULL,'|host_description| - 5 Minute CPU','vm  - 5 Minute CPU','<path_rra>/vm__5min_cpu_37.rrd','','on','',300,'',1),(71,20,38,20,1,NULL,'|host_description| - Logged in Users','vm  - Logged in Users','<path_rra>/vm__users_38.rrd','','on','',300,'',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_template_rrd`
--

LOCK TABLES `data_template_rrd` WRITE;
/*!40000 ALTER TABLE `data_template_rrd` DISABLE KEYS */;
INSERT INTO `data_template_rrd` VALUES (1,'f1ba3a5b17b95825021241398bb0f277',0,0,1,'','1000','','0','',600,'',1,'','proc','',24),(2,'8175ca431c8fe50efff5a1d3ae51b55d',0,0,2,'','500','','0','',600,'',1,'','load_1min','',17),(3,'a2eeb8acd6ea01cd0e3ac852965c0eb6',0,0,2,'','500','','0','',600,'',1,'','load_5min','',18),(4,'9f951b7fb3b19285a411aebb5254a831',0,0,2,'','500','','0','',600,'',1,'','load_15min','',19),(5,'46a5afe8e6c0419172c76421dc9e304a',0,0,3,'','500','','0','',600,'',1,'','users','',21),(6,'a4df3de5238d3beabee1a2fe140d3d80',0,0,4,'','0','','0','',600,'',1,'','mem_buffers','',23),(7,'7fea6acc9b1a19484b4cb4cef2b6c5da',0,0,5,'','0','','0','',600,'',1,'','mem_swap','',23),(8,'4c82df790325d789d304e6ee5cd4ab7d',0,0,6,'','0','','0','',600,'',1,'','hdd_free','',0),(9,'07175541991def89bd02d28a215f6fcc',0,0,6,'','0','','0','',600,'',1,'','hdd_used','',0),(10,'962fd1994fe9cae87fb36436bdb8a742',0,0,7,'','5000','','0','',600,'',1,'','ping','',30),(11,'224b83ea73f55f8a861bcf4c9bea0472',0,0,8,'on','100','','0','',600,'on',1,'','snmp_oid','',0),(12,'2df25c57022b0c7e7d0be4c035ada1a0',0,0,9,'on','100000000000','','0','',600,'',2,'','traffic_in','',0),(13,'721c0794526d1ac1c359f27dc56faa49',0,0,9,'on','100000000000','','0','',600,'',2,'','traffic_out','',0),(14,'c802e2fd77f5b0a4c4298951bf65957c',0,0,10,'','10000000','','0','',600,'',2,'','errors_in','',0),(15,'4e2a72240955380dc8ffacfcc8c09874',0,0,10,'','10000000','','0','',600,'',2,'','discards_in','',0),(16,'13ebb33f9cbccfcba828db1075a8167c',0,0,10,'','10000000','','0','',600,'',2,'','discards_out','',0),(17,'31399c3725bee7e09ec04049e3d5cd17',0,0,10,'','10000000','','0','',600,'',2,'','errors_out','',0),(18,'636672962b5bb2f31d86985e2ab4bdfe',0,0,11,'','1000000000','','0','',600,'',2,'','unicast_in','',0),(19,'18ce92c125a236a190ee9dd948f56268',0,0,11,'','1000000000','','0','',600,'',2,'','unicast_out','',0),(20,'7be68cbc4ee0b2973eb9785f8c7a35c7',0,0,12,'','1000000000','','0','',600,'',2,'','nonunicast_out','',0),(21,'93e2b6f59b10b13f2ddf2da3ae98b89a',0,0,12,'','1000000000','','0','',600,'',2,'','nonunicast_in','',0),(22,'ed44c2438ef7e46e2aeed2b6c580815c',0,0,13,'','0','','0','',600,'',1,'','load_1min','',0),(23,'9b3a00c9e3530d9e58895ac38271361e',0,0,14,'','0','','0','',600,'',1,'','load_5min','',0),(24,'6746c2ed836ecc68a71bbddf06b0e5d9',0,0,15,'','0','','0','',600,'',1,'','load_15min','',0),(25,'9835d9e1a8c78aa2475d752e8fa74812',0,0,16,'','0','','0','',600,'',1,'','mem_buffers','',0),(26,'9c78dc1981bcea841b8c827c6dc0d26c',0,0,17,'','0','','0','',600,'',1,'','mem_free','',0),(27,'7a6ca455bbeff99ca891371bc77d5cf9',0,0,18,'','0','','0','',600,'',1,'','mem_cache','',0),(28,'129128c4c4769a74adfccf3bfa2eac32',0,0,19,'','0','','0',NULL,600,'',1,'','mem_total','',0),(29,'9464c91bcff47f23085ae5adae6ab987',0,0,20,'','0','','0','',600,'',1,'','users','',0),(30,'50ccbe193c6c7fc29fb9f726cd6c48ee',0,0,21,'','0','','0','',600,'',1,'','proc','',0),(31,'f7fc3e802831391ccd92c05b680da27c',0,0,22,'','0','','0','',600,'',1,'','ssCpuSystem','',0),(32,'93d64a9d12a9929013cd9e970a5d333c',0,0,23,'','0','','0','',600,'',1,'','ssCpuUser','',0),(33,'3d13e790d0eedbeaa9601dcd8c49be31',0,0,24,'','0','','0','',600,'',1,'','ssCpuIdle','',0),(34,'6f3c1f1706df1e20976bd5d616f63d1d',0,0,25,'','0','','0','',600,'',1,'','ssSysInterrupts','',0),(35,'4faab1acdeb03e2bad23d3b80cf9455f',0,0,26,'','0','','0','',600,'',1,'','ssSysContext','',0),(36,'9a925659fc657e446d8623fae0ee9bfa',0,0,27,'','0','','0','',600,'',1,'','reads','',48),(37,'67f8e5f269e7d77818cdb11a9639b561',0,0,27,'','0','','0','',600,'',1,'','writes','',49),(38,'1e2ceb5261d92b3b668b1b8b6c1c4d5f',0,0,28,'','0','','0','',600,'',1,'','bytesread','',51),(39,'dc830e6d271690a7d323199b00b09836',0,0,28,'','0','','0','',600,'',1,'','byteswritten','',52),(40,'2d53f9c76767a2ae8909f4152fd473a4',0,0,29,'','0','','0','',600,'',1,'','hdd_free','',0),(41,'93d91aa7a3cc5473e7b195d5d6e6e675',0,0,29,'','0','','0','',600,'',1,'','hdd_used','',0),(42,'0ee6bb54957f6795a5369a29f818d860',0,0,30,'','0','','0','',600,'',1,'','hdd_used','',0),(43,'165a0da5f461561c85d092dfe96b9551',0,0,30,'','0','','0','',600,'',1,'','hdd_total','',0),(44,'9825aaf7c0bdf1554c5b4b86680ac2c0',0,0,31,'','0','','0','',600,'',1,'','cpu','',0),(45,'bd02243964326257af313861ed5dbd68',0,0,32,'','0','','0','',600,'',2,'','Device_Reads','',0),(46,'0810b7d392b044e5947e324942a6c6dc',0,0,32,'','0','','0','',600,'',2,'','Bytes_Written','',0),(47,'5caf6f213e9e828efc9f8f9b2ed76d3d',0,0,32,'','0','','0','',600,'',2,'','Device_Writes','',0),(48,'15f554db4748ed584449fe6d3cddb38e',0,0,32,'','100','','0','',600,'',1,'','1Min_LoadAvg','',0),(49,'c7d3c107a9598f2a1209ed0fccd2527c',0,0,32,'','100','','0','',600,'',1,'','5Min_LoadAvg','',0),(50,'8aa93b5eb1db402622935784e9bce232',0,0,32,'','100','','0','',600,'',1,'','15Min_LoadAvg','',0),(51,'569d9564a56dfe030df1fec5b596a6eb',0,0,32,'','0','','0','',600,'',2,'','Bytes_Read','',0),(52,'3c0fd1a188b64a662dfbfa985648397b',0,0,33,'','100','','0','',600,'',1,'','5min_cpu','',0),(62,'',6,7,4,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'mem_buffers',NULL,23),(63,'',7,8,5,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'mem_swap',NULL,23),(64,'',2,9,2,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_1min',NULL,17),(65,'',3,9,2,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_5min',NULL,18),(66,'',4,9,2,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_15min',NULL,19),(67,'',5,10,3,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'users',NULL,21),(68,'',1,11,1,NULL,'1000',NULL,'0',NULL,600,NULL,1,NULL,'proc',NULL,24),(69,'',8,12,6,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_free',NULL,0),(70,'',9,12,6,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_used',NULL,0),(71,'',1,13,1,NULL,'1000',NULL,'0',NULL,600,NULL,1,NULL,'proc',NULL,24),(72,'',2,14,2,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_1min',NULL,17),(73,'',3,14,2,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_5min',NULL,18),(74,'',4,14,2,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_15min',NULL,19),(75,'',5,15,3,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'users',NULL,21),(76,'',6,16,4,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'mem_buffers',NULL,23),(77,'',7,17,5,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'mem_swap',NULL,23),(78,'',1,18,1,NULL,'1000',NULL,'0',NULL,600,NULL,1,NULL,'proc',NULL,24),(79,'',2,19,2,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_1min',NULL,17),(80,'',3,19,2,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_5min',NULL,18),(81,'',4,19,2,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_15min',NULL,19),(82,'',5,20,3,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'users',NULL,21),(83,'',6,21,4,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'mem_buffers',NULL,23),(84,'',7,22,5,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'mem_swap',NULL,23),(85,'',52,23,33,NULL,'100',NULL,'0',NULL,600,NULL,1,NULL,'5min_cpu',NULL,0),(86,'',29,24,20,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'users',NULL,0),(87,'',30,25,21,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'proc',NULL,0),(88,'',38,26,28,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'bytesread',NULL,51),(89,'',39,26,28,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'byteswritten',NULL,52),(90,'',36,27,27,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'reads',NULL,48),(91,'',37,27,27,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'writes',NULL,49),(92,'',35,28,26,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'ssSysContext',NULL,0),(93,'',33,29,24,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'ssCpuIdle',NULL,0),(94,'',31,30,22,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'ssCpuSystem',NULL,0),(95,'',32,31,23,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'ssCpuUser',NULL,0),(96,'',34,32,25,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'ssSysInterrupts',NULL,0),(97,'',22,33,13,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'load_1min',NULL,0),(98,'',24,34,15,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'load_15min',NULL,0),(99,'',23,35,14,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'load_5min',NULL,0),(100,'',8,36,6,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_free',NULL,0),(101,'',9,36,6,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_used',NULL,0),(102,'',52,37,33,NULL,'100',NULL,'0',NULL,600,NULL,1,NULL,'5min_cpu',NULL,0),(103,'',29,38,20,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'users',NULL,0);
/*!40000 ALTER TABLE `data_template_rrd` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COMMENT='Creates a relationship for each item in a custom graph.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_local`
--

LOCK TABLES `graph_local` WRITE;
/*!40000 ALTER TABLE `graph_local` DISABLE KEYS */;
INSERT INTO `graph_local` VALUES (6,4,1,0,0,''),(7,2,1,0,0,''),(8,3,1,0,0,''),(9,1,1,0,0,''),(10,5,1,1,1,'/dev/sda7'),(11,1,2,0,0,''),(12,2,2,0,0,''),(13,3,2,0,0,''),(14,4,2,0,0,''),(15,1,3,0,0,''),(16,2,3,0,0,''),(17,3,3,0,0,''),(18,4,3,0,0,''),(19,33,3,0,0,''),(20,20,3,0,0,''),(21,21,3,0,0,''),(22,26,3,0,0,''),(23,25,3,0,0,''),(24,24,3,0,0,''),(25,22,3,0,0,''),(26,23,3,0,0,''),(27,18,3,0,0,''),(28,5,3,1,1,'/dev/sda7'),(29,33,2,0,0,''),(30,20,2,0,0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1 COMMENT='Stores the actual graph data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_templates_graph`
--

LOCK TABLES `graph_templates_graph` WRITE;
/*!40000 ALTER TABLE `graph_templates_graph` DISABLE KEYS */;
INSERT INTO `graph_templates_graph` VALUES (1,0,0,1,'',1,'','|host_description| - Processes','','',200,'',700,'','100','','0','','processes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(2,0,0,2,'',1,'','|host_description| - Load Average','','',200,'',700,'','100','','0','','run que length','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','0','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(3,0,0,3,'',1,'','|host_description| - Logged in Users','','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(4,0,0,4,'',1,'','|host_description| - Memory Usage','','',200,'',700,'','100','','0','','kilobytes','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(5,0,0,5,'',1,'on','|host_description| - Available Disk Space','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(6,0,0,6,'',1,'','|host_description| - Ping Latency','','',200,'',700,'','100','','0','','milliseconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(7,0,0,7,'',1,'on','|host_description| -','','',200,'',700,'','100','','0','on','','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(8,0,0,8,'',1,'on','|host_description| - Traffic','','',200,'',700,'','100','','0','','bits per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(9,0,0,9,'',1,'on','|host_description| - Errors/Discards','','',200,'',700,'','100','','0','','errors/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(10,0,0,10,'',1,'on','|host_description| - Unicast Packets','','',200,'',700,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(11,0,0,11,'',1,'on','|host_description| - Non-Unicast Packets','','',200,'',700,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(12,0,0,12,'',1,'on','|host_description| - Traffic','','',200,'',700,'','100','','0','','bytes per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(13,0,0,13,'',1,'on','|host_description| - Traffic','','',200,'',700,'','100','','0','','bits per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(14,0,0,14,'',1,'on','|host_description| - Traffic','','',200,'',700,'','100','','0','','bits per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(15,0,0,15,'',1,'on','|host_description| - Traffic','','',200,'',700,'','100','','0','','bytes per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(16,0,0,16,'',1,'on','|host_description| - Multicast Packets','','',200,'',700,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(17,0,0,17,'',1,'on','|host_description| - Broadcast Packets','','',200,'',700,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(18,0,0,18,'',1,'','|host_description| - Load Average','','',200,'',700,'','100','','0','','run queue','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(19,0,0,19,'',1,'','|host_description| - Memory Usage','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(20,0,0,20,'',1,'','|host_description| - Logged in Users','','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(21,0,0,21,'',1,'','|host_description| - Processes','','',200,'',700,'','100','','0','','processes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(22,0,0,22,'',1,'','|host_description| - CPU Utilization','','',200,'',700,'','100','','0','','percent','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(23,0,0,23,'',1,'','|host_description| - Interrupts','','',200,'',700,'','100','','0','','Interrupts','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(24,0,0,24,'',1,'','|host_description| - Context Switches','','',200,'',700,'','100','','0','','Context Switches','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(25,0,0,25,'',1,'','|host_description| - Combined SCSI Disk I/O','','',200,'',700,'','100','','0','','operations/second','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(26,0,0,26,'',1,'','|host_description| - Combined SCSI Disk Bytes','','',200,'',700,'','100','','0','','bytes/second','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(27,0,0,27,'',1,'on','|host_description| - Hard Drive Space','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(28,0,0,28,'',1,'on','|host_description| - Available Disk Space','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(29,0,0,29,'',1,'on','|host_description| - CPU Utilization','','',200,'',700,'','110','','0','','percent','','on','','','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(30,0,0,30,'',1,'','|host_description| - Device I/O - Bytes Read/Written |query_diskIODevice|','','',200,'',700,'','0','','0','','Bytes Read/Written','','on','','on','',2,'','','','','','','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(31,0,0,31,'',1,'','|host_description| - Device I/O - Load Averages - |query_diskIODevice|','','',200,'',700,'','100','','0','','Load Average','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(32,0,0,32,'',1,'','|host_description| - Device I/O - Reads/Writes |query_diskIODevice|','','',200,'',700,'','0','','0','','Reads/Writes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(33,0,0,33,'',1,'','|host_description| - CPU Usage','','',200,'',700,'','100','','0','','percent','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(39,4,6,4,'',1,'','|host_description| - Memory Usage','localhost - Memory Usage','',200,'',700,'','100','','0','','kilobytes','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(40,2,7,2,'',1,'','|host_description| - Load Average','localhost - Load Average','',200,'',700,'','100','','0','','run que length','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','0','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(41,3,8,3,'',1,'','|host_description| - Logged in Users','localhost - Logged in Users','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(42,1,9,1,'',1,'','|host_description| - Processes','localhost - Processes','',200,'',700,'','100','','0','','processes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(43,5,10,5,'',1,'','|host_description| - Disk Space - |query_dskDevice|','localhost - Disk Space - /dev/sda7','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(44,1,11,1,'',1,'','|host_description| - Processes','vm  - Processes','',200,'',700,'','100','','0','','processes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(45,2,12,2,'',1,'','|host_description| - Load Average','vm  - Load Average','',200,'',700,'','100','','0','','run que length','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','0','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(46,3,13,3,'',1,'','|host_description| - Logged in Users','vm  - Logged in Users','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(47,4,14,4,'',1,'','|host_description| - Memory Usage','vm  - Memory Usage','',200,'',700,'','100','','0','','kilobytes','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(48,1,15,1,'',1,'','|host_description| - Processes','local - Processes','',200,'',700,'','100','','0','','processes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(49,2,16,2,'',1,'','|host_description| - Load Average','local - Load Average','',200,'',700,'','100','','0','','run que length','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','0','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(50,3,17,3,'',1,'','|host_description| - Logged in Users','local - Logged in Users','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(51,4,18,4,'',1,'','|host_description| - Memory Usage','local - Memory Usage','',200,'',700,'','100','','0','','kilobytes','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(52,33,19,33,'',1,'','|host_description| - CPU Usage','local - CPU Usage','',200,'',700,'','100','','0','','percent','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(53,20,20,20,'',1,'','|host_description| - Logged in Users','local - Logged in Users','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(54,21,21,21,'',1,'','|host_description| - Processes','local - Processes','',200,'',700,'','100','','0','','processes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(55,26,22,26,'',1,'','|host_description| - Combined SCSI Disk Bytes','local - Combined SCSI Disk Bytes','',200,'',700,'','100','','0','','bytes/second','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(56,25,23,25,'',1,'','|host_description| - Combined SCSI Disk I/O','local - Combined SCSI Disk I/O','',200,'',700,'','100','','0','','operations/second','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(57,24,24,24,'',1,'','|host_description| - Context Switches','local - Context Switches','',200,'',700,'','100','','0','','Context Switches','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(58,22,25,22,'',1,'','|host_description| - CPU Utilization','local - CPU Utilization','',200,'',700,'','100','','0','','percent','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(59,23,26,23,'',1,'','|host_description| - Interrupts','local - Interrupts','',200,'',700,'','100','','0','','Interrupts','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(60,18,27,18,'',1,'','|host_description| - Load Average','local - Load Average','',200,'',700,'','100','','0','','run queue','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(61,5,28,5,'',1,'','|host_description| - Disk Space - |query_dskDevice|','local - Disk Space - /dev/sda7','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(62,33,29,33,'',1,'','|host_description| - CPU Usage','vm  - CPU Usage','',200,'',700,'','100','','0','','percent','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(63,20,30,20,'',1,'','|host_description| - Logged in Users','vm  - Logged in Users','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=latin1 COMMENT='Stores the actual graph item data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_templates_item`
--

LOCK TABLES `graph_templates_item` WRITE;
/*!40000 ALTER TABLE `graph_templates_item` DISABLE KEYS */;
INSERT INTO `graph_templates_item` VALUES (1,'ba00ecd28b9774348322ff70a96f2826',0,0,1,1,48,'7F',7,0.00,'',0,0,0,'',1,'','Running Processes<>','','',2,1),(2,'304244ca63d5b09e62a94c8ec6fbda8d',0,0,1,1,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(3,'da1ba71a93d2ed4a2a00d54592b14157',0,0,1,1,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(4,'5b4f05b04f704a24c663998293fa8848',0,0,1,1,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(5,'93ad2f2803b5edace85d86896620b9da',0,0,2,2,15,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute Average','','',2,1),(6,'fa1570f2b111da3555e165c7873a376b',0,0,2,2,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,2),(7,'16675723e5e9885489c2ccbbcee82ef0',0,0,2,2,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,3),(8,'31aab74f1dc7d1bf540da8cc19203944',0,0,2,2,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,4),(9,'bbdfa13adc00398eed132b1ccb4337d2',0,0,2,3,8,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute Average','','',2,5),(10,'0f5158874901e0ecfba9b4dc9a4f3afd',0,0,2,3,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,6),(11,'e8425ef97ba1b5d98a84bda5ea42c0e8',0,0,2,3,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,7),(12,'760f184ddf2c4f10d26f1b1eec68f579',0,0,2,3,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,8),(13,'9cf6ed48a6a54b9644a1de8c9929bd4e',0,0,2,4,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute Average','','',2,9),(14,'0dd3ea1600ef0749b7895f349de650a0',0,0,2,4,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,10),(15,'15ac9644211ac78240154a0eb3cd8b29',0,0,2,4,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,11),(16,'c45aeff75d805220a7798f46324381f6',0,0,2,4,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,12),(17,'fa1bc4eff128c4da70f5247d55b8a444',0,0,2,0,1,'FF',4,0.00,'',0,12,0,'',1,'','','','on',2,13),(18,'cf0848f7482b56ea746453f90881d05e',0,0,2,2,15,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,14),(19,'ebb3b6d41faaf7338fd640b8ff720cb3',0,0,2,3,8,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(20,'f995fe7d096e2ef4b33608328ebc0843',0,0,2,4,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,16),(21,'5c94ac24bc0d6d2712cc028fa7d4c7d2',0,0,3,5,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(22,'8bc7f905526f62df7d5c2d8c27c143c1',0,0,3,5,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(23,'cd074cd2b920aab70d480c020276d45b',0,0,3,5,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(24,'415630f25f5384ba0c82adbdb05fe98b',0,0,3,5,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(25,'c55914240f7e1d4f881ea598d4de9196',0,0,3,5,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(26,'5fa7c2317f19440b757ab2ea1cae6abc',0,0,4,6,41,'FF',7,0.00,'',0,14,0,'',1,'','Free','','',2,9),(27,'b1d18060bfd3f68e812c508ff4ac94ed',0,0,4,6,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,10),(28,'780b6f0850aaf9431d1c246c55143061',0,0,4,6,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,11),(29,'2d54a7e7bb45e6c52d97a09e24b7fba7',0,0,4,6,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,12),(30,'40206367a3c192b836539f49801a0b15',0,0,4,7,30,'FF',8,0.00,'',0,14,0,'',1,'','Swap','','',2,13),(31,'7ee72e2bb3722d4f8a7f9c564e0dd0d0',0,0,4,7,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,14),(32,'c8af33b949e8f47133ee25e63c91d4d0',0,0,4,7,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,15),(33,'568128a16723d1195ce6a234d353ce00',0,0,4,7,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,16),(34,'6ca2161c37b0118786dbdb46ad767e5d',0,0,5,9,48,'7F',7,0.00,'',0,14,0,'',1,'','Used','','',2,1),(35,'8ef3e7fb7ce962183f489725939ea40f',0,0,5,9,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,2),(36,'3b13eb2e542fe006c9bf86947a6854fa',0,0,5,9,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,3),(37,'a751838f87068e073b95be9555c57bde',0,0,5,9,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,4),(38,'5d6dff9c14c71dc1ebf83e87f1c25695',0,0,5,8,20,'7F',8,0.00,'',0,14,0,'',1,'','Available','','',2,5),(39,'b27cb9a158187d29d17abddc6fdf0f15',0,0,5,8,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(40,'6c0555013bb9b964e51d22f108dae9b0',0,0,5,8,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(41,'42ce58ec17ef5199145fbf9c6ee39869',0,0,5,8,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(42,'9bdff98f2394f666deea028cbca685f3',0,0,5,0,1,'FF',5,0.00,'',0,15,0,'',1,'','Total','','',2,9),(43,'fb831fefcf602bc31d9d24e8e456c2e6',0,0,5,0,0,'FF',9,0.00,'',0,15,0,'',4,'','Current:','','',2,10),(44,'5a958d56785a606c08200ef8dbf8deef',0,0,5,0,0,'FF',9,0.00,'',0,15,0,'',1,'','Average:','','',2,11),(45,'5ce67a658cec37f526dc84ac9e08d6e7',0,0,5,0,0,'FF',9,0.00,'',0,15,0,'',3,'','Maximum:','','on',2,12),(46,'ac0ffc9f0f2cb7f8c6cb9eb8fa73b390',0,0,5,9,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(47,'d9fc8b516374885c6c45153803e5b90a',0,0,5,8,20,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(48,'8b693a3303345abdc5ad9798895bc6c4',0,0,6,10,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,1),(49,'80e0aa956f50c261e5143273da58b8a3',0,0,6,10,25,'7F',7,0.00,'',0,0,0,'',1,'','','','',2,2),(50,'48fdcae893a7b7496e1a61efc3453599',0,0,6,10,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(51,'22f43e5fa20f2716666ba9ed9a7d1727',0,0,6,10,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(52,'3e86d497bcded7af7ab8408e4908e0d8',0,0,6,10,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(53,'41316670b1a36171de2bda91a0cc2364',0,0,7,11,98,'FF',7,0.00,'',0,0,0,'',1,'','','','',2,1),(54,'c9e8cbdca0215b434c902e68755903ea',0,0,7,11,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(55,'dab91d7093e720841393feea5bdcba85',0,0,7,11,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(56,'03e5bd2151fea3c90843eb1130b84458',0,0,7,11,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(57,'67b03eadc8e1d948a23326b7c6e225aa',0,0,8,12,22,'FF',4,0.00,'',0,2,0,'',3,'','','','',2,1),(58,'0470b2427dbfadb6b8346e10a71268fa',0,0,8,12,22,'7F',7,0.00,'',0,2,0,'',1,'','Inbound','','',2,2),(59,'84a5fe0db518550266309823f994ce9c',0,0,8,12,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,3),(60,'2f222f28084085cd06a1f46e4449c793',0,0,8,12,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,4),(61,'55acbcc33f46ee6d754e8e81d1b54808',0,0,8,12,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','on',2,5),(62,'d71b8ba294f057e0f135cc4c644e6b0d',0,0,8,13,20,'FF',4,0.00,'',0,2,0,'',3,'','','','',2,6),(63,'fdaf2321fc890e355711c2bffc07d036',0,0,8,13,20,'7F',7,0.00,'',0,2,0,'',1,'','Outbound','','',2,7),(64,'768318f42819217ed81196d2179d3e1b',0,0,8,13,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,8),(65,'cb3aa6256dcb3acd50d4517b77a1a5c3',0,0,8,13,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,9),(66,'671e989be7cbf12c623b4e79d91c7bed',0,0,8,13,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','on',2,10),(67,'7e04a041721df1f8828381a9ea2f2154',0,0,9,15,31,'FF',4,0.00,'',0,0,0,'',1,'','Discards In','','',2,1),(68,'afc8bca6b1b3030a6d71818272336c6c',0,0,9,15,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(69,'6ac169785f5aeaf1cc5cdfd38dfcfb6c',0,0,9,15,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(70,'178c0a0ce001d36a663ff6f213c07505',0,0,9,15,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(71,'8e3268c0abde7550616bff719f10ee2f',0,0,9,14,48,'FF',4,0.00,'',0,0,0,'',1,'','Errors In','','',2,5),(72,'18891392b149de63b62c4258a68d75f8',0,0,9,14,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(73,'dfc9d23de0182c9967ae3dabdfa55a16',0,0,9,14,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(74,'c47ba64e2e5ea8bf84aceec644513176',0,0,9,14,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(75,'617d10dff9bbc3edd9d733d9c254da76',0,0,9,16,18,'FF',4,0.00,'',0,0,0,'',1,'','Discards Out','','',2,9),(76,'9269a66502c34d00ac3c8b1fcc329ac6',0,0,9,16,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,10),(77,'d45deed7e1ad8350f3b46b537ae0a933',0,0,9,16,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,11),(78,'2f64cf47dc156e8c800ae03c3b893e3c',0,0,9,16,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,12),(79,'57434bef8cb21283c1a73f055b0ada19',0,0,9,17,89,'FF',4,0.00,'',0,0,0,'',1,'','Errors Out','','',2,13),(80,'660a1b9365ccbba356fd142faaec9f04',0,0,9,17,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,14),(81,'28c5297bdaedcca29acf245ef4bbed9e',0,0,9,17,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,15),(82,'99098604fd0c78fd7dabac8f40f1fb29',0,0,9,17,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,16),(83,'d4e5f253f01c3ea77182c5a46418fc44',0,0,10,18,25,'7F',7,0.00,'',0,0,0,'',1,'','Unicast Packets In','','',2,1),(84,'526a96add143da021c5f00d8764a6c12',0,0,10,18,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(85,'81eeb46f451212f00fd7caee42a81c0b',0,0,10,18,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(86,'089e4d1c3faeb00fd5dcc9622b06d656',0,0,10,18,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(87,'9d052e7d632c479737fbfaced0821f79',0,0,10,19,71,'7F',7,0.00,'',0,0,0,'',1,'','Unicast Packets Out','','',2,5),(88,'9b9fa6268571b6a04fa4411d8e08c730',0,0,10,19,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(89,'8e8f2fbeb624029cbda1d2a6ddd991ba',0,0,10,19,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(90,'c76495beb1ed01f0799838eb8a893124',0,0,10,19,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(91,'042d90f1a390c15509ae208bd97aa885',0,0,10,18,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(92,'3641f6b8e83ea26e73d41ceccf38b131',0,0,10,19,71,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,10),(93,'fe66cb973966d22250de073405664200',0,0,11,21,25,'7F',7,0.00,'',0,0,0,'',1,'','Non-Unicast Packets In','','',2,1),(94,'1ba3fc3466ad32fdd2669cac6cad6faa',0,0,11,21,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(95,'f810154d3a934c723c21659e66199cdf',0,0,11,21,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(96,'98a161df359b01304346657ff1a9d787',0,0,11,21,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(97,'d5e55eaf617ad1f0516f6343b3f07c5e',0,0,11,20,71,'7F',7,0.00,'',0,0,0,'',1,'','Non-Unicast Packets Out','','',2,5),(98,'9fde6b8c84089b9f9044e681162e7567',0,0,11,20,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(99,'9a3510727c3d9fa7e2e7a015783a99b3',0,0,11,20,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(100,'451afd23f2cb59ab9b975fd6e2735815',0,0,11,20,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(101,'c72c76b0c6d9066a4feea17ca032b3cd',0,0,11,21,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(102,'8b281ba233f7a382f8d9094f2019ec94',0,0,11,20,71,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,10),(103,'b276e28b10447b11ee289f78e0c1ed82',0,0,12,12,22,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,1),(104,'de3eefd6d6c58afabdabcaf6c0168378',0,0,12,12,22,'7F',7,0.00,'',0,0,0,'',1,'','Inbound','','',2,2),(105,'1a80fa108f5c46eecb03090c65bc9a12',0,0,12,12,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(106,'fe458892e7faa9d232e343d911e845f3',0,0,12,12,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(107,'175c0a68689bebc38aad2fbc271047b3',0,0,12,12,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(108,'f9da7d4c2da9636f2f3e37f4781954db',0,0,12,13,20,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,6),(109,'1bf2283106510491ddf3b9c1376c0b31',0,0,12,13,20,'7F',4,0.00,'',0,0,0,'',1,'','Outbound','','',2,7),(110,'c5202f1690ffe45600c0d31a4a804f67',0,0,12,13,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,8),(111,'eb9794e3fdafc2b74f0819269569ed40',0,0,12,13,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,9),(112,'6bcedd61e3ccf7518ca431940c93c439',0,0,12,13,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,10),(113,'11d87688979b97cf026809f75cef30be',0,0,13,12,22,'FF',4,1.00,'',0,2,0,'',3,'','','','',2,1),(114,'918e6e7d41bb4bae0ea2937b461742a4',0,0,13,12,22,'7F',7,0.00,'',0,2,0,'',1,'','Inbound','','',2,2),(115,'f19fbd06c989ea85acd6b4f926e4a456',0,0,13,12,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,3),(116,'fc150a15e20c57e11e8d05feca557ef9',0,0,13,12,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,4),(117,'ccbd86e03ccf07483b4d29e63612fb18',0,0,13,12,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','on',2,5),(118,'75796e3f885739c2d7229fd25babf30d',0,0,13,13,20,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,6),(119,'964c5c30cd05eaf5a49c0377d173de86',0,0,13,13,20,'7F',7,0.00,'',0,2,0,'',1,'','Outbound','','',2,7),(120,'b1a6fb775cf62e79e1c4bc4933c7e4ce',0,0,13,13,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,8),(121,'721038182a872ab266b5cf1bf7f7755c',0,0,13,13,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,9),(122,'2302f80c2c70b897d12182a1fc11ecd6',0,0,13,13,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','on',2,10),(123,'4ffc7af8533d103748316752b70f8e3c',0,0,13,0,0,'FF',1,0.00,'',0,0,0,'',1,'','','','on',2,11),(124,'64527c4b6eeeaf627acc5117ff2180fd',0,0,13,13,9,'FF',2,0.00,'',0,0,0,'',1,'','95th Percentile','|95:bits:0:max:2|','',2,12),(125,'d5bbcbdbf83ae858862611ac6de8fc62',0,0,13,13,0,'FF',1,0.00,'',0,0,0,'',1,'','(|95:bits:6:max:2| mbit in+out)','','',2,13),(126,'9ee6db2f910144bc95760876d0a16a62',0,0,14,12,22,'FF',4,1.00,'',0,2,0,'',3,'','','','',2,1),(127,'1995d8c23e7d8e1efa2b2c55daf3c5a7',0,0,14,12,22,'7F',7,0.00,'',0,2,0,'',1,'','Inbound','','',2,2),(128,'55083351cd728b82cc4dde68eb935700',0,0,14,12,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,3),(129,'54782f71929e7d1734ed5ad4b8dda50d',0,0,14,12,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,4),(130,'88d3094d5dc2164cbf2f974aeb92f051',0,0,14,12,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','',2,5),(131,'5b43e4102600ad75379c5afd235099c4',0,0,14,12,0,'FF',1,0.00,'',0,0,0,'',1,'','Total In:  |sum:auto:current:2:auto|','','on',2,6),(132,'c4886a8552ee60c6559de8ab16c2dcf2',0,0,14,13,20,'FF',4,1.00,'',0,2,0,'',3,'','','','',2,7),(133,'4a381a8e87d4db1ac99cf8d9078266d3',0,0,14,13,20,'7F',7,0.00,'',0,2,0,'',1,'','Outbound','','',2,8),(134,'5bff63207c7bf076d76ff3036b5dad54',0,0,14,13,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,9),(135,'979fff9d691ca35e3f4b3383d9cae43f',0,0,14,13,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,10),(136,'0e715933830112c23c15f7e3463f77b6',0,0,14,13,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','',2,11),(137,'db7c15d253ca666601b3296f2574edc9',0,0,14,13,0,'FF',1,0.00,'',0,0,0,'',1,'','Total Out: |sum:auto:current:2:auto|','','on',2,12),(138,'3baa47b136f8c36ccea69196b0285a6c',0,0,15,12,22,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,1),(139,'3ff8dba1ca6279692b3fcabed0bc2631',0,0,15,12,22,'7F',7,0.00,'',0,0,0,'',1,'','Inbound','','',2,2),(140,'66bfdb701c8eeadffe55e926d6e77e71',0,0,15,12,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(141,'777aa88fb0a79b60d081e0e3759f1cf7',0,0,15,12,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(142,'de265acbbfa99eb4b3e9f7e90c7feeda',0,0,15,12,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','',2,5),(143,'76ae747365553a02313a2d8a0dd55c8a',0,0,15,12,0,'FF',1,0.00,'',0,0,0,'',1,'','Total In:  |sum:auto:current:2:auto|','','on',2,6),(144,'43a2cef12147952c703fc0fc473dec7a',0,0,15,13,20,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,7),(145,'cf8c9f69878f0f595d583eac109a9be1',0,0,15,13,20,'7F',7,0.00,'',0,0,0,'',1,'','Outbound','','',2,8),(146,'54e3971b3dd751dd2509f62721c12b41',0,0,15,13,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,9),(147,'6824d29c3f13fe1e849f1dbb8377d3f1',0,0,15,13,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,10),(148,'fdaec5b9227522c758ad55882c483a83',0,0,15,13,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','',2,11),(149,'d6041d14f9c8fb9b7ddcf3556f763c03',0,0,15,13,0,'FF',1,0.00,'',0,0,0,'',1,'','Total Out: |sum:auto:current:2:auto|','','on',2,12),(150,'34a594c6b419427329b10f73f40e85f7',0,0,16,18,25,'7F',7,0.00,'',0,0,0,'',1,'','Multicast Packets In','','',2,1),(151,'1540d561f6ab4b55ac810661fb0c93ee',0,0,16,18,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(152,'e9e41de3845454688f838662e4c34aa7',0,0,16,18,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(153,'350ebb1cd31fb46d9997bc21a00d36b1',0,0,16,18,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(154,'16f958e2b047113d38c7550c76ef04c8',0,0,16,19,71,'7F',7,0.00,'',0,0,0,'',1,'','Multicast Packets Out','','',2,5),(155,'a393430c1db0d9da48dca3098022cf50',0,0,16,19,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(156,'3f73834149d86814a4dbbfa4052fdb14',0,0,16,19,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(157,'07164e2d5ebe685b622a97250dab9cc2',0,0,16,19,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(158,'2a19f1c71b1ff8edea69af3f1825cec0',0,0,16,18,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(159,'e9625f33db3635e39e206334da9f99ef',0,0,16,19,71,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,10),(160,'ea54bfaa4bad2b6862165840418f5fd4',0,0,17,21,25,'7F',7,0.00,'',0,0,0,'',1,'','Broadcast Packets In','','',2,1),(161,'a2508ab1f57dff7b143433ab81ff7a3e',0,0,17,21,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(162,'cab434df67b94a93728ab794b1d0f6fb',0,0,17,21,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(163,'29d51e734ad14bcdb3a9b7a640f2c4a3',0,0,17,21,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(164,'725d97e3666c2417241ca7bb67a8c902',0,0,17,20,71,'7F',7,0.00,'',0,0,0,'',1,'','Broadcast Packets Out','','',2,5),(165,'b01f45a155e10f49d640d13b50aa61a5',0,0,17,20,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(166,'eb37825efbb281484cdb1e896764b73a',0,0,17,20,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(167,'b18b67ef2779d5ff43843cac220d9bb9',0,0,17,20,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(168,'56ea543140aa516299ba202b313fc822',0,0,17,21,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(169,'ce17bd1ed1efaa2f7eb2b1fef7354d8d',0,0,17,20,71,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,10),(170,'d77d2050be357ab067666a9485426e6b',0,0,18,22,15,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute Average','','',2,1),(171,'664b23027b847964b9cf92e16538ee66',0,0,18,22,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,2),(172,'2832fe3cb648e0c7a0905d04c39e7093',0,0,18,22,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,3),(173,'12b7126f3ced07574b1e5f8bf3f1b4bc',0,0,18,22,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,4),(174,'8580230d31d2851ec667c296a665cbf9',0,0,18,23,8,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute Average','','',2,5),(175,'48099998fd7cddeab6685b6e3bf07b1a',0,0,18,23,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,6),(176,'af5b1e90e9ad3e2a5ce0e0cd58bdb76b',0,0,18,23,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,7),(177,'28953315320fc3bea62f8a9a094825e3',0,0,18,23,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,8),(178,'2ec10edf4bfaa866b7efd544d4c3f446',0,0,18,24,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute Average','','',2,9),(179,'efc200ea9c770725ffed0f5b75976035',0,0,18,24,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,10),(180,'b81c4fba7c56fb91f722b41c806d3fe8',0,0,18,24,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,11),(181,'520a2b1fed006bf79bd81c30b7478781',0,0,18,24,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,12),(182,'f1e343e458e95676cb4fa98ccfa89be2',0,0,18,22,15,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(183,'401fc06aff694aef1333b2aeaafc598e',0,0,18,23,8,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(184,'96698209a56e2765d6b31c6a15cef66b',0,0,18,24,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(185,'5dcf25ffb22516593f0989c350e23976',0,0,19,28,142,'7F',7,1.00,'',0,14,0,'',1,'','Memory Total','','',2,1),(186,'4813c1df025417d45dd0fb5062d4f095',0,0,19,28,0,'FF',9,1.00,'',0,14,0,'',4,'','Current:','','',2,2),(187,'749d182a551ada29c6db6992cd791dbd',0,0,19,28,0,'FF',9,1.00,'',0,14,0,'',1,'','Average:','','',2,3),(188,'68beff095c894bf5336982459f8763e3',0,0,19,28,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(189,'95d6e4e5110b456f34324f7941d08318',0,0,19,25,35,'7F',7,0.00,'',0,14,0,'',1,'','Memory Buffers','','',2,5),(190,'0c631bfc0785a9cca68489ea87a6c3da',0,0,19,25,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(191,'3468579d3b671dfb788696df7dcc1ec9',0,0,19,25,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(192,'c3ddfdaa65449f99b7f1a735307f9abe',0,0,19,25,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(193,'8a1b44ab97d3b56207d0e9e77a035d25',0,0,19,27,30,'7F',8,0.00,'',0,14,0,'',1,'','Cache Memory','','',2,9),(194,'6db3f439e9764941ff43fbaae348f5dc',0,0,19,27,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,10),(195,'cc9b2fe7acf0820caa61c1519193f65e',0,0,19,27,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,11),(196,'9eea140bdfeaa40d50c5cdcd1f23f72d',0,0,19,27,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,12),(197,'7517a40d478e28ed88ba2b2a65e16b57',0,0,19,26,52,'7F',8,0.00,'',0,14,0,'',1,'','Memory Free','','',2,13),(198,'df0c8b353d26c334cb909dc6243957c5',0,0,19,26,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,14),(199,'c41a4cf6fefaf756a24f0a9510580724',0,0,19,26,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,15),(200,'9efa8f01c6ed11364a21710ff170f422',0,0,19,26,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,16),(201,'2cc00941cd1690789f952f5c9976db1a',0,0,19,28,143,'FF',4,1.00,'',0,14,0,'',3,'','','','',2,17),(202,'479deb05c1b4bc8491ddca5cdb4801a4',0,0,19,25,35,'FF',4,1.00,'',0,14,0,'',3,'','','','',2,18),(203,'876c3723c5dbd6654d13259e5976dfd0',0,0,19,27,30,'FF',20,1.00,'',0,14,0,'',3,'','','','',2,19),(204,'d35384da14f3df0baf3f276a9140661a',0,0,19,26,52,'FF',20,1.00,'',0,14,0,'',3,'','','','',2,20),(205,'38f6891b0db92aa8950b4ce7ae902741',0,0,20,29,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(206,'af13152956a20aa894ef4a4067b88f63',0,0,20,29,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(207,'1b2388bbede4459930c57dc93645284e',0,0,20,29,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(208,'6407dc226db1d03be9730f4d6f3eeccf',0,0,20,29,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(209,'26b0e9922e1e4c1961b9120e90881985',0,0,20,29,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(210,'fca6a530c8f37476b9004a90b42ee988',0,0,21,30,48,'7F',7,0.00,'',0,0,0,'',1,'','Running Processes','','',2,1),(211,'5acebbde3dc65e02f8fda03955852fbe',0,0,21,30,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(212,'311079ffffac75efaab2837df8123122',0,0,21,30,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(213,'724d27007ebf31016cfa5530fee1b867',0,0,21,30,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','',3,4),(214,'aa2be4ba323b0ded621b3e34737b26a1',0,0,21,30,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(215,'53c9b0999e402a4a7cbeface3ea84479',0,0,22,31,48,'7F',7,0.00,'',0,0,0,'',1,'','System:','','',2,1),(216,'23ce25454b19d116c2665f36276178cd',0,0,22,31,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,2),(217,'8f8f596cda649b141e6fb33753328441',0,0,22,31,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,3),(218,'f64a0489181fca04c3ab9756d599cd2a',0,0,22,31,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,4),(219,'444155b1d39f0414b8f7536d05725f10',0,0,22,32,6,'7F',8,0.00,'',0,0,0,'',1,'','User:','','',2,5),(220,'ff1636dec0cf9582770ebc8d41f8ad92',0,0,22,32,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,6),(221,'a9814713bdd7982063ede15294e44353',0,0,22,32,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,7),(222,'b74446b41339040c50769c528f140afc',0,0,22,32,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,8),(223,'7a8fd8ba66b859e766b4b5f4f634dbce',0,0,22,33,112,'7F',8,0.00,'',0,0,0,'',1,'','Idle:','','',2,9),(224,'073b77aec68c56fb703c95e4999a99a6',0,0,22,33,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,10),(225,'3c0f7af8872c51acbf79b71b79f0bad5',0,0,22,33,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,11),(226,'ca50f081abe0f8718977f2982f2209f1',0,0,22,33,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,12),(227,'709a9acaaab34bc6976eb8499f1828ce',0,0,22,0,69,'7F',8,0.00,'',0,16,0,'',1,'','IO Wait:','','',2,13),(228,'7d4a7f4d52491c0b25dcbbe2222d0f0d',0,0,22,0,0,'FF',9,0.00,'',0,16,0,'',4,'','Current:','','',5,14),(229,'75390a70fc7589c23295d9ed45aa7614',0,0,22,0,0,'FF',9,0.00,'',0,16,0,'',1,'','Average:','','',5,15),(230,'ee981253aa7b49d9761a80ec0ad1541a',0,0,22,0,0,'FF',9,0.00,'',0,16,0,'',3,'','Maximum:','','on',5,16),(231,'857bb546882bc5049e673c4188cdda8b',0,0,23,34,46,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,1),(232,'e7261d3093976dbe63de4937296a9a96',0,0,23,34,46,'7F',7,0.00,'',0,0,0,'',1,'','Interrupts:','','',2,2),(233,'959854c407cfa371240c0744d44618a6',0,0,23,34,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,3),(234,'1fbdf8aef7acfbc90ba7d24b6644e432',0,0,23,34,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(235,'2df153e12b5db6ae3dea51df70f73651',0,0,23,34,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(236,'0b502e0b5d0228d17d3c30f5a04c7083',0,0,24,35,65,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,1),(237,'64c92d07fe3877e99dcc3b570ee90966',0,0,24,35,65,'7F',7,0.00,'',0,0,0,'',1,'','Context Switches:','','',2,2),(238,'72c6b8ab332e09e2894f18bcf5ba92fe',0,0,24,35,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,3),(239,'37f9956018cb4615de77aec4695fbb0c',0,0,24,35,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(240,'1d7fe63be7b044229b79b6203298e506',0,0,24,35,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(241,'c6034b9950f1eedb9623215773ac4c0e',0,0,25,36,67,'7F',7,0.00,'',0,17,0,'',1,'','Reads:','','',2,1),(242,'fc50e9a07b1662f659e87807228fcd50',0,0,25,36,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',3,2),(243,'fe48830387c7065ec8411d7509d4d387',0,0,25,36,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',3,3),(244,'f003813991610aa5f6889a2e5a526cca',0,0,25,36,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',3,4),(245,'822b07e6f130a6ea9c4e56b745d456bb',0,0,25,37,41,'7F',8,0.00,'',0,17,0,'',1,'','Writes:','','',2,5),(246,'9cca58312cb9a95693e7e2a2d36de347',0,0,25,37,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',3,6),(247,'b51a340cee28a09462ff313592a69a72',0,0,25,37,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',3,7),(248,'818864becb9866cf3a2121c5d4478d80',0,0,25,37,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',3,8),(249,'4a1e068ffc8c910ee9c5307d779c2db8',0,0,25,36,67,'FF',4,1.00,'',0,17,0,'',3,'','','','',2,9),(250,'f066a69f356fc13e266d4c7b737f8c0b',0,0,25,37,41,'FF',20,1.00,'',0,17,0,'',3,'','','','',2,10),(251,'46d2518edca9b8c584eb56da6e0d8591',0,0,26,38,60,'7F',7,0.00,'',0,17,0,'',1,'','Bytes Read:','','',2,1),(252,'278e15e34511ac2901776a5b2f57d86a',0,0,26,38,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',2,2),(253,'af0663bb419f274a0ed0136d4bd72367',0,0,26,38,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',2,3),(254,'bf1430f6ead0841deedd0453863d6f12',0,0,26,38,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',2,4),(255,'0d501ca8ba8d40edaaf84251ce59c423',0,0,26,39,31,'7F',8,0.00,'',0,17,0,'',1,'','Bytes Written:','','',2,5),(256,'214d9cdbf3964e6b96b3040a9d346cd1',0,0,26,39,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',2,6),(257,'9cc55857c9a94c366c7530a0c04aebe4',0,0,26,39,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',2,7),(258,'9e0b34da9be24a05c4e35d199158d7a8',0,0,26,39,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',2,8),(259,'aa49ac76638f30cd1e4b873155bdb1c1',0,0,26,38,60,'FF',4,1.00,'',0,17,0,'',3,'','','','',2,9),(260,'684c38d947eb1b9b64d718ab7a3552f3',0,0,26,39,31,'FF',20,1.00,'',0,17,0,'',3,'','','','',2,10),(261,'b561ed15b3ba66d277e6d7c1640b86f7',0,0,27,41,48,'7F',7,0.00,'',0,14,0,'',1,'','Used','','',2,1),(262,'99ef051057fa6adfa6834a7632e9d8a2',0,0,27,41,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,2),(263,'3986695132d3f4716872df4c6fbccb65',0,0,27,41,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,3),(264,'0444300017b368e6257f010dca8bbd0d',0,0,27,41,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,4),(265,'4d6a0b9063124ca60e2d1702b3e15e41',0,0,27,40,20,'7F',8,0.00,'',0,14,0,'',1,'','Available','','',2,5),(266,'181b08325e4d00cd50b8cdc8f8ae8e77',0,0,27,40,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(267,'bba0a9ff1357c990df50429d64314340',0,0,27,40,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(268,'d4a67883d53bc1df8aead21c97c0bc52',0,0,27,40,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(269,'253c9ec2d66905245149c1c2dc8e536e',0,0,27,0,1,'FF',5,0.00,'',0,15,0,'',1,'','Total','','',2,9),(270,'ea9ea883383f4eb462fec6aa309ba7b5',0,0,27,0,0,'FF',9,0.00,'',0,15,0,'',4,'','Current:','','',2,10),(271,'83b746bcaba029eeca170a9f77ec4864',0,0,27,0,0,'FF',9,0.00,'',0,15,0,'',1,'','Average:','','',2,11),(272,'82e01dd92fd37887c0696192efe7af65',0,0,27,0,0,'FF',9,0.00,'',0,15,0,'',3,'','Maximum:','','on',2,12),(273,'a198acfb7af4b149e97b2eeae05f7854',0,0,27,41,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(274,'fa2011b811862c238b476b5cd1d648e4',0,0,27,40,20,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(275,'d80e4a4901ab86ee39c9cc613e13532f',0,0,28,43,20,'7F',7,0.00,'',0,0,0,'',1,'','Total','','',2,1),(276,'567c2214ee4753aa712c3d101ea49a5d',0,0,28,43,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(277,'ba0b6a9e316ef9be66abba68b80f7587',0,0,28,43,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(278,'4b8e4a6bf2757f04c3e3a088338a2f7a',0,0,28,43,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(279,'16d6a9a7f608762ad65b0841e5ef4e9c',0,0,28,42,48,'7F',7,0.00,'',0,0,0,'',1,'','Used','','',2,5),(280,'2c35b5cae64c5f146a55fcb416dd14b5',0,0,28,42,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(281,'36fa8063df3b07cece878d54443db727',0,0,28,42,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(282,'b7b381d47972f836785d338a3bef6661',0,0,28,42,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(283,'fd1f89bda6ca439507b8b10a6895ef83',0,0,28,43,20,'FF',4,1.00,'',0,0,0,'',1,'','','','',2,9),(284,'204c34152b67dada375e7a147ebe7b3f',0,0,28,42,344,'FF',4,1.00,'',0,0,0,'',1,'','','','',2,10),(285,'42537599b5fb8ea852240b58a58633de',0,0,29,44,9,'7F',7,0.00,'',0,0,0,'',1,'','CPU Utilization','','',2,1),(286,'d478a76de1df9edf896c9ce51506c483',0,0,29,44,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(287,'8536e034ab5268a61473f1ff2f6bd88f',0,0,29,44,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(288,'87e10f9942b625aa323a0f39b60058e7',0,0,29,44,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(289,'309fd90f1a335fc13383a332a06504f1',0,0,29,44,9,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(290,'5f1c879abc0726777fca0fc789389c83',0,0,30,51,81,'7F',7,0.00,'',0,0,0,'',1,'','Bytes Read','','',2,1),(291,'51c0118319b44f47189ae31f0309f9f0',0,0,30,51,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(292,'0f89b5078bf70f0af2bf78234b23f00d',0,0,30,51,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(293,'0120d481227fa168959c10bb270caa18',0,0,30,51,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(294,'e73e2f5934a93891e7cbc573904bd6b4',0,0,30,46,31,'7F',8,0.00,'',0,0,0,'',1,'','Bytes Written','','',2,5),(295,'1c6656d52338c4abb6dadf149bfed8bf',0,0,30,46,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(296,'e37e7851de6f4fbcb7d56a154a105e87',0,0,30,46,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(297,'70eee256f03cfc9b2c94b79764c919f7',0,0,30,46,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(298,'bdca605f97fdfba3d40218f3fd1c6cb2',0,0,30,51,81,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(299,'592330a782c1e3234b068ba5c654b27e',0,0,30,46,31,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,10),(300,'2f92441bafd3b0ac3d8a7b8f14f7e7f4',0,0,31,48,25,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute:','','',2,1),(301,'95c77bfdeab8864b3308a8ddae8a16d6',0,0,31,48,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',2,2),(302,'3742a4866a8778864fc50f1f9ae10b06',0,0,31,48,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',2,3),(303,'aaaaa65c1525d22a62fd821c2b2ed7c5',0,0,31,48,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(304,'0a493360ea80b6c42fab0a25a4035ac9',0,0,31,49,31,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute:','','',2,5),(305,'b60da656f73dc1d11635625c2e6ef8c1',0,0,31,49,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',2,6),(306,'d44df4adf7c34dc15e76ab871c0f7ce6',0,0,31,49,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',2,7),(307,'e087987a73b788ff5661f66a9874fa59',0,0,31,49,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(308,'c970fc901877e404e96c0f5e3ff294b5',0,0,31,50,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute:','','',2,9),(309,'3794dae61e4e3edbdede2cb237154dc6',0,0,31,50,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',2,10),(310,'e585d22bc3d118452e586f731769954e',0,0,31,50,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',2,11),(311,'31e471174c77bdb8c2b88f126732e2ea',0,0,31,50,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,12),(312,'de8cc8b4d0b3bce5a15e0332abcc89f3',0,0,31,48,25,'FF',4,1.00,'',0,0,0,'',4,'','','','',2,13),(313,'9ab1319b03c5582751de0e918d27ba36',0,0,31,49,31,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(314,'5642ca20de5f7a517d4fe1b32c67d05f',0,0,31,50,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(315,'6b85618a4561027dc8dcb67583fdca53',0,0,32,45,21,'7F',7,0.00,'',0,0,0,'',1,'','Device Reads:','','',3,1),(316,'44c288205e20b2728a49386848edef0b',0,0,32,45,0,'FF',9,0.00,'',0,0,0,'',4,'','Last:','','',3,2),(317,'582b30daf33cec747505d4aa1b5beab3',0,0,32,45,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',3,3),(318,'0e1db768b3c884e7b70ef9c5f1b5c299',0,0,32,45,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(319,'d22a3018c9394f9c72e6a39535facd0d',0,0,32,45,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(320,'169f60ae37d15d6981fca7ab5b5899bb',0,0,32,47,9,'7F',8,0.00,'',0,0,0,'',1,'','Device Writes:','','',3,6),(321,'36692ccb814a0c7d7c1c4ed1fa51a185',0,0,32,47,0,'FF',9,0.00,'',0,0,0,'',4,'','Last:','','',3,7),(322,'8a880165df484c71ab809559158e2a15',0,0,32,47,0,'FF',9,0.00,'',0,0,0,'',2,'','Minumum:','','',3,8),(323,'634c71aa9ed03895176a26aceb375d83',0,0,32,47,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,9),(324,'168911021bc829a8abf4d4bfeacbe1d3',0,0,32,47,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,10),(325,'ce2b53b34a50ce8c54c8849b1c8baf9e',0,0,32,45,21,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,11),(326,'7675101daedceb6fd63d927e304f6273',0,0,32,47,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,12),(327,'098b10c13a5701ddb7d4d1d2e2b0fdb7',0,0,33,52,9,'FF',7,0.00,'',0,0,0,'',1,'','CPU Usage','','',2,1),(328,'1dbda412a9926b0ee5c025aa08f3b230',0,0,33,52,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(329,'725c45917146807b6a4257fc351f2bae',0,0,33,52,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(330,'4e336fdfeb84ce65f81ded0e0159a5e0',0,0,33,52,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(378,'',26,6,4,62,41,'FF',7,0.00,'',0,14,0,'',1,'','Free','','',2,9),(379,'',27,6,4,62,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,10),(380,'',28,6,4,62,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,11),(381,'',29,6,4,62,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,12),(382,'',30,6,4,63,30,'FF',8,0.00,'',0,14,0,'',1,'','Swap','','',2,13),(383,'',31,6,4,63,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,14),(384,'',32,6,4,63,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,15),(385,'',33,6,4,63,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,16),(386,'',5,7,2,64,15,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute Average','','',2,1),(387,'',6,7,2,64,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,2),(388,'',7,7,2,64,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,3),(389,'',8,7,2,64,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,4),(390,'',9,7,2,65,8,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute Average','','',2,5),(391,'',10,7,2,65,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,6),(392,'',11,7,2,65,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,7),(393,'',12,7,2,65,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,8),(394,'',13,7,2,66,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute Average','','',2,9),(395,'',14,7,2,66,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,10),(396,'',15,7,2,66,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,11),(397,'',16,7,2,66,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,12),(398,'',17,7,2,0,1,'FF',4,0.00,'',0,12,0,'',1,'','','','on',2,13),(399,'',18,7,2,64,15,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,14),(400,'',19,7,2,65,8,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(401,'',20,7,2,66,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,16),(402,'',21,8,3,67,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(403,'',22,8,3,67,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(404,'',23,8,3,67,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(405,'',24,8,3,67,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(406,'',25,8,3,67,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(407,'',1,9,1,68,48,'7F',7,0.00,'',0,0,0,'',1,'','Running Processes<>','','',2,1),(408,'',2,9,1,68,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(409,'',3,9,1,68,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(410,'',4,9,1,68,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(411,'',34,10,5,70,48,'7F',7,0.00,'',0,14,0,'',1,'','Used','','',2,1),(412,'',35,10,5,70,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,2),(413,'',36,10,5,70,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,3),(414,'',37,10,5,70,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,4),(415,'',38,10,5,69,20,'7F',8,0.00,'',0,14,0,'',1,'','Available','','',2,5),(416,'',39,10,5,69,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(417,'',40,10,5,69,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(418,'',41,10,5,69,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(419,'',42,10,5,0,1,'FF',5,0.00,'',0,15,0,'',1,'','Total','','',2,9),(420,'',43,10,5,0,0,'FF',9,0.00,'',0,15,0,'',4,'','Current:','','',2,10),(421,'',44,10,5,0,0,'FF',9,0.00,'',0,15,0,'',1,'','Average:','','',2,11),(422,'',45,10,5,0,0,'FF',9,0.00,'',0,15,0,'',3,'','Maximum:','','on',2,12),(423,'',46,10,5,70,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(424,'',47,10,5,69,20,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(425,'',1,11,1,71,48,'7F',7,0.00,'',0,0,0,'',1,'','Running Processes<>','','',2,1),(426,'',2,11,1,71,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(427,'',3,11,1,71,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(428,'',4,11,1,71,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(429,'',5,12,2,72,15,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute Average','','',2,1),(430,'',6,12,2,72,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,2),(431,'',7,12,2,72,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,3),(432,'',8,12,2,72,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,4),(433,'',9,12,2,73,8,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute Average','','',2,5),(434,'',10,12,2,73,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,6),(435,'',11,12,2,73,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,7),(436,'',12,12,2,73,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,8),(437,'',13,12,2,74,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute Average','','',2,9),(438,'',14,12,2,74,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,10),(439,'',15,12,2,74,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,11),(440,'',16,12,2,74,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,12),(441,'',17,12,2,0,1,'FF',4,0.00,'',0,12,0,'',1,'','','','on',2,13),(442,'',18,12,2,72,15,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,14),(443,'',19,12,2,73,8,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(444,'',20,12,2,74,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,16),(445,'',21,13,3,75,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(446,'',22,13,3,75,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(447,'',23,13,3,75,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(448,'',24,13,3,75,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(449,'',25,13,3,75,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(450,'',26,14,4,76,41,'FF',7,0.00,'',0,14,0,'',1,'','Free','','',2,9),(451,'',27,14,4,76,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,10),(452,'',28,14,4,76,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,11),(453,'',29,14,4,76,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,12),(454,'',30,14,4,77,30,'FF',8,0.00,'',0,14,0,'',1,'','Swap','','',2,13),(455,'',31,14,4,77,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,14),(456,'',32,14,4,77,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,15),(457,'',33,14,4,77,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,16),(458,'',1,15,1,78,48,'7F',7,0.00,'',0,0,0,'',1,'','Running Processes<>','','',2,1),(459,'',2,15,1,78,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(460,'',3,15,1,78,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(461,'',4,15,1,78,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(462,'',5,16,2,79,15,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute Average','','',2,1),(463,'',6,16,2,79,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,2),(464,'',7,16,2,79,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,3),(465,'',8,16,2,79,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,4),(466,'',9,16,2,80,8,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute Average','','',2,5),(467,'',10,16,2,80,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,6),(468,'',11,16,2,80,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,7),(469,'',12,16,2,80,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,8),(470,'',13,16,2,81,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute Average','','',2,9),(471,'',14,16,2,81,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,10),(472,'',15,16,2,81,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,11),(473,'',16,16,2,81,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,12),(474,'',17,16,2,0,1,'FF',4,0.00,'',0,12,0,'',1,'','','','on',2,13),(475,'',18,16,2,79,15,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,14),(476,'',19,16,2,80,8,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(477,'',20,16,2,81,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,16),(478,'',21,17,3,82,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(479,'',22,17,3,82,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(480,'',23,17,3,82,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(481,'',24,17,3,82,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(482,'',25,17,3,82,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(483,'',26,18,4,83,41,'FF',7,0.00,'',0,14,0,'',1,'','Free','','',2,9),(484,'',27,18,4,83,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,10),(485,'',28,18,4,83,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,11),(486,'',29,18,4,83,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,12),(487,'',30,18,4,84,30,'FF',8,0.00,'',0,14,0,'',1,'','Swap','','',2,13),(488,'',31,18,4,84,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,14),(489,'',32,18,4,84,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,15),(490,'',33,18,4,84,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,16),(491,'',327,19,33,85,9,'FF',7,0.00,'',0,0,0,'',1,'','CPU Usage','','',2,1),(492,'',328,19,33,85,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(493,'',329,19,33,85,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(494,'',330,19,33,85,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(495,'',205,20,20,86,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(496,'',206,20,20,86,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(497,'',207,20,20,86,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(498,'',208,20,20,86,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(499,'',209,20,20,86,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(500,'',210,21,21,87,48,'7F',7,0.00,'',0,0,0,'',1,'','Running Processes','','',2,1),(501,'',211,21,21,87,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(502,'',212,21,21,87,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(503,'',213,21,21,87,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','',3,4),(504,'',214,21,21,87,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(505,'',251,22,26,88,60,'7F',7,0.00,'',0,17,0,'',1,'','Bytes Read:','','',2,1),(506,'',252,22,26,88,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',2,2),(507,'',253,22,26,88,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',2,3),(508,'',254,22,26,88,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',2,4),(509,'',255,22,26,89,31,'7F',8,0.00,'',0,17,0,'',1,'','Bytes Written:','','',2,5),(510,'',256,22,26,89,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',2,6),(511,'',257,22,26,89,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',2,7),(512,'',258,22,26,89,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',2,8),(513,'',259,22,26,88,60,'FF',4,1.00,'',0,17,0,'',3,'','','','',2,9),(514,'',260,22,26,89,31,'FF',20,1.00,'',0,17,0,'',3,'','','','',2,10),(515,'',241,23,25,90,67,'7F',7,0.00,'',0,17,0,'',1,'','Reads:','','',2,1),(516,'',242,23,25,90,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',3,2),(517,'',243,23,25,90,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',3,3),(518,'',244,23,25,90,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',3,4),(519,'',245,23,25,91,41,'7F',8,0.00,'',0,17,0,'',1,'','Writes:','','',2,5),(520,'',246,23,25,91,0,'FF',9,0.00,'',0,17,0,'',4,'','Current:','','',3,6),(521,'',247,23,25,91,0,'FF',9,0.00,'',0,17,0,'',1,'','Average:','','',3,7),(522,'',248,23,25,91,0,'FF',9,0.00,'',0,17,0,'',3,'','Maximum:','','on',3,8),(523,'',249,23,25,90,67,'FF',4,1.00,'',0,17,0,'',3,'','','','',2,9),(524,'',250,23,25,91,41,'FF',20,1.00,'',0,17,0,'',3,'','','','',2,10),(525,'',236,24,24,92,65,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,1),(526,'',237,24,24,92,65,'7F',7,0.00,'',0,0,0,'',1,'','Context Switches:','','',2,2),(527,'',238,24,24,92,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,3),(528,'',239,24,24,92,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(529,'',240,24,24,92,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(530,'',215,25,22,94,48,'7F',7,0.00,'',0,0,0,'',1,'','System:','','',2,1),(531,'',216,25,22,94,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,2),(532,'',217,25,22,94,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,3),(533,'',218,25,22,94,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,4),(534,'',219,25,22,95,6,'7F',8,0.00,'',0,0,0,'',1,'','User:','','',2,5),(535,'',220,25,22,95,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,6),(536,'',221,25,22,95,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,7),(537,'',222,25,22,95,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,8),(538,'',223,25,22,93,112,'7F',8,0.00,'',0,0,0,'',1,'','Idle:','','',2,9),(539,'',224,25,22,93,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,10),(540,'',225,25,22,93,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,11),(541,'',226,25,22,93,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,12),(542,'',227,25,22,0,69,'7F',8,0.00,'',0,16,0,'',1,'','IO Wait:','','',2,13),(543,'',228,25,22,0,0,'FF',9,0.00,'',0,16,0,'',4,'','Current:','','',5,14),(544,'',229,25,22,0,0,'FF',9,0.00,'',0,16,0,'',1,'','Average:','','',5,15),(545,'',230,25,22,0,0,'FF',9,0.00,'',0,16,0,'',3,'','Maximum:','','on',5,16),(546,'',231,26,23,96,46,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,1),(547,'',232,26,23,96,46,'7F',7,0.00,'',0,0,0,'',1,'','Interrupts:','','',2,2),(548,'',233,26,23,96,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,3),(549,'',234,26,23,96,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(550,'',235,26,23,96,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(551,'',170,27,18,97,15,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute Average','','',2,1),(552,'',171,27,18,97,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,2),(553,'',172,27,18,97,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,3),(554,'',173,27,18,97,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,4),(555,'',174,27,18,99,8,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute Average','','',2,5),(556,'',175,27,18,99,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,6),(557,'',176,27,18,99,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,7),(558,'',177,27,18,99,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,8),(559,'',178,27,18,98,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute Average','','',2,9),(560,'',179,27,18,98,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,10),(561,'',180,27,18,98,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,11),(562,'',181,27,18,98,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,12),(563,'',182,27,18,97,15,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(564,'',183,27,18,99,8,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(565,'',184,27,18,98,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(566,'',34,28,5,101,48,'7F',7,0.00,'',0,14,0,'',1,'','Used','','',2,1),(567,'',35,28,5,101,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,2),(568,'',36,28,5,101,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,3),(569,'',37,28,5,101,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,4),(570,'',38,28,5,100,20,'7F',8,0.00,'',0,14,0,'',1,'','Available','','',2,5),(571,'',39,28,5,100,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(572,'',40,28,5,100,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(573,'',41,28,5,100,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(574,'',42,28,5,0,1,'FF',5,0.00,'',0,15,0,'',1,'','Total','','',2,9),(575,'',43,28,5,0,0,'FF',9,0.00,'',0,15,0,'',4,'','Current:','','',2,10),(576,'',44,28,5,0,0,'FF',9,0.00,'',0,15,0,'',1,'','Average:','','',2,11),(577,'',45,28,5,0,0,'FF',9,0.00,'',0,15,0,'',3,'','Maximum:','','on',2,12),(578,'',46,28,5,101,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(579,'',47,28,5,100,20,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(580,'',327,29,33,102,9,'FF',7,0.00,'',0,0,0,'',1,'','CPU Usage','','',2,1),(581,'',328,29,33,102,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(582,'',329,29,33,102,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(583,'',330,29,33,102,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(584,'',205,30,20,103,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(585,'',206,30,20,103,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(586,'',207,30,20,103,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(587,'',208,30,20,103,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(588,'',209,30,20,103,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_tree`
--

LOCK TABLES `graph_tree` WRITE;
/*!40000 ALTER TABLE `graph_tree` DISABLE KEYS */;
INSERT INTO `graph_tree` VALUES (1,'on',0,'0000-00-00 00:00:00',1,'Default Tree',1,1,'0000-00-00 00:00:00',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_tree_items`
--

LOCK TABLES `graph_tree_items` WRITE;
/*!40000 ALTER TABLE `graph_tree_items` DISABLE KEYS */;
INSERT INTO `graph_tree_items` VALUES (6,0,25,1,10,'',0,0,1,1,'',''),(7,0,24,1,7,'',0,0,1,1,'',''),(8,0,23,1,8,'',0,0,1,1,'',''),(9,0,22,1,6,'',0,0,1,1,'',''),(10,0,21,1,9,'',0,0,1,1,'',''),(11,0,20,1,22,'',0,0,1,1,'',''),(12,0,19,1,23,'',0,0,1,1,'',''),(13,0,18,1,24,'',0,0,1,1,'',''),(14,0,17,1,19,'',0,0,1,1,'',''),(15,0,16,1,25,'',0,0,1,1,'',''),(16,0,15,1,28,'',0,0,1,1,'',''),(17,0,14,1,26,'',0,0,1,1,'',''),(18,0,13,1,27,'',0,0,1,1,'',''),(19,0,12,1,16,'',0,0,1,1,'',''),(20,0,11,1,17,'',0,0,1,1,'',''),(21,0,10,1,20,'',0,0,1,1,'',''),(22,0,9,1,18,'',0,0,1,1,'',''),(23,0,8,1,15,'',0,0,1,1,'',''),(24,0,7,1,21,'',0,0,1,1,'',''),(25,0,6,1,12,'',0,0,1,1,'',''),(26,0,5,1,13,'',0,0,1,1,'',''),(27,0,4,1,14,'',0,0,1,1,'',''),(28,0,3,1,11,'',0,0,1,1,'',''),(29,0,2,1,29,'',0,0,1,1,'',''),(30,0,1,1,30,'',0,0,1,1,'','');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,1,0,1,'localhost','127.0.0.1','','','public',2,'','','','','','','',161,500,'Linux ruben-Lenovo-Z50-75 4.15.0-44-generic #47-Ubuntu SMP Mon Jan 14 11:26:59 UTC 2019 x86_64','OID: .1.3.6.1.4.1.8072.3.2.10',1609811,'Me me@example.org','ruben-Lenovo-Z50-75','Sitting on the Dock of the Bay',2,1,23,400,1,10,1,'',3,0,'2019-01-13 13:40:02','2019-01-13 14:00:02','Device did not respond to SNMP',1.14000,608.42000,2.11000,4.40970,0,2388,3,99.87437,'2019-02-02 05:50:02'),(2,1,0,1,'vm ','192.168.0.20','','','public',2,'','','','','','','',161,500,'Linux (none) 3.13.0-24-generic #46-Ubuntu SMP Thu Apr 10 19:11:08 UTC 2014 x86_64','OID: .1.3.6.1.4.1.8072.3.2.10',5017428,'Me me@example.org','(none)','Sitting on the Dock of the Bay',2,1,23,400,1,10,1,'',1,1130,'2019-01-21 22:00:06','2019-01-21 16:45:04','Device did not respond to SNMP',0.92000,286.79000,2.45000,3.20943,0,2321,1903,18.00948,'2019-02-02 05:50:03'),(3,1,0,1,'local','192.168.0.11','','','public',2,'','','','','','','',161,500,'Linux ruben-Lenovo-Z50-75 4.15.0-44-generic #47-Ubuntu SMP Mon Jan 14 11:26:59 UTC 2019 x86_64','OID: .1.3.6.1.4.1.8072.3.2.10',1609858,'Me me@example.org','ruben-Lenovo-Z50-75','Sitting on the Dock of the Bay',2,1,23,400,1,10,1,'',3,0,'2019-01-30 02:10:04','2019-01-31 02:30:02','Device did not respond to SNMP',1.20000,93.53000,3.70000,3.23279,0,2323,446,80.80069,'2019-02-02 05:50:02');
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
INSERT INTO `host_graph` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4),(2,20),(2,33),(3,1),(3,2),(3,3),(3,4),(3,18),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,33);
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
INSERT INTO `host_snmp_cache` VALUES (1,1,'dskDevice','/dev/loop0','/dev/loop0','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop1','/dev/loop1','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop10','/dev/loop10','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop11','/dev/loop11','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop12','/dev/loop12','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop13','/dev/loop13','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop14','/dev/loop14','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop15','/dev/loop15','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop16','/dev/loop16','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop17','/dev/loop17','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop18','/dev/loop18','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop19','/dev/loop19','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop2','/dev/loop2','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop20','/dev/loop20','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop21','/dev/loop21','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop22','/dev/loop22','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop23','/dev/loop23','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop24','/dev/loop24','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop25','/dev/loop25','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop26','/dev/loop26','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop27','/dev/loop27','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop28','/dev/loop28','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop3','/dev/loop3','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop4','/dev/loop4','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop5','/dev/loop5','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop6','/dev/loop6','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop7','/dev/loop7','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop8','/dev/loop8','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/loop9','/dev/loop9','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/sda3','/dev/sda3','',1,'2019-02-02 05:50:05'),(1,1,'dskDevice','/dev/sda7','/dev/sda7','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/supertuxkart/37','/dev/loop0','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/chromium/562','/dev/loop1','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/chromium/566','/dev/loop10','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/core/6259','/dev/loop11','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/core/6130','/dev/loop12','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-3-26-1604/70','/dev/loop13','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gtk-common-themes/808','/dev/loop14','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-logs/37','/dev/loop15','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-characters/103','/dev/loop16','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/core18/536','/dev/loop17','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/supertuxkart/51','/dev/loop18','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/supertuxkart/40','/dev/loop19','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gtk-common-themes/701','/dev/loop2','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/core/6350','/dev/loop20','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/chromium/538','/dev/loop21','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/android-studio/69','/dev/loop22','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-calculator/238','/dev/loop23','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-calculator/180','/dev/loop24','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/android-studio/70','/dev/loop25','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/core18/442','/dev/loop26','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-logs/45','/dev/loop27','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-characters/124','/dev/loop28','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-system-monitor/51','/dev/loop3','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-3-26-1604/74','/dev/loop4','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/core18/594','/dev/loop5','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-calculator/260','/dev/loop6','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-system-monitor/57','/dev/loop7','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gtk-common-themes/818','/dev/loop8','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/snap/gnome-characters/139','/dev/loop9','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/mnt/01D2CAB7A886FB10','/dev/sda3','',1,'2019-02-02 05:50:05'),(1,1,'dskMount','/','/dev/sda7','',1,'2019-02-02 05:50:05'),(2,1,'dskDevice','/dev/loop0','/dev/loop0','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop1','/dev/loop1','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop10','/dev/loop10','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop11','/dev/loop11','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop12','/dev/loop12','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop13','/dev/loop13','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop14','/dev/loop14','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop15','/dev/loop15','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop16','/dev/loop16','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop17','/dev/loop17','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop18','/dev/loop18','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop19','/dev/loop19','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop2','/dev/loop2','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop20','/dev/loop20','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop21','/dev/loop21','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop22','/dev/loop22','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop23','/dev/loop23','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop24','/dev/loop24','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop25','/dev/loop25','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop26','/dev/loop26','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop27','/dev/loop27','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop3','/dev/loop3','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop4','/dev/loop4','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop5','/dev/loop5','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop6','/dev/loop6','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop7','/dev/loop7','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop8','/dev/loop8','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/loop9','/dev/loop9','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/sda3','/dev/sda3','',1,'2019-01-21 20:05:05'),(2,1,'dskDevice','/dev/sda7','/dev/sda7','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-system-monitor/51','/dev/loop0','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-calculator/180','/dev/loop1','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/core/6130','/dev/loop10','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-calculator/260','/dev/loop11','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-logs/45','/dev/loop12','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-characters/139','/dev/loop13','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/supertuxkart/37','/dev/loop14','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gtk-common-themes/818','/dev/loop15','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/core18/536','/dev/loop16','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/core/5897','/dev/loop17','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/supertuxkart/40','/dev/loop18','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-logs/37','/dev/loop19','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-characters/124','/dev/loop2','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-system-monitor/57','/dev/loop20','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/supertuxkart/51','/dev/loop21','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-calculator/238','/dev/loop22','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/android-studio/70','/dev/loop23','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/chromium/566','/dev/loop24','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/chromium/538','/dev/loop25','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/core/6034','/dev/loop26','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gtk-common-themes/808','/dev/loop27','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/core18/442','/dev/loop3','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-characters/103','/dev/loop4','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/android-studio/69','/dev/loop5','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-3-26-1604/70','/dev/loop6','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/chromium/562','/dev/loop7','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gnome-3-26-1604/74','/dev/loop8','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/snap/gtk-common-themes/701','/dev/loop9','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/mnt/01D2CAB7A886FB10','/dev/sda3','',1,'2019-01-21 20:05:05'),(2,1,'dskMount','/','/dev/sda7','',1,'2019-01-21 20:05:05'),(3,1,'dskDevice','/dev/loop0','/dev/loop0','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop1','/dev/loop1','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop10','/dev/loop10','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop11','/dev/loop11','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop12','/dev/loop12','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop13','/dev/loop13','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop14','/dev/loop14','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop15','/dev/loop15','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop16','/dev/loop16','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop17','/dev/loop17','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop18','/dev/loop18','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop19','/dev/loop19','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop2','/dev/loop2','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop20','/dev/loop20','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop21','/dev/loop21','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop22','/dev/loop22','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop23','/dev/loop23','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop24','/dev/loop24','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop25','/dev/loop25','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop26','/dev/loop26','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop27','/dev/loop27','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop28','/dev/loop28','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop3','/dev/loop3','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop4','/dev/loop4','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop5','/dev/loop5','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop6','/dev/loop6','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop7','/dev/loop7','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop8','/dev/loop8','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/loop9','/dev/loop9','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/sda3','/dev/sda3','',1,'2019-02-02 05:50:06'),(3,1,'dskDevice','/dev/sda7','/dev/sda7','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/supertuxkart/37','/dev/loop0','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/chromium/562','/dev/loop1','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/chromium/566','/dev/loop10','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/core/6259','/dev/loop11','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/core/6130','/dev/loop12','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-3-26-1604/70','/dev/loop13','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gtk-common-themes/808','/dev/loop14','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-logs/37','/dev/loop15','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-characters/103','/dev/loop16','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/core18/536','/dev/loop17','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/supertuxkart/51','/dev/loop18','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/supertuxkart/40','/dev/loop19','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gtk-common-themes/701','/dev/loop2','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/core/6350','/dev/loop20','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/chromium/538','/dev/loop21','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/android-studio/69','/dev/loop22','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-calculator/238','/dev/loop23','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-calculator/180','/dev/loop24','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/android-studio/70','/dev/loop25','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/core18/442','/dev/loop26','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-logs/45','/dev/loop27','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-characters/124','/dev/loop28','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-system-monitor/51','/dev/loop3','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-3-26-1604/74','/dev/loop4','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/core18/594','/dev/loop5','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-calculator/260','/dev/loop6','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-system-monitor/57','/dev/loop7','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gtk-common-themes/818','/dev/loop8','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/snap/gnome-characters/139','/dev/loop9','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/mnt/01D2CAB7A886FB10','/dev/sda3','',1,'2019-02-02 05:50:06'),(3,1,'dskMount','/','/dev/sda7','',1,'2019-02-02 05:50:06'),(3,5,'hrProcessorFrwID','Total','4000','',1,'2019-02-02 05:50:10');
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
INSERT INTO `host_snmp_query` VALUES (1,1,'dskDevice','|query_dskDevice|',1),(2,1,'dskDevice','|query_dskDevice|',1),(3,1,'dskDevice','|query_dskDevice|',1),(3,2,'','|query_|',1),(3,3,'','|query_|',1),(3,4,'','|query_|',1),(3,5,'hrProcessorFrwID','CPU#|query_hrProcessorFrwID|',1),(3,6,'','|query_|',1);
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
INSERT INTO `poller` VALUES (1,'','Main Poller','',2,'localhost','cacti','cacti','','',3306,'',2.4282,13,19,2,'2019-02-02 05:50:04','2019-02-02 05:50:04');
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
INSERT INTO `poller_data_template_field_mappings` VALUES (1,'proc','proc','2019-01-13 03:38:51'),(2,'10min','load_15min','2019-01-13 03:38:51'),(2,'1min','load_1min','2019-01-13 03:38:51'),(2,'5min','load_5min','2019-01-13 03:38:51'),(3,'users','users','2019-01-13 03:38:52'),(4,'kilobytes','mem_buffers','2019-01-13 03:38:52'),(5,'kilobytes','mem_swap','2019-01-13 03:38:52'),(7,'out_ms','ping','2019-01-13 03:38:59'),(27,'reads','reads','2019-01-13 03:39:31'),(27,'writes','writes','2019-01-13 03:39:31'),(28,'bytesread','bytesread','2019-01-13 03:39:31'),(28,'byteswritten','byteswritten','2019-01-13 03:39:31');
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
INSERT INTO `poller_item` VALUES (7,1,1,1,1,'2019-02-02 05:50:02','127.0.0.1','public',2,'','','','','','','',161,500,'mem_buffers','/var/www/html/telco/rra/localhost_mem_buffers_7.rrd',1,300,0,'perl /var/www/html/telco/scripts/linux_memory.pl \'MemFree:\'','',''),(8,1,1,1,1,'2019-02-02 05:50:02','127.0.0.1','public',2,'','','','','','','',161,500,'mem_swap','/var/www/html/telco/rra/localhost_mem_swap_8.rrd',1,300,0,'perl /var/www/html/telco/scripts/linux_memory.pl \'SwapFree:\'','',''),(9,1,1,1,1,'2019-02-02 05:50:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/telco/rra/localhost_load_1min_9.rrd',1,300,0,'perl /var/www/html/telco/scripts/loadavg_multi.pl','',''),(10,1,1,1,1,'2019-02-02 05:50:02','127.0.0.1','public',2,'','','','','','','',161,500,'users','/var/www/html/telco/rra/localhost_users_10.rrd',1,300,0,'perl /var/www/html/telco/scripts/unix_users.pl \'\'','',''),(11,1,1,1,1,'2019-02-02 05:50:02','127.0.0.1','public',2,'','','','','','','',161,500,'proc','/var/www/html/telco/rra/localhost_proc_11.rrd',1,300,0,'perl /var/www/html/telco/scripts/unix_processes.pl','',''),(12,1,1,1,1,'2019-02-02 05:50:06','127.0.0.1','public',2,'','','','','','','',161,500,'hdd_free','/usr/share/cacti/site/rra/localhost_hdd_free_12.rrd',2,300,0,'perl /usr/share/cacti/site/scripts/query_unix_partitions.pl \'get\' \'available\' \'/dev/sda7\'','',''),(12,1,1,1,1,'2019-02-02 05:50:06','127.0.0.1','public',2,'','','','','','','',161,500,'hdd_used','/usr/share/cacti/site/rra/localhost_hdd_free_12.rrd',2,300,0,'perl /usr/share/cacti/site/scripts/query_unix_partitions.pl \'get\' \'used\' \'/dev/sda7\'','',''),(13,1,2,1,1,'2019-02-02 05:50:02','192.168.0.20','public',2,'','','','','','','',161,500,'proc','/var/www/html/telco/rra/vm__proc_13.rrd',1,300,0,'perl /var/www/html/telco/scripts/unix_processes.pl','',''),(14,1,2,1,1,'2019-02-02 05:50:02','192.168.0.20','public',2,'','','','','','','',161,500,'','/var/www/html/telco/rra/vm__load_1min_14.rrd',1,300,0,'perl /var/www/html/telco/scripts/loadavg_multi.pl','',''),(15,1,2,1,1,'2019-02-02 05:50:02','192.168.0.20','public',2,'','','','','','','',161,500,'users','/var/www/html/telco/rra/vm__users_15.rrd',1,300,0,'perl /var/www/html/telco/scripts/unix_users.pl \'\'','',''),(16,1,2,1,1,'2019-02-02 05:50:02','192.168.0.20','public',2,'','','','','','','',161,500,'mem_buffers','/var/www/html/telco/rra/vm__mem_buffers_16.rrd',1,300,0,'perl /var/www/html/telco/scripts/linux_memory.pl \'MemFree:\'','',''),(17,1,2,1,1,'2019-02-02 05:50:02','192.168.0.20','public',2,'','','','','','','',161,500,'mem_swap','/var/www/html/telco/rra/vm__mem_swap_17.rrd',1,300,0,'perl /var/www/html/telco/scripts/linux_memory.pl \'SwapFree:\'','',''),(18,1,3,1,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'proc','/var/www/html/telco/rra/local_proc_18.rrd',1,300,0,'perl /var/www/html/telco/scripts/unix_processes.pl','',''),(19,1,3,1,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'','/var/www/html/telco/rra/local_load_1min_19.rrd',1,300,0,'perl /var/www/html/telco/scripts/loadavg_multi.pl','',''),(20,1,3,1,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'users','/var/www/html/telco/rra/local_users_20.rrd',1,300,0,'perl /var/www/html/telco/scripts/unix_users.pl \'\'','',''),(21,1,3,1,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'mem_buffers','/var/www/html/telco/rra/local_mem_buffers_21.rrd',1,300,0,'perl /var/www/html/telco/scripts/linux_memory.pl \'MemFree:\'','',''),(22,1,3,1,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'mem_swap','/var/www/html/telco/rra/local_mem_swap_22.rrd',1,300,0,'perl /var/www/html/telco/scripts/linux_memory.pl \'SwapFree:\'','',''),(23,1,3,0,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'5min_cpu','/var/www/html/telco/rra/local_5min_cpu_23.rrd',1,300,0,'.1.3.6.1.4.1.9.2.1.58.0','',''),(24,1,3,0,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'users','/var/www/html/telco/rra/local_users_24.rrd',1,300,0,'.1.3.6.1.2.1.25.1.5.0','',''),(25,1,3,0,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'proc','/var/www/html/telco/rra/local_proc_25.rrd',1,300,0,'.1.3.6.1.2.1.25.1.6.0','',''),(26,1,3,2,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'','/var/www/html/telco/rra/local_bytesread_26.rrd',1,300,0,'/var/www/html/telco/scripts/ss_net_snmp_disk_bytes.php ss_net_snmp_disk_bytes \'192.168.0.11\'','',''),(27,1,3,2,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'','/var/www/html/telco/rra/local_reads_27.rrd',1,300,0,'/var/www/html/telco/scripts/ss_net_snmp_disk_io.php ss_net_snmp_disk_io \'192.168.0.11\'','',''),(28,1,3,0,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'ssSysContext','/var/www/html/telco/rra/local_sssyscontext_28.rrd',1,300,0,'.1.3.6.1.4.1.2021.11.8.0','',''),(29,1,3,0,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'ssCpuIdle','/var/www/html/telco/rra/local_sscpuidle_29.rrd',1,300,0,'.1.3.6.1.4.1.2021.11.11.0','',''),(30,1,3,0,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'ssCpuSystem','/var/www/html/telco/rra/local_sscpusystem_30.rrd',1,300,0,'.1.3.6.1.4.1.2021.11.10.0','',''),(31,1,3,0,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'ssCpuUser','/var/www/html/telco/rra/local_sscpuuser_31.rrd',1,300,0,'.1.3.6.1.4.1.2021.11.9.0','',''),(32,1,3,0,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'ssSysInterrupts','/var/www/html/telco/rra/local_sssysinterrupts_32.rrd',1,300,0,'.1.3.6.1.4.1.2021.11.7.0','',''),(33,1,3,0,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'load_1min','/var/www/html/telco/rra/local_load_1min_33.rrd',1,300,0,'.1.3.6.1.4.1.2021.10.1.3.1','',''),(34,1,3,0,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'load_15min','/var/www/html/telco/rra/local_load_15min_34.rrd',1,300,0,'.1.3.6.1.4.1.2021.10.1.3.3','',''),(35,1,3,0,1,'2019-02-02 05:50:02','192.168.0.11','public',2,'','','','','','','',161,500,'load_5min','/var/www/html/telco/rra/local_load_5min_35.rrd',1,300,0,'.1.3.6.1.4.1.2021.10.1.3.2','',''),(36,1,3,1,1,'2019-02-02 05:50:06','192.168.0.11','public',2,'','','','','','','',161,500,'hdd_free','/var/www/html/telco/rra/local_hdd_free_36.rrd',2,300,0,'perl /var/www/html/telco/scripts/query_unix_partitions.pl \'get\' \'available\' \'/dev/sda7\'','',''),(36,1,3,1,1,'2019-02-02 05:50:06','192.168.0.11','public',2,'','','','','','','',161,500,'hdd_used','/var/www/html/telco/rra/local_hdd_free_36.rrd',2,300,0,'perl /var/www/html/telco/scripts/query_unix_partitions.pl \'get\' \'used\' \'/dev/sda7\'','',''),(37,1,2,0,1,'2019-02-02 05:50:02','192.168.0.20','public',2,'','','','','','','',161,500,'5min_cpu','/var/www/html/telco/rra/vm__5min_cpu_37.rrd',1,300,0,'.1.3.6.1.4.1.9.2.1.58.0','',''),(38,1,2,0,1,'2019-02-02 05:50:02','192.168.0.20','public',2,'','','','','','','',161,500,'users','/var/www/html/telco/rra/vm__users_38.rrd',1,300,0,'.1.3.6.1.2.1.25.1.5.0','','');
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
INSERT INTO `poller_output` VALUES (36,'hdd_used','2019-02-02 05:50:02','U'),(36,'hdd_free','2019-02-02 05:50:02','U'),(35,'load_5min','2019-02-02 05:50:02','U'),(34,'load_15min','2019-02-02 05:50:02','U'),(33,'load_1min','2019-02-02 05:50:02','U'),(32,'ssSysInterrupts','2019-02-02 05:50:02','U'),(31,'ssCpuUser','2019-02-02 05:50:02','U'),(30,'ssCpuSystem','2019-02-02 05:50:02','U'),(29,'ssCpuIdle','2019-02-02 05:50:02','U'),(28,'ssSysContext','2019-02-02 05:50:02','U'),(27,'','2019-02-02 05:50:02','reads:0 writes:0'),(26,'','2019-02-02 05:50:02','bytesread:0 byteswritten:0'),(25,'proc','2019-02-02 05:50:02','U'),(18,'proc','2019-02-02 05:50:02','U'),(19,'','2019-02-02 05:50:02','1min:0.74 5min:1.08 10min:1.00'),(20,'users','2019-02-02 05:50:02','U'),(21,'mem_buffers','2019-02-02 05:50:02','U'),(22,'mem_swap','2019-02-02 05:50:02','U'),(23,'5min_cpu','2019-02-02 05:50:02','U'),(24,'users','2019-02-02 05:50:02','U');
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
INSERT INTO `poller_reindex` VALUES (1,1,0,1,'<','1610153','.1.3.6.1.2.1.1.3.0'),(2,1,0,1,'<','5017703','.1.3.6.1.2.1.1.3.0'),(3,1,0,1,'<','1610234','.1.3.6.1.2.1.1.3.0'),(3,2,0,1,'<','1610270','.1.3.6.1.2.1.1.3.0'),(3,3,0,1,'<','1610297','.1.3.6.1.2.1.1.3.0'),(3,4,0,1,'<','1610480','.1.3.6.1.2.1.1.3.0'),(3,5,0,1,'<','1610623','.1.3.6.1.2.1.1.3.0'),(3,6,0,1,'<','1610650','.1.3.6.1.2.1.1.3.0');
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
) ENGINE=InnoDB AUTO_INCREMENT=6901 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_time`
--

LOCK TABLES `poller_time` WRITE;
/*!40000 ALTER TABLE `poller_time` DISABLE KEYS */;
INSERT INTO `poller_time` VALUES (6897,20790,1,'2019-02-02 05:50:02','2019-02-02 05:50:03'),(6898,20788,1,'2019-02-02 05:50:02','2019-02-02 05:50:03'),(6899,20792,1,'2019-02-02 05:50:02','2019-02-02 05:50:04'),(6900,20794,1,'2019-02-02 05:50:02','2019-02-02 05:50:04');
/*!40000 ALTER TABLE `poller_time` ENABLE KEYS */;
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
INSERT INTO `settings` VALUES ('admin_user','1'),('auth_cache_enabled','on'),('auth_method','1'),('autocomplete_enabled','1'),('autocomplete_rows','30'),('automation_email',''),('automation_fromemail',''),('automation_fromname',''),('automation_graphs_enabled','on'),('automation_tree_enabled','on'),('availability_method','2'),('axis_size','7'),('base_url','http://ruben-Lenovo-Z50-75'),('boost_parallel','1'),('boost_png_cache_directory','/var/www/html/telco2/cache/boost/'),('boost_png_cache_enable',''),('boost_poller_mem_limit','1024'),('boost_redirect',''),('boost_rrd_update_enable',''),('boost_rrd_update_interval','60'),('boost_rrd_update_max_records','1000000'),('boost_rrd_update_max_records_per_select','50000'),('boost_rrd_update_max_runtime','1200'),('boost_rrd_update_string_length','2000'),('boost_rrd_update_system_enable',''),('concurrent_processes','1'),('cron_interval','300'),('date','2019-02-02 00:50:02'),('default_datechar','1'),('default_date_format','4'),('default_graphs_new_dropdown','-2'),('default_graph_height','150'),('default_graph_width','500'),('default_has',''),('default_image_format','1'),('default_poller','1'),('default_site','1'),('default_template','1'),('deletion_verification','on'),('device_threads','1'),('drag_and_drop','on'),('dsstats_daily_interval','60'),('dsstats_enable',''),('dsstats_hourly_duration','60'),('dsstats_major_update_time','12:00am'),('dsstats_poller_mem_limit','1024'),('enable_snmp_agent','on'),('font_method','1'),('force_https',''),('graph_auth_method','1'),('graph_watermark','Generated by Cacti®'),('grds_creation_method','0'),('guest_user','0'),('hide_console',''),('hide_form_description',''),('i18n_auto_detection','1'),('i18n_default_language','en-US'),('i18n_language_support','1'),('ldap_encryption','0'),('ldap_group_member_type','1'),('ldap_group_require',''),('ldap_mode','0'),('ldap_port','389'),('ldap_port_ssl','636'),('ldap_referrals','0'),('ldap_version','3'),('legend_size','8'),('logrotate_enabled','on'),('logrotate_frequency','1'),('logrotate_lastrun','1549083604'),('logrotate_retain','7'),('log_destination','1'),('log_perror','on'),('log_pstats',''),('log_pwarn',''),('log_refresh_interval','60'),('log_validation',''),('log_verbosity','2'),('max_data_query_field_length','40'),('max_display_rows','1000'),('max_get_size','10'),('max_threads','1'),('max_title_length','110'),('notify_admin',''),('num_rows_log','500'),('num_rows_table','30'),('oid_increasing_check_disable',''),('path_boost_log',''),('path_cactilog','/var/log/cacti/cacti.log'),('path_php_binary','/usr/bin/php'),('path_rrdtool','/usr/bin/rrdtool'),('path_snmpbulkwalk','/usr/bin/snmpbulkwalk'),('path_snmpget','/usr/bin/snmpget'),('path_snmpgetnext','/usr/bin/snmpgetnext'),('path_snmptrap','/usr/bin/snmptrap'),('path_snmpwalk','/usr/bin/snmpwalk'),('path_spine','/usr/sbin/spine'),('path_spine_config','/etc/cacti/spine.conf'),('path_stderrlog','/var/www/html/telco2/log/telco2_stderr.log'),('path_webroot','/var/www/html/telco'),('php_servers','1'),('ping_failure_count','2'),('ping_method','2'),('ping_port','23'),('ping_recovery_count','3'),('ping_retries','1'),('ping_timeout','400'),('poller_debug',''),('poller_enabled','on'),('poller_interval','300'),('poller_lastrun_1','1549086601'),('poller_replicate_data_input_crc','cc19e844260b89070701c0e549f15ae8844e3752'),('poller_replicate_data_input_fields_crc','df678dc58026a6b4d501da94bc0d13f9ce2cf5cd'),('poller_replicate_data_source_cache_crc_1','2596a9ad6eff40af92e25a8df4b16710fee39a13'),('poller_replicate_device_cache_crc_1','8a2996463b23f1a6f03da1ee40a0cd1a1c28db81'),('poller_replicate_snmp_query_crc','6ee24657128567b8abc3501a4aad0679d4fa20c8'),('poller_sync_interval','7200'),('poller_type','1'),('process_leveling','on'),('realtime_cache_path','/var/www/html/telco2/cache/realtime/'),('realtime_enabled','on'),('realtime_gwindow','60'),('realtime_interval','10'),('reindex_method','1'),('remote_agent_timeout','5'),('reports_allow_ln',''),('reports_default_image_format','1'),('reports_log_verbosity','2'),('reports_max_attach','10485760'),('rrdp_fingerprint',''),('rrdp_fingerprint_backup',''),('rrdp_port','40301'),('rrdp_port_backup','40301'),('rrdtool_version','rrd-1.7.x'),('rrd_archive','/var/www/html/telco2/rra/archive/'),('rrd_autoclean',''),('rrd_autoclean_method','1'),('script_timeout','25'),('secpass_expireaccount','0'),('secpass_expirepass','0'),('secpass_forceold',''),('secpass_history','0'),('secpass_lockfailed','0'),('secpass_minlen','8'),('secpass_reqmixcase','on'),('secpass_reqnum','on'),('secpass_reqspec','on'),('secpass_unlocktime','60'),('selected_theme','classic'),('selective_debug',''),('selective_device_debug',''),('selective_plugin_debug',''),('settings_dns_primary',''),('settings_dns_secondary',''),('settings_dns_timeout','500'),('settings_from_email','rubengutierrez2991@gmail.com'),('settings_from_name','ruben00'),('settings_how','2'),('settings_ping_mail','1'),('settings_sendmail_path',''),('settings_smtp_host','smtp.gmail.com'),('settings_smtp_password','lauritaNICE'),('settings_smtp_port','587'),('settings_smtp_secure','tls'),('settings_smtp_timeout','10'),('settings_smtp_username','rubengutierrez2991@gmail.com'),('settings_test_email','rubengutierrez2991@gmail.com'),('settings_wordwrap','120'),('snmp_auth_protocol','MD5'),('snmp_bulk_walk_size','10'),('snmp_community','public'),('snmp_context',''),('snmp_engine_id',''),('snmp_password',''),('snmp_port','161'),('snmp_priv_passphrase',''),('snmp_priv_protocol','DES'),('snmp_retries','3'),('snmp_security_level','authPriv'),('snmp_timeout','500'),('snmp_username',''),('snmp_version','2'),('spikekill_avgnan','last'),('spikekill_backupdir','/var/www/html/telco2/cache/spikekill/'),('spikekill_basetime','12:00am'),('spikekill_batch','0'),('spikekill_deviations','10'),('spikekill_method','2'),('spikekill_number','5'),('spikekill_outliers','5'),('spikekill_percent','1000'),('spine_log_level','0'),('stats_poller','Time:2.4282 Method:cmd.php Processes:1 Threads:N/A Hosts:3 HostsPerProcess:3 DataSources:34 RRDsProcessed:0'),('stats_recache_1','Poller: RecacheTime:6.0927 DevicesRecached:2'),('storage_location','0'),('title_size','10'),('unit_size','7'),('user_template','0');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Registered MIB files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_mibs`
--

LOCK TABLES `snmpagent_mibs` WRITE;
/*!40000 ALTER TABLE `snmpagent_mibs` DISABLE KEYS */;
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
  `email_address` varchar(128) DEFAULT NULL,
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
INSERT INTO `user_auth` VALUES (1,'admin','$2y$10$buuemEF6Uk2LR/1nGmh.JOEyIR0AFnVWU097oZwF8KMlVc5qytcK2',0,'Administrator','rubengutierrez2991@gmail.com','','on','on','on','on','on',2,1,1,1,1,'on',-1,-1,'-1','',0,0,869792722),(3,'guest','43e9a4ab75570f5b',0,'Guest Account','','on','on','on','on','on','3',1,1,1,1,1,'',-1,-1,'-1','',0,0,0),(4,'ruben','$2y$10$mZQAGEJPzOM1bGKp96Jp/erMdmhxhB/22m9zhDPrPdnnuiqV9pHPe',0,'rubengutierrez','ruben--gutierrez@hotmail.com','','on','on','on','on','on',1,1,1,1,1,'on',-1,-1,'','',0,0,2721828126),(5,'hebert','$2y$10$oeuCk3BOsy7CitwMtZMQSuELxHjUiX/uSWcLmXC478DrBWAZVGeDC',0,'adf','','','on','on','on','on','on',1,1,1,1,1,'on',-1,-1,'','',0,0,1951574626);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='Caches Remember Me Details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_cache`
--

LOCK TABLES `user_auth_cache` WRITE;
/*!40000 ALTER TABLE `user_auth_cache` DISABLE KEYS */;
INSERT INTO `user_auth_cache` VALUES (1,1,'127.0.0.1','2019-01-13 03:43:12','e9f6e7cb8d867a0c2ee2aeb238acd989f808abaca3ea2aa594daba3a77bbe1384b69ea1e0f085162d52efea4295ea52a862883f397c672ec7a6afd019c67a11b'),(5,1,'127.0.0.1','2019-01-13 03:59:20','e3256c19b27be5555d4d295282c2e626711a2792eb307827db95946a1fb0b6f97ae89d401ea4b82e3a21c6fc0207214e5e66dc42fb2bfddb894f1f71198c4c59'),(9,1,'127.0.0.1','2019-01-13 05:09:28','a38a6ece54b3abbb3caf660e4766517c14e124a06bee063eccc973df35d774130a88524dbc83d0bb8d28742526f3c173d7620fa15e6f723fc51d4469acb9165b'),(12,1,'127.0.0.1','2019-01-13 13:16:54','18b96886ef9e9e849da6d55b5eb569b003b3215e8f14ab54dad74cdff43e30e47e39ae1a1ac373ab61727d193cc95209d1f4423e9cc9a94c7b20debbb689e61d');
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
INSERT INTO `user_auth_realm` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(100,1),(101,1),(1043,1),(7,3),(7,4),(1,5),(7,5),(8,5),(100,5);
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
INSERT INTO `user_log` VALUES ('admin',1,'2019-01-13 03:43:12',1,'127.0.0.1'),('admin',1,'2019-01-13 03:47:09',1,'127.0.0.1'),('admin',1,'2019-01-13 03:47:17',2,'127.0.0.1'),('admin',1,'2019-01-13 03:59:20',2,'127.0.0.1'),('admin',1,'2019-01-13 03:59:28',1,'127.0.0.1'),('admin',1,'2019-01-13 04:39:52',1,'127.0.0.1'),('admin',1,'2019-01-13 05:09:20',2,'127.0.0.1'),('admin',1,'2019-01-13 05:09:28',2,'127.0.0.1'),('admin',1,'2019-01-13 05:12:21',2,'127.0.0.1'),('admin',1,'2019-01-13 05:12:23',2,'127.0.0.1'),('admin',1,'2019-01-13 13:16:54',2,'127.0.0.1'),('admin',1,'2019-01-13 13:18:25',1,'127.0.0.1'),('admin',1,'2019-01-13 14:48:40',1,'127.0.0.1'),('admin',1,'2019-01-15 04:24:34',1,'127.0.0.1'),('admin',1,'2019-01-15 12:47:55',1,'127.0.0.1'),('admin',1,'2019-01-15 14:41:36',1,'127.0.0.1'),('admin',1,'2019-01-15 15:51:43',1,'127.0.0.1'),('admin',1,'2019-01-15 16:08:15',1,'127.0.0.1'),('admin',1,'2019-01-15 18:01:13',1,'127.0.0.1'),('admin',1,'2019-01-15 19:45:28',1,'127.0.0.1'),('admin',1,'2019-01-15 22:01:46',1,'127.0.0.1'),('admin',1,'2019-01-16 03:15:52',1,'127.0.0.1'),('admin',1,'2019-01-16 03:53:24',1,'127.0.0.1'),('admin',1,'2019-01-17 00:41:02',1,'127.0.0.1'),('admin',1,'2019-01-17 03:44:34',1,'127.0.0.1'),('admin',1,'2019-01-17 13:03:24',1,'127.0.0.1'),('admin',1,'2019-01-17 15:40:22',1,'127.0.0.1'),('admin',1,'2019-01-17 16:16:34',2,'127.0.0.1'),('admin',1,'2019-01-17 17:45:19',2,'127.0.0.1'),('admin',1,'2019-01-17 22:01:05',2,'127.0.0.1'),('admin',1,'2019-01-18 01:58:42',2,'127.0.0.1'),('admin',1,'2019-01-18 03:30:07',2,'127.0.0.1'),('admin',1,'2019-01-18 05:53:51',1,'127.0.0.1'),('admin',1,'2019-01-18 13:44:16',1,'127.0.0.1'),('admin',1,'2019-01-18 14:26:10',2,'127.0.0.1'),('admin',1,'2019-01-18 17:17:27',2,'127.0.0.1'),('admin',1,'2019-01-18 19:08:10',1,'127.0.0.1'),('admin',1,'2019-01-19 01:49:54',1,'127.0.0.1'),('admin',1,'2019-01-20 00:05:04',1,'127.0.0.1'),('admin',1,'2019-01-21 04:12:21',1,'127.0.0.1'),('admin',1,'2019-01-21 19:57:56',1,'127.0.0.1'),('admin',1,'2019-01-21 22:09:20',1,'127.0.0.1'),('admin',1,'2019-01-22 04:09:49',1,'127.0.0.1'),('admin',1,'2019-01-22 05:41:57',1,'127.0.0.1'),('admin',1,'2019-01-22 16:53:24',1,'127.0.0.1'),('admin',1,'2019-01-22 17:56:05',1,'127.0.0.1'),('admin',1,'2019-01-22 19:38:14',1,'127.0.0.1'),('admin',1,'2019-01-23 01:59:36',1,'127.0.0.1'),('admin',1,'2019-01-23 13:57:26',1,'127.0.0.1'),('admin',1,'2019-01-23 22:12:44',1,'127.0.0.1'),('admin',1,'2019-01-23 22:22:02',1,'127.0.0.1'),('admin',1,'2019-01-24 03:04:45',1,'127.0.0.1'),('admin',1,'2019-01-24 05:04:28',1,'127.0.0.1'),('admin',1,'2019-01-24 06:05:04',1,'127.0.0.1'),('admin',1,'2019-01-24 18:29:19',1,'127.0.0.1'),('admin',1,'2019-01-24 20:11:14',1,'127.0.0.1'),('admin',1,'2019-01-25 15:04:25',1,'127.0.0.1'),('admin',1,'2019-01-25 16:02:02',1,'127.0.0.1'),('admin',1,'2019-01-25 20:53:38',1,'127.0.0.1'),('admin',1,'2019-01-25 23:50:54',1,'127.0.0.1'),('admin',1,'2019-01-25 23:52:30',1,'127.0.0.1'),('admin',1,'2019-01-26 00:00:39',1,'127.0.0.1'),('admin',1,'2019-01-26 03:49:38',1,'127.0.0.1'),('admin',1,'2019-01-26 15:12:42',1,'127.0.0.1'),('admin',1,'2019-01-26 16:23:11',1,'127.0.0.1'),('admin',1,'2019-01-26 18:30:00',1,'127.0.0.1'),('admin',1,'2019-01-28 16:25:51',1,'127.0.0.1'),('admin',1,'2019-01-28 16:29:32',1,'127.0.0.1'),('admin',1,'2019-01-31 00:53:14',1,'127.0.0.1'),('admin',1,'2019-01-31 01:03:55',1,'127.0.0.1'),('hebert',5,'2019-01-31 01:07:16',1,'127.0.0.1'),('ruben',4,'2019-01-13 17:09:54',1,'127.0.0.1'),('ruben',4,'2019-01-13 18:21:49',2,'127.0.0.1'),('ruben',4,'2019-01-13 22:19:37',2,'127.0.0.1'),('ruben',4,'2019-01-14 02:48:12',2,'127.0.0.1'),('ruben',4,'2019-01-14 16:52:44',2,'127.0.0.1'),('ruben',4,'2019-01-14 23:02:57',2,'127.0.0.1'),('ruben',4,'2019-01-15 04:20:45',2,'127.0.0.1'),('ruben',4,'2019-01-15 04:20:59',1,'127.0.0.1'),('ruben',4,'2019-01-15 04:25:31',1,'127.0.0.1'),('ruben',4,'2019-01-15 12:09:47',2,'127.0.0.1'),('ruben',4,'2019-01-15 12:52:16',1,'127.0.0.1'),('ruben',4,'2019-01-15 15:58:26',1,'127.0.0.1'),('ruben',4,'2019-01-15 18:01:33',1,'127.0.0.1'),('ruben',4,'2019-01-15 19:45:09',1,'127.0.0.1'),('ruben',4,'2019-01-18 05:53:26',1,'127.0.0.1'),('ruben',4,'2019-01-18 06:46:42',1,'127.0.0.1'),('ruben',4,'2019-01-18 18:30:41',1,'127.0.0.1'),('ruben',4,'2019-01-18 22:40:27',1,'127.0.0.1'),('ruben',4,'2019-01-19 20:10:02',1,'127.0.0.1'),('ruben',4,'2019-01-23 22:14:36',1,'127.0.0.1'),('ruben',4,'2019-01-25 23:49:44',1,'127.0.0.1'),('ruben',4,'2019-01-30 22:47:01',1,'127.0.0.1'),('ruben',4,'2019-01-31 01:02:46',1,'127.0.0.1');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-02  0:51:23
