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
      identifier = { name = "Allure"; version = "0.6.1.0"; };
      license = "AGPL-3.0-only";
      copyright = "";
      maintainer = "Mikolaj Konarski <mikolaj.konarski@funktory.com>";
      author = "Andres Loeh, Mikolaj Konarski and others";
      homepage = "http://allureofthestars.com";
      url = "";
      synopsis = "Near-future Sci-Fi roguelike and tactical squad game";
      description = "Allure of the Stars\nis a near-future Sci-Fi roguelike and tactical squad game.\nTry out the browser version of Allure of the Stars at\n<http://allureofthestars.com/play>\n(It runs fastest on Chrome. Keyboard commands and savefiles\nare supported only on recent enough versions of browsers.\nMouse should work everywhere.)\n\n<<https://raw.githubusercontent.com/AllureOfTheStars/media/master/screenshot/crawl-0.6.0.0-8x8xb.png>>\n\nPlease see the changelog file for recent improvements\nand the issue tracker for short-term plans. Long term goals\nare high replayability and auto-balancing through procedural\ncontent generation and persistent content modification\nbased on player behaviour. Contributions are welcome.\n\nThe game is written using the LambdaHack roguelike game engine\navailable at <http://hackage.haskell.org/package/LambdaHack>.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "Allure" = {
          depends = [
            (hsPkgs."LambdaHack" or (buildDepError "LambdaHack"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."enummapset-th" or (buildDepError "enummapset-th"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."text" or (buildDepError "text"))
            ] ++ (pkgs.lib).optional (!(compiler.isGhcjs && true)) (hsPkgs."zlib" or (buildDepError "zlib"));
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."LambdaHack" or (buildDepError "LambdaHack"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."enummapset-th" or (buildDepError "enummapset-th"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."text" or (buildDepError "text"))
            ] ++ (pkgs.lib).optional (!(compiler.isGhcjs && true)) (hsPkgs."zlib" or (buildDepError "zlib"));
          buildable = true;
          };
        };
      };
    }