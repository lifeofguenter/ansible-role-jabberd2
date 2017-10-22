CREATE TABLE `authreg` (
    `username` TEXT, KEY `username` (`username`(255)),
    `realm` TINYTEXT, KEY `realm` (`realm`(255)),
    `password` TINYTEXT ) DEFAULT CHARSET=UTF8;

--
-- Session manager tables 
--

--
-- Active (seen) users
-- Used by: core
--
CREATE TABLE `active` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `time` INT ) DEFAULT CHARSET=UTF8;

--
-- Logout times
-- Used by: mod_iq_last
--
CREATE TABLE `logout` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `time` INT ) DEFAULT CHARSET=UTF8;

--
-- Roster items
-- Used by: mod_roster
--
CREATE TABLE `roster-items` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `jid` TEXT,
    `name` TEXT,
    `to` TINYINT,
    `from` TINYINT,
    `ask` INT ) DEFAULT CHARSET=UTF8;

--
-- Roster groups
-- Used by: mod_roster
--
CREATE TABLE `roster-groups` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `jid` TEXT,
    `group` TEXT ) DEFAULT CHARSET=UTF8;

--
-- vCard (user profile information)
-- Used by: mod_iq_vcard
--
CREATE TABLE `vcard` (
    `collection-owner` VARCHAR(255) NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `fn` VARCHAR(255),
    `nickname` VARCHAR(255),
    `url` VARCHAR(255),
    `tel` VARCHAR(255),
    `email` VARCHAR(255),
    `jabberid` VARCHAR(3071),
    `mailer` VARCHAR(1023),
    `title` VARCHAR(255),
    `role` VARCHAR(255),
    `bday` VARCHAR(255),        # Shouldn't this be a DATE?
    `tz` VARCHAR(7),
    `n-family` VARCHAR(255),
    `n-given` VARCHAR(255),
    `n-middle` VARCHAR(255),
    `n-prefix` VARCHAR(255),
    `n-suffix` VARCHAR(255),
    `adr-street` VARCHAR(255),
    `adr-extadd` VARCHAR(255),
    `adr-pobox` VARCHAR(15),
    `adr-locality` VARCHAR(255),
    `adr-region` VARCHAR(255),
    `adr-pcode` VARCHAR(31),
    `adr-country` VARCHAR(63),
    `geo-lat` VARCHAR(255),
    `geo-lon` VARCHAR(255),
    `org-orgname` VARCHAR(255),
    `org-orgunit` VARCHAR(255),
    `agent-extval` VARCHAR(255),
    `sort-string` VARCHAR(255),
    `desc` TEXT,
    `note` TEXT,
    `uid` VARCHAR(255),
    
    `photo-type` VARCHAR(127),
    `photo-binval` TEXT,
    `photo-extval` VARCHAR(255),
    
    `logo-type` VARCHAR(127),
    `logo-binval` TEXT,
    `logo-extval` VARCHAR(255),
    
    `sound-phonetic` VARCHAR(255),
    `sound-binval` TEXT,
    `sound-extval` VARCHAR(255),
    
    `key-type` VARCHAR(127),
    `key-cred` TEXT,
    
    `rev` VARCHAR(255)
    ) DEFAULT CHARSET=UTF8;

--
-- Offline message queue
-- Used by: mod_offline
--
CREATE TABLE `queue` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `xml` MEDIUMTEXT ) DEFAULT CHARSET=UTF8;

--
-- Private XML storage
-- Used by: mod_iq_private
--
CREATE TABLE `private` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `ns` TEXT,
    `xml` MEDIUMTEXT ) DEFAULT CHARSET=UTF8;

--
-- Message Of The Day (MOTD) messages (announcements)
-- Used by: mod_announce
--
CREATE TABLE `motd-message` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `xml` TEXT ) DEFAULT CHARSET=UTF8;

--
-- Times of last MOTD message for each user
-- Used by: mod_announce
--
CREATE TABLE `motd-times` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `time` INT ) DEFAULT CHARSET=UTF8;

--
-- Default privacy list
-- Used by: mod_privacy
--
CREATE TABLE `privacy-default` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `default` text ) DEFAULT CHARSET=UTF8;

--
-- Privacy lists
-- Used by: mod_privacy
--
CREATE TABLE `privacy-items` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `list` TEXT,
    `type` TEXT,
    `value` TEXT,
    `deny` TINYINT,
    `order` INT,
    `block` INT ) DEFAULT CHARSET=UTF8;

--
-- Vacation settings
-- Used by: mod_vacation
--
CREATE TABLE `vacation-settings` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, PRIMARY KEY(`object-sequence`),
    `start` INT,
    `end` INT,
    `message` TEXT ) DEFAULT CHARSET=UTF8;

--
-- Users statuses
-- Used by: mod_status
--
CREATE TABLE `status` (
    `collection-owner` TEXT NOT NULL, KEY(`collection-owner`(255)),
    `object-sequence` BIGINT NOT NULL AUTO_INCREMENT, KEY(`object-sequence`),
    `status` TEXT NOT NULL,
    `show` TEXT NOT NULL,
    `last-login` INT DEFAULT '0',
    `last-logout` INT DEFAULT '0',
    `xml` TEXT ) DEFAULT CHARSET=UTF8;
