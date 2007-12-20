-- phpMyAdmin SQL Dump
-- version 2.11.2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 20. Dezember 2007 um 17:34
-- Server Version: 4.0.24
-- PHP-Version: 5.2.0-8+etch7~bpo.1


--
-- Datenbank: `ewebuki_mdebase`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `auth_content`
--

CREATE TABLE IF NOT EXISTS `auth_content` (
  `uid` int(11) NOT NULL default '0',
  `gid` int(11) NOT NULL default '0',
  `pid` int(11) NOT NULL default '0',
  `db` varchar(20) NOT NULL default '',
  `tname` varchar(50) NOT NULL default '',
  `ebene` text NOT NULL,
  `kategorie` text NOT NULL,
  PRIMARY KEY  (`uid`,`gid`,`pid`,`db`,`tname`)
) TYPE=MyISAM;

--
-- Daten f�r Tabelle `auth_content`
--

INSERT INTO `auth_content` (`uid`, `gid`, `pid`, `db`, `tname`, `ebene`, `kategorie`) VALUES
(0, 1, 1, '', '/', '', ''),
(0, 1, 2, '', '/', '', ''),
(0, 1, 3, '', '/', '', ''),
(0, 1, 4, '', '/', '', ''),
(0, 1, 5, '', '/', '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `gid` int(11) NOT NULL auto_increment,
  `ggroup` varchar(30) NOT NULL default '',
  `beschreibung` text NOT NULL,
  PRIMARY KEY  (`gid`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

--
-- Daten f�r Tabelle `auth_group`
--

INSERT INTO `auth_group` (`gid`, `ggroup`, `beschreibung`) VALUES
(1, 'manager', 'manager');

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `auth_level`
--

CREATE TABLE IF NOT EXISTS `auth_level` (
  `lid` int(11) NOT NULL auto_increment,
  `level` varchar(10) NOT NULL default '',
  `beschreibung` text NOT NULL,
  PRIMARY KEY  (`lid`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

--
-- Daten f�r Tabelle `auth_level`
--

INSERT INTO `auth_level` (`lid`, `level`, `beschreibung`) VALUES
(1, 'cms_edit', 'berechtigt zum bearbeiten der templates'),
(2, 'cms_admin', 'berechtigt zur administration');

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `auth_member`
--

CREATE TABLE IF NOT EXISTS `auth_member` (
  `uid` int(11) NOT NULL default '0',
  `gid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`uid`,`gid`)
) TYPE=MyISAM;

--
-- Daten f�r Tabelle `auth_member`
--

INSERT INTO `auth_member` (`uid`, `gid`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `auth_priv`
--

CREATE TABLE IF NOT EXISTS `auth_priv` (
  `pid` int(11) NOT NULL default '0',
  `priv` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`pid`)
) TYPE=MyISAM;

--
-- Daten f�r Tabelle `auth_priv`
--

INSERT INTO `auth_priv` (`pid`, `priv`) VALUES
(1, 'view'),
(2, 'edit'),
(3, 'publish'),
(4, 'admin'),
(5, 'add');

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `auth_right`
--

CREATE TABLE IF NOT EXISTS `auth_right` (
  `uid` int(11) NOT NULL default '0',
  `lid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`uid`,`lid`)
) TYPE=MyISAM;

--
-- Daten f�r Tabelle `auth_right`
--

INSERT INTO `auth_right` (`uid`, `lid`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `auth_special`
--

CREATE TABLE IF NOT EXISTS `auth_special` (
  `sid` int(11) NOT NULL auto_increment,
  `suid` int(11) NOT NULL default '0',
  `content` int(11) default '0',
  `sdb` varchar(20) NOT NULL default '',
  `stname` varchar(50) NOT NULL default '',
  `sebene` text,
  `skategorie` text,
  `sbeschreibung` text,
  PRIMARY KEY  (`sid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

--
-- Daten f�r Tabelle `auth_special`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `uid` int(11) NOT NULL auto_increment,
  `nachname` varchar(40) NOT NULL default '',
  `vorname` varchar(40) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `username` varchar(20) NOT NULL default '',
  `pass` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `username` (`username`)
) TYPE=MyISAM PACK_KEYS=0 AUTO_INCREMENT=2 ;

--
-- Daten f�r Tabelle `auth_user`
--

INSERT INTO `auth_user` (`uid`, `nachname`, `vorname`, `email`, `username`, `pass`) VALUES
(1, 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki', 'WFffxluy26Lew');

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `db_leer`
--

CREATE TABLE IF NOT EXISTS `db_leer` (
  `id` int(11) NOT NULL auto_increment,
  `field1` varchar(255) NOT NULL default '',
  `field2` text NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

--
-- Daten f�r Tabelle `db_leer`
--

INSERT INTO `db_leer` (`id`, `field1`, `field2`) VALUES
(1, 'Erster Eintrag', 'Zweite Spalte'),
(2, 'Zweiter Eintrag', 'Zweite Spalte');

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `site_file`
--

CREATE TABLE IF NOT EXISTS `site_file` (
  `fid` int(11) NOT NULL auto_increment,
  `frefid` int(11) NOT NULL default '0',
  `fuid` int(11) NOT NULL default '0',
  `fdid` int(11) NOT NULL default '0',
  `ftname` varchar(255) NOT NULL default '',
  `ffname` varchar(255) NOT NULL default '',
  `ffart` enum('gif','jpg','png','pdf','zip','odt','ods','odp','gz','bz2') NOT NULL default 'jpg',
  `fdesc` text NOT NULL,
  `funder` varchar(255) default NULL,
  `fhit` varchar(255) default NULL,
  `fdel` text,
  PRIMARY KEY  (`fid`)
) TYPE=MyISAM AUTO_INCREMENT=11 ;

--
-- Daten f�r Tabelle `site_file`
--

INSERT INTO `site_file` (`fid`, `frefid`, `fuid`, `fdid`, `ftname`, `ffname`, `ffart`, `fdesc`, `funder`, `fhit`, `fdel`) VALUES
(1, 0, 1, 0, '', 'ewebuki_160x67.png', 'png', 'eWeBuKi Logo Beschreibung', 'eWeBuKi Logo Unterschift', '', NULL),
(2, 0, 1, 0, '', 'upload--alex.jpg', 'jpg', 'Der Alex in Berlin', 'Der Alex in Berlin', '#p2,10# #p1,10#', NULL),
(3, 0, 1, 0, '', 'upload--dark.jpg', 'jpg', 'Unwetter naht', ' Unwetter naht', '#p1,20#', NULL),
(4, 0, 1, 0, '', 'upload--dust.jpg', 'jpg', 'Staub im PC', 'Staub im PC', '#p2,20#', NULL),
(5, 0, 1, 0, '', 'upload--hummel.jpg', 'jpg', 'Hummelflug', 'Hummelflug', '#p2,30#', NULL),
(6, 0, 1, 0, '', 'upload--italy.jpg', 'jpg', 'S�ditalien', 'S�ditalien', '#p1,30#', NULL),
(7, 0, 1, 0, '', 'upload--karibik.jpg', 'jpg', 'Karibik Blick', 'Karibik Blick', '#p1,40#', NULL),
(8, 0, 1, 0, '', 'upload--palenque.jpg', 'jpg', 'Maya Ruine', 'Maya Ruine', '#p1,50#', NULL),
(9, 0, 1, 0, '', 'upload--rose.jpg', 'jpg', 'Rose bl�ht', 'Rose bl�ht', '#p2,40#', NULL),
(10, 0, 1, 0, '', 'upload--wolken.jpg', 'jpg', 'Wolkenblick', 'Wolkenblick', '#p1,60#', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `site_form`
--

CREATE TABLE IF NOT EXISTS `site_form` (
  `fid` int(11) NOT NULL auto_increment,
  `flabel` varchar(20) NOT NULL default '',
  `ftname` varchar(40) NOT NULL default '',
  `fsize` varchar(7) NOT NULL default '0',
  `fclass` varchar(30) NOT NULL default '',
  `fstyle` varchar(60) NOT NULL default '',
  `foption` enum('file','hidden','password','pgenum','readonly') default NULL,
  `frequired` enum('0','-1') NOT NULL default '0',
  `fcheck` text NOT NULL,
  PRIMARY KEY  (`fid`)
) TYPE=MyISAM AUTO_INCREMENT=11 ;

--
-- Daten f�r Tabelle `site_form`
--

INSERT INTO `site_form` (`fid`, `flabel`, `ftname`, `fsize`, `fclass`, `fstyle`, `foption`, `frequired`, `fcheck`) VALUES
(1, 'username', '210295197.modify', '0', '', '', NULL, '-1', ''),
(2, 'pass', '210295197.modify', '0', '', '', 'password', '-1', ''),
(3, 'pass', '852881080.modify', '0', '', '', 'password', '-1', ''),
(4, 'fid', '-939795212.modify', '0', 'hidden', '', 'hidden', '-1', ''),
(6, 'fdesc', '-939795212.modify', '25', '', '', NULL, '0', ''),
(7, 'funder', '-939795212.modify', '30', '', '', NULL, '0', ''),
(8, 'fhit', '-939795212.modify', '30', '', '', NULL, '0', ''),
(9, 'entry', '-555504947.add', '0', '', '', NULL, '-1', 'PREG:^[a-z_-.0-9]+$'),
(10, 'entry', '-555504947.edit', '0', '', '', NULL, '-1', 'PREG:^[a-z_-.0-9]+$');

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `site_form_lang`
--

CREATE TABLE IF NOT EXISTS `site_form_lang` (
  `flid` int(11) NOT NULL auto_increment,
  `fid` int(11) NOT NULL default '0',
  `flang` varchar(5) NOT NULL default 'de',
  `fpgenum` text,
  `fwerte` varchar(255) NOT NULL default '',
  `ferror` varchar(255) NOT NULL default '',
  `fdberror` varchar(255) NOT NULL default '',
  `fchkerror` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`flid`)
) TYPE=MyISAM AUTO_INCREMENT=11 ;

--
-- Daten f�r Tabelle `site_form_lang`
--

INSERT INTO `site_form_lang` (`flid`, `fid`, `flang`, `fpgenum`, `fwerte`, `ferror`, `fdberror`, `fchkerror`) VALUES
(1, 1, 'de', NULL, '', 'Username darf nicht leer sein.', 'Username bereits vorhanden.', ''),
(2, 2, 'de', NULL, '', 'Passworte nicht identisch oder leer.', '', ''),
(3, 3, 'de', NULL, '', 'Passworte nicht identisch oder leer.', '', ''),
(9, 9, 'de', NULL, '', '', '', 'Ung�ltige Zeichen im Feld Eintrag.'),
(10, 10, 'de', NULL, '', '', '', 'Ung�ltige Zeichen im Feld Eintrag.');

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `site_lock`
--

CREATE TABLE IF NOT EXISTS `site_lock` (
  `lang` varchar(5) NOT NULL default '',
  `label` varchar(20) NOT NULL default '',
  `tname` varchar(40) NOT NULL default '',
  `byalias` varchar(20) NOT NULL default '',
  `lockat` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`lang`,`label`,`tname`)
) TYPE=MyISAM;

--
-- Daten f�r Tabelle `site_lock`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `site_menu`
--

CREATE TABLE IF NOT EXISTS `site_menu` (
  `mid` int(10) NOT NULL auto_increment,
  `refid` int(10) default '0',
  `entry` varchar(30) NOT NULL default '',
  `picture` varchar(128) default NULL,
  `sort` int(8) NOT NULL default '1000',
  `hide` enum('-1') default NULL,
  `level` varchar(10) default NULL,
  `mandatory` enum('-1') default NULL,
  `defaulttemplate` enum('default1','default2','default3','default4') NOT NULL default 'default1',
  PRIMARY KEY  (`mid`),
  UNIQUE KEY `DUPE` (`refid`,`entry`)
) TYPE=MyISAM PACK_KEYS=1 AUTO_INCREMENT=6 ;

--
-- Daten f�r Tabelle `site_menu`
--

INSERT INTO `site_menu` (`mid`, `refid`, `entry`, `picture`, `sort`, `hide`, `level`, `mandatory`, `defaulttemplate`) VALUES
(1, 0, 'demo', NULL, 10, NULL, NULL, NULL, 'default1'),
(2, 0, 'show', NULL, 20, NULL, NULL, NULL, 'default1'),
(3, 0, 'bilderstrecke', NULL, 30, NULL, NULL, NULL, 'default1'),
(4, 0, 'fehler', NULL, 40, NULL, NULL, NULL, 'default1'),
(5, 0, 'impressum', NULL, 50, NULL, NULL, NULL, 'default1');

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `site_menu_lang`
--

CREATE TABLE IF NOT EXISTS `site_menu_lang` (
  `mlid` int(10) NOT NULL auto_increment,
  `mid` int(10) NOT NULL default '0',
  `lang` varchar(5) NOT NULL default 'de',
  `label` varchar(30) NOT NULL default '',
  `exturl` varchar(128) default NULL,
  PRIMARY KEY  (`mlid`)
) TYPE=MyISAM PACK_KEYS=1 AUTO_INCREMENT=6 ;

--
-- Daten f�r Tabelle `site_menu_lang`
--

INSERT INTO `site_menu_lang` (`mlid`, `mid`, `lang`, `label`, `exturl`) VALUES
(1, 1, 'de', 'Demo', NULL),
(2, 2, 'de', 'eWeBuKi Show', NULL),
(3, 3, 'de', 'Bilderstrecke', NULL),
(4, 4, 'de', '404', NULL),
(5, 5, 'de', 'Impressum', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur f�r Tabelle `site_text`
--

CREATE TABLE IF NOT EXISTS `site_text` (
  `lang` varchar(5) NOT NULL default 'de',
  `label` varchar(20) NOT NULL default '',
  `tname` varchar(40) NOT NULL default '',
  `version` int(11) NOT NULL default '0',
  `ebene` text NOT NULL,
  `kategorie` text NOT NULL,
  `crc32` enum('-1','0') NOT NULL default '-1',
  `html` enum('-1','0') NOT NULL default '0',
  `content` text NOT NULL,
  `changed` datetime NOT NULL default '0000-00-00 00:00:00',
  `bysurname` varchar(40) NOT NULL default '',
  `byforename` varchar(40) NOT NULL default '',
  `byemail` varchar(60) NOT NULL default '',
  `byalias` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`lang`,`label`,`tname`,`version`)
) TYPE=MyISAM PACK_KEYS=1;

--
-- Daten f�r Tabelle `site_text`
--

INSERT INTO `site_text` (`lang`, `label`, `tname`, `version`, `ebene`, `kategorie`, `crc32`, `html`, `content`, `changed`, `bysurname`, `byforename`, `byemail`, `byalias`) VALUES
('de', 'abort', '-555504947.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Abbrechen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'content', '-555504947.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Inhalt', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'entry', '-555504947.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Eintrag', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_menu', '-555504947.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Fehler beim l�schen des Men�eintrag', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_menu_lang', '-555504947.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Fehler beim l�schen der Sprache(n)', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_text', '-555504947.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Fehler beim l�schen des/r Text/e', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', '-555504947.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Den Men�punkt "!#ausgaben_entry" wirklich l�schen?', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'languages', '-555504947.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Sprachen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'no_content', '-555504947.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Kein Inhalt', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'send', '-555504947.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Abschicken', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-555504947.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Men�-Editor - Men�punkt l�schen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'abort', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Abbrechen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'add', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Neue Sprache hinzuf�gen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'basic', '-555504947.edit-multi', 0, '/admin/menued', 'add', '-1', '0', 'Allgemein', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'delete', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Diese Sprache l�schen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'entry', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Eintrag', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_lang_add', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Diese Sprache ist bereits vorhanden.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_lang_delete', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Die Entwickler Sprache kann nicht gel�scht werden.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_result', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'DB Fehler: ', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'extended', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Speziell', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'exturl', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'externe Url', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'hide', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Deaktiviert', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'label', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Bezeichnung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'lang', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Sprache', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'language', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Sprachen Verwaltung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'level', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'ben�tigter Level', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'madatory', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Erzwungen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'new_lang', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Neue Sprache', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'refid', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Ref. ID', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'reset', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Zur�cksetzen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'send', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Abschicken', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'sort', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Sortierung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'template', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Template', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Men�-Editor - Men�punkt', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'abort', '-555504947.edit-single', 0, '/admin/menued', 'edit', '-1', '0', 'Abbrechen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'add', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Neue Sprache hinzuf�gen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'basic', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Allgemein', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'entry', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Eintrag', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_lang_add', '-555504947.edit-single', 0, '/admin/menued', 'edit', '-1', '0', 'Diese Sprache ist bereits vorhanden.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_lang_delete', '-555504947.edit-single', 0, '/admin/menued', 'edit', '-1', '0', 'Die Entwickler Sprache kann nicht gel�scht werden.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_result', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'DB Fehler: ', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'extended', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Speziell', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'exturl', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'ext. Url', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'hide', '-555504947.edit-single', 0, '/admin/menued', 'edit', '-1', '0', 'Versteckt', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'label', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Bezeichnung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'lang', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Sprache', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'level', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'ben�tigter Level', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'madatory', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Erzwungen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'new_lang', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Neue Sprache', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'refid', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Ref ID.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'reset', '-555504947.edit-single', 0, '/admin/menued', 'edit', '-1', '0', 'Zur�cksetzen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'send', '-555504947.edit-single', 0, '/admin/menued', 'edit', '-1', '0', 'Abschicken', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'sort', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Sortierung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'template', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Template', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-555504947.edit-single', 0, '/admin/menued', 'edit', '-1', '0', 'Men�-Editor - Men�punkt bearbeiten', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'button_desc_add', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', 'Unterpunkt hinzuf�gen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'button_desc_delete', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', 'L�schen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'button_desc_down', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', 'Sortierung - Nach unten', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'button_desc_edit', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', 'Bearbeiten', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'button_desc_move', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', 'Im Men� Baum verschieben', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'button_desc_up', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', 'Sortierung - Nach oben', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'disabled', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', 'Abgeschaltet', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'enabled', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', 'Eingeschaltet', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error1', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', 'Men�punkte mit Unterpunkten lassen sich nicht l�schen.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'extern', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', '(extern)', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', 'my', 0, '', 'my', '-1', '0', 'Modul Beispiel "my" einfach', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'renumber', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', 'Neu durchnummerieren', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-555504947.list', 0, '/admin/menued', 'list', '-1', '0', 'Menu-Editor - �bersicht', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'abort', '-555504947.move', 0, '/admin/menued', 'move', '-1', '0', 'Abbrechen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'entry', '-555504947.move', 0, '/admin/menued', 'move', '-1', '0', 'Eintrag', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'extern', '-555504947.move', 0, '/admin/menued', 'move', '-1', '0', '(extern)', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'reset', '-555504947.move', 0, '/admin/menued', 'move', '-1', '0', 'Zur�cksetzen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'root', '-555504947.move', 0, '/admin/menued', 'move', '-1', '0', 'Ins Hauptmen�', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'send', '-555504947.move', 0, '/admin/menued', 'move', '-1', '0', 'Abschicken', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-555504947.move', 0, '/admin/menued', 'move', '-1', '0', 'Men�-Editor - Men�punkt verschieben', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'send', '852881080.modify', 0, '/admin/passed', 'modify', '-1', '0', 'Abschicken', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'chkpass', '852881080.modify', 0, '/admin/passed', 'modify', '-1', '0', 'Wiederholung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', '852881080.modify', 0, '/admin/passed', 'modify', '-1', '0', 'Passwort �ndern', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'newpass', '852881080.modify', 0, '/admin/passed', 'modify', '-1', '0', 'Neues', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'oldpass', '852881080.modify', 0, '/admin/passed', 'modify', '-1', '0', 'Altes', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '852881080.modify', 0, '/admin/passed', 'modify', '-1', '0', 'Passwort Editor', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', 'auth', 0, '', 'index', '-1', '0', 'Intern', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'desc', 'auth', 0, '', 'index', '-1', '0', 'Werkzeuge', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'fileed', 'auth', 0, '', 'index', '-1', '0', 'Datei-Editor', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'leveled', 'auth', 0, '', 'index', '-1', '0', 'Level-Editor', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'menued', 'auth', 0, '', 'index', '-1', '0', 'Men�-Editor', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'nachher', 'auth', 0, '', 'index', '-1', '0', 'ist angemeldet.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'passed', 'auth', 0, '', 'index', '-1', '0', 'Passwort-Editor', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'usered', 'auth', 0, '', 'index', '-1', '0', 'User-Editor', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'vorher', 'auth', 0, '', 'index', '-1', '0', 'Benutzer', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'abort', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Abbrechen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'add', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Datei einf�gen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'b', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Fett', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'big', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Gr�sser als der Rest', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'br', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Erzwungener Umbruch', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'cent', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Zentriert', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'center', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Zentriert', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'cite', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Logisch: cite', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'col', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Tabellenspalte', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'db', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'DB', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'div', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Bereich', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'e', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Mail', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'em', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Logisch: emphatisch', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'email', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'eMail Link', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Datei', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'files', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Dateien', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'h1', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', '�berschrift Klasse 1', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'h2', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', '�berschrift Klasse 2', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'hl', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Spezielle Trennlinie', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'hr', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Trennlinie', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'i', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Kursiv', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'img', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Bild', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'imgb', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Bild mit Rahmen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'in', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Initial', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'label', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Marke', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'language', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Sprache', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'link', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Link', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'list', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Liste', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'm1', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Men� dieser Ebene', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'm2', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Men� der Unterebene', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'pre', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Vorformatiert', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'quote', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'In Anf�hrungszeichen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'row', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Tabellenzeile', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 's', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Durchgestrichen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'save', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Speichern', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'small', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Kleiner als der Rest', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'sp', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Gesch�tztes Leerzeichen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'strong', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Logisch: strong', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'sub', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Tiefgestellt', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'sup', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Hochgestellt', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'tab', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Tabelle', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'tagselect', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Tag ausw�hlen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'template', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Template', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'tt', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Dickengleich', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'u', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Unterstrichen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'up', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Zur�ck-Link', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'upload', 'cms.edit.cmstag', 0, '', 'index', '-1', '0', 'Hinaufladen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', '404', 0, '', 'fehlt', '-1', '0', '[H1]Fehler 404 - Nicht gefunden.[/H1]\r\n\r\n[P]Die Uri !#ausgaben_404seite wurde nicht gefunden.\r\n\r\nLeider konnte das System nicht feststellen woher sie gekommen sind[/P].', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'modcol', 'global', 0, '/admin/leveled', 'list', '-1', '0', 'Funktionen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_dupe', '-555504947.edit-single', 0, '/admin/menued', 'add', '-1', '0', 'Der Eintrag ist bereits vorhanden.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', '404referer', 0, '', 'fehlt', '-1', '0', '[H1]Fehler 404 - Nicht gefunden.[/H1]\r\n\r\n[P]Die Uri: !#ausgaben_404seite wurde nicht gefunden.\r\n\r\nDie [LINK=!#ausgaben_404referer]Seite[/LINK] enthaelt einen falschen/alten Link.[/P]', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_dupe', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'Der Eintrag ist bereits vorhanden.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_dupe', '-555504947.move', 0, '/admin/menued', 'move', '-1', '0', 'In dieser Ebene existiert bereits ein Eintrag mit gleichem Namen.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'logout', 'auth', 0, '', 'auth.login', '-1', '0', 'Abgemeldet', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'denied', 'auth', 0, '', 'auth.login', '-1', '0', 'Zugriff verweigert!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'picture', '-555504947.edit-multi', 0, '/admin/menued', 'edit', '-1', '0', 'evt. Bild', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'picture', '-555504947.edit-single', 0, '/admin/menued', 'edit', '-1', '0', 'evt. Bild', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'reset', '852881080.modify', 0, '/admin/passed', 'modify', '-1', '0', 'Zur�cksetzen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'abort', '852881080.modify', 0, '/admin/passed', 'modify', '-1', '0', 'Abbrechen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-840786483.list', 0, '/admin/menued', 'list', '-1', '0', 'Level-Editor - �bersicht', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-840786483.modify', 0, '/admin/menued', 'edit', '-1', '0', 'Level-Editor - Bearbeiten', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'level', '-840786483.modify', 0, '/admin/leveled', 'modify', '-1', '0', 'Bezeichnung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'description', '-840786483.modify', 0, '/admin/leveled', 'modify', '-1', '0', 'Beschreibung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'del', '-840786483.modify', 0, '/admin/leveled', 'edit', '-1', '0', 'Entfernen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'add', '-840786483.modify', 0, '/admin/leveled', 'edit', '-1', '0', 'Hinzuf�gen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'login', '210295197.list', 0, '/admin/usered', 'list', '-1', '0', 'Login', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'send', '-840786483.delete', 0, '/admin/leveled', 'modify', '-1', '0', 'L�schen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'abort', '-840786483.delete', 0, '/admin/leveled', 'modify', '-1', '0', 'Abbrechen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'frage', '-840786483.delete', 0, '/admin/leveled', 'modify', '-1', '0', 'Wollen Sie den Level "!#ausgaben_level" wirklich l�schen?', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'level', '-840786483.details', 0, '/admin/leveled', 'details', '-1', '0', 'Bezeichnung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'user', '-840786483.details', 0, '/admin/leveled', 'details', '-1', '0', 'Mitglieder', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'beschreibung', '-840786483.details', 0, '/admin/leveled', 'details', '-1', '0', 'Beschreibung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'edit', '-840786483.details', 0, '/admin/leveled', 'details', '-1', '0', 'Bearbeiten', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'list', '-840786483.details', 0, '/admin/leveled', 'details', '-1', '0', '�bersicht', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-840786483.details', 0, '/admin/leveled', 'details', '-1', '0', 'Level Editor - Eigenschaften', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-840786483.delete', 0, '/admin/leveled', 'modify', '-1', '0', 'Level-Editor - L�schen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '210295197.list', 0, '/admin/usered', 'list', '-1', '0', 'User-Editor - �bersicht', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-939795212.list', 0, '/admin/fileed', 'list', '-1', '0', 'Datei-Editor - �bersicht', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'search', '-939795212.list', 0, '/admin/fileed', 'list', '-1', '0', 'Suche', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'gesamt', '-939795212.list', 0, '/admin/fileed', 'list', '-1', '0', 'Gesamt:', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'fileedit', '-939795212.list', 0, '/admin/fileed', 'list', '-1', '0', 'Bearbeiten', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'filedelete', '-939795212.list', 0, '/admin/fileed', 'list', '-1', '0', 'L�schen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ffname', '-939795212.modify', 0, '/admin', 'usered', '-1', '0', 'Dateiname', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'fdesc', '-939795212.modify', 0, '/admin', 'usered', '-1', '0', 'Bildbeschreibung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'funder', '-939795212.modify', 0, '/admin', 'usered', '-1', '0', 'Bildunterschrift', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'fhit', '-939795212.modify', 0, '/admin', 'usered', '-1', '0', 'Schlagworte', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'upa', '-939795212.modify', 0, '/admin', 'usered', '-1', '0', 'Die aktuelle Datei durch', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'upb', '-939795212.modify', 0, '/admin', 'usered', '-1', '0', 'ersetzen.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'send', '-939795212.modify', 0, '/admin', 'usered', '-1', '0', 'Abschicken', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'reset', '-939795212.modify', 0, '/admin', 'usered', '-1', '0', 'Zur�cksetzen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'abort', '-939795212.modify', 0, '/admin', 'usered', '-1', '0', 'Abbrechen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'cmslink', 'global', 1, '/admin/fileed', 'list', '-1', '0', 'zum Content Editor', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'level', '-840786483.list', 0, '/admin/leveled', 'list', '-1', '0', 'Bezeichnung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'beschreibung', '-840786483.list', 0, '/admin/leveled', 'list', '-1', '0', 'Beschreibung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'delete', 'global', 0, '/admin/leveled', 'list', '-1', '0', 'L�schen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'edit', 'global', 0, '/admin/leveled', 'list', '-1', '0', 'Bearbeiten', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'back', 'global', 0, '/admin/leveled', 'details', '-1', '0', 'Zur�ck', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'members', '-840786483.delete', 0, '/admin/leveled', 'delete', '-1', '0', 'Mitglieder', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '210295197.modify', 0, '/admin/usered', 'modify', '-1', '0', 'User-Editor - Bearbeiten', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_oldpass', '852881080.modify', 0, '/admin/passed', 'modify', '-1', '0', 'Das alte Passwort stimmt nicht!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_chkpass', '852881080.modify', 0, '/admin/passed', 'modify', '-1', '0', 'Das Neue Passwort und die Wiederholung stimmen nicht �berein!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'nachname', '210295197.modify', 0, '/admin/usered', 'modify', '-1', '0', 'Nachname', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'vorname', '210295197.modify', 0, '/admin/usered', 'modify', '-1', '0', 'Vorname', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'email', '210295197.modify', 0, '/admin/usered', 'modify', '-1', '0', 'eMail', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'send', 'global', 0, '/admin/usered', 'edit', '-1', '0', 'Abschicken', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'frage', '210295197.delete', 0, '/admin/usered', 'modify', '-1', '0', 'Wollen Sie den User "!#ausgaben_username" wirklich l�schen?', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'login', '210295197.details', 0, '/admin/usered', 'details', '-1', '0', 'Login', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '210295197.delete', 0, '/admin/usered', 'modify', '-1', '0', 'User-Editor - L�schen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '210295197.details', 0, '/admin/usered', 'details', '-1', '0', 'User-Editor - Eigenschaften', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'username', '210295197.modify', 0, '/admin/usered', 'modify', '-1', '0', 'Login', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'newpass', '210295197.modify', 0, '/admin/usered', 'modify', '-1', '0', 'Passwort', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'chkpass', '210295197.modify', 0, '/admin/usered', 'modify', '-1', '0', 'Wiederholung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', 'base', 0, '', 'impressum', '-1', '0', 'Menu', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'copyright', 'base', 0, '', 'index', '-1', '0', 'eWeBuKi - Copyright 2003-2007', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'kekse', 'base', 0, '', 'impressum', '-1', '0', 'Kekse', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'bloged', 'auth', 0, '/admin/passed', 'modify', '-1', '0', 'Blog-Editor', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'send', '-939795212.delete', 0, '/admin/menued', 'list', '-1', '0', 'Abschicken', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'abort', '-939795212.delete', 0, '/admin/menued', 'list', '-1', '0', 'Abbrechen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-939795212.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Datei Editor - Datei l�schen!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', '-939795212.delete', 0, '/admin/menued', 'delete', '-1', '0', 'Die Datei "!#ausgaben_ffname" wirklich l�schen?', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-939795212.upload', 0, '/admin/menued', 'list', '-1', '0', 'Datei-Editor Upload', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file', '-939795212.upload', 0, '/admin/menued', 'list', '-1', '0', 'Dateiauswahl', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'send', '-939795212.upload', 0, '/admin/menued', 'list', '-1', '0', 'Abschicken', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'reset', '-939795212.upload', 0, '/admin/menued', 'edit', '-1', '0', 'Zur�cksetzen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'abort', '-939795212.upload', 0, '/admin/menued', 'edit', '-1', '0', 'Abbrechen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-939795212.modify', 0, '/admin/menued', 'add', '-1', '0', 'Datei-Editor - Datei Eigenschaften bearbeiten', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'answera', '-939795212.list', 0, '/admin/fileed', 'list', '-1', '0', 'Ihre Schnellsuche nach', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'answerb', '-939795212.list', 0, '/admin/fileed', 'list', '-1', '0', 'hat', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'answerc_no', '-939795212.list', 0, '/admin/fileed', 'list', '-1', '0', 'keine Eintr�ge gefunden.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'answerc_yes', '-939795212.list', 0, '/admin/fileed', 'list', '-1', '0', 'folgende Eintr�ge gefunden.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'next', '-939795212.list', 0, '/admin/fileed', 'list', '-1', '0', 'Vorherige Seite', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'prev', '-939795212.list', 0, '/admin/fileed', 'list', '-1', '0', 'Nexte Seite', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'filecollect', '-939795212.list', 2, '/admin/fileed', 'list', '-1', '0', 'Gruppieren', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-939795212.compilation', 1, '/admin/fileed', 'compilation', '-1', '0', 'Gruppierung - �bersicht', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_edit', '-939795212.modify', 0, '/admin/fileed', 'edit', '-1', '0', 'Bild kann nur vom Eigent�mer bearbeitet werden.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'references', '-939795212.modify', 0, '/admin/fileed', 'edit', '-1', '0', 'Ist enthalten in:', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'details', 'global', 0, '/admin/leveled', 'list', '-1', '0', 'Details', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'new', 'global', 0, '/admin/leveled', 'list', '-1', '0', 'Neuer Eintrag', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'special', '210295197.delete', 0, '/admin/usered', 'delete', '-1', '0', 'Spezial Rechte', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'reset', 'global', 0, '/admin/usered', 'edit', '-1', '0', 'Zur�cksetzen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'abort', 'global', 0, '/admin/usered', 'edit', '-1', '0', 'Abbrechen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'del', '210295197.modify', 0, '/admin/usered', 'edit', '-1', '0', 'Nehmen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'actual', '210295197.modify', 0, '/admin/usered', 'edit', '-1', '0', 'Besitzt', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'avail', '210295197.modify', 0, '/admin/usered', 'edit', '-1', '0', 'Verf�gbar', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'add', '210295197.modify', 0, '/admin/usered', 'edit', '-1', '0', 'Geben', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'actual', '-840786483.modify', 0, '/admin/leveled', 'edit', '-1', '0', 'Mitglieder', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'avail', '-840786483.modify', 0, '/admin/leveled', 'edit', '-1', '0', 'Verf�gbar', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'surname', '210295197.list', 0, '/admin/usered', 'list', '-1', '0', 'Nachname', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'forename', '210295197.list', 0, '/admin/usered', 'list', '-1', '0', 'Vorname', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'right', '210295197.delete', 0, '/admin/usered', 'delete', '-1', '0', 'Rechte', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-2051315182.list', 0, '/admin/bloged', 'list', '-1', '0', 'Blog-Editor - �bersicht', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'anzahl', 'global', 0, '/admin/leveled', 'list', '-1', '0', 'Eintr�ge: ', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'surname', '210295197.details', 0, '/admin/usered', 'details', '-1', '0', 'Nachname', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'forename', '210295197.details', 0, '/admin/usered', 'details', '-1', '0', 'Vorname', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'email', '210295197.details', 0, '/admin/usered', 'details', '-1', '0', 'E-Mail', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'level', '210295197.details', 0, '/admin/usered', 'details', '-1', '0', 'Rechte', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'field1', 'my', 0, '', 'my', '-1', '0', 'Feld 1', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'field2', 'my', 0, '', 'my', '-1', '0', 'Feld 2', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', 'my', 0, '', 'my', '-1', '0', 'Beispiel f�r eine einfache Funktion.', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-1468826685.list', 0, '/dir/my', 'list', '-1', '0', 'Modul Beispiel "my" erweitert - �bersicht', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'field1', '-1468826685.list', 0, '/dir/my', 'list', '-1', '0', 'Feld 1', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-1468826685.modify', 0, '/dir/my', 'edit', '-1', '0', 'Modul Beispiel "my" erweitert - Bearbeiten', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'field1', '-1468826685.modify', 0, '/admin/leveled', 'list', '-1', '0', 'Feld 1', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'field2', '-1468826685.modify', 0, '/dir/my', 'edit', '-1', '0', 'Feld 2', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-1468826685.delete', 0, '/dir/my', 'delete', '-1', '0', 'Modul Beispiel "my" erweitert - L�schen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'field1', '-1468826685.delete', 0, '/dir/my', 'delete', '-1', '0', 'Feld 1', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'field2', '-1468826685.delete', 0, '/dir/my', 'delete', '-1', '0', 'Feld 2', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-1468826685.details', 0, '/dir/my', 'details', '-1', '0', 'Modul Beispiel "my" erweitert - Details', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'field1', '-1468826685.details', 0, '/dir/my', 'details', '-1', '0', 'Feld 1', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'field2', '-1468826685.details', 0, '/dir/my', 'details', '-1', '0', 'Feld 2', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', 'demo', 0, '', 'demo', '-1', '0', '[H1]Erstes Kapitel[/H1]\r\n\r\n[H2]Erster Absatz[/H2]\r\n\r\n[P]Weit hinten, hinter den Wortbergen, fern der L�nder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen Sie in Buchstabhausen an der K�ste des Semantik, eines gro�en Sprachozeans. Ein kleines B�chlein namens Duden flie�t durch ihren Ort und versorgt sie mit den n�tigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allm�chtigen Interpunktion werden die Blindtexte beherrscht � ein geradezu unorthographisches Leben.[/P]\r\n\r\n\r\n[H2]Zweiter Absatz[/H2]\r\n\r\n\r\n[P]Eines Tages aber beschlo� eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der gro�e Oxmox riet ihr davon ab, da es dort wimmele von b�sen Kommata, wilden Fragezeichen und hinterh�ltigen Semikoli, doch das Blindtextchen lie� sich nicht beirren. Es packte seine sieben Versalien, schob sich sein Initial in den G�rtel und machte sich auf den Weg.[/P]\r\n\r\n\r\n[H1]Zweites Kapitel[/H1]\r\n\r\n[H2]Erster Absatz[/H2]\r\n\r\n[P]Als es die ersten H�gel des Kursivgebirges erklommen hatte, warf es einen letzten Blick zur�ck auf die Skyline seiner Heimatstadt Buchstabhausen, die Headline von Alphabetdorf und die Subline seiner eigenen Stra�e, der Zeilengasse. Wehm�tig lief ihm eine rethorische Frage �ber die Wange, dann setzte es seinen Weg fort.[/P]\r\n\r\n[P=box]Unterwegs traf es eine Copy. Die Copy warnte das Blindtextchen, da, wo sie herk�me w�re sie zigmal umgeschrieben worden und alles, was von ihrem Ursprung noch �brig w�re, sei das Wort "und" und das Blindtextchen solle umkehren und wieder in sein eigenes, sicheres Land zur�ckkehren.[/P]\r\n\r\n[H2]Dritter Absatz[/H2]\r\n\r\n[P]Doch alles Gutzureden konnte es nicht �berzeugen und so dauerte es nicht lange, bis ihm ein paar heimt�ckische Werbetexter auflauerten, es mit Longe und Parole betrunken machten und es dann in ihre Agentur schleppten, wo sie es f�r ihre Projekte wieder und wieder mi�brauchten. Und wenn es nicht umgeschrieben wurde, dann benutzen Sie es immernoch.[/P]', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-102562964.list', 1, '/admin/grouped', 'list', '-1', '0', 'Gruppen-Editor - �bersicht', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'filelist', 'global', 1, '/admin/fileed', 'list', '-1', '0', 'Datei-Editor', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'filecompilation', 'global', 3, '/admin/fileed', 'list', '-1', '0', 'Gruppierung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'fileupload', 'global', 1, '/admin/fileed', 'list', '-1', '0', 'Upload', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'group', '-939795212.list', 1, '/admin/fileed', 'list', '-1', '0', 'Gruppe', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'search', '-939795212.compilation', 1, '/admin/fileed', 'list', '-1', '0', 'Suche', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'compilation_search', '-939795212.compilation', 1, '/admin/fileed', 'compilation', '-1', '0', 'Galerien', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'compilation', '-939795212.compilation', 1, '/admin/fileed', 'compilation', '-1', '0', 'Galerie', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'of', '-939795212.compilation', 1, '/admin/fileed', 'list', '-1', '0', 'von', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'group', '-102562964.list', 1, '/admin/grouped', 'list', '-1', '0', 'Gruppe', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error0', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Kein Fehler, Datei entspricht den Vorgaben', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'beschreibung', '-102562964.list', 1, '/admin/grouped', 'list', '-1', '0', 'Beschreibung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error1', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Die hochgeladene Datei �berschreitet die Gr��enbeschr�nkung "upload_max_filesize" der php.ini!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error2', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Die hochgeladene Datei �berschreitet die im Formular festgelegte "MAX_FILE_SIZE"-Anweisung!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'group', '-102562964.modify', 3, '/admin/grouped', 'add', '-1', '0', 'Gruppe', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error3', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Die Datei wurde nur teilweise hochgeladen!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error4', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Es wurde keine Datei hochgeladen!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error6', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Es ist kein tempor�res Upload-Verzeichnis verf�gbar!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error7', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Es kann nicht auf die Platte geschrieben werden!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error8', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Der Upload wurde von einer Erweiterung verhindert!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error10', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Die Datei ist zu gro�!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error11', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Ung�ltiges Dateiformat!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error12', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Die Datei ist schon vorhanden!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error13', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Unbekannter Fehler. Eventuell ist die "post_max_size" der php.ini die Ursache. Bitte nicht weiter probieren!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'file_error14', 'global', 1, '/admin/fileed', 'upload', '-1', '0', 'Es wird mindestens die PHP-Version 4.x.x ben�tigt!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'avail', '-102562964.modify', 1, '/admin/grouped', 'add', '-1', '0', 'Verf�gbar', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki');
INSERT INTO `site_text` (`lang`, `label`, `tname`, `version`, `ebene`, `kategorie`, `crc32`, `html`, `content`, `changed`, `bysurname`, `byforename`, `byemail`, `byalias`) VALUES
('de', 'actual', '-102562964.modify', 1, '/admin/grouped', 'edit', '-1', '0', 'Mitglieder', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'del', '-102562964.modify', 1, '/admin/grouped', 'edit', '-1', '0', 'Entfernen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'add', '-102562964.modify', 1, '/admin/grouped', 'edit', '-1', '0', 'Hinzuf�gen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'description', '-102562964.modify', 1, '/admin/grouped', 'edit', '-1', '0', 'Beschreibung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'frage', '-102562964.delete', 2, '/admin/grouped', 'delete', '-1', '0', 'Wollen Sie die Gruppe "!#ausgaben_ggroup" wirklich l�schen ?', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'members', '-102562964.delete', 1, '/admin/grouped', 'delete', '-1', '0', 'Mitglieder', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'user', '-102562964.details', 1, '/admin/grouped', 'details', '-1', '0', 'Mitglieder', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'group', '-102562964.details', 1, '/admin/grouped', 'details', '-1', '0', 'Gruppe', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'beschreibung', '-102562964.details', 1, '/admin/grouped', 'details', '-1', '0', 'Beschreibung', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-102562964.details', 1, '/admin/grouped', 'details', '-1', '0', 'Gruppen-Editor - Eigenschaften', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-102562964.delete', 1, '/admin/grouped', 'delete', '-1', '0', 'Gruppen-Editor - L�schen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '-102562964.modify', 1, '/admin/grouped', 'edit', '-1', '0', 'Gruppen-Editor - Bearbeiten', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'error_dupe', '-102562964.modify', 1, '/admin/grouped', 'add', '-1', '0', 'Fehler: Es gibt bereits eine Gruppe mit diesem Namen !', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'secret', 'auth', 0, '', 'auth', '-1', '0', 'Hintereingang', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'all_files', 'global', 1, '/admin/fileed', 'list', '-1', '0', 'Dateien', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'sel_files', 'global', 1, '/admin/fileed', 'list', '-1', '0', 'Markierte', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'images', '-939795212.list', 1, '/admin/fileed', 'list', '-1', '0', 'Bilder', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'button_desc_jump', '-555504947.list', 1, '/admin/menued', 'list', '-1', '0', 'zur Content-Seite', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'grouped', 'auth', 0, '', 'auth', '-1', '0', 'Gruppen-Editor', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'url', '807284226.modify', 1, '/admin/righted', 'edit', '-1', '0', 'Pfad: ', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'actual', '807284226.modify', 1, '/admin/righted', 'edit', '-1', '0', 'Vorhanden Rechte f�r diese Url', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'group', '807284226.modify', 1, '/admin/righted', 'edit', '-1', '0', 'Gruppen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'priv', '807284226.modify', 1, '/admin/righted', 'edit', '-1', '0', 'Rechte', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'ueberschrift', '807284226.modify', 2, '/admin/righted', 'edit', '-1', '0', 'Rechte-Editor', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'delete_ok', '-939795212.delete', 2, '/admin/fileed', 'delete', '-1', '0', 'wird gel�scht!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', '-939795212.delete', 1, '/admin/fileed', 'delete', '-1', '0', 'Folgende Dateien wurden zum l�schen ausgew�hlt:', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'user_error', '-939795212.delete', 1, '/admin/fileed', 'delete', '-1', '0', 'Sie sind nicht Eigent�mer dieser Datei!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'content_error', '-939795212.delete', 1, '/admin/fileed', 'delete', '-1', '0', 'ist enthalten auf', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'group_error', '-939795212.delete', 1, '/admin/fileed', 'delete', '-1', '0', 'ist enthalten in folgender Gruppe:', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'delete_error', '-939795212.delete', 1, '/admin/fileed', 'delete', '-1', '0', 'Datei konnte nicht gel�scht werden!', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'root', '-555504947.list', 1, '/admin/menued', 'move', '-1', '0', 'Als Hauptpunkt anlegen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'compilation_info', 'global', 1, '/impressum', 'test', '-1', '0', 'Fotostrecke starten: Klicken Sie auf ein Bild', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'add', '807284226.modify', 1, '/admin/righted', 'edit', '-1', '0', 'Hinzuf�gen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'compilation_pics', 'global', 1, '/impressum', 'test', '-1', '0', 'Bilder', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'of', 'global', 1, '/impressum/test', 'view', '-1', '0', 'von', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'selected', '-939795212.compilation', 1, '/admin/fileed', 'compilation', '-1', '0', 'ausgew�hlte Selektion(en):', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'sel_show', '-939795212.compilation', 1, '/admin/fileed', 'compilation', '-1', '0', 'Nur diese anzeigen', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'num_pics', '-939795212.compilation', 1, '/admin/fileed', 'compilation', '-1', '0', 'Bilder insgesamt: ', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'all_names', '-939795212.compilation', 1, '/admin/fileed', 'compilation', '-1', '0', 'Alle verwendeten Titel', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', 'bilderstrecke', 0, '', 'bilderstrecke', '-1', '0', '[H1]�berschrift[/H1]\r\n\r\n[P]Demo des "Selection Tag".[/P]\r\n\r\n[DIV=box][LINK=http://ewebuki.de/auth/dokumentation/tags/spezial.html#SEL]Beschreibung des "Tag"[/LINK][/DIV]\r\n\r\n[HS][/HS]\r\n\r\n[P]Das ist ein [SEL=1;m;;]Textlink[/SEL] zu der Bilderstrecke.\r\n[E][SEL=1;m;;]Textlink[/SEL][/E][/P]\r\n\r\n[HS][/HS]\r\n\r\n[P]Bitte nur ein Bild.\r\n[E][SEL=1;b;True;8]Gruppierung, ein Bild[/SEL][/E][/P]\r\n\r\n[SEL=1;b;True;8]Gruppierung, ein Bild[/SEL][HS][/HS]\r\n\r\n[P]Oder doch ein paar "Teaser Thumbs"?\r\n[E][SEL=1;b;;3:7:10]Gruppierung, viele Bilder[/SEL][/E][/P]\r\n\r\n[SEL=1;b;;3:7:10]Gruppierung, viele Bilder[/SEL]\r\n\r\n\r\n[HS][/HS]\r\n\r\n[P]Und jetzt die "Thumbs" aller Bilder?\r\n[E][SEL=1;b;;a]Gruppierung, alle Bilder[/SEL][/E][/P]\r\n\r\n[SEL=1;b;;a]Gruppierung, alle Bilder[/SEL]', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', 'fehler', 0, '', 'fehler', '-1', '0', '[H1]404 Test[/H1]\r\n\r\n\r\n[P]Hiermit wird die 404 Fehlerseite angezeigt.\r\n\r\n[LINK=fehlt.html]404 Fehler mit Referer[/LINK]\r\n\r\nUm die zweite 404 Fehlermeldung (Referer unbekannt) sichtbar zu machen,\r\nin der Eingabezeile der obigen 404 Fehlermeldung einfach Enter dr�cken.[/P]', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', 'impressum', 0, '', 'impressum', '-1', '0', '[H1]Impressum[/H1]\r\n\r\n\r\n[P]eWeBuKi - Copyright 2003-2007\r\nby [EMAIL=w.ammon(at)chaos.de]Werner Ammon[/EMAIL][/P]\r\n\r\n\r\n[H2]Weitere Infoseiten:[/H2]\r\n\r\n\r\n[P][LINK=http://www.ewebuki.de/]www.ewebuki.de[/LINK]\r\n[LINK=http://developer.berlios.de/projects/ewebuki/]developer.berlios.de/projects/ewebuki/[/LINK][/P]', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', 'index', 0, '', 'index', '-1', '0', '[H1]Gl�ckwunsch Ihr eWeBuKi l�uft![/H1]\r\n\r\n[P]Um sich am System anzumelden benutzen Sie bitte folgende Daten:\r\n\r\nuser: ewebuki\r\npass: ewebuki[/P]\r\n\r\n[P=box][B]ACHTUNG:[/B] Passwort �ndern nicht vergessen![/P]\r\n\r\n[P]Weitere Infoseiten:\r\n[LINK=http://www.ewebuki.de/]www.ewebuki.de[/LINK]\r\n[LINK=http://developer.berlios.de/projects/ewebuki/]developer.berlios.de/projects/ewebuki/[/LINK][/P]\r\n', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki'),
('de', 'inhalt', 'show', 0, '', 'show', '-1', '0', '[H1]eWeBuKi Show[/H1]\r\n\r\n\r\n[H2]Tabellen Positionen[/H2]\r\n\r\n[TAB=;300;1]\r\n[ROW]\r\n[COL]1,1[/COL]\r\n[COL=;;u]1,2[/COL]\r\n[COL=r]1,3\r\n\r\n\r\n[/COL]\r\n[/ROW][ROW]\r\n[COL=m]2,1[/COL]\r\n[COL=;;g]2,2[/COL]\r\n[COL=r;;m]2,3\r\n\r\n\r\n[/COL]\r\n[/ROW]\r\n[/TAB]\r\n\r\n\r\n[H2]Easy Template Links[/H2]\r\n\r\n[P]!#lnk_1\r\n!#lnk_2\r\n!#lnk_3[/P]\r\n\r\n[H2]Menu oberhalb (M1,mit Bez.)[/H2]\r\n[M1]nach oben[/M1]\r\n\r\n[H2]Menu oberhalb als Liste (M1=l,ohne Bez.)[/H2]\r\n[M1=l][/M1]\r\n\r\n[H2]Menu gleiche Ebene (M2,mit Bez.)[/H2]\r\n[M2]nach oben[/M2]\r\n\r\n[H2]Menu gleiche Ebene als Liste (M2=l,mit Bez.)[/H2]\r\n[M2=l][/M2]\r\n\r\n\r\n\r\n[H2]Tabellen Abst�nde[/H2]\r\n[P]Tabellen Abst�nde (abstand text - tabelle 1)[/P]\r\n\r\n\r\n[TAB=;300;1]\r\n[ROW]\r\n\r\n[COL=l;150]links oben\r\n[/COL]\r\n\r\n[COL=l;150]rechts oben\r\n[/COL]\r\n\r\n[/ROW]\r\n[/TAB]\r\n\r\n[TAB=;300;1]\r\n[ROW]\r\n\r\n[COL=l;150]links oben\r\n[/COL]\r\n\r\n[COL=l;150]rechts oben\r\n[/COL]\r\n\r\n[/ROW]\r\n[/TAB]\r\n\r\n\r\n[P]Tabellen Abst�nde (abstand text - tabelle 2)[/P]\r\n\r\n[IN]I[/IN]nitial fuer Texte\r\n\r\n[H1][B][EM]Bold EM Tag[/EM][/B] im H1 Tag[/H1]\r\n\r\nText zwischen Linien:\r\n[HL][/HL]\r\nHier kommt der Text.\r\n[HL][/HL]\r\n\r\n[H2]Bilder im Text[/H2]\r\n\r\n[P][IMG=/file/picture/small/img_1.png;l;;;20;;20]eWeBuKi Logo[/IMG]Weit hinten, hinter den Wortbergen, fern der L�nder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen Sie in Buchstabhausen an der K�ste des Semantik, eines gro�en Sprachozeans. Ein kleines B�chlein namens Duden flie�t durch ihren Ort und versorgt sie mit den n�tigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allm�chtigen Interpunktion werden die Blindtexte beherrscht - ein geradezu unorthographisches Leben.[/P]\r\n\r\n[H2]Mehrere Bilder rechts[/H2]\r\n\r\n[P]Bei mehreren Bildern rechts gibt es Abstand Probleme. Um das zu umgehen muss der Umlauf mit dem Tag BR=a angehalten werden.[/P]\r\n\r\n[IMGB=/file/picture/small/img_1.png;r;0;b]Logo[/IMGB]Text neben Bild 1[BR=a][/BR]\r\n\r\n[IMGB=/file/picture/small/img_1.png;r]Logo[/IMGB]Text neben Bild 2[BR=a][/BR]\r\n\r\n[P]Nicht nur Bilder sondern auch Text kann mit diesem Trick unter das Bild geschoben werden.[/P]\r\n[H1]ueberschrift h1[/H1]\r\n[H2]ueberschrift h2[/H2]\r\n[H3]ueberschrift h3[/H3]\r\n[H4]ueberschrift h4[/H4]\r\n[H5]ueberschrift h5[/H5]\r\n[H6]ueberschrift h6[/H6]\r\n\r\nAbsaetze mit css einstellen:\r\n[P]Im Absatz ist es Schoen[/P]\r\n\r\nDIV=class jeder css im Content:\r\n[DIV=anderst]Dieser Text ist schoener als der Rest[/DIV]', '1970-01-01 00:00:00', 'Doe', 'John', 'john.doe@ewebuki.de', 'ewebuki');
