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
      specVersion = "1.8";
      identifier = { name = "hatt"; version = "1.5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2012 Benedict Eastaugh";
      maintainer = "benedict@eastaugh.net";
      author = "Benedict Eastaugh";
      homepage = "http://extralogical.net/projects/hatt";
      url = "";
      synopsis = "A truth table generator for classical propositional logic.";
      description = "Hatt is a command-line program which prints truth tables\nfor expressions in classical propositional logic, and a\nlibrary allowing its parser, evaluator and truth table\ngenerator to be used in other programs. It includes support\nfor converting logical expressions into several normal\nforms.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."ansi-wl-pprint" or (buildDepError "ansi-wl-pprint"))
          ];
        buildable = true;
        };
      exes = {
        "hatt" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hatt" or (buildDepError "hatt"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test-hatt" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hatt" or (buildDepError "hatt"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            ];
          buildable = true;
          };
        };
      };
    }