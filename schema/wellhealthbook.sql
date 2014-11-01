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
-- Table structure for table `CCIGroups`
--

DROP TABLE IF EXISTS `CCIGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CCIGroups` (
  `codeRange` char(10) NOT NULL,
  `code` char(10) NOT NULL,
  `existsPriorTo1996` char(50) NOT NULL,
  `dateEffective` char(10) NOT NULL,
  `dateDeletion` char(10) NOT NULL,
  `modifier` tinyint(1) NOT NULL,
  PRIMARY KEY (`codeRange`,`code`),
  KEY `codeRange` (`codeRange`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CCIMEGroups`
--

DROP TABLE IF EXISTS `CCIMEGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CCIMEGroups` (
  `codeRange` char(10) NOT NULL,
  `code` char(10) NOT NULL,
  `existsPriorTo1996` char(50) NOT NULL,
  `dateEffective` char(10) NOT NULL,
  `dateDeletion` char(10) NOT NULL,
  `modifier` tinyint(1) NOT NULL,
  `isMutuallyExclusiveGroup` tinyint(1) NOT NULL,
  PRIMARY KEY (`codeRange`,`code`),
  KEY `codeRange` (`codeRange`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CCIMUE`
--

DROP TABLE IF EXISTS `CCIMUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CCIMUE` (
  `code` char(10) NOT NULL,
  `serviceType` tinyint(4) NOT NULL,
  `MUE` int(11) NOT NULL,
  PRIMARY KEY (`code`,`serviceType`),
  KEY `code` (`code`),
  KEY `serviceType` (`serviceType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aclModules`
--

DROP TABLE IF EXISTS `aclModules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aclModules` (
  `aclModuleId` int(11) NOT NULL,
  `aclModuleName` varchar(32) NOT NULL,
  PRIMARY KEY (`aclModuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aclPrivileges`
--

DROP TABLE IF EXISTS `aclPrivileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aclPrivileges` (
  `aclPrivilegeId` int(11) NOT NULL,
  `aclResourceId` int(11) NOT NULL,
  `aclPrivilegeName` varchar(32) NOT NULL,
  PRIMARY KEY (`aclPrivilegeId`),
  UNIQUE KEY `aclResourceId_2` (`aclResourceId`,`aclPrivilegeName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aclResources`
--

DROP TABLE IF EXISTS `aclResources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aclResources` (
  `aclResourceId` int(11) NOT NULL,
  `aclModuleId` int(11) NOT NULL,
  `aclResourceName` varchar(32) NOT NULL,
  PRIMARY KEY (`aclResourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aclRolePrivileges`
--

DROP TABLE IF EXISTS `aclRolePrivileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aclRolePrivileges` (
  `aclRoleId` int(11) NOT NULL,
  `aclPrivilegeId` int(11) NOT NULL,
  PRIMARY KEY (`aclRoleId`,`aclPrivilegeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aclRoles`
--

DROP TABLE IF EXISTS `aclRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aclRoles` (
  `aclRoleId` int(11) NOT NULL,
  `aclRoleName` varchar(32) NOT NULL,
  PRIMARY KEY (`aclRoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `line1` varchar(255) NOT NULL DEFAULT '',
  `line2` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `region` int(11) NOT NULL DEFAULT '0',
  `county` char(4) NOT NULL,
  `state` char(3) NOT NULL,
  `postal_code` varchar(255) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `person_id` int(11) NOT NULL,
  `type` char(10) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `practiceId` int(11) NOT NULL,
  `displayOrder` int(11) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='An address that can be for a company or a person. STARTEMPTY';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointmentTemplates`
--

DROP TABLE IF EXISTS `appointmentTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentTemplates` (
  `appointmentTemplateId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `breakdown` text NOT NULL,
  PRIMARY KEY (`appointmentTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments` (
  `appointmentId` int(11) NOT NULL,
  `arrived` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `reason` char(10) NOT NULL,
  `walkin` tinyint(1) NOT NULL DEFAULT '0',
  `createdDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastChangeId` int(11) NOT NULL DEFAULT '0',
  `lastChangeDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creatorId` int(11) NOT NULL DEFAULT '0',
  `practiceId` int(11) NOT NULL DEFAULT '0',
  `providerId` int(11) NOT NULL DEFAULT '0',
  `patientId` int(11) NOT NULL DEFAULT '0',
  `roomId` int(11) NOT NULL DEFAULT '0',
  `appointmentCode` varchar(255) NOT NULL DEFAULT '',
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`appointmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attachmentBlobs`
--

DROP TABLE IF EXISTS `attachmentBlobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachmentBlobs` (
  `attachmentId` int(11) NOT NULL,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`attachmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `attachmentId` int(11) NOT NULL,
  `attachmentReferenceId` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateTime` datetime NOT NULL,
  `mimeType` varchar(255) NOT NULL,
  `md5sum` varchar(40) NOT NULL,
  PRIMARY KEY (`attachmentId`),
  KEY `attachmentReferenceId` (`attachmentReferenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auditSequences`
--

DROP TABLE IF EXISTS `auditSequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditSequences` (
  `id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auditValues`
--

DROP TABLE IF EXISTS `auditValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditValues` (
  `auditValueId` int(11) NOT NULL,
  `auditId` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`auditValueId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `auditId` int(11) NOT NULL,
  `objectClass` varchar(255) NOT NULL,
  `objectId` char(32) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `dateTime` datetime NOT NULL,
  `startProcessing` datetime NOT NULL,
  `endProcessing` datetime NOT NULL,
  `patientId` int(11) NOT NULL,
  `ipAddress` varchar(16) NOT NULL,
  PRIMARY KEY (`auditId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `barcodeMacros`
--

DROP TABLE IF EXISTS `barcodeMacros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barcodeMacros` (
  `name` varchar(255) NOT NULL,
  `regex` varchar(255) NOT NULL,
  `macro` text NOT NULL,
  `active` tinyint(4) NOT NULL,
  `cache` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `building_address`
--

DROP TABLE IF EXISTS `building_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building_address` (
  `building_id` int(11) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `address_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`building_id`,`address_id`),
  KEY `address_id` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Links a building to a address specifying type. STARTEMPTY';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `building_program_identifier`
--

DROP TABLE IF EXISTS `building_program_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building_program_identifier` (
  `building_id` int(11) NOT NULL DEFAULT '0',
  `program_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `x12_sender_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`building_id`,`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buildings` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `practice_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `facility_code_id` int(11) NOT NULL DEFAULT '0',
  `phone_number` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` char(3) NOT NULL,
  `postalCode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `practice_id` (`practice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='STARTEMPTY';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rght` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `lft` (`lft`,`rght`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='STARTWITHDATA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimFileBlobs`
--

DROP TABLE IF EXISTS `claimFileBlobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimFileBlobs` (
  `claimFileId` int(11) NOT NULL,
  `data` mediumblob NOT NULL,
  `statementData` mediumblob NOT NULL,
  PRIMARY KEY (`claimFileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimFiles`
--

DROP TABLE IF EXISTS `claimFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimFiles` (
  `claimFileId` int(11) NOT NULL,
  `destination` char(32) NOT NULL,
  `claimIds` text NOT NULL,
  `status` char(16) NOT NULL,
  `dateTime` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `visitId` int(11) NOT NULL,
  PRIMARY KEY (`claimFileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimLines`
--

DROP TABLE IF EXISTS `claimLines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimLines` (
  `claimLineId` int(11) NOT NULL,
  `claimId` int(11) NOT NULL,
  `visitId` int(11) NOT NULL,
  `insuranceProgramId` int(11) NOT NULL,
  `procedureCode` char(10) NOT NULL,
  `units` int(11) NOT NULL,
  `diagnosisCode1` char(10) NOT NULL,
  `diagnosisCode2` char(10) NOT NULL,
  `diagnosisCode3` char(10) NOT NULL,
  `diagnosisCode4` char(10) NOT NULL,
  `diagnosisCode5` char(10) NOT NULL,
  `diagnosisCode6` char(10) NOT NULL,
  `diagnosisCode7` char(10) NOT NULL,
  `diagnosisCode8` char(10) NOT NULL,
  `modifier1` char(10) NOT NULL,
  `modifier2` char(10) NOT NULL,
  `modifier3` char(10) NOT NULL,
  `modifier4` char(10) NOT NULL,
  `excludeFromDiscount` tinyint(1) NOT NULL,
  `excludeFromClaim` tinyint(1) NOT NULL,
  `mappedCode` varchar(10) NOT NULL,
  `baseFee` float(7,2) NOT NULL,
  `adjustedFee` float(7,2) NOT NULL,
  `unitsDoesNotEffectFee` tinyint(1) NOT NULL,
  `linkedMedicationId` int(11) NOT NULL,
  `ndc` varchar(255) NOT NULL,
  `dateTime` datetime NOT NULL,
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`claimLineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimRules`
--

DROP TABLE IF EXISTS `claimRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimRules` (
  `claimRuleId` int(11) NOT NULL,
  `title` char(255) NOT NULL,
  `message` text NOT NULL,
  `event` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `operator` char(10) NOT NULL,
  `code` char(10) NOT NULL,
  `value` char(255) NOT NULL,
  `operand` char(10) NOT NULL,
  `groupId` int(11) NOT NULL,
  `rowOrder` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  PRIMARY KEY (`claimRuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimSequences`
--

DROP TABLE IF EXISTS `claimSequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimSequences` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clearhealth_claim`
--

DROP TABLE IF EXISTS `clearhealth_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clearhealth_claim` (
  `claim_id` int(11) NOT NULL,
  `encounter_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `total_billed` float(7,2) NOT NULL DEFAULT '0.00',
  `total_paid` float(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`claim_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='STARTEMPTY';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinicalNoteAnnotations`
--

DROP TABLE IF EXISTS `clinicalNoteAnnotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinicalNoteAnnotations` (
  `clinicalNoteAnnotationId` int(11) NOT NULL,
  `clinicalNoteId` int(11) NOT NULL,
  `xAxis` int(11) NOT NULL,
  `yAxis` int(11) NOT NULL,
  `annotation` text NOT NULL,
  PRIMARY KEY (`clinicalNoteAnnotationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinicalNoteDefinitions`
--

DROP TABLE IF EXISTS `clinicalNoteDefinitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinicalNoteDefinitions` (
  `clinicalNoteDefinitionId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `clinicalNoteTemplateId` int(11) NOT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`clinicalNoteDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinicalNoteTemplates`
--

DROP TABLE IF EXISTS `clinicalNoteTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinicalNoteTemplates` (
  `clinicalNoteTemplateId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `guid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`clinicalNoteTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinicalNotes`
--

DROP TABLE IF EXISTS `clinicalNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinicalNotes` (
  `clinicalNoteId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `visitId` int(11) NOT NULL,
  `clinicalNoteDefinitionId` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `authoringPersonId` int(11) NOT NULL,
  `consultationId` int(11) NOT NULL,
  `locationId` int(11) NOT NULL,
  `eSignatureId` int(11) NOT NULL,
  PRIMARY KEY (`clinicalNoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codes`
--

DROP TABLE IF EXISTS `codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codes` (
  `code_id` int(11) NOT NULL,
  `code_text` varchar(255) DEFAULT NULL,
  `code_text_short` varchar(24) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `code_type` tinyint(2) DEFAULT NULL,
  `modifier` varchar(5) DEFAULT NULL,
  `units` tinyint(3) DEFAULT NULL,
  `fee` decimal(7,2) DEFAULT NULL,
  `superbill` tinyint(1) NOT NULL DEFAULT '0',
  `rvu` float NOT NULL,
  PRIMARY KEY (`code_id`),
  KEY `code_text` (`code_text`),
  KEY `code` (`code`),
  KEY `code_type` (`code_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coding_data`
--

DROP TABLE IF EXISTS `coding_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coding_data` (
  `coding_data_id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `code_id` int(11) NOT NULL DEFAULT '0',
  `modifier` int(11) NOT NULL DEFAULT '0',
  `units` float(5,2) NOT NULL DEFAULT '1.00',
  `fee` float(11,2) NOT NULL DEFAULT '0.00',
  `primary_code` tinyint(4) NOT NULL DEFAULT '0',
  `code_order` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coding_data_id`),
  KEY `foreign_id` (`foreign_id`),
  KEY `parent_id` (`parent_id`),
  KEY `code_id` (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `notes` text NOT NULL,
  `initials` varchar(10) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `is_historic` enum('no','yes') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Base Company record most of the data is linked in STARTEMPTY';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_address`
--

DROP TABLE IF EXISTS `company_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_address` (
  `company_id` int(11) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `address_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`company_id`,`address_id`),
  KEY `address_id` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Links a company to a address specifying the type STARTEMPTY';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_company`
--

DROP TABLE IF EXISTS `company_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_company` (
  `company_id` int(11) NOT NULL DEFAULT '0',
  `related_company_id` int(11) NOT NULL DEFAULT '0',
  `company_relation_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`company_id`,`related_company_id`),
  KEY `related_company_id` (`related_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relates a company to another company STARTEMPTY';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_number`
--

DROP TABLE IF EXISTS `company_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_number` (
  `company_id` int(11) NOT NULL DEFAULT '0',
  `number_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`company_id`,`number_id`),
  KEY `company_id` (`company_id`),
  KEY `number_id` (`number_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Links between company and phone_numbers STARTEMPTY';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_type`
--

DROP TABLE IF EXISTS `company_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_type` (
  `company_id` int(11) NOT NULL DEFAULT '0',
  `company_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`company_id`,`company_type`),
  KEY `company_id` (`company_id`),
  KEY `company_type` (`company_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Link to specify company type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `configId` varchar(32) NOT NULL,
  `value` text,
  PRIMARY KEY (`configId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `countries_name` varchar(64) NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`countries_iso_code_3`),
  KEY `IDX_COUNTRIES_NAME` (`countries_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronable`
--

DROP TABLE IF EXISTS `cronable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronable` (
  `cronable_id` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `minute` varchar(8) NOT NULL DEFAULT '0',
  `hour` varchar(8) NOT NULL DEFAULT '0',
  `day_of_month` varchar(8) NOT NULL DEFAULT '0',
  `month` varchar(8) NOT NULL DEFAULT '0',
  `day_of_week` varchar(8) NOT NULL DEFAULT '0',
  `year` varchar(8) NOT NULL DEFAULT '0',
  `at_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `controller` varchar(255) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `arguments` text NOT NULL,
  `last_run` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`cronable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboardComponent`
--

DROP TABLE IF EXISTS `dashboardComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboardComponent` (
  `dashboardComponentId` varchar(50) NOT NULL COMMENT 'GUID',
  `name` varchar(50) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`dashboardComponentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataIntegrationActions`
--

DROP TABLE IF EXISTS `dataIntegrationActions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataIntegrationActions` (
  `dataIntegrationActionId` int(11) NOT NULL,
  `guid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `action` text NOT NULL,
  `handlerType` tinyint(4) NOT NULL,
  PRIMARY KEY (`dataIntegrationActionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataIntegrationDatasources`
--

DROP TABLE IF EXISTS `dataIntegrationDatasources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataIntegrationDatasources` (
  `dataIntegrationDatasourceId` int(11) NOT NULL,
  `guid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `datasource` text NOT NULL,
  `handlerType` tinyint(4) NOT NULL,
  PRIMARY KEY (`dataIntegrationDatasourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataIntegrationDestinations`
--

DROP TABLE IF EXISTS `dataIntegrationDestinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataIntegrationDestinations` (
  `dataIntegrationDestinationId` int(11) NOT NULL,
  `guid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` char(4) NOT NULL,
  `connectInfo` text NOT NULL,
  `handlerType` tinyint(4) NOT NULL,
  PRIMARY KEY (`dataIntegrationDestinationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataIntegrationTemplates`
--

DROP TABLE IF EXISTS `dataIntegrationTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataIntegrationTemplates` (
  `dataIntegrationTemplateId` int(11) NOT NULL,
  `guid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `handlerType` tinyint(4) NOT NULL,
  PRIMARY KEY (`dataIntegrationTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnosisCodesAllergies`
--

DROP TABLE IF EXISTS `diagnosisCodesAllergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosisCodesAllergies` (
  `code` char(10) NOT NULL,
  `textShort` varchar(24) DEFAULT NULL,
  `textLong` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnosisCodesICD`
--

DROP TABLE IF EXISTS `diagnosisCodesICD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosisCodesICD` (
  `code` char(10) NOT NULL,
  `textShort` varchar(24) DEFAULT NULL,
  `textLong` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnosisCodesSNOMED`
--

DROP TABLE IF EXISTS `diagnosisCodesSNOMED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosisCodesSNOMED` (
  `snomedId` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `lastchange` date NOT NULL,
  `subsetStatus` varchar(255) NOT NULL,
  `snomedStatus` varchar(255) NOT NULL,
  PRIMARY KEY (`snomedId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discountTables`
--

DROP TABLE IF EXISTS `discountTables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discountTables` (
  `guid` char(32) NOT NULL,
  `discountId` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `insuranceProgramIds` mediumtext NOT NULL,
  `discount` char(6) NOT NULL,
  `discountType` char(10) NOT NULL,
  `dateStart` date NOT NULL,
  `dateEnd` date NOT NULL,
  `rowOrder` int(11) NOT NULL,
  `familySize1` int(11) NOT NULL,
  `income1` float(7,2) NOT NULL,
  `familySize2` int(11) NOT NULL,
  `income2` float(7,2) NOT NULL,
  `familySize3` int(11) NOT NULL,
  `income3` float(7,2) NOT NULL,
  `familySize4` int(11) NOT NULL,
  `income4` float(7,2) NOT NULL,
  `familySize5` int(11) NOT NULL,
  `income5` float(7,2) NOT NULL,
  `familySize6` int(11) NOT NULL,
  `income6` float(7,2) NOT NULL,
  `familySize7` int(11) NOT NULL,
  `income7` float(7,2) NOT NULL,
  `familySize8` int(11) NOT NULL,
  `income8` float(7,2) NOT NULL,
  `familySize9` int(11) NOT NULL,
  `income9` float(7,2) NOT NULL,
  `familySize10` int(11) NOT NULL,
  `income10` float(7,2) NOT NULL,
  PRIMARY KEY (`guid`,`discountId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `type` enum('file_url','blob','web_url') DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `mimetype` varchar(255) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `revision` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `foreign_id` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `revision` (`revision`),
  KEY `foreign_id` (`foreign_id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drugCodeClass`
--

DROP TABLE IF EXISTS `drugCodeClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drugCodeClass` (
  `code` varchar(10) NOT NULL,
  `textShort` varchar(24) DEFAULT NULL,
  `textLong` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eFaxInbounds`
--

DROP TABLE IF EXISTS `eFaxInbounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eFaxInbounds` (
  `eFaxInboundId` int(11) NOT NULL,
  `dateRequested` datetime NOT NULL,
  `requestType` char(15) NOT NULL,
  `accountId` char(10) NOT NULL,
  `numberDialed` char(10) NOT NULL,
  `dateReceived` datetime NOT NULL,
  `faxName` char(50) NOT NULL,
  `fileType` char(3) NOT NULL,
  `pageCount` int(11) NOT NULL,
  `CSID` char(50) NOT NULL,
  `ANI` char(25) NOT NULL,
  `status` int(11) NOT NULL,
  `MCFID` int(11) NOT NULL,
  `fileContents` text NOT NULL,
  PRIMARY KEY (`eFaxInboundId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ePrescribers`
--

DROP TABLE IF EXISTS `ePrescribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ePrescribers` (
  `ePrescriberId` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL,
  `providerId` int(11) NOT NULL,
  `SSID` char(15) NOT NULL,
  `dateActiveStart` datetime NOT NULL,
  `dateActiveEnd` datetime NOT NULL,
  `serviceLevel` int(11) NOT NULL,
  PRIMARY KEY (`ePrescriberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eSignatures`
--

DROP TABLE IF EXISTS `eSignatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eSignatures` (
  `eSignatureId` int(11) NOT NULL,
  `eSignatureParentId` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `signedDateTime` datetime NOT NULL,
  `signingUserId` int(11) NOT NULL,
  `objectId` int(11) NOT NULL,
  `objectClass` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `signature` varchar(255) NOT NULL,
  PRIMARY KEY (`eSignatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `educationResources`
--

DROP TABLE IF EXISTS `educationResources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educationResources` (
  `educationResourceId` int(11) NOT NULL,
  `resource` char(255) NOT NULL,
  `dateTime` datetime NOT NULL,
  PRIMARY KEY (`educationResourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `encounter`
--

DROP TABLE IF EXISTS `encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter` (
  `encounter_id` int(11) NOT NULL DEFAULT '0',
  `encounter_reason` int(11) NOT NULL DEFAULT '0',
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `building_id` int(11) NOT NULL DEFAULT '0',
  `date_of_treatment` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `treating_person_id` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_change_user_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('closed','open','billed') NOT NULL DEFAULT 'open',
  `occurence_id` int(11) DEFAULT NULL,
  `created_by_user_id` int(11) NOT NULL DEFAULT '0',
  `payer_group_id` int(11) DEFAULT NULL,
  `current_payer` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `practice_id` int(11) DEFAULT NULL,
  `activePayerId` int(11) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `void` tinyint(1) NOT NULL,
  `appointmentId` int(11) NOT NULL,
  PRIMARY KEY (`encounter_id`),
  KEY `building_id` (`building_id`),
  KEY `treating_person_id` (`treating_person_id`),
  KEY `last_change_user_id` (`last_change_user_id`),
  KEY `patient_id` (`patient_id`),
  KEY `occurence_id` (`occurence_id`),
  KEY `date_of_treatment` (`date_of_treatment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enumerations`
--

DROP TABLE IF EXISTS `enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enumerations` (
  `enumerationId` int(11) NOT NULL,
  `guid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `key` char(10) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `parentId` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `ormClass` varchar(255) DEFAULT NULL,
  `ormId` int(11) DEFAULT NULL,
  `ormEditMethod` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`enumerationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enumerationsClosure`
--

DROP TABLE IF EXISTS `enumerationsClosure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enumerationsClosure` (
  `ancestor` int(11) NOT NULL,
  `descendant` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`ancestor`,`descendant`),
  KEY `descendant` (`descendant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eobAdjustments`
--

DROP TABLE IF EXISTS `eobAdjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eobAdjustments` (
  `eobAdjustmentId` int(11) NOT NULL,
  `claimId` int(11) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `claimLineId` int(11) NOT NULL,
  `type` char(10) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`eobAdjustmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`event_id`),
  KEY `start` (`start`),
  KEY `end` (`end`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `externalTeamMembers`
--

DROP TABLE IF EXISTS `externalTeamMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externalTeamMembers` (
  `externalTeamMemberId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `practice` varchar(100) NOT NULL,
  `provider` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`externalTeamMemberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fbclaim`
--

DROP TABLE IF EXISTS `fbclaim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fbclaim` (
  `claim_id` int(11) NOT NULL DEFAULT '0',
  `claim_identifier` varchar(255) NOT NULL DEFAULT '',
  `revision` int(11) NOT NULL DEFAULT '0',
  `status` enum('new','pending','sent','archive','deleted') NOT NULL DEFAULT 'new',
  `timestamp` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `date_sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `format` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`claim_id`),
  KEY `claim_identifier` (`claim_identifier`),
  KEY `status` (`status`),
  KEY `revision` (`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feeSchedules`
--

DROP TABLE IF EXISTS `feeSchedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeSchedules` (
  `guid` char(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `procedureCode` char(10) NOT NULL,
  `fee` float(7,2) NOT NULL,
  `modifier1` char(10) NOT NULL,
  `modifier1fee` float(7,2) NOT NULL,
  `modifier2` char(10) NOT NULL,
  `modifier2fee` float(7,2) NOT NULL,
  `modifier3` char(10) NOT NULL,
  `modifier3fee` float(7,2) NOT NULL,
  `modifier4` char(10) NOT NULL,
  `modifier4fee` float(7,2) NOT NULL,
  `insuranceProgramIds` mediumtext NOT NULL,
  `dateOfServiceStart` date NOT NULL,
  `dateOfServiceEnd` date NOT NULL,
  `mappedCode` varchar(10) NOT NULL,
  `dateObsolete` date NOT NULL,
  PRIMARY KEY (`guid`,`procedureCode`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filterStates`
--

DROP TABLE IF EXISTS `filterStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filterStates` (
  `filterStateId` int(11) NOT NULL,
  `tabName` varchar(50) NOT NULL,
  `providerId` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `dateFilter` date NOT NULL,
  `showCancelledAppointments` tinyint(1) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`filterStateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `form_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `system_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `system_name` (`system_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the EMR extending forms STARTWITHDATA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formularyDefault`
--

DROP TABLE IF EXISTS `formularyDefault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formularyDefault` (
  `fullNDC` varchar(20) NOT NULL,
  `directions` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `schedule` char(10) NOT NULL,
  `labelId` int(11) NOT NULL,
  `externalUrl` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `vaclass` varchar(255) NOT NULL,
  `deaSchedule` tinyint(1) NOT NULL,
  `print` tinyint(1) NOT NULL,
  `description` varchar(255) NOT NULL,
  `dose` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `prn` tinyint(1) NOT NULL,
  `quantityQualifier` varchar(255) NOT NULL,
  `refills` int(11) NOT NULL,
  `daysSupply` int(11) NOT NULL,
  `substitution` tinyint(1) NOT NULL,
  PRIMARY KEY (`fullNDC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generalAlertHandlers`
--

DROP TABLE IF EXISTS `generalAlertHandlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generalAlertHandlers` (
  `generalAlertHandlerId` int(11) NOT NULL,
  `guid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `handlerObject` text NOT NULL,
  `active` tinyint(4) NOT NULL,
  `datasource` text NOT NULL,
  `template` text NOT NULL,
  PRIMARY KEY (`generalAlertHandlerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generalAlerts`
--

DROP TABLE IF EXISTS `generalAlerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generalAlerts` (
  `generalAlertId` int(11) NOT NULL,
  `message` text NOT NULL,
  `urgency` varchar(10) NOT NULL,
  `status` varchar(12) NOT NULL,
  `dateTime` datetime NOT NULL,
  `teamId` char(10) NOT NULL,
  `userId` int(11) NOT NULL,
  `objectId` char(32) NOT NULL,
  `objectClass` varchar(255) NOT NULL,
  `forwardedBy` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`generalAlertId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genericData`
--

DROP TABLE IF EXISTS `genericData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genericData` (
  `genericDataId` int(11) NOT NULL,
  `objectId` char(32) NOT NULL,
  `objectClass` varchar(255) NOT NULL,
  `dateTime` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `revisionId` int(11) NOT NULL,
  PRIMARY KEY (`genericDataId`),
  KEY `objectId` (`objectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generic_notes`
--

DROP TABLE IF EXISTS `generic_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_notes` (
  `generic_note_id` bigint(20) NOT NULL,
  `parent_obj_id` bigint(20) NOT NULL,
  `created` date NOT NULL,
  `person_id` bigint(20) NOT NULL,
  `note` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `deprecated` tinyint(4) NOT NULL,
  PRIMARY KEY (`generic_note_id`),
  KEY `parent_obj_id` (`parent_obj_id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `growthChartBMIForAge20`
--

DROP TABLE IF EXISTS `growthChartBMIForAge20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `growthChartBMIForAge20` (
  `growthChartBMIForAge20Id` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `age` float NOT NULL,
  `p3rd` varchar(50) NOT NULL,
  `p5th` varchar(50) NOT NULL,
  `p10th` varchar(50) NOT NULL,
  `p25th` varchar(50) NOT NULL,
  `p50th` varchar(50) NOT NULL,
  `p75th` varchar(50) NOT NULL,
  `p85th` varchar(50) NOT NULL,
  `p90th` varchar(50) NOT NULL,
  `p95th` varchar(50) NOT NULL,
  `p97th` varchar(50) NOT NULL,
  PRIMARY KEY (`growthChartBMIForAge20Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `growthChartHeadCircumferenceForAge36`
--

DROP TABLE IF EXISTS `growthChartHeadCircumferenceForAge36`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `growthChartHeadCircumferenceForAge36` (
  `growthChartHeadCircumferenceForAge36Id` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `age` float NOT NULL,
  `p3rd` varchar(50) NOT NULL,
  `p5th` varchar(50) NOT NULL,
  `p10th` varchar(50) NOT NULL,
  `p25th` varchar(50) NOT NULL,
  `p50th` varchar(50) NOT NULL,
  `p75th` varchar(50) NOT NULL,
  `p90th` varchar(50) NOT NULL,
  `p95th` varchar(50) NOT NULL,
  `p97th` varchar(50) NOT NULL,
  PRIMARY KEY (`growthChartHeadCircumferenceForAge36Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `growthChartLengthForAge36`
--

DROP TABLE IF EXISTS `growthChartLengthForAge36`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `growthChartLengthForAge36` (
  `growthChartLengthForAge36Id` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `age` float NOT NULL,
  `p3rd` varchar(50) NOT NULL,
  `p5th` varchar(50) NOT NULL,
  `p10th` varchar(50) NOT NULL,
  `p25th` varchar(50) NOT NULL,
  `p50th` varchar(50) NOT NULL,
  `p75th` varchar(50) NOT NULL,
  `p90th` varchar(50) NOT NULL,
  `p95th` varchar(50) NOT NULL,
  `p97th` varchar(50) NOT NULL,
  PRIMARY KEY (`growthChartLengthForAge36Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `growthChartStatureForAge20`
--

DROP TABLE IF EXISTS `growthChartStatureForAge20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `growthChartStatureForAge20` (
  `growthChartStatureForAge20Id` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `age` float NOT NULL,
  `p3rd` varchar(50) NOT NULL,
  `p5th` varchar(50) NOT NULL,
  `p10th` varchar(50) NOT NULL,
  `p25th` varchar(50) NOT NULL,
  `p50th` varchar(50) NOT NULL,
  `p75th` varchar(50) NOT NULL,
  `p90th` varchar(50) NOT NULL,
  `p95th` varchar(50) NOT NULL,
  `p97th` varchar(50) NOT NULL,
  PRIMARY KEY (`growthChartStatureForAge20Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `growthChartWeightForAge20`
--

DROP TABLE IF EXISTS `growthChartWeightForAge20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `growthChartWeightForAge20` (
  `growthChartWeightForAge20Id` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `age` float NOT NULL,
  `p3rd` varchar(50) NOT NULL,
  `p5th` varchar(50) NOT NULL,
  `p10th` varchar(50) NOT NULL,
  `p25th` varchar(50) NOT NULL,
  `p50th` varchar(50) NOT NULL,
  `p75th` varchar(50) NOT NULL,
  `p90th` varchar(50) NOT NULL,
  `p95th` varchar(50) NOT NULL,
  `p97th` varchar(50) NOT NULL,
  PRIMARY KEY (`growthChartWeightForAge20Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `growthChartWeightForAge36`
--

DROP TABLE IF EXISTS `growthChartWeightForAge36`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `growthChartWeightForAge36` (
  `growthChartWeightForAge36Id` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `age` float NOT NULL,
  `p3rd` varchar(50) NOT NULL,
  `p5th` varchar(50) NOT NULL,
  `p10th` varchar(50) NOT NULL,
  `p25th` varchar(50) NOT NULL,
  `p50th` varchar(50) NOT NULL,
  `p75th` varchar(50) NOT NULL,
  `p90th` varchar(50) NOT NULL,
  `p95th` varchar(50) NOT NULL,
  `p97th` varchar(50) NOT NULL,
  PRIMARY KEY (`growthChartWeightForAge36Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `growthChartWeightForRecumbentLength36`
--

DROP TABLE IF EXISTS `growthChartWeightForRecumbentLength36`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `growthChartWeightForRecumbentLength36` (
  `growthChartWeightForRecumbentLength36Id` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `length` float NOT NULL,
  `p3rd` varchar(50) NOT NULL,
  `p5th` varchar(50) NOT NULL,
  `p10th` varchar(50) NOT NULL,
  `p25th` varchar(50) NOT NULL,
  `p50th` varchar(50) NOT NULL,
  `p75th` varchar(50) NOT NULL,
  `p90th` varchar(50) NOT NULL,
  `p95th` varchar(50) NOT NULL,
  `p97th` varchar(50) NOT NULL,
  PRIMARY KEY (`growthChartWeightForRecumbentLength36Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `growthChartWeightForStature20`
--

DROP TABLE IF EXISTS `growthChartWeightForStature20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `growthChartWeightForStature20` (
  `growthChartWeightForStature20Id` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `stature` float NOT NULL,
  `p3rd` varchar(50) NOT NULL,
  `p5th` varchar(50) NOT NULL,
  `p10th` varchar(50) NOT NULL,
  `p25th` varchar(50) NOT NULL,
  `p50th` varchar(50) NOT NULL,
  `p75th` varchar(50) NOT NULL,
  `p85th` varchar(50) NOT NULL,
  `p90th` varchar(50) NOT NULL,
  `p95th` varchar(50) NOT NULL,
  `p97th` varchar(50) NOT NULL,
  PRIMARY KEY (`growthChartWeightForStature20Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `handlers`
--

DROP TABLE IF EXISTS `handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handlers` (
  `handlerId` int(11) NOT NULL,
  `guid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `direction` char(12) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `conditionObject` text NOT NULL,
  `action` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `review` tinyint(4) NOT NULL,
  `resolve` tinyint(4) NOT NULL,
  `timeframe` varchar(36) NOT NULL,
  `handlerType` tinyint(4) NOT NULL,
  `dataIntegrationDatasourceId` int(11) NOT NULL,
  `dataIntegrationTemplateId` int(11) NOT NULL,
  `dataIntegrationDestinationId` int(11) NOT NULL,
  `dataIntegrationActionId` int(11) NOT NULL,
  PRIMARY KEY (`handlerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `healthStatusAlerts`
--

DROP TABLE IF EXISTS `healthStatusAlerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `healthStatusAlerts` (
  `healthStatusAlertId` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `personId` int(11) NOT NULL,
  `healthStatusHandlerId` int(11) NOT NULL,
  `dateDue` datetime NOT NULL,
  `lastOccurence` datetime NOT NULL,
  `priority` tinyint(4) NOT NULL,
  PRIMARY KEY (`healthStatusAlertId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `healthStatusHandlerPatients`
--

DROP TABLE IF EXISTS `healthStatusHandlerPatients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `healthStatusHandlerPatients` (
  `healthStatusHandlerId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  PRIMARY KEY (`healthStatusHandlerId`,`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `healthStatusHandlers`
--

DROP TABLE IF EXISTS `healthStatusHandlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `healthStatusHandlers` (
  `healthStatusHandlerId` int(11) NOT NULL,
  `guid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `handlerObject` text NOT NULL,
  `active` tinyint(4) NOT NULL,
  `timeframe` varchar(36) NOT NULL,
  `datasource` text NOT NULL,
  `template` text NOT NULL,
  PRIMARY KEY (`healthStatusHandlerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hl7Messages`
--

DROP TABLE IF EXISTS `hl7Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7Messages` (
  `hl7MessageId` int(11) NOT NULL,
  `message` text NOT NULL,
  `type` char(4) NOT NULL,
  PRIMARY KEY (`hl7MessageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `holidayId` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`holidayId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `identifier`
--

DROP TABLE IF EXISTS `identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identifier` (
  `identifier_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(100) NOT NULL DEFAULT '',
  `identifier_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identifier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `immunizationInventory`
--

DROP TABLE IF EXISTS `immunizationInventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `immunizationInventory` (
  `immunizationInventoryId` int(11) NOT NULL,
  `immunization` varchar(255) NOT NULL,
  `lotNumber` char(16) NOT NULL,
  `expiration` date NOT NULL,
  `parLevel` int(4) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `mvxCode` varchar(255) NOT NULL,
  `immunizationId` int(4) NOT NULL,
  PRIMARY KEY (`immunizationInventoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance` (
  `company_id` int(11) NOT NULL DEFAULT '0',
  `fee_schedule_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`company_id`),
  KEY `fee_schedule_id` (`fee_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insurance_program`
--

DROP TABLE IF EXISTS `insurance_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_program` (
  `insurance_program_id` int(11) NOT NULL,
  `payer_type` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `fee_schedule_id` int(11) NOT NULL DEFAULT '0',
  `x12_sender_id` varchar(255) NOT NULL DEFAULT '',
  `x12_receiver_id` varchar(255) NOT NULL DEFAULT '',
  `x12_version` varchar(255) NOT NULL DEFAULT '',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `funds_source` int(11) NOT NULL DEFAULT '0',
  `program_type` int(11) NOT NULL DEFAULT '0',
  `payer_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`insurance_program_id`),
  KEY `fee_schedule_id` (`fee_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insured_relationship`
--

DROP TABLE IF EXISTS `insured_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insured_relationship` (
  `insured_relationship_id` int(11) NOT NULL,
  `insurance_program_id` int(11) NOT NULL DEFAULT '0',
  `person_id` int(11) NOT NULL DEFAULT '0',
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `subscriber_to_patient_relationship` char(10) NOT NULL,
  `copay` float(11,2) NOT NULL DEFAULT '0.00',
  `assigning` int(11) NOT NULL DEFAULT '0',
  `group_name` varchar(100) NOT NULL DEFAULT '',
  `group_number` varchar(100) NOT NULL DEFAULT '',
  `default_provider` int(11) NOT NULL DEFAULT '0',
  `program_order` int(11) NOT NULL DEFAULT '0',
  `effective_start` date NOT NULL DEFAULT '0000-00-00',
  `effective_end` date NOT NULL DEFAULT '0000-00-00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `dateLastVerified` datetime NOT NULL,
  `verified` tinyint(2) NOT NULL,
  `desc` varchar(255) NOT NULL,
  PRIMARY KEY (`insured_relationship_id`),
  KEY `person_id` (`person_id`),
  KEY `insurance_program_id` (`insurance_program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_note`
--

DROP TABLE IF EXISTS `lab_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_note` (
  `lab_note_id` int(11) NOT NULL DEFAULT '0',
  `lab_test_id` int(11) NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  PRIMARY KEY (`lab_note_id`),
  KEY `lab_test_id` (`lab_test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_order`
--

DROP TABLE IF EXISTS `lab_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_order` (
  `lab_order_id` int(11) NOT NULL DEFAULT '0',
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `type` char(6) NOT NULL,
  `status` char(2) NOT NULL DEFAULT '',
  `ordering_provider` varchar(255) NOT NULL DEFAULT '',
  `manual_service` tinyint(4) NOT NULL,
  `manual_order_date` date NOT NULL,
  `encounter_id` int(11) NOT NULL,
  `external_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `orderDescription` varchar(255) NOT NULL,
  `eSignatureId` int(11) NOT NULL,
  PRIMARY KEY (`lab_order_id`),
  KEY `external_id` (`external_id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_result`
--

DROP TABLE IF EXISTS `lab_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_result` (
  `lab_result_id` int(11) NOT NULL DEFAULT '0',
  `lab_test_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `units` varchar(255) NOT NULL DEFAULT '',
  `reference_range` varchar(255) NOT NULL DEFAULT '',
  `abnormal_flag` char(8) NOT NULL,
  `result_status` char(1) NOT NULL DEFAULT '',
  `observation_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `producer_id` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `extra` varchar(255) NOT NULL,
  `cliaPerformingOrg` text NOT NULL,
  PRIMARY KEY (`lab_result_id`),
  KEY `description` (`description`),
  KEY `lab_test_id` (`lab_test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_test`
--

DROP TABLE IF EXISTS `lab_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_test` (
  `lab_test_id` int(11) NOT NULL DEFAULT '0',
  `lab_order_id` int(11) NOT NULL DEFAULT '0',
  `order_num` varchar(255) NOT NULL DEFAULT '',
  `filer_order_num` varchar(255) NOT NULL DEFAULT '',
  `observation_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `specimen_received_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `report_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering_provider` varchar(255) NOT NULL DEFAULT '',
  `service` varchar(255) NOT NULL DEFAULT '',
  `component_code` varchar(255) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT '',
  `clia_disclosure` varchar(255) NOT NULL DEFAULT '',
  `test_note` text NOT NULL,
  PRIMARY KEY (`lab_test_id`),
  KEY `lab_order_id` (`lab_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mainmenu`
--

DROP TABLE IF EXISTS `mainmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainmenu` (
  `menuId` varchar(36) NOT NULL,
  `siteSection` varchar(50) NOT NULL DEFAULT 'default',
  `parentId` varchar(36) NOT NULL DEFAULT '0',
  `dynamicKey` varchar(50) NOT NULL,
  `section` enum('children','more','dynamic') NOT NULL DEFAULT 'children',
  `displayOrder` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `prefix` varchar(100) NOT NULL DEFAULT 'main',
  `type` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `typeValue` varchar(255) NOT NULL,
  `jsAction` text NOT NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationRefillRequests`
--

DROP TABLE IF EXISTS `medicationRefillRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationRefillRequests` (
  `messageId` char(32) NOT NULL,
  `medicationId` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `dateStart` datetime NOT NULL,
  `details` text NOT NULL,
  `dateTime` datetime NOT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationRefillResponses`
--

DROP TABLE IF EXISTS `medicationRefillResponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationRefillResponses` (
  `messageId` char(32) NOT NULL,
  `medicationId` int(11) NOT NULL,
  `response` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `dateTime` datetime NOT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medications` (
  `medicationId` int(11) NOT NULL,
  `hipaaNDC` varchar(255) NOT NULL,
  `personId` int(11) NOT NULL,
  `type` char(3) NOT NULL,
  `patientReported` tinyint(4) NOT NULL,
  `substitution` tinyint(4) NOT NULL,
  `dateBegan` datetime NOT NULL,
  `datePrescribed` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `directions` varchar(255) NOT NULL,
  `prescriberPersonId` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `dose` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `priority` char(10) NOT NULL,
  `schedule` varchar(255) NOT NULL,
  `prn` tinyint(4) NOT NULL,
  `transmit` char(10) NOT NULL,
  `dateTransmitted` datetime NOT NULL,
  `daysSupply` int(11) NOT NULL,
  `strength` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `refills` int(11) NOT NULL,
  `rxnorm` varchar(255) NOT NULL,
  `eSignatureId` int(11) NOT NULL,
  `pharmacyId` varchar(36) NOT NULL,
  `quantityQualifier` varchar(255) NOT NULL,
  `pkey` varchar(10) NOT NULL,
  `dateDiscontinued` datetime NOT NULL,
  `refillRequestId` varchar(50) NOT NULL,
  PRIMARY KEY (`medicationId`),
  KEY `medicationId` (`medicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_section` varchar(50) NOT NULL DEFAULT 'default',
  `parent` int(11) NOT NULL DEFAULT '0',
  `dynamic_key` varchar(50) NOT NULL DEFAULT '',
  `section` enum('children','more','dynamic') NOT NULL DEFAULT 'children',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `prefix` varchar(100) NOT NULL DEFAULT 'main',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=228988 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messaging`
--

DROP TABLE IF EXISTS `messaging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messaging` (
  `messagingId` char(32) NOT NULL,
  `objectId` char(32) NOT NULL,
  `objectClass` varchar(255) NOT NULL,
  `objectType` tinyint(1) NOT NULL,
  `status` varchar(255) NOT NULL,
  `dateStatus` datetime NOT NULL,
  `note` text NOT NULL,
  `rawMessage` text NOT NULL,
  `relatesToMessagingId` varchar(50) NOT NULL,
  `personId` int(11) NOT NULL,
  `providerId` int(11) NOT NULL,
  `messageType` varchar(50) NOT NULL,
  `unresolved` tinyint(1) NOT NULL,
  `rawMessageResponse` text NOT NULL,
  PRIMARY KEY (`messagingId`),
  KEY `unresolved` (`unresolved`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messagingEPrescribes`
--

DROP TABLE IF EXISTS `messagingEPrescribes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messagingEPrescribes` (
  `messagingId` char(32) NOT NULL,
  `auditId` int(11) NOT NULL,
  `pharmacyId` varchar(36) NOT NULL,
  `resend` tinyint(1) NOT NULL,
  `retries` int(11) NOT NULL,
  `medicationId` int(11) NOT NULL,
  `refills` varchar(50) NOT NULL,
  PRIMARY KEY (`messagingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messagingInboundFaxes`
--

DROP TABLE IF EXISTS `messagingInboundFaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messagingInboundFaxes` (
  `messagingId` char(32) NOT NULL,
  `personId` int(11) NOT NULL,
  `mrn` varchar(50) NOT NULL,
  `subject` text NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `messageId` char(32) NOT NULL,
  `attachmentId` int(11) NOT NULL,
  PRIMARY KEY (`messagingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messagingOutboundFaxes`
--

DROP TABLE IF EXISTS `messagingOutboundFaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messagingOutboundFaxes` (
  `messagingId` char(32) NOT NULL,
  `auditId` int(11) NOT NULL,
  `transmissionId` char(15) NOT NULL,
  `docid` varchar(50) NOT NULL,
  `faxNumber` char(25) NOT NULL,
  `resend` tinyint(1) NOT NULL,
  `retries` int(11) NOT NULL,
  `finalDisposition` tinyint(1) NOT NULL,
  `dateCompletion` datetime NOT NULL,
  `faxStatus` int(11) NOT NULL,
  `faxStatusDescription` varchar(255) NOT NULL,
  `faxNum` char(25) NOT NULL,
  `recipientCSID` char(20) NOT NULL,
  `duration` char(5) NOT NULL,
  `pagesSent` int(11) NOT NULL,
  `numberOfRetries` int(11) NOT NULL,
  PRIMARY KEY (`messagingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `misc_charge`
--

DROP TABLE IF EXISTS `misc_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misc_charge` (
  `misc_charge_id` int(11) NOT NULL DEFAULT '0',
  `encounter_id` int(11) NOT NULL DEFAULT '0',
  `amount` float(7,2) NOT NULL DEFAULT '0.00',
  `charge_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(50) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `chargeType` char(10) NOT NULL,
  `personId` int(11) NOT NULL,
  `appointmentId` int(11) NOT NULL,
  `claimLineId` int(11) NOT NULL,
  `claimFileId` int(11) NOT NULL,
  PRIMARY KEY (`misc_charge_id`),
  KEY `encounter_id` (`encounter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `revision` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`owner`),
  KEY `foreign_id_2` (`foreign_id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `note_id` int(10) unsigned NOT NULL DEFAULT '0',
  `revision_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `note` mediumtext NOT NULL,
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`note_id`),
  KEY `revision_id` (`revision_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nsdrDefinitionMethods`
--

DROP TABLE IF EXISTS `nsdrDefinitionMethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsdrDefinitionMethods` (
  `uuid` char(36) NOT NULL,
  `nsdrDefinitionUuid` char(36) NOT NULL,
  `methodName` char(50) DEFAULT NULL,
  `method` text,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nsdrDefinitions`
--

DROP TABLE IF EXISTS `nsdrDefinitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsdrDefinitions` (
  `uuid` char(36) NOT NULL,
  `namespace` char(255) DEFAULT NULL,
  `aliasFor` char(255) DEFAULT NULL,
  `ORMClass` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `number`
--

DROP TABLE IF EXISTS `number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `number` (
  `number_id` int(11) NOT NULL,
  `number_type` int(11) NOT NULL DEFAULT '0',
  `notes` tinytext NOT NULL,
  `number` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `person_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `type` char(10) NOT NULL,
  `displayOrder` int(11) NOT NULL,
  `practiceId` int(11) NOT NULL,
  PRIMARY KEY (`number_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='A phone number';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderImaging`
--

DROP TABLE IF EXISTS `orderImaging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderImaging` (
  `orderId` int(11) NOT NULL,
  `imagingType` char(10) NOT NULL,
  `procedure` char(10) NOT NULL,
  `historyAndReason` text NOT NULL,
  `category` char(10) NOT NULL,
  `orderingLocation` int(11) NOT NULL,
  `dateRequested` datetime NOT NULL,
  `transportMode` char(10) NOT NULL,
  `isolation` tinyint(1) NOT NULL,
  `pregnant` char(10) NOT NULL,
  `urgency` char(10) NOT NULL,
  `datePreOp` datetime NOT NULL,
  `submitTo` int(11) NOT NULL,
  `modifiers` varchar(255) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderLabTests`
--

DROP TABLE IF EXISTS `orderLabTests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderLabTests` (
  `orderId` int(11) NOT NULL,
  `labTest` char(32) NOT NULL,
  `collectionSample` char(96) NOT NULL,
  `specimen` char(10) NOT NULL,
  `urgency` char(10) NOT NULL,
  `comments` text NOT NULL,
  `collectionType` char(10) NOT NULL,
  `dateCollection` datetime NOT NULL,
  `schedule` char(10) NOT NULL,
  `daysSupply` int(11) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `providerId` int(11) DEFAULT NULL,
  `dateStart` datetime DEFAULT NULL,
  `dateStop` datetime DEFAULT NULL,
  `orderText` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `eSignatureId` int(11) NOT NULL DEFAULT '0',
  `patientId` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `dateDiscontinued` datetime NOT NULL,
  `hold` tinyint(1) NOT NULL,
  `release` tinyint(1) NOT NULL,
  `type` int(11) NOT NULL,
  `textOnlyType` char(10) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `person_id` int(11) NOT NULL DEFAULT '0',
  `is_default_provider_primary` int(11) NOT NULL DEFAULT '0',
  `default_provider` int(11) NOT NULL DEFAULT '0',
  `record_number` char(16) NOT NULL,
  `employer_name` varchar(255) NOT NULL DEFAULT '',
  `confidentiality` char(10) NOT NULL,
  `specialNeedsNote` varchar(255) NOT NULL,
  `specialNeedsTranslator` tinyint(4) NOT NULL,
  `teamId` char(10) NOT NULL,
  `defaultPharmacyId` varchar(36) NOT NULL,
  `signedHipaaDate` datetime NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `record_number` (`record_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='An patient extends the person entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientAllergies`
--

DROP TABLE IF EXISTS `patientAllergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientAllergies` (
  `patientAllergyId` int(11) NOT NULL,
  `causativeAgent` varchar(255) DEFAULT NULL,
  `patientId` int(11) NOT NULL,
  `observerId` int(11) NOT NULL,
  `reactionType` varchar(32) NOT NULL,
  `observed` tinyint(1) NOT NULL,
  `severity` varchar(32) NOT NULL,
  `dateTimeCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateTimeReaction` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `symptoms` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `noKnownAllergies` tinyint(1) NOT NULL,
  `enteredInError` tinyint(1) DEFAULT '0',
  `drugAllergy` char(32) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`patientAllergyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientDiagnosis`
--

DROP TABLE IF EXISTS `patientDiagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientDiagnosis` (
  `code` char(10) NOT NULL,
  `patientId` int(11) NOT NULL,
  `providerId` int(11) NOT NULL,
  `addToProblemList` tinyint(1) NOT NULL,
  `isPrimary` tinyint(1) NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `patientDiagnosisId` int(11) NOT NULL,
  `visitId` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  PRIMARY KEY (`patientDiagnosisId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientEducations`
--

DROP TABLE IF EXISTS `patientEducations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientEducations` (
  `code` char(10) NOT NULL,
  `patientId` int(11) NOT NULL,
  `level` varchar(10) NOT NULL,
  `education` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `dateTime` datetime NOT NULL,
  PRIMARY KEY (`code`,`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientExams`
--

DROP TABLE IF EXISTS `patientExams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientExams` (
  `code` char(10) NOT NULL,
  `patientId` int(11) NOT NULL,
  `result` varchar(10) NOT NULL,
  `exam` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `dateExamined` date NOT NULL,
  `refused` tinyint(1) NOT NULL,
  PRIMARY KEY (`code`,`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientImmunizations`
--

DROP TABLE IF EXISTS `patientImmunizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientImmunizations` (
  `code` char(10) NOT NULL,
  `patientId` int(11) NOT NULL,
  `reportedNotAdministered` tinyint(4) NOT NULL,
  `patientReported` tinyint(4) NOT NULL,
  `series` varchar(255) NOT NULL,
  `reaction` varchar(255) NOT NULL,
  `repeatContraindicated` tinyint(4) NOT NULL,
  `immunization` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `patientImmunizationId` int(11) NOT NULL,
  `dateAdministered` datetime NOT NULL,
  `lot` varchar(20) NOT NULL,
  `route` varchar(4) NOT NULL,
  `site` varchar(4) NOT NULL,
  `amount` char(16) NOT NULL,
  `units` char(16) NOT NULL,
  PRIMARY KEY (`patientImmunizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientProcedures`
--

DROP TABLE IF EXISTS `patientProcedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientProcedures` (
  `code` char(10) NOT NULL,
  `patientId` int(11) NOT NULL,
  `providerId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `procedure` varchar(255) NOT NULL,
  `modifiers` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `patientProcedureId` int(11) NOT NULL,
  `visitId` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `diagnosisCode1` char(10) NOT NULL,
  `diagnosisCode2` char(10) NOT NULL,
  `diagnosisCode3` char(10) NOT NULL,
  `diagnosisCode4` char(10) NOT NULL,
  `diagnosisCode5` char(10) NOT NULL,
  `diagnosisCode6` char(10) NOT NULL,
  `diagnosisCode7` char(10) NOT NULL,
  `diagnosisCode8` char(10) NOT NULL,
  `modifier1` char(10) NOT NULL,
  `modifier2` char(10) NOT NULL,
  `modifier3` char(10) NOT NULL,
  `modifier4` char(10) NOT NULL,
  PRIMARY KEY (`patientProcedureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientStatistics`
--

DROP TABLE IF EXISTS `patientStatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientStatistics` (
  `personId` int(11) NOT NULL,
  PRIMARY KEY (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientStatisticsDefinitions`
--

DROP TABLE IF EXISTS `patientStatisticsDefinitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientStatisticsDefinitions` (
  `patientStatisticsDefinitionId` int(11) NOT NULL,
  `guid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `value` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`patientStatisticsDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientVisitTypes`
--

DROP TABLE IF EXISTS `patientVisitTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientVisitTypes` (
  `providerId` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `isPrimary` tinyint(1) NOT NULL,
  `patientVisitTypeId` int(11) NOT NULL,
  `visitId` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  PRIMARY KEY (`patientVisitTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_note`
--

DROP TABLE IF EXISTS `patient_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_note` (
  `patient_note_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `note_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `note` text NOT NULL,
  `deprecated` tinyint(1) NOT NULL DEFAULT '0',
  `reason` char(10) NOT NULL,
  `posting` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`patient_note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_statistics`
--

DROP TABLE IF EXISTS `patient_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_statistics` (
  `person_id` int(11) NOT NULL DEFAULT '0',
  `ethnicity` int(11) NOT NULL DEFAULT '0',
  `race` int(11) NOT NULL DEFAULT '0',
  `income` int(11) NOT NULL DEFAULT '0',
  `language` int(11) NOT NULL DEFAULT '0',
  `migrant_status` int(11) NOT NULL DEFAULT '0',
  `registration_location` int(11) NOT NULL DEFAULT '0',
  `sign_in_date` date NOT NULL DEFAULT '0000-00-00',
  `monthly_income` int(11) NOT NULL DEFAULT '0',
  `family_size` int(11) NOT NULL DEFAULT '0',
  `education_level` int(11) NOT NULL DEFAULT '0',
  `employment_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL DEFAULT '0',
  `encounter_id` int(11) NOT NULL DEFAULT '0',
  `payment_type` char(10) NOT NULL,
  `ref_num` varchar(60) NOT NULL DEFAULT '',
  `amount` float(11,2) NOT NULL DEFAULT '0.00',
  `writeoff` float(11,2) NOT NULL DEFAULT '0.00',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payer_id` int(11) NOT NULL DEFAULT '0',
  `payment_date` date NOT NULL DEFAULT '0000-00-00',
  `title` varchar(255) NOT NULL DEFAULT '',
  `personId` int(11) NOT NULL,
  `appointmentId` int(11) NOT NULL,
  `claimLineId` int(11) NOT NULL,
  `claimFileId` int(11) NOT NULL,
  `allocated` float(11,2) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `foreign_id` (`foreign_id`),
  KEY `encounter_id` (`encounter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissionTemplates`
--

DROP TABLE IF EXISTS `permissionTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissionTemplates` (
  `permissionTemplateId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `template` text NOT NULL,
  PRIMARY KEY (`permissionTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `salutation` varchar(20) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `middle_name` varchar(50) NOT NULL DEFAULT '',
  `suffix` varchar(12) NOT NULL,
  `gender` char(10) NOT NULL,
  `initials` varchar(10) NOT NULL DEFAULT '',
  `date_of_birth` date NOT NULL DEFAULT '0000-00-00',
  `summary` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `secondary_email` varchar(100) NOT NULL DEFAULT '',
  `has_photo` enum('0','1') NOT NULL DEFAULT '0',
  `identifier` varchar(100) NOT NULL DEFAULT '',
  `identifier_type` char(10) NOT NULL,
  `marital_status` char(10) NOT NULL,
  `inactive` int(1) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL,
  `primary_practice_id` int(11) NOT NULL DEFAULT '0',
  `activePhoto` int(11) NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `primary_practice_id` (`primary_practice_id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='A person in the system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person_address`
--

DROP TABLE IF EXISTS `person_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_address` (
  `person_id` int(11) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `address_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`,`address_id`),
  KEY `address_type` (`address_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Links a person to a address specifying the address type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person_number`
--

DROP TABLE IF EXISTS `person_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_number` (
  `person_id` int(11) NOT NULL DEFAULT '0',
  `number_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`person_id`,`number_id`),
  KEY `phone_id` (`number_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Links between people and phone_numbers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacies`
--

DROP TABLE IF EXISTS `pharmacies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacies` (
  `pharmacyId` varchar(36) NOT NULL,
  `NCPDPID` char(7) NOT NULL,
  `StoreNumber` char(35) NOT NULL,
  `ReferenceNumberAlt1` char(35) NOT NULL,
  `ReferenceNumberAlt1Qualifier` char(3) NOT NULL,
  `StoreName` char(35) NOT NULL,
  `AddressLine1` char(35) NOT NULL,
  `AddressLine2` char(35) NOT NULL,
  `City` char(35) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` char(11) NOT NULL,
  `PhonePrimary` char(25) NOT NULL,
  `Fax` char(25) NOT NULL,
  `Email` char(80) NOT NULL,
  `PhoneAlt1` char(25) NOT NULL,
  `PhoneAlt1Qualifier` char(3) NOT NULL,
  `PhoneAlt2` char(25) NOT NULL,
  `PhoneAlt2Qualifier` char(3) NOT NULL,
  `PhoneAlt3` char(25) NOT NULL,
  `PhoneAlt3Qualifier` char(3) NOT NULL,
  `PhoneAlt4` char(25) NOT NULL,
  `PhoneAlt4Qualifier` char(3) NOT NULL,
  `PhoneAlt5` char(25) NOT NULL,
  `PhoneAlt5Qualifier` char(3) NOT NULL,
  `ActiveStartTime` datetime NOT NULL,
  `ActiveEndTime` datetime NOT NULL,
  `ServiceLevel` char(5) NOT NULL,
  `PartnerAccount` char(35) NOT NULL,
  `LastModifierDate` char(22) NOT NULL,
  `TwentyFourHourFlag` char(1) NOT NULL,
  `CrossStreet` char(35) NOT NULL,
  `RecordChange` char(1) NOT NULL,
  `OldServiceLevel` char(5) NOT NULL,
  `TextServiceLevel` char(100) NOT NULL,
  `TextServiceLevelChange` char(100) NOT NULL,
  `Version` char(5) NOT NULL,
  `NPI` char(10) NOT NULL,
  `preferred` tinyint(4) NOT NULL,
  `print` tinyint(4) NOT NULL,
  PRIMARY KEY (`pharmacyId`),
  KEY `Zip` (`Zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postingJournals`
--

DROP TABLE IF EXISTS `postingJournals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postingJournals` (
  `postingJournalId` int(11) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `payerId` int(11) NOT NULL,
  `visitId` int(11) NOT NULL,
  `claimLineId` int(11) NOT NULL,
  `claimFileId` int(11) NOT NULL,
  `amount` float(11,2) NOT NULL,
  `note` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `datePosted` date NOT NULL,
  `dateTime` datetime NOT NULL,
  PRIMARY KEY (`postingJournalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `practice_address`
--

DROP TABLE IF EXISTS `practice_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practice_address` (
  `practice_id` int(11) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `address_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`practice_id`,`address_id`),
  KEY `address_id` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Links a practice to a address specifying the address type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `practice_number`
--

DROP TABLE IF EXISTS `practice_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practice_number` (
  `practice_id` int(11) NOT NULL DEFAULT '0',
  `number_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`practice_id`,`number_id`),
  KEY `person_id` (`practice_id`),
  KEY `phone_id` (`number_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Links between people and phone_numbers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `practices`
--

DROP TABLE IF EXISTS `practices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practices` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `problemListComments`
--

DROP TABLE IF EXISTS `problemListComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problemListComments` (
  `problemListCommentId` int(11) NOT NULL,
  `problemListId` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`problemListCommentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `problemLists`
--

DROP TABLE IF EXISTS `problemLists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problemLists` (
  `problemListId` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `codeTextShort` varchar(255) DEFAULT NULL,
  `dateOfOnset` datetime DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `personId` int(11) NOT NULL,
  `providerId` int(11) DEFAULT NULL,
  `status` char(8) DEFAULT NULL,
  `immediacy` char(9) DEFAULT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `flags` varchar(12) DEFAULT NULL,
  `previousStatus` char(8) DEFAULT NULL,
  PRIMARY KEY (`problemListId`),
  KEY `personId` (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedureCodeImmunizations`
--

DROP TABLE IF EXISTS `procedureCodeImmunizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedureCodeImmunizations` (
  `enumeration_value_id` int(11) NOT NULL DEFAULT '0',
  `enumeration_id` int(11) NOT NULL DEFAULT '0',
  `guid` char(36) NOT NULL,
  `systemName` char(24) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0',
  `extra1` varchar(255) NOT NULL DEFAULT '',
  `extra2` varchar(255) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '1',
  `depth` tinyint(4) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`enumeration_value_id`),
  KEY `key` (`key`),
  KEY `enumeration_id` (`enumeration_id`),
  KEY `systemName` (`systemName`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedureCodesCPT`
--

DROP TABLE IF EXISTS `procedureCodesCPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedureCodesCPT` (
  `textLong` varchar(255) DEFAULT NULL,
  `textShort` varchar(50) DEFAULT NULL,
  `code` char(10) DEFAULT NULL,
  KEY `code_text` (`textLong`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedureCodesImmunization`
--

DROP TABLE IF EXISTS `procedureCodesImmunization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedureCodesImmunization` (
  `textShort` varchar(255) NOT NULL,
  `code` char(11) NOT NULL,
  `textLong` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedureCodesLOINC`
--

DROP TABLE IF EXISTS `procedureCodesLOINC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedureCodesLOINC` (
  `loinc_num` char(32) NOT NULL,
  `component` char(255) NOT NULL,
  `property` char(32) NOT NULL,
  `time_aspct` char(32) NOT NULL,
  `system` char(96) NOT NULL,
  `scale_typ` char(8) NOT NULL,
  `method_typ` char(64) NOT NULL,
  `relat_nms` char(255) NOT NULL,
  `class` char(32) NOT NULL,
  `source` char(16) NOT NULL,
  `dt_last_ch` char(16) NOT NULL,
  `chng_type` char(8) NOT NULL,
  `comments` text NOT NULL,
  `answerlist` char(255) NOT NULL,
  `status` char(16) NOT NULL,
  `map_to` char(8) NOT NULL,
  `scope` char(16) NOT NULL,
  `consumer_name` char(255) NOT NULL,
  `ipcc_units` char(8) NOT NULL,
  `reference` text NOT NULL,
  `exact_cmp_sy` char(64) NOT NULL,
  `molar_mass` char(16) NOT NULL,
  `classtype` char(16) NOT NULL,
  `formula` text NOT NULL,
  `species` char(32) NOT NULL,
  `exmpl_answers` text NOT NULL,
  `acssym` text NOT NULL,
  `base_name` char(64) NOT NULL,
  `final` char(2) NOT NULL,
  `naaccr_id` char(8) NOT NULL,
  `code_table` char(32) NOT NULL,
  `setroot` char(16) NOT NULL,
  `panelelements` char(255) NOT NULL,
  `survey_quest_text` text NOT NULL,
  `survey_quest_src` char(64) NOT NULL,
  `unitsrequired` char(2) NOT NULL,
  `submitted_units` char(64) NOT NULL,
  `relatednames2` text NOT NULL,
  `shortname` char(64) NOT NULL,
  `order_obs` char(16) NOT NULL,
  `cdisc_common_tests` char(2) NOT NULL,
  `hl7_field_subfield_id` char(32) NOT NULL,
  `external_copyright_notice` text NOT NULL,
  `example_units` char(64) NOT NULL,
  `inpc_percentage` char(16) NOT NULL,
  `long_common_name` char(255) NOT NULL,
  `hl7_v2_datatype` char(8) NOT NULL,
  `hl7_v3_datatype` char(8) NOT NULL,
  `curated_range_and_units` char(64) NOT NULL,
  `document_section` char(16) NOT NULL,
  `definition_description_help` text NOT NULL,
  `example_ucum_units` char(32) NOT NULL,
  `example_si_ucum_units` char(32) NOT NULL,
  `status_reason` char(32) NOT NULL,
  `status_text` text NOT NULL,
  PRIMARY KEY (`loinc_num`),
  KEY `system` (`system`),
  KEY `shortname` (`shortname`),
  KEY `status` (`status`),
  KEY `order_obs` (`order_obs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `processingErrors`
--

DROP TABLE IF EXISTS `processingErrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processingErrors` (
  `processingErrorId` int(11) NOT NULL,
  `auditId` int(11) NOT NULL,
  `handlerId` int(11) NOT NULL,
  PRIMARY KEY (`processingErrorId`),
  UNIQUE KEY `auditId` (`auditId`,`handlerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `person_id` int(11) NOT NULL DEFAULT '0',
  `state_license_number` varchar(100) NOT NULL DEFAULT '',
  `clia_number` varchar(100) NOT NULL DEFAULT '',
  `dea_number` varchar(100) NOT NULL DEFAULT '',
  `bill_as` int(11) NOT NULL DEFAULT '0',
  `report_as` int(11) NOT NULL DEFAULT '0',
  `routing_station` char(4) NOT NULL,
  `sureScriptsSPI` varchar(20) NOT NULL,
  `color` varchar(10) NOT NULL,
  `specialty` char(3) NOT NULL,
  `dateActiveStart` datetime NOT NULL,
  `dateActiveEnd` datetime NOT NULL,
  `serviceLevel` int(11) NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `routing_station` (`routing_station`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providerDashboardState`
--

DROP TABLE IF EXISTS `providerDashboardState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerDashboardState` (
  `providerDashboardStateId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `facilityId` int(11) NOT NULL,
  `global` tinyint(1) NOT NULL COMMENT '1 global | 0 mine',
  `name` varchar(128) NOT NULL,
  `layout` char(2) NOT NULL COMMENT 'layout type for dashboardInnerLayout',
  `state` text NOT NULL,
  PRIMARY KEY (`providerDashboardStateId`),
  KEY `personId` (`personId`,`facilityId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_sequence`
--

DROP TABLE IF EXISTS `record_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportBase`
--

DROP TABLE IF EXISTS `reportBase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportBase` (
  `reportBaseId` int(11) NOT NULL,
  `guid` varchar(36) NOT NULL,
  `displayName` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `filters` longtext NOT NULL,
  PRIMARY KEY (`reportBaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportBaseClosures`
--

DROP TABLE IF EXISTS `reportBaseClosures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportBaseClosures` (
  `ancestor` int(11) NOT NULL,
  `descendant` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`ancestor`,`descendant`),
  KEY `descendant` (`descendant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportQueries`
--

DROP TABLE IF EXISTS `reportQueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportQueries` (
  `reportQueryId` int(11) NOT NULL,
  `reportBaseId` int(11) NOT NULL,
  `type` char(10) NOT NULL,
  `displayName` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`reportQueryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportViews`
--

DROP TABLE IF EXISTS `reportViews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportViews` (
  `reportViewId` int(11) NOT NULL,
  `reportBaseId` int(11) NOT NULL,
  `displayName` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `columnDefinitions` longtext NOT NULL,
  `customizeColumnNames` tinyint(1) NOT NULL,
  `runQueriesImmediately` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `viewOrder` int(1) NOT NULL,
  `showResultsIn` varchar(8) NOT NULL,
  `showResultsOptions` text NOT NULL,
  PRIMARY KEY (`reportViewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_templates`
--

DROP TABLE IF EXISTS `report_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_templates` (
  `report_template_id` int(11) NOT NULL DEFAULT '0',
  `report_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_default` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sequence` int(11) NOT NULL DEFAULT '100000',
  `custom_id` varchar(255) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `template` text NOT NULL,
  PRIMARY KEY (`report_template_id`),
  KEY `report_id` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Report templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `query` longtext NOT NULL,
  `description` mediumtext NOT NULL,
  `custom_id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Report definitions TODO: change to Generic Seq';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `number_seats` int(11) NOT NULL DEFAULT '0',
  `building_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(10) NOT NULL DEFAULT '',
  `routing_station` char(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `routing_station` (`routing_station`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routing`
--

DROP TABLE IF EXISTS `routing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routing` (
  `routingId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `stationId` char(4) NOT NULL,
  `fromStationId` char(4) NOT NULL,
  `timestamp` datetime NOT NULL,
  `checkInTimestamp` datetime NOT NULL,
  `appointmentId` int(11) NOT NULL,
  `providerId` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  PRIMARY KEY (`routingId`),
  KEY `station_id` (`stationId`,`fromStationId`,`timestamp`),
  KEY `appointment_id` (`appointmentId`),
  KEY `provider_id` (`providerId`,`roomId`),
  KEY `person_id` (`personId`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routing_archive`
--

DROP TABLE IF EXISTS `routing_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routing_archive` (
  `routingId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `stationId` char(4) NOT NULL,
  `fromStationId` char(4) NOT NULL,
  `timestamp` datetime NOT NULL,
  `checkInTimestamp` datetime NOT NULL,
  `appointmentId` int(11) NOT NULL,
  `providerId` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  PRIMARY KEY (`routingId`),
  KEY `station_id` (`stationId`,`fromStationId`,`timestamp`),
  KEY `appointment_id` (`appointmentId`),
  KEY `provider_id` (`providerId`,`roomId`),
  KEY `person_id` (`personId`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `schedule_id` int(10) unsigned NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description_long` text,
  `description_short` text,
  `schedule_code` varchar(255) DEFAULT NULL,
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `provider_id` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduleEvents`
--

DROP TABLE IF EXISTS `scheduleEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduleEvents` (
  `scheduleEventId` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `scheduleCode` char(4) NOT NULL,
  `providerId` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `scheduleId` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `buildingId` int(11) NOT NULL,
  PRIMARY KEY (`scheduleEventId`),
  KEY `start` (`start`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduleTemplates`
--

DROP TABLE IF EXISTS `scheduleTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduleTemplates` (
  `scheduleTemplateId` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `template` longtext NOT NULL,
  PRIMARY KEY (`scheduleTemplateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_date`
--

DROP TABLE IF EXISTS `storage_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_date` (
  `foreign_key` int(11) NOT NULL DEFAULT '0',
  `value_key` varchar(50) NOT NULL DEFAULT '',
  `value` date NOT NULL DEFAULT '0000-00-00',
  `array_index` tinyint(4) NOT NULL,
  PRIMARY KEY (`foreign_key`,`value_key`,`array_index`),
  KEY `foreign_key` (`foreign_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Generic way to store date values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_int`
--

DROP TABLE IF EXISTS `storage_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_int` (
  `foreign_key` int(11) NOT NULL DEFAULT '0',
  `value_key` varchar(50) NOT NULL DEFAULT '',
  `value` int(11) NOT NULL DEFAULT '0',
  `array_index` tinyint(4) NOT NULL,
  PRIMARY KEY (`foreign_key`,`value_key`,`array_index`),
  KEY `foreign_key` (`foreign_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Generic way to store integer values (also boolean)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_string`
--

DROP TABLE IF EXISTS `storage_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_string` (
  `foreign_key` int(11) NOT NULL DEFAULT '0',
  `value_key` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `array_index` tinyint(4) NOT NULL,
  PRIMARY KEY (`foreign_key`,`value_key`,`array_index`),
  KEY `foreign_key` (`foreign_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Generic way to string values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage_text`
--

DROP TABLE IF EXISTS `storage_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_text` (
  `foreign_key` int(11) NOT NULL DEFAULT '0',
  `value_key` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `array_index` tinyint(4) NOT NULL,
  PRIMARY KEY (`foreign_key`,`value_key`,`array_index`),
  KEY `foreign_key` (`foreign_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Generic way to string values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teamMembers`
--

DROP TABLE IF EXISTS `teamMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teamMembers` (
  `teamMemberId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `cosignWithParent` tinyint(4) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`teamMemberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `teamId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `cosignWithParent` tinyint(4) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`teamId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatedText`
--

DROP TABLE IF EXISTS `templatedText`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatedText` (
  `templateId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `template` longtext NOT NULL,
  PRIMARY KEY (`templateId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updateFileBlobs`
--

DROP TABLE IF EXISTS `updateFileBlobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updateFileBlobs` (
  `updateFileId` int(11) NOT NULL,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`updateFileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updateFiles`
--

DROP TABLE IF EXISTS `updateFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updateFiles` (
  `updateFileId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateTime` datetime NOT NULL,
  `md5sum` varchar(40) NOT NULL,
  `version` varchar(16) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `description` varchar(255) NOT NULL,
  `channelId` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL,
  `license` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `queue` tinyint(1) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`updateFileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(55) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(255) NOT NULL DEFAULT '',
  `person_id` int(11) DEFAULT NULL,
  `disabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `default_location_id` int(11) NOT NULL DEFAULT '0',
  `defaultBuildingId` int(11) NOT NULL,
  `permissionTemplateId` varchar(32) NOT NULL,
  `preferences` text NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`),
  KEY `default_location_id` (`default_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Users in the System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userKeys`
--

DROP TABLE IF EXISTS `userKeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userKeys` (
  `userId` int(11) NOT NULL,
  `privateKey` text NOT NULL,
  `publicKey` text NOT NULL,
  `iv` char(30) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vitalSignGroups`
--

DROP TABLE IF EXISTS `vitalSignGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vitalSignGroups` (
  `vitalSignGroupId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `enteringUserId` int(11) NOT NULL,
  `visitId` int(11) NOT NULL,
  `vitalSignTemplateId` int(11) NOT NULL,
  `enteredInError` tinyint(1) NOT NULL,
  PRIMARY KEY (`vitalSignGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vitalSignTemplates`
--

DROP TABLE IF EXISTS `vitalSignTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vitalSignTemplates` (
  `vitalSignTemplateId` int(11) NOT NULL,
  `template` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vitalSignValueQualifiers`
--

DROP TABLE IF EXISTS `vitalSignValueQualifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vitalSignValueQualifiers` (
  `vitalSignValueQualifierId` int(11) NOT NULL,
  `vitalSignValueId` int(11) NOT NULL,
  `qualifier` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`vitalSignValueQualifierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vitalSignValues`
--

DROP TABLE IF EXISTS `vitalSignValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vitalSignValues` (
  `vitalSignValueId` int(11) NOT NULL,
  `vitalSignGroupId` int(11) NOT NULL,
  `unavailable` tinyint(4) NOT NULL,
  `refused` tinyint(4) NOT NULL,
  `vital` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `units` char(10) NOT NULL,
  PRIMARY KEY (`vitalSignValueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `writeOffs`
--

DROP TABLE IF EXISTS `writeOffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writeOffs` (
  `writeOffId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `appointmentId` int(11) NOT NULL,
  `claimLineId` int(11) NOT NULL,
  `claimFileId` int(11) NOT NULL,
  `visitId` int(11) NOT NULL,
  `amount` float(11,2) NOT NULL,
  `userId` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` char(255) NOT NULL,
  `payerId` int(11) NOT NULL,
  PRIMARY KEY (`writeOffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zipcodeGeo`
--

DROP TABLE IF EXISTS `zipcodeGeo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zipcodeGeo` (
  `zip` int(6) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` char(3) NOT NULL,
  `geo_lat` float NOT NULL,
  `geo_lon` float NOT NULL,
  PRIMARY KEY (`zip`,`city`),
  KEY `zip` (`zip`),
  KEY `city` (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zipcodes`
--

DROP TABLE IF EXISTS `zipcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zipcodes` (
  `zip` int(10) unsigned NOT NULL DEFAULT '0',
  `city` varchar(45) NOT NULL DEFAULT '',
  `state` char(2) NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  `tz_offset` tinyint(4) NOT NULL DEFAULT '0',
  `dst` char(1) NOT NULL DEFAULT '',
  `country` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
