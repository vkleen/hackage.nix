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
      identifier = { name = "PrimitiveArray"; version = "0.8.0.1"; };
      license = "BSD-3-Clause";
      copyright = "Christian Hoener zu Siederdissen, 2011-2016";
      maintainer = "choener@bioinf.uni-leipzig.de";
      author = "Christian Hoener zu Siederdissen, 2011-2016";
      homepage = "https://github.com/choener/PrimitiveArray";
      url = "";
      synopsis = "Efficient multidimensional arrays";
      description = "<http://www.bioinf.uni-leipzig.de/Software/gADP/ generalized Algebraic Dynamic Programming>\n\nThis library provides efficient multidimensional arrays. Import\n@Data.PrimitiveArray@ for indices, lenses, and arrays.\n\nFor\n<http://www.bioinf.uni-leipzig.de/Software/gADP/ generalized ADP>\nusers, the library also provides the machinary to\nfill tables in the correct order required by usual CYK-style\nparsers, or regular grammars (used e.g. in alignment\nalgorithms). This means that unless your grammar require a\nstrange order in which parsing is to be performed, it will\nmostly \"just work\".\n\nIn general all operations are (highly) unsafe, no\nbounds-checking or other sanity-checking is performed.\nOperations are aimed toward efficiency as much as possible.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bits" or (buildDepError "bits"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."cereal-vector" or (buildDepError "cereal-vector"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."log-domain" or (buildDepError "log-domain"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."smallcheck" or (buildDepError "smallcheck"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vector-binary-instances" or (buildDepError "vector-binary-instances"))
          (hsPkgs."vector-th-unbox" or (buildDepError "vector-th-unbox"))
          (hsPkgs."DPutils" or (buildDepError "DPutils"))
          (hsPkgs."OrderedBits" or (buildDepError "OrderedBits"))
          ];
        buildable = true;
        };
      tests = {
        "properties" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."smallcheck" or (buildDepError "smallcheck"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-smallcheck" or (buildDepError "tasty-smallcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."PrimitiveArray" or (buildDepError "PrimitiveArray"))
            ];
          buildable = true;
          };
        };
      };
    }