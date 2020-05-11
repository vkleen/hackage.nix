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
    flags = {
      debug = false;
      debugoutput = false;
      debugdump = false;
      examples = false;
      spectest = false;
      devel = false;
      btstruc = false;
      };
    package = {
      specVersion = "1.10.0";
      identifier = { name = "ADPfusion"; version = "0.5.2.2"; };
      license = "BSD-3-Clause";
      copyright = "Christian Hoener zu Siederdissen, 2011-2016";
      maintainer = "choener@bioinf.uni-leipzig.de";
      author = "Christian Hoener zu Siederdissen, 2011-2016";
      homepage = "https://github.com/choener/ADPfusion";
      url = "";
      synopsis = "Efficient, high-level dynamic programming.";
      description = "<http://www.bioinf.uni-leipzig.de/Software/gADP/ generalized Algebraic Dynamic Programming>\n\nADPfusion combines stream-fusion (using the stream interface\nprovided by the vector library) and type-level programming to\nprovide highly efficient dynamic programming combinators.\n\nADPfusion allows writing dynamic programs for single- and\nmulti-tape problems. Inputs can be sequences, or sets. New\ninput types can be defined, without having to rewrite this\nlibrary thanks to the open-world assumption of ADPfusion.\n\nThe library provides the machinery for Outside and Ensemble\nalgorithms as well. Ensemble algorithms combine Inside and\nOutside calculations.\n\nStarting with version 0.4.1 we support writing multiple\ncontext-free grammars (interleaved syntactic variables). Such\ngrammars have applications in bioinformatics and linguistics.\n\nThe homepage provides a number of tutorial-style examples, with\nlinear and context-free grammars over sequence and set inputs.\n\nThe formal background for generalized algebraic dynamic\nprogrmaming and ADPfusion is described in a number of papers.\nThese can be found on the gADP homepage and in the README.\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bits" or (buildDepError "bits"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."mmorph" or (buildDepError "mmorph"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."strict" or (buildDepError "strict"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."th-orphans" or (buildDepError "th-orphans"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."tuple" or (buildDepError "tuple"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."DPutils" or (buildDepError "DPutils"))
          (hsPkgs."OrderedBits" or (buildDepError "OrderedBits"))
          (hsPkgs."PrimitiveArray" or (buildDepError "PrimitiveArray"))
          ];
        buildable = true;
        };
      exes = {
        "NeedlemanWunsch" = {
          depends = (pkgs.lib).optionals (flags.examples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ADPfusion" or (buildDepError "ADPfusion"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."PrimitiveArray" or (buildDepError "PrimitiveArray"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = if flags.examples then true else false;
          };
        "spectest" = {
          depends = (pkgs.lib).optionals (flags.spectest) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ADPfusion" or (buildDepError "ADPfusion"))
            (hsPkgs."PrimitiveArray" or (buildDepError "PrimitiveArray"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = if flags.spectest then true else false;
          };
        };
      tests = {
        "properties" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ADPfusion" or (buildDepError "ADPfusion"))
            (hsPkgs."bits" or (buildDepError "bits"))
            (hsPkgs."OrderedBits" or (buildDepError "OrderedBits"))
            (hsPkgs."PrimitiveArray" or (buildDepError "PrimitiveArray"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."strict" or (buildDepError "strict"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "TestBacktrackingStructures" = {
          depends = (pkgs.lib).optionals (flags.btstruc) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."fmlist" or (buildDepError "fmlist"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            ];
          buildable = if flags.btstruc then true else false;
          };
        };
      };
    }