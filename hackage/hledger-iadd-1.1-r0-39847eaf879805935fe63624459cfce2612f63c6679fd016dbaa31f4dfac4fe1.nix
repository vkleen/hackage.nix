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
      identifier = { name = "hledger-iadd"; version = "1.1"; };
      license = "BSD-3-Clause";
      copyright = "2016 Hans-Peter Deifel";
      maintainer = "hpd@hpdeifel.de";
      author = "Hans-Peter Deifel";
      homepage = "http://github.com/rootzlevel/hledger-iadd#readme";
      url = "";
      synopsis = "A terminal UI as drop-in replacement for hledger add";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."hledger-lib" or (buildDepError "hledger-lib"))
          (hsPkgs."brick" or (buildDepError "brick"))
          (hsPkgs."vty" or (buildDepError "vty"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."microlens" or (buildDepError "microlens"))
          (hsPkgs."text-zipper" or (buildDepError "text-zipper"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."text-format" or (buildDepError "text-format"))
          (hsPkgs."xdg-basedir" or (buildDepError "xdg-basedir"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."free" or (buildDepError "free"))
          ];
        buildable = true;
        };
      exes = {
        "hledger-iadd" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hledger-iadd" or (buildDepError "hledger-iadd"))
            (hsPkgs."hledger-lib" or (buildDepError "hledger-lib"))
            (hsPkgs."brick" or (buildDepError "brick"))
            (hsPkgs."vty" or (buildDepError "vty"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."microlens" or (buildDepError "microlens"))
            (hsPkgs."text-zipper" or (buildDepError "text-zipper"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."text-format" or (buildDepError "text-format"))
            (hsPkgs."xdg-basedir" or (buildDepError "xdg-basedir"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."free" or (buildDepError "free"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hledger-iadd" or (buildDepError "hledger-iadd"))
            (hsPkgs."hledger-lib" or (buildDepError "hledger-lib"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text-format" or (buildDepError "text-format"))
            (hsPkgs."free" or (buildDepError "free"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            ];
          buildable = true;
          };
        };
      };
    }