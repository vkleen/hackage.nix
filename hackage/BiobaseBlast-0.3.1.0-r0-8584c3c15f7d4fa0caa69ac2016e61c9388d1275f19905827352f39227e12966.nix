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
      identifier = { name = "BiobaseBlast"; version = "0.3.1.0"; };
      license = "GPL-3.0-only";
      copyright = "Christian Hoener zu Siederdissen, 2013 - 2019";
      maintainer = "choener@bioinf.uni-leipzig.de";
      author = "Christian Hoener zu Siederdissen, Florian Eggenhofer";
      homepage = "https://github.com/choener/BiobaseBlast";
      url = "";
      synopsis = "BLAST-related tools";
      description = "This library contains BLAST-related functionality:\n\n- Parser for tabular NCBI BLAST+ output\n- Parser for JSON2 NCBI BLAST+ output\n- Parsers for BLOSUM and PAM matrices.\n- Specialized substitution functions for (in)complete amino\nacid / nucleotide triplet substitution.\n- Incomplete nucleotide patterns map one or two nucleotides to\nan amino acid (need for indel editing in the mitochondria of\ncertain species like /p.polycephalum/).\n\nThe matrices are currently not provided but can be found here:\n<ftp://ftp.ncbi.nih.gov/blast/matrices/>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."file-embed" or (buildDepError "file-embed"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."log-domain" or (buildDepError "log-domain"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vector-th-unbox" or (buildDepError "vector-th-unbox"))
          (hsPkgs."BiobaseENA" or (buildDepError "BiobaseENA"))
          (hsPkgs."BiobaseTypes" or (buildDepError "BiobaseTypes"))
          (hsPkgs."BiobaseXNA" or (buildDepError "BiobaseXNA"))
          (hsPkgs."PrimitiveArray" or (buildDepError "PrimitiveArray"))
          (hsPkgs."SciBaseTypes" or (buildDepError "SciBaseTypes"))
          ];
        buildable = true;
        };
      tests = {
        "properties" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-silver" or (buildDepError "tasty-silver"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."BiobaseBlast" or (buildDepError "BiobaseBlast"))
            ];
          buildable = true;
          };
        };
      };
    }