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
      specVersion = "1.12";
      identifier = { name = "hmp3-ng"; version = "2.9.3"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Galen Huntington";
      author = "Don Stewart, Galen Huntington";
      homepage = "https://github.com/galenhuntington/hmp3-ng#readme";
      url = "";
      synopsis = "A 2019 fork of an ncurses mp3 player written in Haskell";
      description = "An mp3 player with a curses frontend. Playlists are populated by\npassing directory names on the commandline, and saved to the\n~/.hmp3db database. Type 'h' to display the help page.  Colours may\nbe configured at runtime by editing the \"~/.hmp3\" file.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hmp3" = {
          depends = [
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."clock" or (buildDepError "clock"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."hscurses" or (buildDepError "hscurses"))
            (hsPkgs."monad-extras" or (buildDepError "monad-extras"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."pcre-light" or (buildDepError "pcre-light"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            ];
          libs = [ (pkgs."ncursesw" or (sysDepError "ncursesw")) ];
          buildable = true;
          };
        };
      };
    }