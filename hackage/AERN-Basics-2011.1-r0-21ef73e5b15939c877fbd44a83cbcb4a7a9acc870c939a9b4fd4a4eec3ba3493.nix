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
      specVersion = "1.2";
      identifier = { name = "AERN-Basics"; version = "2011.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2010 Michal Konecny, Jan Duracz";
      maintainer = "mikkonecny@gmail.com";
      author = "Michal Konecny (Aston University)";
      homepage = "http://code.google.com/p/aern/";
      url = "";
      synopsis = "foundational type classes for approximating exact real numbers";
      description = "Type-classes abstracting various kinds of approximations for exact entities:\n\n* those that are /near/ to the exact value due to limited granularity\n(eg floating point numbers with fixed granularity (aka precision)\napproximating real numbers or bounded-degree polynomials with floating point coefficients\napproximating continuous functions)\n\n* those that somehow /enclose/ the exact entity, usually using a pair of /endpoints/\n\nType classes are provided to capture:\n\n* the partial, sometimes semidecidable, natural ordering (<=) used in relation to /nearness/\n\n* the partial, sometimes semidecidable, refinement ordering (&#8849;) used in relation to /enclosure/\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."criterion" or (buildDepError "criterion"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."test-framework" or (buildDepError "test-framework"))
          (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
          ];
        buildable = true;
        };
      exes = {
        "toolAERN-bench-csv-to-gnuplot" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ];
          buildable = true;
          };
        };
      };
    }