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
      specVersion = "1.6.0";
      identifier = { name = "BiobaseXNA"; version = "0.8.1.0"; };
      license = "GPL-3.0-only";
      copyright = "Christian Hoener zu Siederdissen, 2011-2013";
      maintainer = "choener@tbi.univie.ac.at";
      author = "Christian Hoener zu Siederdissen";
      homepage = "http://www.tbi.univie.ac.at/~choener/";
      url = "";
      synopsis = "Efficient RNA/DNA representations";
      description = "This is a base library for bioinformatics with emphasis on RNA\nand DNA primary structure as well as amino acid sequences.\n\nProvided are efficient encodings for short sequences, as\nrequired by RNA folding tools. Extended RNA secondary\nstructures can be represented as well.\n\nContains data from:\n\n@\nFrequency and isostericity of RNA base pairs\nJesse Stombaugh, Craig L. Zirbel, Eric Westhof, and Neocles B. Leontis\nNucl. Acids Res. (2009)\n@\n\n<http://dx.crossref.org/10.1093%2Fnar%2Fgkp011>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."csv" or (buildDepError "csv"))
          (hsPkgs."file-embed" or (buildDepError "file-embed"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."PrimitiveArray" or (buildDepError "PrimitiveArray"))
          (hsPkgs."repa" or (buildDepError "repa"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."tuple" or (buildDepError "tuple"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      exes = {
        "SubOptDistance" = {
          depends = [ (hsPkgs."cmdargs" or (buildDepError "cmdargs")) ];
          buildable = true;
          };
        };
      };
    }