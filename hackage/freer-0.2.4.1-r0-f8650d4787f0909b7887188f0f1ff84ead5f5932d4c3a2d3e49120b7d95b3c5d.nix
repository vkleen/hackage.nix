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
      identifier = { name = "freer"; version = "0.2.4.1"; };
      license = "BSD-3-Clause";
      copyright = "Allele Dev 2016";
      maintainer = "allele.dev@gmail.com";
      author = "Allele Dev";
      homepage = "https://gitlab.com/queertypes/freer";
      url = "";
      synopsis = "Implementation of the Freer Monad";
      description = "Freer is an implementation of \"Freer Monads, More Extensible\nEffects\"\n\nThe key features of Freer are:\n\n* An efficient effect system for Haskell - as a library!\n\n* Implementations for several common Haskell monad instances:\n\n* Core components for defining your own Effects";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      exes = {
        "freer-examples" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."freer" or (buildDepError "freer"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."freer" or (buildDepError "freer"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "core" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."freer" or (buildDepError "freer"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."free" or (buildDepError "free"))
            ];
          buildable = true;
          };
        };
      };
    }