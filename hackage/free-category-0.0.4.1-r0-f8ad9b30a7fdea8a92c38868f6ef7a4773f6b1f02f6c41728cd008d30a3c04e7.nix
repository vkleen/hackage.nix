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
      identifier = { name = "free-category"; version = "0.0.4.1"; };
      license = "MPL-2.0";
      copyright = "(c) 2018-2019 Marcin Szamotulski";
      maintainer = "profunctor@pm.me";
      author = "Marcin Szamotulski";
      homepage = "https://github.com/coot/free-category#readme";
      url = "";
      synopsis = "efficient data types for free categories and arrows";
      description = "Provide various data types for free categories / type aligned queues, type\nclasses which allow to write abstract categories with side effects (Kleisli\nlike categories).  These are useful for encoding type safe state machines.\nFree arrows are also provided.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."free-algebras" or (buildDepError "free-algebras"))
          ];
        buildable = true;
        };
      tests = {
        "test-cats" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."free-algebras" or (buildDepError "free-algebras"))
            (hsPkgs."free-category" or (buildDepError "free-category"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench-cats" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."free-category" or (buildDepError "free-category"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            ];
          buildable = true;
          };
        };
      };
    }