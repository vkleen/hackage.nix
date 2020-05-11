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
      specVersion = "1.10";
      identifier = { name = "taffybar"; version = "0.1.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "travitch@cs.wisc.edu";
      author = "Tristan Ravitch";
      homepage = "http://github.com/travitch/taffybar";
      url = "";
      synopsis = "A desktop bar similar to xmobar, but with more GUI";
      description = "A somewhat fancier desktop bar than xmobar.  This bar is based on\ngtk2hs and provides several widgets (including a few graphical ones).\nIt also sports an optional snazzy system tray.\n\nChanges in v0.1.3:\n\n* Depend on gtk 0.12.1+ to be able to build under ghc 7.2\n\n* Fix the background colors in the calendar so that it follows the GTK theme instead\nof the bar-specific color settings\n\n* Fix the display of non-ASCII window titles in the XMonad log applet (assuming you use the dbusLog function)\n\n* Add a horrible hack to force the bar to not resize to be larger than the screen due to notifications or long window titles\n\nChanges in v0.1.2:\n\n* Readable widget for freedesktop notifications\n\n* Fixed a few potential deadlocks on startup\n\n* Use the GTK+ rc-file styling system for colors instead of hard coding them";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."HTTP" or (buildDepError "HTTP"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."web-encodings" or (buildDepError "web-encodings"))
          (hsPkgs."cairo" or (buildDepError "cairo"))
          (hsPkgs."dbus-core" or (buildDepError "dbus-core"))
          (hsPkgs."gtk" or (buildDepError "gtk"))
          (hsPkgs."dyre" or (buildDepError "dyre"))
          (hsPkgs."HStringTemplate" or (buildDepError "HStringTemplate"))
          (hsPkgs."gtk-traymanager" or (buildDepError "gtk-traymanager"))
          (hsPkgs."xmonad-contrib" or (buildDepError "xmonad-contrib"))
          (hsPkgs."xmonad" or (buildDepError "xmonad"))
          (hsPkgs."xdg-basedir" or (buildDepError "xdg-basedir"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          ];
        pkgconfig = [
          (pkgconfPkgs."gtk+-2.0" or (pkgConfDepError "gtk+-2.0"))
          ];
        buildable = true;
        };
      exes = {
        "taffybar" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."dyre" or (buildDepError "dyre"))
            (hsPkgs."gtk" or (buildDepError "gtk"))
            (hsPkgs."xdg-basedir" or (buildDepError "xdg-basedir"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            ];
          pkgconfig = [
            (pkgconfPkgs."gtk+-2.0" or (pkgConfDepError "gtk+-2.0"))
            ];
          buildable = true;
          };
        };
      };
    }