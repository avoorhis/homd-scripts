-- MySQL dump 10.13  Distrib 5.6.37, for macos10.12 (x86_64)
--
-- Host: localhost    Database: homdAV
-- ------------------------------------------------------
-- Server version	5.6.37

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
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `domain_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`domain_id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=15856 DEFAULT CHARSET=latin1 COMMENT='select domain,phylum,klass,`order`,family,genus,species from taxonomy\n	JOIN domain using(domain_id)\n	JOIN phylum using(phylum_id)\n	JOIN klass using (klass_id)\n	JOIN `order` using(order_id)\n	JOIN family using(family_id)\n	JOIN genus using (genus_id)\n	JOIN species using (species_id)\n	WHERE oral_taxon_id = ''500''';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family` (
  `family_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `family` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`family_id`),
  UNIQUE KEY `family` (`family`)
) ENGINE=InnoDB AUTO_INCREMENT=11116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genus`
--

DROP TABLE IF EXISTS `genus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genus` (
  `genus_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `genus` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`genus_id`),
  UNIQUE KEY `genus` (`genus`)
) ENGINE=InnoDB AUTO_INCREMENT=11116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `klass`
--

DROP TABLE IF EXISTS `klass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klass` (
  `klass_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `klass` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`klass_id`),
  UNIQUE KEY `klass` (`klass`)
) ENGINE=InnoDB AUTO_INCREMENT=11117 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=11117 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `otid_prime`
--

DROP TABLE IF EXISTS `otid_prime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otid_prime` (
  `otid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `otid_name` varchar(20) NOT NULL DEFAULT '',
  `taxonomy_id` int(8) unsigned NOT NULL,
  `warning` int(8) NOT NULL DEFAULT '0',
  `NCBI_taxon_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`otid`),
  KEY `otid_taxonomy_fk` (`taxonomy_id`),
  CONSTRAINT `otid_taxonomy_fk` FOREIGN KEY (`taxonomy_id`) REFERENCES `taxonomy` (`taxonomy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phylum`
--

DROP TABLE IF EXISTS `phylum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phylum` (
  `phylum_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phylum` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`phylum_id`),
  UNIQUE KEY `phylum` (`phylum`)
) ENGINE=InnoDB AUTO_INCREMENT=11117 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rRNA_sequence`
--

DROP TABLE IF EXISTS `rRNA_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rRNA_sequence` (
  `rRNA_sequence_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `otid` int(11) unsigned NOT NULL,
  `rRNA_sequence` varchar(100) NOT NULL,
  PRIMARY KEY (`rRNA_sequence_id`),
  UNIQUE KEY `otid` (`otid`,`rRNA_sequence`),
  CONSTRAINT `otid_rRNA_sequence_fk3` FOREIGN KEY (`otid`) REFERENCES `otid_prime` (`otid`)
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_strain`
--

DROP TABLE IF EXISTS `ref_strain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_strain` (
  `reference_strain_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `otid` int(11) unsigned NOT NULL,
  `reference_strain` varchar(100) NOT NULL,
  PRIMARY KEY (`reference_strain_id`),
  UNIQUE KEY `otid` (`otid`,`reference_strain`),
  CONSTRAINT `otid_ref_strain_fk3` FOREIGN KEY (`otid`) REFERENCES `otid_prime` (`otid`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference`
--

DROP TABLE IF EXISTS `reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference` (
  `reference_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `otid` int(11) unsigned NOT NULL,
  `pubmed_id` int(15) DEFAULT NULL,
  `journal` varchar(150) NOT NULL,
  `authors` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`reference_id`),
  KEY `otid_reference_ibfk_3` (`otid`),
  CONSTRAINT `otid_reference_ibfk_3` FOREIGN KEY (`otid`) REFERENCES `otid_prime` (`otid`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_genomes`
--

DROP TABLE IF EXISTS `seq_genomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_genomes` (
  `seq_id` varchar(12) NOT NULL,
  `Inclusive_higher_taxa` varchar(50) NOT NULL,
  `genus_id` int(8) unsigned NOT NULL,
  `species_id` int(8) unsigned NOT NULL,
  `culture_collection` varchar(50) DEFAULT NULL,
  `status` varchar(25) NOT NULL,
  `sequence_center` varchar(256) DEFAULT NULL,
  `number_contig` int(8) DEFAULT NULL COMMENT 'the latest version',
  `combined_length` int(15) DEFAULT NULL COMMENT 'the latest version',
  `flag_id` int(3) unsigned NOT NULL COMMENT 'indexed to table flag',
  `oral_pathogen` tinyint(1) DEFAULT NULL COMMENT '"0" means oral bacteria. "1" means oral pathogen.',
  PRIMARY KEY (`seq_id`),
  KEY `culture_collection` (`culture_collection`),
  KEY `genome_ibfk_1` (`genus_id`),
  KEY `genome_ibfk_2` (`species_id`),
  KEY `genome_ibfk_3` (`flag_id`),
  CONSTRAINT `genome_ibfk_1` FOREIGN KEY (`genus_id`) REFERENCES `genus` (`genus_id`) ON UPDATE CASCADE,
  CONSTRAINT `genome_ibfk_2` FOREIGN KEY (`species_id`) REFERENCES `species` (`species_id`) ON UPDATE CASCADE,
  CONSTRAINT `genome_ibfk_3` FOREIGN KEY (`flag_id`) REFERENCES `seqid_flag` (`flag_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seq_genomes_extra`
--

DROP TABLE IF EXISTS `seq_genomes_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_genomes_extra` (
  `seq_id` varchar(11) NOT NULL,
  `isolate_origin` text NOT NULL,
  `ncbi_id` varchar(30) NOT NULL DEFAULT '',
  `ncbi_taxon_id` varchar(10) NOT NULL DEFAULT '',
  `goldstamp_id` varchar(20) NOT NULL DEFAULT '',
  `genbank_acc` varchar(100) NOT NULL DEFAULT '',
  `cmr_id` varchar(10) NOT NULL DEFAULT '',
  `GC` varchar(5) NOT NULL DEFAULT '',
  `GC_comment` text NOT NULL,
  `atcc_medium_number` varchar(25) NOT NULL DEFAULT '',
  `non_atcc_medium` varchar(25) NOT NULL DEFAULT '',
  `16s_rRNA` text NOT NULL,
  `16s_rRNA_comment` text NOT NULL,
  `Type_strain` varchar(10) NOT NULL DEFAULT '',
  `oral` varchar(80) NOT NULL DEFAULT '',
  `Number_of_Clones_6_06` int(10) NOT NULL,
  `Air_or_Anerobe` varchar(10) NOT NULL DEFAULT '',
  `shape` varchar(20) NOT NULL DEFAULT '',
  `gram_stain` varchar(10) NOT NULL DEFAULT '',
  `ATCC_List_1` varchar(14) NOT NULL DEFAULT '',
  `Other_internal_names` text NOT NULL,
  `flag_explanation` varchar(50) NOT NULL DEFAULT '',
  `NCBI_Nucleotide_Entries_7_06` int(7) NOT NULL,
  `Biochemistry` text NOT NULL,
  `DNA_Molecular_Summary` text NOT NULL,
  `ORF_Annotation_Summary` text NOT NULL,
  `Unnamed_Field4` text NOT NULL,
  `Unnamed_Field5` text NOT NULL,
  PRIMARY KEY (`seq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seqid_flag`
--

DROP TABLE IF EXISTS `seqid_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seqid_flag` (
  `flag_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `seqid_flag` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`flag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seqid_otid_index`
--

DROP TABLE IF EXISTS `seqid_otid_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seqid_otid_index` (
  `seq_id` varchar(9) NOT NULL,
  `otid` int(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`seq_id`),
  KEY `otid` (`otid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `site_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `otid` int(11) unsigned NOT NULL,
  `site` varchar(20) DEFAULT '',
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `otid` (`otid`,`site`),
  CONSTRAINT `otid_fk3` FOREIGN KEY (`otid`) REFERENCES `otid_prime` (`otid`)
) ENGINE=InnoDB AUTO_INCREMENT=825 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `species_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `species` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`species_id`),
  UNIQUE KEY `species` (`species`)
) ENGINE=InnoDB AUTO_INCREMENT=11116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synonym`
--

DROP TABLE IF EXISTS `synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonym` (
  `synonym_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `otid` int(11) unsigned DEFAULT NULL,
  `synonym` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`synonym_id`),
  UNIQUE KEY `otid` (`otid`,`synonym`),
  CONSTRAINT `synonyms_ibfk_1` FOREIGN KEY (`otid`) REFERENCES `otid_prime` (`otid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy`
--

DROP TABLE IF EXISTS `taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy` (
  `taxonomy_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned DEFAULT NULL,
  `phylum_id` int(11) unsigned DEFAULT NULL,
  `klass_id` int(11) unsigned DEFAULT NULL,
  `order_id` int(11) unsigned DEFAULT NULL,
  `family_id` int(11) unsigned DEFAULT NULL,
  `genus_id` int(11) unsigned NOT NULL,
  `species_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`taxonomy_id`),
  UNIQUE KEY `all_names` (`domain_id`,`phylum_id`,`klass_id`,`order_id`,`family_id`,`genus_id`,`species_id`),
  KEY `taxonomy_fk_klass_id` (`klass_id`),
  KEY `taxonomy_fk_family_id` (`family_id`),
  KEY `taxonomy_fk_genus_id` (`genus_id`),
  KEY `taxonomy_fk_order_id` (`order_id`),
  KEY `taxonomy_fk_phylum_id` (`phylum_id`),
  KEY `taxonomy_fk_species_id` (`species_id`),
  CONSTRAINT `taxonomy_ibfk_3` FOREIGN KEY (`genus_id`) REFERENCES `genus` (`genus_id`) ON UPDATE CASCADE,
  CONSTRAINT `taxonomy_ibfk_4` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`domain_id`) ON UPDATE CASCADE,
  CONSTRAINT `taxonomy_ibfk_5` FOREIGN KEY (`family_id`) REFERENCES `family` (`family_id`) ON UPDATE CASCADE,
  CONSTRAINT `taxonomy_ibfk_6` FOREIGN KEY (`klass_id`) REFERENCES `klass` (`klass_id`) ON UPDATE CASCADE,
  CONSTRAINT `taxonomy_ibfk_7` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON UPDATE CASCADE,
  CONSTRAINT `taxonomy_ibfk_8` FOREIGN KEY (`phylum_id`) REFERENCES `phylum` (`phylum_id`) ON UPDATE CASCADE,
  CONSTRAINT `taxonomy_ibfk_9` FOREIGN KEY (`species_id`) REFERENCES `species` (`species_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5528 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type_strain`
--

DROP TABLE IF EXISTS `type_strain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_strain` (
  `type_strain_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `otid` int(11) unsigned NOT NULL,
  `type_strain` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_strain_id`),
  UNIQUE KEY `otid` (`otid`,`type_strain`),
  CONSTRAINT `type_strain_ibfk_1` FOREIGN KEY (`otid`) REFERENCES `otid_prime` (`otid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `virus_data1`
--

DROP TABLE IF EXISTS `virus_data1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virus_data1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Assembly.NCBI` varchar(50) NOT NULL DEFAULT '',
  `SRA_Accession.NCBI` varchar(100) NOT NULL DEFAULT '',
  `Submitters.NCBI` text,
  `Release_Date.NCBI` varchar(50) DEFAULT NULL,
  `Family.NCBI` varchar(50) DEFAULT NULL,
  `Genus.NCBI` varchar(50) DEFAULT NULL,
  `Species.NCBI` varchar(100) DEFAULT NULL,
  `Molecule_type.NCBI` varchar(50) DEFAULT NULL,
  `Sequence_Type.NCBI` varchar(50) DEFAULT NULL,
  `Geo_Location.NCBI` varchar(100) DEFAULT NULL,
  `USA.NCBI` varchar(10) DEFAULT NULL,
  `Host.NCBI` varchar(100) DEFAULT NULL,
  `Isolation_Source.NCBI` varchar(100) DEFAULT NULL,
  `Collection_Date.NCBI` varchar(100) DEFAULT NULL,
  `BioSample.NCBI` varchar(20) DEFAULT NULL,
  `GenBank_Title.NCBI` varchar(100) DEFAULT NULL,
  `KK_Host_standardized_name` varchar(50) DEFAULT NULL,
  `KK_On_2021.109_initialization_list` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-30 12:54:22
