let
  buildDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (build dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  sysDepError = pkg:
    builtins.throw ''
      The Nixpkgs package set does not contain the package: ${pkg} (system dependency).
      
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      '';
  pkgConfDepError = pkg:
    builtins.throw ''
      The pkg-conf packages does not contain the package: ${pkg} (pkg-conf dependency).
      
      You may need to augment the pkg-conf package mapping in haskell.nix so that it can be found.
      '';
  exeDepError = pkg:
    builtins.throw ''
      The local executable components do not include the component: ${pkg} (executable dependency).
      '';
  legacyExeDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (executable dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  buildToolDepError = pkg:
    builtins.throw ''
      Neither the Haskell package set or the Nixpkgs package set contain the package: ${pkg} (build tool dependency).
      
      If this is a system dependency:
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      
      If this is a Haskell dependency:
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
in { system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, config, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.6";
      identifier = { name = "manatee-curl"; version = "0.0.8"; };
      license = "GPL-3.0-only";
      copyright = "(c) 2009 ~ 2010 Andy Stewart";
      maintainer = "Andy Stewart <lazycat.manatee@gmail.com>";
      author = "Andy Stewart";
      homepage = "";
      url = "";
      synopsis = "Download Manager extension for Manatee.";
      description = "manatee-curl is multithreads download manager extension for Manatee (Haskell/Gtk+ Integrated Live Environment)\n\nDefault configuration template at Config\\/Curl.hs, copy to directory `HOME/.manatee/config/`.\n\nNote, you need re-install package to start the configuration file take effect the next time,\n\nVideo at (Select 720p HD) at : <http://www.youtube.com/watch?v=weS6zys3U8k> <http://www.youtube.com/watch?v=A3DgKDVkyeM> <http://v.youku.com/v_show/id_XMjI2MDMzODI4.html>\n\nScreenshots at : <http://goo.gl/MkVw>\n\nManual at : <http://haskell.org/haskellwiki/Manatee>\n\nIRC channel: irc.freenode.net 6667 <##manatee>\n\nMailing-List: manatee-user\\@googlegroups.com manatee-develop\\@googlegroups.com\n";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."manatee-core" or (buildDepError "manatee-core"))
          (hsPkgs."dbus-client" or (buildDepError "dbus-client"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."gtk-serialized-event" or (buildDepError "gtk-serialized-event"))
          (hsPkgs."gtk" or (buildDepError "gtk"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."glib" or (buildDepError "glib"))
          (hsPkgs."gio" or (buildDepError "gio"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."curl" or (buildDepError "curl"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."derive" or (buildDepError "derive"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."regex-tdfa" or (buildDepError "regex-tdfa"))
          (hsPkgs."dbus-core" or (buildDepError "dbus-core"))
          ];
        buildable = true;
        };
      exes = { "manatee-curl" = { buildable = true; }; };
      };
    }