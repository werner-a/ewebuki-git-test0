<?php $t_start = array_sum(explode(' ', microtime())); require "libraries/global.inc.php";
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    $main_script_name = "$Id$";
    $main_script_desc = "haupt script";
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
    eWeBuKi - a easy website building kit
    Copyright (C)2001-2015 Werner Ammon ( wa<at>chaos.de )

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

    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "php version: ". PHP_VERSION .$debugging["char"];
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "[ ** $main_script_name ** ]".$debugging["char"];

    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "script name: ".$_SERVER["SCRIPT_NAME"].$debugging["char"];

    // path in die bestandteile zerlegen
    $pathvars["uri"] = $_SERVER["REQUEST_URI"];
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "pathvars uri: ".$pathvars["uri"].$debugging["char"];

    $pathvars["requested"] = explode("?", $_SERVER["REQUEST_URI"]);
    $pathvars["requested"] = $pathvars["requested"][0];

    // subdir support
    if ( $pathvars["subdir"] != "" ) {
        $pathvars["requested"] = str_replace($pathvars["subdir"],"",$pathvars["requested"]);
    }

    // url ohne .htm(l) wird ergaenzt
    if ( !strstr($pathvars["requested"],".htm") ) {
        if ( preg_match("/\/$/",$pathvars["requested"]) ) {
            // url endet mit /
            $pathvars["requested"] .= "index.html";
        } else {
            $pathvars["requested"] .= ".html";
        }
    }

    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "pathvars requested: ".$pathvars["requested"].$debugging["char"];

    $pathvars["level"] = explode("/", $pathvars["requested"]);
    $pieces = "";
    foreach($pathvars["level"] as $piece) {
        $pieces .= $piece." ";
    }
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "pathvars level: array(".$pieces.")".$debugging["char"];
    $pathvars["level_depth"] = count($pathvars["level"])-1;
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "pathvars level depth: ".$pathvars["level_depth"].$debugging["char"];

    // design detection
    // wegen einem bug in php 4.1.0 unterdrueckt ein @is_dir die falsche warning
    // http://bugs.php.net/bug.php?id=14420 und http://bugs.php.net/bug.php?id=14424
    $authcount = null;
    if ( $pathvars["level_depth"] >= 2 && @is_dir($pathvars["fileroot"]."templates/".$pathvars["level"][1]) ) {
      $environment["design"] = $pathvars["level"][1];
      $pathvars["virtual"] = "/".$environment["design"];
      $authcount++;
      $designsw = " (user)";
    } else {
      $environment["design"] = $specialvars["default_design"];
      $designsw = " (default)";
    }
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "design".$designsw.": ".$environment["design"].$debugging["char"];

    // language detection
    $position = null;
    for ( $i=1; $i<=2 ; $i++ ) {
        if ( isset($pathvars["level"][$i]) ) {
            if ( in_array($pathvars["level"][$i],$specialvars["available_languages"]) ) {
                $position = $i;
                break;
            }
        }
    }
    if ( $position >= 1) {

      // language converter
      if ( is_array($specialvars["convert_languages"]) ) {
        foreach ( $specialvars["convert_languages"] as $key => $value ) {
          if ( $pathvars["level"][$position] == $key ) {
            if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "lang convert: ".$key."->".$value.$debugging["char"];
            $pathvars["level"][$position] = $value;
            $coverted = "converted ";
            # noch zwei $pathvars umbauen, damit alles schoen umgeleitet wird!
            $pathvars["requested"] = str_replace($key,$value,$pathvars["requested"]);
            $pathvars["uri"] = str_replace($key,$value,$pathvars["uri"]);
            break;
          }
        }
      }

      $environment["language"] = $pathvars["level"][$position];
      $pathvars["virtual"] .= "/".$environment["language"];
      $authcount++;
      $langsw .= " (".$coverted."user)";
      if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "lang".$langsw.": ".$environment["language"].$debugging["char"];
    } else {
      if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "http accept lang: ".$_SERVER["HTTP_ACCEPT_LANGUAGE"].$debugging["char"];
      $http_accept_language = explode(",",$_SERVER["HTTP_ACCEPT_LANGUAGE"]);
      foreach( $http_accept_language as $lang ) {
        if ( in_array($lang,$specialvars["available_languages"]) ) {
          $environment["language"] = $lang;
          $langsw = " (browser)";
          break;
        }
      }
      if ( !isset($environment["language"]) ) {
        $environment["language"] = $specialvars["default_language"];
        $langsw = " (default)";
      }
      if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "lang".$langsw.": ".$environment["language"].$debugging["char"];
    }

    // host werte "www.xxx.yyy.de" in "www" und "xxx.yyy.de" array
    $environment["fqdn"] = explode(".", $_SERVER["HTTP_HOST"], 2);

    // virtual path auth korrektur und auth url init
    $ausgaben["auth_url"] = $pathvars["virtual"];
    $authcount++;
    if ( strstr($pathvars["level"][$authcount],"auth" ) ) {
        $pathvars["virtual"] .= "/auth";
    }
    $pathvars["virtual_depth"] = count(explode("/",$pathvars["virtual"]));
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "virtual path: ".$pathvars["virtual"].$debugging["char"];
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "virtual path depth: ".$pathvars["virtual_depth"].$debugging["char"];


    //
    // strg: neues ebene + kategorie verfahren
    //

    // neuer parameter 'ebene'
    $environment["ebene"] = substr_replace($pathvars["requested"], '', 0, strlen($pathvars["virtual"]));
    $paramstr = strrchr($environment["ebene"],"/");
    $environment["ebene"] = str_replace($paramstr,"",$environment["ebene"]);
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "strg ebene: ".$environment["ebene"].$debugging["char"];

    // neuer parameter 'parameter'
    $paramlen = (strrpos($paramstr,".htm")-1);
    $paramstr = substr($paramstr,1,$paramlen);
    $environment["parameter"] = explode(",", $paramstr);
    foreach( $environment["parameter"] as $key => $piece ) {
        if ( $key == 0 ) {
            $pieces = $piece;
            $environment["allparameter"] = $piece;
        } else {
            $environment["allparameter"] .= ",".$piece;
            $pieces .= " ".$piece;
        }
    }
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "strg parameter: array( ".$pieces." )".$debugging["char"];

    // neuer parameter 'kategorie'
    $environment["kategorie"] = $environment["parameter"][0];
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "strg kategorie: ".$environment["kategorie"].$debugging["char"];

    // neu: ausgabe template
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "strg ebene crc32: ".eCRC($environment["ebene"]).$debugging["char"];
    $environment["template"] = eCRC($environment["ebene"]).".".$environment["kategorie"].".tem.html";
    $template_link = "<a href=\"file://".$environment["template"]."\">".$environment["template"]."</a>";
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "strg template (auto): ".$template_link.$debugging["char"];

    // auth url complete
    $ausgaben["auth_url"] = $pathvars["subdir"].$ausgaben["auth_url"].$environment["ebene"]."/".$environment["allparameter"].".html";
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "auth url: ".$ausgaben["auth_url"].$debugging["char"];

    // print url
    #$ausgaben["print_url"] = $pathvars["uri"]."?print=true";
    $ausgaben["print_url"] = $pathvars["uri"];
    #$ausgaben["print_url"] = "leer";
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "print url: ".$ausgaben["print_url"].$debugging["char"];


    //
    // strg: altes katid + subkatid verfahren
    //

    // welche position haben katid und subkatid
    if ( $pathvars["virtual_depth"] == $pathvars["level_depth"] ) {
        $environment["param"] = $pathvars["level"][$pathvars["level_depth"]];
        #$ausgaben["login_url"] .= "/".$environment["param"];
        #$ausgaben["logout_url"] .= "/".$environment["param"];
    } else {
        $environment["param"] = $pathvars["level"][$pathvars["level_depth"]-1];
        $environment["subparam"] = $pathvars["level"][$pathvars["level_depth"]];
        #$ausgaben["login_url"] .= "/".$environment["param"]."/".$environment["subparam"];
        #$ausgaben["logout_url"] .=  "/".$environment["param"]."/".$environment["subparam"];
    }

    // param und katid extrahieren und evtl. zurechtschneiden
    if (strstr($environment["param"],"html")) {
        $paramlen = (strlen($environment["param"])-5);
        $environment["param"]  = substr($environment["param"],0,$paramlen);
    }
    $environment["param"] = explode(",", $environment["param"]);
    $environment["katid"] = $environment["param"][0];
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "strg (alt) katid: ".$environment["katid"].$debugging["char"];

    // subparam und subkatid extrahieren und evtl. zurechtschneiden
    if (strstr($environment["subparam"],"html")) {
        $subparamlen = (strlen($environment["subparam"])-5);
        $environment["subparam"] = substr($environment["subparam"],0,$subparamlen);
    }
    $environment["subparam"] = explode(",", $environment["subparam"]);
    $environment["subkatid"] = $environment["subparam"][0];
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "strg (alt) subkatid: ".$environment["subkatid"].$debugging["char"];

    // die drei design abhaengigen variablen werden angepasst
    $pathvars["menuroot"]  = $pathvars["protocol"]."://".$_SERVER["HTTP_HOST"].$pathvars["subdir"].$pathvars["virtual"];
    $pathvars["images"]    = "/images/".$environment["design"]."/";
    $pathvars["templates"] = $pathvars["fileroot"]."templates/".$environment["design"]."/";

    // grundmapping main output
    if ( $specialvars["crc32"] == -1 ) {
        if ( $environment["kategorie"] != "" ) {
             $mapping["main"] = $environment["kategorie"];
        }
    } else {
        if ( $environment["katid"] != "" && $environment["katid"] != "index" ) {
             $mapping["main"] = $environment["katid"];
        }
    }

    if (version_compare(PHP_VERSION, "4.3.0", ">=")) {
        // was steht in den post vars
        if ( $debugging["html_enable"] && count($_POST) > 0 ) {
            $debugging["ausgabe"] .= "form (post):";
            $debugging["ausgabe"] .= "<pre>".print_r($_POST,True)."</pre>";
        }
        // was steht in den get vars
        if ( $debugging["html_enable"] && count($_GET) > 0 ) {
            $debugging["ausgabe"] .= "form (post):";
            $debugging["ausgabe"] .= "<pre>".print_r($_GET,True)."</pre>";
        }
    } else {
        // was steht in den post vars
        if ( $debugging["html_enable"] && count($_POST) > 0 ) {
            if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "form (post):".$debugging["char"];
            foreach($_POST as $name => $value) {
                if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= $name." => ".$value.$debugging["char"];
            }
        }

        // was steht in den get vars
        if ( $debugging["html_enable"] && count($_GET) > 0 ) {
            if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "form (get):".$debugging["char"];
            foreach($_GET as $name => $value) {
                if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= $name." => ".$value.$debugging["char"];
            }
        }
    }


    // hallo zur datenbank
    $db      = new DB_connect();
    $version = $db->getVERSION();
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "db version: ".$version.$debugging["char"];

    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "db access \"server\" value: ".$_SERVER["SERVER_NAME"].$debugging["char"];
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "db access[\"num\"] selected: ".DB_ACCESS.$debugging["char"];

    $connect = $db->connect();
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "db connect: ".$connect.$debugging["char"];

    // subdir support
    $pathvars["virtual"] = $pathvars["subdir"].$pathvars["virtual"];
    $pathvars["requested"] = $pathvars["subdir"].$pathvars["requested"];

    // login verwalten ( muss erste funktion nach datenbank connect sein !!!)
    require $pathvars["config"]."auth.cfg.php";
    require $pathvars["libraries"]."auth.inc.php";

    // ueberschreiben von default werten
    require $pathvars["config"]."overwrite.cfg.php";

    if ( $environment["ebene"] == "/cms" || $environment["ebene"] == "/admin/contented" ) {
        if ( $specialvars["old_contented"] == True ) {
            include $pathvars["libraries"]."cms.inc.php";
        }
    } else {
        if ( strstr($_SERVER["REQUEST_URI"],"/auth/") ) {
            $_SESSION["page"] = $_SERVER["REQUEST_URI"];
            $_SESSION["ebene"] = $environment["ebene"];
            $_SESSION["kategorie"] = $environment["kategorie"];
        }
    }

    // steuerung der funktionen
    require $pathvars["config"]."modules.cfg.php";

    // label check
    if ( isset($_GET["edit"]) ) {
        if ( $_GET["edit"] == "" ) {
            $tname = $mapping["main"];
        } else {
            $tname = eCRC($environment["ebene"]).".".$_GET["edit"];
        }
        $sql = "SELECT * FROM ". SITETEXT ."
                WHERE tname='".$tname."'
                AND lang='".$environment["language"]."'";
        if ( $debugging["sql_enable"] ) $debugging["ausgabe"] .= "sql: ".$sql.$debugging["char"];
        $result = $db -> query($sql);
        $ausgaben["inaccessible"] .= "---<br />label check:<br />";
        while ( $data = $db -> fetch_array($result,1) ) {
            $ausgaben["inaccessible"] .= "# (".$data["label"].") #(".$data["label"].")<br />";
        }
        $ausgaben["inaccessible"] .= "---<br />label automatic:<br />";
    }

    // webdesigner kann mit dieser datei das laden der templates beinflussen
    if ( file_exists($pathvars["templates"]."linking.inc.php") ) {
      $linking_path = $pathvars["templates"];
      include $linking_path."linking.inc.php";
    } elseif ( file_exists($pathvars["fileroot"]."templates/default/linking.inc.php") ) {
      $linking_path = $pathvars["fileroot"]."templates/default/";
      include $linking_path."linking.inc.php";
    }

    // template overwrite?
    if ( $debugging["html_enable"] ) {
        $main_auto = $environment["template"];
        $main_new = str_replace(".".eCRC($environment["ebene"]),"",eCRC($environment["ebene"]).".".$mapping["main"].".tem.html");
        if ( $main_auto != $main_new ) {
            $debugging["ausgabe"] .= "<B>ATTENTION: template overwrite -> ".$mapping["main"].".tem.html</B>".$debugging["char"];
        }
    }

    // rekursiven parser aufrufen
    if ( isset($_POST["print"]) || isset($_GET["print"]) ) {
        $debugging["html_enable"] = 0;
        $print_template = $_POST["print"][2].$_GET["print"][2];
        if ( preg_match("/^[a-zA-Z0-9-_]+$/", $print_template) ){
            rparser( $print_template.".tem.html", $specialvars["default_template"].".tem.html");
        }
    } elseif ( isset($_POST["pdf"]) || isset($_GET["pdf"]) ) {
        $debugging["html_enable"] = 0;
        $debugging["sql_enable"] = 0;
        rparser("base.tem.html", $specialvars["default_template"].".tem.html", "", true);
        #echo $ausgaben["buffer"];

        $path_to_tcpdf = "/usr/local/share/php5/tcpdf/tcpdf.php";
        if ( file_exists($path_to_tcpdf) ) {
            require_once($path_to_tcpdf);
        } else {
            die("Can't find TCPDF library");
        }

        $path_to_tcpdf_function = $pathvars["libraries"]."function_tcpdf.inc.php";
        if ( file_exists($path_to_tcpdf_function) ) require_once($path_to_tcpdf_function);

        tcpdf_it($ausgaben["buffer"]);

    } elseif ( isset($_POST["hijack"]) || isset($_GET["hijack"]) ) {
        foreach ( $_GET as $key => $value ) {
            if ( $hijack == "" ) {
                $hijack  = $value;
            } else {
                $hijack .= "&".$key."=".$value;
            }
        }
        $frameset_template = $_POST["hijack"].$hijack;
        #$ausgaben["navigation"] = "/templates/net/frameset.head.tem.html";
        $ausgaben["navigation"] = "frameset.head.tem.html?head=true";
        $ausgaben["hijack"] = $frameset_template;
        rparser("frameset.tem.html", $specialvars["default_template"].".tem.html");
    } elseif ( isset($_POST["head"]) || isset($_GET["head"]) ) {
        $array = explode("?",$_SERVER["HTTP_REFERER"]);
        $ausgaben["seite"] = $array[0];
        rparser("frameset.head.tem.html", $specialvars["default_template"].".tem.html");
    } else {
        rparser("base.tem.html", $specialvars["default_template"].".tem.html");
    }

    $exec_time = array_sum(explode(' ', microtime())) - $t_start;
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "Execution Time: ".$exec_time." seconds".$debugging["char"];

    // entgueltige Debug Ausgabe zusammensetzen und ausgeben
    if ( $debugging["html_enable"] ) $debugging["ausgabe"] .= "[ ++ $main_script_name ++ ]".$debugging["char"];
    if ( $debugging["html_enable"] ) echo $debugging["ausgabe"].$debugging["footer"];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
?>