<?php
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "$Id$";
// "fileed - add funktion";
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
    eWeBuKi - a easy website building kit
    Copyright (C)2001-2009 Werner Ammon ( wa<at>chaos.de )

    This script is a part of eWeBuKi

    eWeBuKi is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    eWeBuKi is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with eWeBuKi; If you did not, you may download a copy at:

    URL:  http://www.gnu.org/licenses/gpl.txt

    You may also request a copy from:

    Free Software Foundation, Inc.
    59 Temple Place, Suite 330
    Boston, MA 02111-1307
    USA

    You may contact the author/development team at:

    Chaos Networks
    c/o Werner Ammon
    Lerchenstr. 11c

    86343 Koenigsbrunn

    URL: http://www.chaos.de
*/
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    if ( $cfg["fileed"]["right"] == "" || priv_check('', $cfg["fileed"]["right"] ) || ($cfg["auth"]["menu"]["fileed"][2] == -1 &&  priv_check('', $cfg["fileed"]["right"],$specialvars["dyndb"] ) ) ) {

        // auf session losgehen, falls zip bearbeitet wurde
        if ( count($_SESSION["zip_extracted"]) == 0 ) unset($_SESSION["zip_extracted"]);
        if ( is_array($_SESSION["zip_extracted"])  ){
            reset($_SESSION["zip_extracted"]);
            $file_buffer = current($_SESSION["zip_extracted"]);
            $file = $file_buffer["name"];
            while( !file_exists($cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"].$file) ){
                unset($_SESSION["zip_extracted"][$file]);
                $file_buffer = current($_SESSION["zip_extracted"]);
                $file = $file_buffer["name"];
            }
        }
        if ( $file == "" ) {
            $ausgaben["thumbnail"] = thumbnail();
        }

        // keine files in dem new-ordner
        if ( $file == "" ) {
            // falls man von wizard kommt, zurueck dahin
            if ( $_SESSION["wizard_last_edit"] != "" ) {
                $header = $_SESSION["wizard_last_edit"];
                unset($_SESSION["wizard_last_edit"]);
            } else {
                $header = $cfg["fileed"]["basis"]."/list.html";
            }
            unset($_SESSION["zip_extracted"]);
            header("Location: ".$header);
        }

        // page basics
        // ***

        #if ( count($_POST) == 0 ) {
        #} else {
            $form_values = $_POST;
        #}

        // form options holen
        $form_options = form_options(eCRC($environment["ebene"]).".modify");

        // form elememte bauen
        $element = form_elements( $cfg["fileed"]["db"]["file"]["entries"], $form_values );

        // form elemente erweitern
        $element["upload"] = "";
        $element["fid"] = "";
        $file_name = substr($file,strrpos($file,"--") );
        $file_name = str_replace("--","",$file_name);
        $element["ffname"] = str_replace("ffname\"", "ffname\" value=\"".preg_replace("/^".$_SESSION["uid"]."_/","",$file_name)."\"", $element["ffname"]);
        if ( is_array($_SESSION["zip_extracted"]) ){
            $element["fdesc"] = str_replace("></textarea>", "/>".trim($file_buffer["fdesc"])."</textarea>", $element["fdesc"]);
            $element["funder"] = str_replace("value=\"\"", "value=\"".trim($file_buffer["funder"])."\"", $element["funder"]);
            $element["fhit"] = str_replace("value=\"\"", "value=\"".trim($file_buffer["compilation"]." ".$file_buffer["fhit"])."\"", $element["fhit"]);
            if ( $_POST["fhit"] == "" ) {
                $form_values["fhit"] = trim($file_buffer["compilation"]." ".$file_buffer["fhit"]);
            }
        }

        $hidedata[$environment["kategorie"]] = array();

        // dummy-fhit-feld
        // * * * * *
        // fhit aufsplitten
        $block_elements = array();
        if ( is_array($cfg["fileed"]["dummy_regex"]) ) {
            foreach ( $cfg["fileed"]["dummy_regex"] as $pattern ) {
                preg_match_all("/".$pattern."/Ui",$form_values["fhit"],$match);
                $block_elements = array_merge($block_elements,$match[0]);
            }
        }
        $fhit_dummy = trim(str_replace($block_elements,"",$form_values["fhit"]));
        $fhit_delicate = trim(implode(" ",$block_elements));
        if ( $rechte[$cfg["fileed"]["no_dummy"]] != -1 && $cfg["fileed"]["no_dummy"] != "" ) {
            $fhit_dummy = $form_values["fhit"];
            if ( isset($_POST["fhit_dummy"]) ) {
                $fhit_dummy = $_POST["fhit_dummy"];
            }
            // fhit_dummy von "verbotenen" eingaben bereinigen
            if ( is_array($cfg["fileed"]["dummy_regex"]) ) {
                foreach ( $cfg["fileed"]["dummy_regex"] as $pattern ) {
                    preg_match_all("/".$pattern."/Ui",$fhit_dummy,$match);
                    $fhit_dummy = str_replace($match[0],"",$fhit_dummy);
                }
            }
            $hidedata["fhit_dummy"]["value"] = $fhit_dummy;
        } else {
            $hidedata["fhit_admin"]["value"] = $form_values["fhit"];
        }
        // dummy-fhit-feld
        // + + + + +

        // +++
        // page basics

        preg_match("/(.*)\.([a-zA-z]{1,4})/i",$file,$match);
        // thumbnail wird vorlaeufig gebaut
        $thumb_srv = $cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"]."tmp".$match[1]."_preview.".$match[2];
        $thumb_web = $cfg["file"]["base"]["webdir"].$cfg["file"]["base"]["new"]."tmp".$match[1]."_preview.".$match[2];
        if ( !file_exists($thumb_srv) ) {
            $type = $cfg["file"]["filetyp"][$match[2]];
            if ( $type == "img" ) {
                switch ( strtolower($match[2]) ) {
                    case "gif":
                        $img_src = @imagecreatefromgif($cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"].$file);
                        break;
                    case "jpg":case "jpeg":
                        $img_src = @imagecreatefromjpeg($cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"].$file);
                        break;
                    case "png":
                        $img_src = @imagecreatefrompng($cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"].$file);
                        break;
                    default:
                        die("config error. can't handle ".$match[2]." file");
                }
                resize( $cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"].$file,
                        "preview",
                        $img_src,
                        $cfg["file"]["size"][$cfg["file"]["fileopt"]["preview_size"]],
                        preg_replace("/\/$/i","",$cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"]),
                        "tmp".$match[1]
                );
            } else {
                $thumb_web = $cfg["fileed"]["iconpath"].$cfg["file"]["fileopt"][$type]["thumbnail"];
            }
        }
        $ausgaben["thumbnail"] = $thumb_web;
        $hidedata["preview_def"]["file"] = $thumb_web;

        // falls zip wird der inhalt gebaut
        if ( $match[2] == "zip" && function_exists("zip_open") ) {
            $dataloop["zip"] = zip_handling($cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"].$file);
            if ( count($dataloop["zip"]) > 0 ){
                $hidedata["zip"][] = -1;
            }
        }

        // funktions bereich fuer erweiterungen
        // ***

        ### put your code here ###

        // +++
        // funktions bereich fuer erweiterungen


        // page basics
        // ***

        // fehlermeldungen
        $ausgaben["form_error"] = "";

        // navigation erstellen
        $ausgaben["form_aktion"] = $cfg["fileed"]["basis"]."/add,".$environment["parameter"][1].",".$environment["parameter"][2].",verify.html";
        $ausgaben["form_break"] = $cfg["fileed"]["basis"]."/list.html";
        if ( $_SESSION["wizard_last_edit"] != "" ) $ausgaben["form_break"] = $_SESSION["wizard_last_edit"];

        // hidden values
        $ausgaben["form_hidden"] .= "";

        // was anzeigen
        $mapping["main"] = eCRC($environment["ebene"]).".modify";
        #$mapping["navi"] = "leer";
        if ( $environment["parameter"][2] == "extract" && is_array($hidedata["zip"]) ) {
            $ausgaben["style_file_edit"]    = "display:none;";
            $ausgaben["style_extract_edit"] = "display:block;";
        } else {
            $ausgaben["style_file_edit"]    = "display:block;";
            $ausgaben["style_extract_edit"] = "display:none;";
        }

        // unzugaengliche #(marken) sichtbar machen
        if ( isset($_GET["edit"]) ) {
            $ausgaben["inaccessible"] = "inaccessible values:<br />";
            $ausgaben["inaccessible"] .= "# (error_result) #(error_result)<br />";
            $ausgaben["inaccessible"] .= "# (error_dupe) #(error_dupe)<br />";
        } else {
            $ausgaben["inaccessible"] = "";
        }

        // wohin schicken

        // +++
        // page basics
        if ( $_POST["continue"] != "" ) {
            unlink( $cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"].$file );
            if ( file_exists($thumb_srv) ) unlink( $thumb_srv );
            header("Location: ".$cfg["fileed"]["basis"]."/add.html");
            exit;
        }

        // beim abbrechen werden alle eigenen dateien aus new-ordner geloescht
        if ( $_POST["abort"] != "" ) {
            $header = $ausgaben["form_break"];
            $dp = opendir($cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"]);
            while ( $file = readdir($dp) ) {
                $info  = explode( "_", $file, 2 );
                if ( $info[0] == $_SESSION["uid"] ) {
                    unlink($cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"].$file);
                }
            }
            header("Location: ".$header);
        }

        if ( ( $environment["parameter"][3] == "verify"
                 &&  ( $_POST["send"] != ""
                    || $_POST["extract"] != ""
                    || $_POST["extension2"] != "" )
             ) || $file_buffer["wave_thru"] == -1 ) {

            // form eigaben pruefen
            form_errors( $form_options, $_POST );

            // funktions bereich fuer erweiterungen
            // ***

            if ( $_POST["extract"] != "" ){
                // naechste freie compilation-id suchen
                if ( $_POST["selection"] == -1 ){
                    $buffer = compilation_list();
                    reset($buffer);
                    $compid = key($buffer) + 1;
                } else {
                    $compid = "";
                }
                // zip auspacken
                $not_extracted = zip_handling($cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"].$file,
                                                $cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"],
                                                $cfg["file"]["filetyp"],
                                                $cfg["file"]["filesize"],
                                                "",
                                                $compid,
                                                $cfg["fileed"]["zip_handling"]["sektions"]
                );
                if ( count($not_extracted) > 0 ) {
                    $buffer = array();
                    foreach ( $not_extracted as $value ){
                        $buffer[] = $value["name"];
                    }
                    $ausgaben["form_error"] .= "#(not_compl_extracted)".implode(", ",$buffer);
                } else {
                    // falls man von wizard kommt, wird die compilation gleich ausgewaehlt
                    if ( $_SESSION["wizard_last_edit"] != "" ) {
                        unset($_SESSION["file_memo"]);
                        unset($_SESSION["compilation_memo"]);
                        $_SESSION["compilation_memo"][$compid] = array();
                    }
                    unlink( $cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"].$file );
                    header("Location: ".$cfg["fileed"]["basis"]."/add.html");
                    exit;
                }
            }

            if ( $file_buffer["wave_thru"] == -1 ) {
                $_POST["ffname"] = str_replace($_SESSION["uid"]."_","",$file_buffer["name"]);
                $_POST["funder"] = $file_buffer["funder"];
                    $_POST["fdesc"] = $file_buffer["fdesc"];
                    $_POST["fhit"] = $file_buffer["fhit"];
            }

            if ( $error ) $ausgaben["form_error"] .= $db -> error("#(error_result)<br />");
            // +++
            // funktions bereich fuer erweiterungen

            // datensatz anlegen
            if ( $ausgaben["form_error"] == ""  ) {
                // ggf versteckte fhit-eingtraege wieder anhaengen
                if ( $rechte[$cfg["fileed"]["no_dummy"]] != -1 ) {
                    // dummy wird ergaenzt
                    $fhit = $fhit_delicate." ".trim($fhit_dummy);
                    $_POST["fhit"] = trim($fhit);
                }

                $kick = array( "PHPSESSID", "form_referer", "send", "image", "image_x", "image_y", "extract", "selection", "bnet", "cnet", "fdesc", "fhit_dummy", "zip_fdesc", "zip_fhit", "zip_funder" );
                foreach($_POST as $name => $value) {
                    if ( !in_array($name,$kick) ) {
                        if ( $sqla != "" ) $sqla .= ",";
                        $sqla .= " ".$name;
                        if ( $sqlb != "" ) $sqlb .= ",";
                        $sqlb .= " '".$value."'";
                    }
                }

                // Sql um spezielle Felder erweitern
                #$sqla .= ", pass";
                #$sqlb .= ", password('".$checked_password."')";
                $sqla .= ", ffart";
                $sqlb .= ", '".strtolower(substr(strrchr($file,"."),1))."'";
                $sqla .= ", fuid";
                $sqlb .= ", '".$_SESSION["uid"]."'";
                $sqla .= ", fdid";
                $sqlb .= ", '".$_SESSION["custom"]."'";
                if ( trim($_POST["fdesc"]) == "" ) {
                    $sqla .= ", fdesc";
                    $sqlb .= ", '".$_POST["funder"]."'";
                } else {
                    $sqla .= ", fdesc";
                    $sqlb .= ", '".$_POST["fdesc"]."'";
                }


                $sql = "INSERT INTO ".$cfg["fileed"]["db"]["file"]["entries"]." (".$sqla.") VALUES (".$sqlb.")";
                if ( $debugging["sql_enable"] ) $debugging["ausgabe"] .= "sql: ".$sql.$debugging["char"];
                $result  = $db -> query($sql);
                #if ( !$result ) $ausgaben["form_error"] .= $db -> error("#(error_result)<br />");
                if ( $result ) {
                    $file_id = $db->lastid();
                    $source = $cfg["file"]["base"]["maindir"].$cfg["file"]["base"]["new"].$file;
                    arrange( $file_id, $source, $file );
                    if ( file_exists($thumb_srv) ) unlink( $thumb_srv );
                    unset($_SESSION["zip_extracted"][$file]);

                    // falls man von wizard kommt, wird das bild gleich ausgewaehlt
                    if ( $_SESSION["wizard_last_edit"] != "" ) {
                        unset($_SESSION["file_memo"]);
                        $_SESSION["file_memo"][$file_id] = $file_id;
                    }
                } else {
                    $ausgaben["form_error"] .= $db -> error("#(error_result)<br />");
                }
                if ( $header == "" ) $header = $cfg["fileed"]["basis"]."/add.html";
            }

            // wenn es keine fehlermeldungen gab, die uri $header laden
            if ( $ausgaben["form_error"] == "" ) {
                header("Location: ".$header);
            }
        }
    } else {
        header("Location: ".$pathvars["virtual"]."/");
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
?>
