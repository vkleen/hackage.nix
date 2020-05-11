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
      specVersion = "1.4.0";
      identifier = { name = "BiobaseXNA"; version = "0.5.6.0"; };
      license = "GPL-3.0-only";
      copyright = "Christian Hoener zu Siederdissen, 2011";
      maintainer = "choener@tbi.univie.ac.at";
      author = "Christian Hoener zu Siederdissen";
      homepage = "http://www.tbi.univie.ac.at/~choener/";
      url = "";
      synopsis = "Efficient RNA/DNA representations";
      description = "This is a base library for bioinformatics with emphasis on RNA\nand DNA primary structure and related tools. Provided are\nefficient encodings for short sequences, as required by RNA\nfolding tools. Extended RNA secondary structures can be\nrepresented as well.\n\nContains data from:\n\nFrequency and isostericity of RNA base pairs\n\nJesse Stombaugh, Craig L. Zirbel, Eric Westhof, and Neocles B. Leontis\n\nNucl. Acids Res. (2009)\n\n<http://dx.crossref.org/10.1093%2Fnar%2Fgkp011>\n\n\n\nChanges since 0.5.5.0\n\n* isostericity for the 6 \"missing\" classes\n\nChanges since 0.5.4.0\n\n* tuple-like updating (updL, updR, updP, updT)\n\n* baseP pair selection\n\n* isostericity data, loaded from csv files\n\nChanges since 0.5.3.0\n\n* tuple-like (selN) selection of basepairing elements (baseL,baseR,baseT)\n\nChanges since 0.5.1.0\n\n* bonusTable for constrained folding";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."csv" or (buildDepError "csv"))
          (hsPkgs."file-embed" or (buildDepError "file-embed"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."tuple" or (buildDepError "tuple"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."PrimitiveArray" or (buildDepError "PrimitiveArray"))
          ];
        buildable = true;
        };
      };
    }