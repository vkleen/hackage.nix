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
      identifier = { name = "hsudoku"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "marcelmoosbrugger@gmail.com";
      author = "Marcel Moosbrugger";
      homepage = "https://github.com/marcelmoosbrugger/hsudoku";
      url = "";
      synopsis = "Sudoku game with a GTK3 interface";
      description = "This package realizes a graphical GTK3 sudoku game. Moreover it\nprovides modules for loading and solving sudoku grids.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
          (hsPkgs."HandsomeSoup" or (buildDepError "HandsomeSoup"))
          (hsPkgs."hxt" or (buildDepError "hxt"))
          (hsPkgs."haskell-gi-base" or (buildDepError "haskell-gi-base"))
          (hsPkgs."gi-gtk" or (buildDepError "gi-gtk"))
          ];
        buildable = true;
        };
      exes = {
        "hsudoku" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
            (hsPkgs."HandsomeSoup" or (buildDepError "HandsomeSoup"))
            (hsPkgs."hxt" or (buildDepError "hxt"))
            (hsPkgs."haskell-gi-base" or (buildDepError "haskell-gi-base"))
            (hsPkgs."gi-gtk" or (buildDepError "gi-gtk"))
            (hsPkgs."hsudoku" or (buildDepError "hsudoku"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
            (hsPkgs."HandsomeSoup" or (buildDepError "HandsomeSoup"))
            (hsPkgs."hxt" or (buildDepError "hxt"))
            (hsPkgs."haskell-gi-base" or (buildDepError "haskell-gi-base"))
            (hsPkgs."gi-gtk" or (buildDepError "gi-gtk"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."hsudoku" or (buildDepError "hsudoku"))
            ];
          buildable = true;
          };
        };
      };
    }