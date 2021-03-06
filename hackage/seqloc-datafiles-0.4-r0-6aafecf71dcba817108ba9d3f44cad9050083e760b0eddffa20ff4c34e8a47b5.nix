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
    flags = { tests = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "seqloc-datafiles"; version = "0.4"; };
      license = "MIT";
      copyright = "";
      maintainer = "nick@ingolia.org";
      author = "Nick Ingolia";
      homepage = "http://www.ingolia-lab.org/seqloc-datafiles-tutorial.html";
      url = "";
      synopsis = "Read and write BED and GTF format genome annotations";
      description = "Read and write BED and GTF format genome annotations";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."iteratee" or (buildDepError "iteratee"))
          (hsPkgs."seqloc" or (buildDepError "seqloc"))
          (hsPkgs."biocore" or (buildDepError "biocore"))
          ];
        buildable = true;
        };
      exes = {
        "gtf-to-bed" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."iteratee" or (buildDepError "iteratee"))
            (hsPkgs."seqloc" or (buildDepError "seqloc"))
            (hsPkgs."biocore" or (buildDepError "biocore"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."monads-tf" or (buildDepError "monads-tf"))
            ];
          buildable = true;
          };
        "bed-to-gtf" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."iteratee" or (buildDepError "iteratee"))
            (hsPkgs."seqloc" or (buildDepError "seqloc"))
            (hsPkgs."biocore" or (buildDepError "biocore"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."monads-tf" or (buildDepError "monads-tf"))
            ];
          buildable = true;
          };
        "gtf-introns" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."iteratee" or (buildDepError "iteratee"))
            (hsPkgs."seqloc" or (buildDepError "seqloc"))
            (hsPkgs."biocore" or (buildDepError "biocore"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."cmdtheline" or (buildDepError "cmdtheline"))
            ];
          buildable = true;
          };
        "bed-subregion" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."iteratee" or (buildDepError "iteratee"))
            (hsPkgs."seqloc" or (buildDepError "seqloc"))
            (hsPkgs."biocore" or (buildDepError "biocore"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."monads-tf" or (buildDepError "monads-tf"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            ];
          buildable = true;
          };
        "test-gtf" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."iteratee" or (buildDepError "iteratee"))
            (hsPkgs."seqloc" or (buildDepError "seqloc"))
            (hsPkgs."biocore" or (buildDepError "biocore"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random" or (buildDepError "random"))
            ];
          buildable = if !flags.tests then false else true;
          };
        "test-bed" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."iteratee" or (buildDepError "iteratee"))
            (hsPkgs."seqloc" or (buildDepError "seqloc"))
            (hsPkgs."biocore" or (buildDepError "biocore"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random" or (buildDepError "random"))
            ];
          buildable = if !flags.tests then false else true;
          };
        "genome-to-trx" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."iteratee" or (buildDepError "iteratee"))
            (hsPkgs."seqloc" or (buildDepError "seqloc"))
            (hsPkgs."biocore" or (buildDepError "biocore"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            ];
          buildable = false;
          };
        };
      };
    }