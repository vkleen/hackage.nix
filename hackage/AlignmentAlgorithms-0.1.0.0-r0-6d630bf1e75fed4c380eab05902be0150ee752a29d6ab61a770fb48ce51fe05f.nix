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
      specVersion = "1.10.0";
      identifier = { name = "AlignmentAlgorithms"; version = "0.1.0.0"; };
      license = "GPL-3.0-only";
      copyright = "Christian Hoener zu Siederdissen, 2013-2017";
      maintainer = "choener@bioinf.uni-leipzig.de";
      author = "Christian Hoener zu Siederdissen, 2013-2017";
      homepage = "https://github.com/choener/AlignmentAlgorithms";
      url = "";
      synopsis = "Collection of alignment algorithms";
      description = "<http://www.bioinf.uni-leipzig.de/Software/gADP/ generalized Algebraic Dynamic Programming>\n\nA selection of (sequence) alignment algorithms. Both terminal,\nand syntactic variables, as well as the index type is not fixed\nhere. This makes it possible to select the correct structure of\nthe grammar here, but bind the required data type for alignment\nin user code.\n\nThat being said, these algorithms are mostly aimed towards\nsequence alignment problems.\n\nList of grammars for sequences:\n\n* global alignment\n* linear scoring: Needleman-Wunsch style\n\n* affine scoring: Gotoh\n\n* semiglobal alignment\n* overhang alignment\n\nList of grammar for trees:\n\n* global alignment\n* linear scoring\n\n* affine scoring\n\n* simplified affine scoring\n\n* global editing\n* linear scoring\n\nWe now provide tree alignment and editing algorithms as well.\nWe do not depend on ADPfusionForest to achieve this because\ngrammar rules are completely disconnected from the underlying\nADPfusion machinery.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."fmlist" or (buildDepError "fmlist"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."ADPfusion" or (buildDepError "ADPfusion"))
          (hsPkgs."FormalGrammars" or (buildDepError "FormalGrammars"))
          (hsPkgs."GrammarProducts" or (buildDepError "GrammarProducts"))
          (hsPkgs."PrimitiveArray" or (buildDepError "PrimitiveArray"))
          ];
        buildable = true;
        };
      };
    }