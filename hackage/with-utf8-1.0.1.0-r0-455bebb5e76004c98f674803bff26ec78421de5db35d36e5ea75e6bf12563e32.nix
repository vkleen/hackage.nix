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
      specVersion = "1.18";
      identifier = { name = "with-utf8"; version = "1.0.1.0"; };
      license = "MPL-2.0";
      copyright = "2020 Serokell";
      maintainer = "Kirill Elagin <kirelagin@serokell.io>";
      author = "Kirill Elagin <kirelagin@serokell.io>";
      homepage = "https://github.com/serokell/haskell-with-utf8#readme";
      url = "";
      synopsis = "Get your IO right on the first try";
      description = "This minimalistic library helps you navigate the world of text encodings\navoiding @invalid argument (invalid byte sequence)@\nand @invalid argument (invalid character)@ in runtime.\n\nThe two most important modules are:\n\n* \"Main.Utf8\"\n* \"System.IO.Utf8\"\n\nSee <https://serokell.io/blog/haskell-with-utf8 this blog post> for why this\nlibrary exists and what exactly it does.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."safe-exceptions" or (buildDepError "safe-exceptions"))
          (hsPkgs."text" or (buildDepError "text"))
          ];
        buildable = true;
        };
      exes = {
        "utf8-troubleshoot" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ];
          buildable = true;
          };
        };
      tests = {
        "with-utf8-test" = {
          depends = [
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."safe-exceptions" or (buildDepError "safe-exceptions"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hedgehog" or (buildDepError "tasty-hedgehog"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."with-utf8" or (buildDepError "with-utf8"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.tasty-discover or (pkgs.buildPackages.tasty-discover or (buildToolDepError "tasty-discover")))
            ];
          buildable = true;
          };
        };
      };
    }