-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 28. Juli 2007 um 13:51
-- Server Version: 4.0.24
-- PHP-Version: 4.3.10-22

--
-- Datenbank: `ewebuki_mdelabl`
--

--
-- Daten f�r Tabelle `site_text`
--

REPLACE INTO `site_text` (`lang`, `label`, `crc32`, `tname`, `ebene`, `kategorie`, `html`, `content`, `changed`, `bysurname`, `byforename`, `byemail`, `byalias`) VALUES
('de', 'abort', '-1', '-555504947.delete', '/admin/menued', 'delete', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'content', '-1', '-555504947.delete', '/admin/menued', 'delete', '0', 'Inhalt', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'entry', '-1', '-555504947.delete', '/admin/menued', 'delete', '0', 'Eintrag', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_menu', '-1', '-555504947.delete', '/admin/menued', 'delete', '0', 'Fehler beim l�schen des Men�eintrag', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_menu_lang', '-1', '-555504947.delete', '/admin/menued', 'delete', '0', 'Fehler beim l�schen der Sprache(n)', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_text', '-1', '-555504947.delete', '/admin/menued', 'delete', '0', 'Fehler beim l�schen des/r Text/e', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'inhalt', '-1', '-555504947.delete', '/admin/menued', 'delete', '0', 'Den Men�punkt "!#ausgaben_entry" wirklich l�schen?', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'languages', '-1', '-555504947.delete', '/admin/menued', 'delete', '0', 'Sprachen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'no_content', '-1', '-555504947.delete', '/admin/menued', 'delete', '0', 'Kein Inhalt', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'send', '-1', '-555504947.delete', '/admin/menued', 'delete', '0', 'Abschicken', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-555504947.delete', '/admin/menued', 'delete', '0', 'Men�-Editor - Men�punkt l�schen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'add', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Neue Sprache hinzuf�gen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'basic', '-1', '-555504947.edit-multi', '/admin/menued', 'add', '0', 'Allgemein', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'delete', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Diese Sprache l�schen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'entry', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Eintrag', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_lang_add', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Diese Sprache ist bereits vorhanden.', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_lang_delete', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Die Entwickler Sprache kann nicht gel�scht werden.', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_result', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'DB Fehler: ', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'extended', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Speziell', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'exturl', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'externe Url', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'hide', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Deaktiviert', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'label', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Bezeichnung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'lang', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Sprache', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'language', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Sprachen Verwaltung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'level', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'ben�tigter Level', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'madatory', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Erzwungen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'new_lang', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Neue Sprache', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'refid', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Ref. ID', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'reset', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Zur�cksetzen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'send', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Abschicken', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'sort', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Sortierung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'template', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Template', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Men�-Editor - Men�punkt', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', '-555504947.edit-single', '/admin/menued', 'edit', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'add', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Neue Sprache hinzuf�gen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'basic', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Allgemein', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'entry', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Eintrag', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_lang_add', '-1', '-555504947.edit-single', '/admin/menued', 'edit', '0', 'Diese Sprache ist bereits vorhanden.', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_lang_delete', '-1', '-555504947.edit-single', '/admin/menued', 'edit', '0', 'Die Entwickler Sprache kann nicht gel�scht werden.', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_result', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'DB Fehler: ', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'extended', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Speziell', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'exturl', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'ext. Url', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'hide', '-1', '-555504947.edit-single', '/admin/menued', 'edit', '0', 'Versteckt', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'label', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Bezeichnung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'lang', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Sprache', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'level', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'ben�tigter Level', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'madatory', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Erzwungen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'new_lang', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Neue Sprache', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'refid', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Ref ID.', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'reset', '-1', '-555504947.edit-single', '/admin/menued', 'edit', '0', 'Zur�cksetzen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'send', '-1', '-555504947.edit-single', '/admin/menued', 'edit', '0', 'Abschicken', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'sort', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Sortierung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'template', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Template', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-555504947.edit-single', '/admin/menued', 'edit', '0', 'Men�-Editor - Men�punkt bearbeiten', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'button_desc_add', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'Unterpunkt hinzuf�gen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'button_desc_delete', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'L�schen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'button_desc_down', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'Sortierung - Nach unten', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'button_desc_edit', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'Bearbeiten', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'button_desc_move', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'Im Men� Baum verschieben', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'button_desc_up', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'Sortierung - Nach oben', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'disabled', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'Abgeschaltet', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'enabled', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'Eingeschaltet', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error1', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'Men�punkte mit Unterpunkten lassen sich nicht l�schen.', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'extern', '-1', '-555504947.list', '/admin/menued', 'list', '0', '(extern)', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'new', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'Neuer Ast', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'renumber', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'Neu durchnummerieren', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-555504947.list', '/admin/menued', 'list', '0', 'Menu-Editor - �bersicht', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', '-555504947.move', '/admin/menued', 'move', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'entry', '-1', '-555504947.move', '/admin/menued', 'move', '0', 'Eintrag', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'extern', '-1', '-555504947.move', '/admin/menued', 'move', '0', '(extern)', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'reset', '-1', '-555504947.move', '/admin/menued', 'move', '0', 'Zur�cksetzen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'root', '-1', '-555504947.move', '/admin/menued', 'move', '0', 'Ins Hauptmen�', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'send', '-1', '-555504947.move', '/admin/menued', 'move', '0', 'Abschicken', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-555504947.move', '/admin/menued', 'move', '0', 'Men�-Editor - Men�punkt verschieben', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'send', '-1', '852881080.modify', '/admin/passed', 'modify', '0', 'Abschicken', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'chkpass', '-1', '852881080.modify', '/admin/passed', 'modify', '0', 'Wiederholung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'inhalt', '-1', '852881080.modify', '/admin/passed', 'modify', '0', 'Passwort �ndern', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'newpass', '-1', '852881080.modify', '/admin/passed', 'modify', '0', 'Neues', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'oldpass', '-1', '852881080.modify', '/admin/passed', 'modify', '0', 'Altes', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '852881080.modify', '/admin/passed', 'modify', '0', 'Passwort Editor', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', 'auth', '', 'index', '0', '�berschrift', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'desc', '-1', 'auth.logout', '', 'index', '0', 'Werkzeuge', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'fileed', '-1', 'auth.logout', '', 'index', '0', 'Datei-Editor', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'leveled', '-1', 'auth.logout', '', 'index', '0', 'Level-Editor', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'menued', '-1', 'auth.logout', '', 'index', '0', 'Men�-Editor', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'nachher', '-1', 'auth.logout', '', 'index', '0', 'ist angemeldet.', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'passed', '-1', 'auth.logout', '', 'index', '0', 'Passwort-Editor', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'usered', '-1', 'auth.logout', '', 'index', '0', 'User-Editor', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'vorher', '-1', 'auth.logout', '', 'index', '0', 'Benutzer', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'add', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Datei einf�gen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'b', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Fett', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'big', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Gr�sser als der Rest', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'br', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Erzwungener Umbruch', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'cent', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Zentriert', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'center', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Zentriert', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'cite', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Logisch: cite', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'col', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Tabellenspalte', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'db', '-1', 'cms.edit.cmstag', '', 'index', '0', 'DB', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'div', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Bereich', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'e', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Mail', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'em', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Logisch: emphatisch', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'email', '-1', 'cms.edit.cmstag', '', 'index', '0', 'eMail Link', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'file', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Datei', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'files', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Dateien', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'h1', '-1', 'cms.edit.cmstag', '', 'index', '0', '�berschrift Klasse 1', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'h2', '-1', 'cms.edit.cmstag', '', 'index', '0', '�berschrift Klasse 2', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'hl', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Spezielle Trennlinie', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'hr', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Trennlinie', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'i', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Kursiv', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'img', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Bild', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'imgb', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Bild mit Rahmen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'in', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Initial', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'label', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Marke', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'language', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Sprache', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'link', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Link', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'list', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Liste', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'm1', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Men� dieser Ebene', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'm2', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Men� der Unterebene', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'pre', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Vorformatiert', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'quote', '-1', 'cms.edit.cmstag', '', 'index', '0', 'In Anf�hrungszeichen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'row', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Tabellenzeile', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 's', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Durchgestrichen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'save', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Speichern', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'small', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Kleiner als der Rest', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'sp', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Gesch�tztes Leerzeichen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'strong', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Logisch: strong', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'sub', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Tiefgestellt', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'sup', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Hochgestellt', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'tab', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Tabelle', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'tagselect', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Tag ausw�hlen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'template', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Template', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'tt', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Dickengleich', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'u', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Unterstrichen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'up', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Zur�ck-Link', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'upload', '-1', 'cms.edit.cmstag', '', 'index', '0', 'Hinaufladen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'inhalt', '-1', '404', '', 'fehlt', '0', '[H1]Fehler 404 - Nicht gefunden.[/H1]\r\n\r\n[P]Die Uri !#ausgaben_404seite wurde nicht gefunden.\r\n\r\nLeider konnte das System nicht feststellen woher sie gekommen sind[/P].', '2007-07-28 13:22:15', 'Ammon', 'Werner', 'chaot@chaos.de', 'chaot'),
('de', 'error_dupe', '-1', '-555504947.edit-single', '/admin/menued', 'add', '0', 'Der Eintrag ist bereits vorhanden.', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'inhalt', '-1', '404referer', '', 'fehlt', '0', '[H1]Fehler 404 - Nicht gefunden.[/H1]\r\n\r\n[P]Die Uri: !#ausgaben_404seite wurde nicht gefunden.\r\n\r\nDie [LINK=!#ausgaben_404referer]Seite[/LINK] enthaelt einen falschen/alten Link.[/P]', '2007-07-28 13:21:52', 'Ammon', 'Werner', 'chaot@chaos.de', 'chaot'),
('de', 'error_dupe', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'Der Eintrag ist bereits vorhanden.', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_dupe', '-1', '-555504947.move', '/admin/menued', 'move', '0', 'In dieser Ebene existiert bereits ein Eintrag mit gleichem Namen.', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'logout', '-1', 'auth.login', '', 'auth.login', '0', 'Abgemeldet', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'denied', '-1', 'auth.login', '', 'auth.login', '0', 'Zugriff verweigert!', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'picture', '-1', '-555504947.edit-multi', '/admin/menued', 'edit', '0', 'evt. Bild', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'picture', '-1', '-555504947.edit-single', '/admin/menued', 'edit', '0', 'evt. Bild', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'reset', '-1', '852881080.modify', '/admin/passed', 'modify', '0', 'Zur�cksetzen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', '852881080.modify', '/admin/passed', 'modify', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-840786483.list', '/admin/menued', 'list', '0', 'Level-Editor - �bersicht', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-840786483.modify', '/admin/menued', 'edit', '0', 'Level-Editor - Bearbeiten', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'level', '-1', '-840786483.modify', '/admin/leveled', 'modify', '0', 'Bezeichnung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'description', '-1', '-840786483.modify', '/admin/leveled', 'modify', '0', 'Beschreibung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'del', '-1', '-840786483.modify', '/admin/leveled', 'modify', '0', 'entfernen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'add', '-1', '-840786483.modify', '/admin/leveled', 'modify', '0', 'hinzuf�gen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'send', '-1', '-840786483.modify', '/admin/leveled', 'modify', '0', 'Abschicken', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'reset', '-1', '-840786483.modify', '/admin/leveled', 'modify', '0', 'Zur�cksetzen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', '-840786483.modify', '/admin/leveled', 'modify', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'send', '-1', '-840786483.delete', '/admin/leveled', 'modify', '0', 'L�schen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', '-840786483.delete', '/admin/leveled', 'modify', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'frage', '-1', '-840786483.delete', '/admin/leveled', 'modify', '0', 'Wollen Sie den Level "!#ausgaben_level" wirklich l�schen?', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'level', '-1', '-840786483.details', '/admin/leveled', 'details', '0', 'Bezeichnung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'user', '-1', '-840786483.details', '/admin/leveled', 'details', '0', 'Mitglieder', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'beschreibung', '-1', '-840786483.details', '/admin/leveled', 'details', '0', 'Beschreibung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'edit', '-1', '-840786483.details', '/admin/leveled', 'details', '0', 'Bearbeiten', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'list', '-1', '-840786483.details', '/admin/leveled', 'details', '0', '�bersicht', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-840786483.details', '/admin/leveled', 'details', '0', 'Level Editor - Eigenschaften', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-840786483.delete', '/admin/leveled', 'modify', '0', 'Level-Editor - L�schen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '210295197.list', '/admin/usered', 'list', '0', 'User-Editor - �bersicht', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'Datei-Editor - �bersicht', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'search', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'Suche', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'gesamt', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'Gesamt:', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'send', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'Go', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'fileedit', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'Bearbeiten', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'filedelete', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'L�schen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ffname', '-1', '-939795212.modify', '/admin', 'usered', '0', 'Dateiname', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'fdesc', '-1', '-939795212.modify', '/admin', 'usered', '0', 'Bildbeschreibung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'funder', '-1', '-939795212.modify', '/admin', 'usered', '0', 'Bildunterschrift', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'fhit', '-1', '-939795212.modify', '/admin', 'usered', '0', 'Schlagworte', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'upa', '-1', '-939795212.modify', '/admin', 'usered', '0', 'Die aktuelle Datei durch', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'upb', '-1', '-939795212.modify', '/admin', 'usered', '0', 'ersetzen.', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'send', '-1', '-939795212.modify', '/admin', 'usered', '0', 'Abschicken', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'reset', '-1', '-939795212.modify', '/admin', 'usered', '0', 'Zur�cksetzen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', '-939795212.modify', '/admin', 'usered', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'cmslink', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'zum Content Editor', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'level', '-1', '-840786483.list', '/admin/leveled', 'list', '0', 'Bezeichnung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'beschreibung', '-1', '-840786483.list', '/admin/leveled', 'list', '0', 'Beschreibung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'modify', '-1', '-840786483.list', '/admin/leveled', 'list', '0', 'Bearbeiten', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'edit', '-1', '-840786483.list', '/admin/leveled', 'list', '0', 'Bearbeiten', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'delete', '-1', '-840786483.list', '/admin/leveled', 'list', '0', 'L�schen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'details', '-1', '-840786483.list', '/admin/leveled', 'list', '0', 'Eigenschaften', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'senden', '-1', '210295197.modify', '/admin/usered', 'modify', '0', 'Abschicken', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'reset', '-1', '210295197.modify', '/admin/usered', 'modify', '0', 'Zur�cksetzen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', '210295197.modify', '/admin/usered', 'modify', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '210295197.modify', '/admin/usered', 'modify', '0', 'User-Editor - Bearbeiten', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_oldpass', '-1', '852881080.modify', '/admin/passed', 'modify', '0', 'Das alte Passwort stimmt nicht!', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'error_chkpass', '-1', '852881080.modify', '/admin/passed', 'modify', '0', 'Das Neue Passwort und die Wiederholung stimmen nicht �berein!', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'nachname', '-1', '210295197.modify', '/admin/usered', 'modify', '0', 'Nachname', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'vorname', '-1', '210295197.modify', '/admin/usered', 'modify', '0', 'Vorname', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'email', '-1', '210295197.modify', '/admin/usered', 'modify', '0', 'eMail', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'new', '-1', '-840786483.list', '/admin/leveled', 'list', '0', 'Neuer Level', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'new', '-1', '210295197.list', '/admin/usered', 'list', '0', 'Neuer User', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'frage', '-1', '210295197.delete', '/admin/usered', 'modify', '0', 'Wollen Sie den User "!#ausgaben_username" wirklich l�schen?', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'delete', '-1', '210295197.delete', '/admin/usered', 'modify', '0', 'Delete', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', '210295197.delete', '/admin/usered', 'modify', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '210295197.delete', '/admin/usered', 'modify', '0', 'User-Editor - L�schen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '210295197.details', '/admin/usered', 'details', '0', 'User-Editor - Eigenschaften', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'username', '-1', '210295197.modify', '/admin/usered', 'modify', '0', 'Login', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'newpass', '-1', '210295197.modify', '/admin/usered', 'modify', '0', 'Passwort', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'chkpass', '-1', '210295197.modify', '/admin/usered', 'modify', '0', 'Wiederholung', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', 'base', '', 'impressum', '0', 'Menu', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'copyright', '-1', 'base', '', 'index', '0', 'eWeBuKi - Copyright 2003-2006', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'kekse', '-1', 'base', '', 'impressum', '0', 'Kekse', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'bloged', '-1', 'auth.logout', '/admin/passed', 'modify', '0', 'Blog-Editor', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'send', '-1', '-939795212.delete', '/admin/menued', 'list', '0', 'Abschicken', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', '-939795212.delete', '/admin/menued', 'list', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-939795212.delete', '/admin/menued', 'delete', '0', 'Datei Editor - Datei l�schen!', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'inhalt', '-1', '-939795212.delete', '/admin/menued', 'delete', '0', 'Die Datei "!#ausgaben_ffname" wirklich l�schen?', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-939795212.upload', '/admin/menued', 'list', '0', 'Datei-Editor Upload', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'file', '-1', '-939795212.upload', '/admin/menued', 'list', '0', 'Dateiauswahl', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'send', '-1', '-939795212.upload', '/admin/menued', 'list', '0', 'Abschicken', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'reset', '-1', '-939795212.upload', '/admin/menued', 'edit', '0', 'Zur�cksetzen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'abort', '-1', '-939795212.upload', '/admin/menued', 'edit', '0', 'Abbrechen', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'ueberschrift', '-1', '-939795212.modify', '/admin/menued', 'add', '0', 'Datei-Editor - Datei Eigenschaften bearbeiten', '0000-00-00 00:00:00', '', '', '', 'ewebuki'),
('de', 'answera', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'Ihre Schnellsuche nach', '2006-09-26 12:18:44', '', '', '', 'ewebuki'),
('de', 'answerb', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'hat', '2006-09-26 12:18:58', '', '', '', 'ewebuki'),
('de', 'answerc_no', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'keine Eintr�ge gefunden.', '2006-09-26 12:19:42', '', '', '', 'ewebuki'),
('de', 'answerc_yes', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'folgende Eintr�ge gefunden.', '2006-09-26 12:20:01', '', '', '', 'ewebuki'),
('de', 'next', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'Vorherige Seite', '2006-09-26 12:22:25', '', '', '', 'ewebuki'),
('de', 'prev', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'Nexte Seite', '2006-09-26 12:22:35', '', '', '', 'ewebuki'),
('de', 'error1', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'Bild wird bereits verwendet - Bearbeiten zeigt wo.', '2006-10-06 20:07:05', '', '', '', 'ewebuki'),
('de', 'error2', '-1', '-939795212.list', '/admin/fileed', 'list', '0', 'Bild kann nur vom Eigent�mer gel�scht werden.', '2006-10-06 20:22:05', '', '', '', 'ewebuki'),
('de', 'error_edit', '-1', '-939795212.modify', '/admin/fileed', 'edit', '0', 'Bild kann nur vom Eigent�mer bearbeitet werden.', '2006-10-06 20:44:19', '', '', '', 'ewebuki'),
('de', 'references', '-1', '-939795212.modify', '/admin/fileed', 'edit', '0', 'Ist enthalten in:', '2006-10-06 19:59:07', '', '', '', 'ewebuki');
