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
      identifier = { name = "essence-of-live-coding"; version = "0.1.0.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "programming@manuelbaerenz.de";
      author = "Manuel Bärenz";
      homepage = "https://www.manuelbaerenz.de/#computerscience";
      url = "";
      synopsis = "General purpose live coding framework";
      description = "essence-of-live-coding is a general purpose and type safe live coding framework.\n\nYou can run programs in it, and edit, recompile and reload them while they're running.\nInternally, the state of the live program is automatically migrated when performing hot code swap.\n\nThe library also offers an easy to use FRP interface.\nIt is parametrized by its side effects,\nseparates data flow cleanly from control flow,\nand allows to develop live programs from reusable, modular components.\nThere are also useful utilities for debugging and quickchecking.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."vector-sized" or (buildDepError "vector-sized"))
          (hsPkgs."foreign-store" or (buildDepError "foreign-store"))
          ];
        buildable = true;
        };
      exes = {
        "TestExceptions" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."essence-of-live-coding" or (buildDepError "essence-of-live-coding"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        };
      tests = {
        "essence-of-live-coding" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."syb" or (buildDepError "syb"))
            (hsPkgs."essence-of-live-coding" or (buildDepError "essence-of-live-coding"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }