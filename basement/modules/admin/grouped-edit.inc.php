<?php
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "$Id$";
// "grouped edit funktion";
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
    eWeBuKi - a easy website building kit
    Copyright (C)2001-2006 Werner Ammon ( wa<at>chaos.de )

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

    86343 K�nigsbrunn

    URL: http://www.chaos.de
*/
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    if ( priv_check("/".$cfg["grouped"]["subdir"]."/".$cfg["grouped"]["name"],$cfg["grouped"]["right"]) ||
        priv_check_old("",$cfg["grouped"]["right"]) ) {

        $hidedata["edit"]["ii"] = "on";

        // page basics
        // ***

        if ( count($HTTP_POST_VARS) == 0 ) {
            $sql = "SELECT *
                      FROM ".$cfg["grouped"]["db"]["group"]["entries"]."
                     WHERE ".$cfg["grouped"]["db"]["group"]["key"]."='".$environment["parameter"][1]."'";
            if ( $debugging["sql_enable"] ) $debugging["ausgabe"] .= "sql: ".$sql.$debugging["char"];
            $result = $db -> query($sql);
            $form_values = $db -> fetch_array($result,1);
        } else {
            $form_values = $HTTP_POST_VARS;
        }

        // form options holen
        $form_options = form_options(crc32($environment["ebene"]).".".$environment["kategorie"]);

        // form elememte bauen
        $element = form_elements( $cfg["grouped"]["db"]["group"]["entries"], $form_values );

        // form elemente erweitern
        $element["extension1"] = "<input name=\"extension1\" type=\"text\" maxlength=\"5\" size=\"5\">";
        $element["extension2"] = "<input name=\"extension2\" type=\"text\" maxlength=\"5\" size=\"5\">";

        // +++
        // page basics


        // funktions bereich fuer erweiterungen
        // ***

        # nice sql query tnx@bastard!
        $sql = "SELECT auth_user.uid, auth_user.username, auth_member.gid FROM auth_user LEFT JOIN auth_member ON (auth_user.uid = auth_member.uid and auth_member.gid = ".$environment["parameter"][1].") ORDER by username";
        $result = $db -> query($sql);

        while ( $all = $db -> fetch_array($result,1) ) {

            if ( $all["gid"] == $environment["parameter"][1] ) {
                $dataloop["actual"][] = array(
                                            "value" => $all["uid"],
                                            "username" => $all["username"]
                                        );
            } else {
                $dataloop["avail"][] = array(
                                            "value" => $all["uid"],
                                            "username" => $all["username"]
                                        );
            }
        }

        // +++
        // funktions bereich fuer erweiterungen

        // page basics
        // ***

        // fehlermeldungen
        $ausgaben["form_error"] = "";

        // navigation erstellen
        $ausgaben["form_aktion"] = $cfg["grouped"]["basis"]."/edit,".$environment["parameter"][1].",verify.html";
        $ausgaben["form_break"] = $cfg["grouped"]["basis"]."/list.html";

        // hidden values
        $ausgaben["form_hidden"] .= "";

        // was anzeigen
        $mapping["main"] = crc32($environment["ebene"]).".modify";
        #$mapping["navi"] = "leer";

        // unzugaengliche #(marken) sichtbar machen
        if ( isset($HTTP_GET_VARS["edit"]) ) {
            $ausgaben["inaccessible"] = "inaccessible values:<br />";
            $ausgaben["inaccessible"] .= "# (error_result) #(error_result)<br />";
            $ausgaben["inaccessible"] .= "# (error_dupe) #(error_dupe)<br />";
        } else {
            $ausgaben["inaccessible"] = "";
        }

        // wohin schicken
        #n/a

        // +++
        // page basics

        if ( $environment["parameter"][2] == "verify"
            &&  ( $HTTP_POST_VARS["send"] != ""
                || $HTTP_POST_VARS["avail"] != ""
                || $HTTP_POST_VARS["actual"] != "" ) ) {

            // form eingaben pr�fen
            form_errors( $form_options, $HTTP_POST_VARS );

            // gibt es diesen gruppe bereits?
            $sql = "SELECT ".$cfg["grouped"]["db"]["group"]["order"].",gid
                        FROM ".$cfg["grouped"]["db"]["group"]["entries"]."
                       WHERE ".$cfg["grouped"]["db"]["group"]["order"]." = '".$HTTP_POST_VARS[$cfg["grouped"]["db"]["group"]["order"]]."'";
            $result  = $db -> query($sql);
            $num_rows = 0;
            while ( $array = $db -> fetch_array($result,1) ) {;
                if ( $array["gid"] != $environment["parameter"][1] ) {
                    $num_rows++;
                }
            }

            if ( $num_rows >= 1 ) $ausgaben["form_error"] = "#(error_dupe)";

            // evtl. zusaetzliche datensatz aendern
            if ( $ausgaben["form_error"] == ""  ) {

                // funktions bereich fuer erweiterungen
                // ***

                // user hinzufuegen
                if ( $HTTP_POST_VARS["add"] ) {
                    foreach ($HTTP_POST_VARS["avail"] as $name => $value ) {
                        $sql = "INSERT INTO ".$cfg["grouped"]["db"]["member"]["entries"]."
                                            (".$cfg["grouped"]["db"]["member"]["group"].",".$cfg["grouped"]["db"]["member"]["user"].")
                                     VALUES ('".$environment["parameter"][1]."','".$value."')";
                        if ( $debugging["sql_enable"] ) $debugging["ausgabe"] .= "sql: ".$sql.$debugging["char"];
                        $result = $db -> query($sql);
                        if ( !$result ) $ausgaben["form_error"] .= $db -> error("#(error_result)<br />");
                    }
                    $header = $cfg["grouped"]["basis"]."/edit,".$environment["parameter"][1].",verify.html";
                }

                // user entfernen
                if ( $HTTP_POST_VARS["del"] ) {
                    foreach ($HTTP_POST_VARS["actual"] as $name => $value ) {
                        $sql = "DELETE FROM ".$cfg["grouped"]["db"]["member"]["entries"]."
                                      WHERE ".$cfg["grouped"]["db"]["member"]["user"]."='".$value."' AND ".$cfg["grouped"]["db"]["member"]["group"]."='".$environment["parameter"][1]."'";
                        if ( $debugging["sql_enable"] ) $debugging["ausgabe"] .= "sql: ".$sql.$debugging["char"];
                        $result = $db -> query($sql);
                        if ( !$result ) $ausgaben["form_error"] .= $db -> error("#(error_result)<br />");
                    }
                    $header = $cfg["grouped"]["basis"]."/edit,".$environment["parameter"][1].",verify.html";
                }

                if ( $error ) $ausgaben["form_error"] .= $db -> error("#(error_result)<br />");
                // +++
                // funktions bereich fuer erweiterungen
            }

            // datensatz aendern
            if ( $ausgaben["form_error"] == ""  ) {

                $kick = array( "PHPSESSID", "form_referer", "send", "actual", "avail" );
                foreach($HTTP_POST_VARS as $name => $value) {
                    if ( !in_array($name,$kick) && !strstr($name, ")" ) ) {
                        if ( $sqla != "" ) $sqla .= ", ";
                        $sqla .= $name."='".$value."'";
                    }
                }

                // Sql um spezielle Felder erweitern
                #$ldate = $HTTP_POST_VARS["ldate"];
                #$ldate = substr($ldate,6,4)."-".substr($ldate,3,2)."-".substr($ldate,0,2)." ".substr($ldate,11,9);
                #$sqla .= ", ldate='".$ldate."'";

                // gruppe aendern
                $sql = "UPDATE ".$cfg["grouped"]["db"]["group"]["entries"]."
                            SET ".$cfg["grouped"]["db"]["group"]["order"]." = '".$HTTP_POST_VARS[$cfg["grouped"]["db"]["group"]["order"]]."',
                                beschreibung = '".$HTTP_POST_VARS["beschreibung"]."'
                            WHERE gid='".$environment["parameter"][1]."'";
                if ( $debugging["sql_enable"] ) $debugging["ausgabe"] .= "sql: ".$sql.$debugging["char"];
                $result  = $db -> query($sql);

                if ( !$result ) $ausgaben["form_error"] .= $db -> error("#(error_result)<br />");
                if ( $header == "" ) $header = $cfg["grouped"]["basis"]."/list.html";
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
