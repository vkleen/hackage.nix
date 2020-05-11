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
      specVersion = "1.8.0";
      identifier = { name = "DnaProteinAlignment"; version = "0.0.0.1"; };
      license = "GPL-3.0-only";
      copyright = "Christian Hoener zu Siederdissen, 2013";
      maintainer = "choener@tbi.univie.ac.at";
      author = "Christian Hoener zu Siederdissen, 2013";
      homepage = "http://www.tbi.univie.ac.at/~choener/";
      url = "";
      synopsis = "Frameshift-aware alignment of protein sequences with DNA sequences";
      description = "Perform a semi-global alignment of a DNA sequence (local) with\na protein sequence (global). The alignment includes the\npossibility of frame shifts.\n\nThe dynamic programming algorithm is created automatically from\natomic single-tape grammars using our grammar product\nframework.\n\nRun the program with @+RTS -N -RTS@ for optimal performance\nwhen aligning against a genome.\n\n\n\nIf you find this library or program useful, please cite:\n\n@\nChristian Höner zu Siederdissen, Ivo L. Hofacker, and Peter F. Stadler\nProduct Grammars for Alignment and Folding\nsubmitted\n@\n\n@\nChristian Höner zu Siederdissen, Ivo L. Hofacker, and Peter F. Stadler\nHow to Multiply Dynamic Programming Algorithms\nBrazilian Symposium on Bioinformatics (BSB 2013)\nLecture Notes in Bioinformatics 8213, Springer, Heidelberg\n@";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."ansi-wl-pprint" or (buildDepError "ansi-wl-pprint"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          (hsPkgs."ADPfusion" or (buildDepError "ADPfusion"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."BiobaseBlast" or (buildDepError "BiobaseBlast"))
          (hsPkgs."BiobaseFasta" or (buildDepError "BiobaseFasta"))
          (hsPkgs."BiobaseXNA" or (buildDepError "BiobaseXNA"))
          (hsPkgs."biocore" or (buildDepError "biocore"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."dlist" or (buildDepError "dlist"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."PrimitiveArray" or (buildDepError "PrimitiveArray"))
          (hsPkgs."repa" or (buildDepError "repa"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      exes = {
        "DnaProteinAlignment" = {
          depends = [
            (hsPkgs."ansi-wl-pprint" or (buildDepError "ansi-wl-pprint"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."ADPfusion" or (buildDepError "ADPfusion"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."BiobaseBlast" or (buildDepError "BiobaseBlast"))
            (hsPkgs."BiobaseFasta" or (buildDepError "BiobaseFasta"))
            (hsPkgs."BiobaseXNA" or (buildDepError "BiobaseXNA"))
            (hsPkgs."biocore" or (buildDepError "biocore"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."dlist" or (buildDepError "dlist"))
            (hsPkgs."DnaProteinAlignment" or (buildDepError "DnaProteinAlignment"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."PrimitiveArray" or (buildDepError "PrimitiveArray"))
            (hsPkgs."repa" or (buildDepError "repa"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      };
    }