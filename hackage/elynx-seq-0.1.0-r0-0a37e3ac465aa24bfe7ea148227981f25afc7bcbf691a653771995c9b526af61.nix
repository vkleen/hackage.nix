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
      specVersion = "1.12";
      identifier = { name = "elynx-seq"; version = "0.1.0"; };
      license = "GPL-3.0-only";
      copyright = "Dominik Schrempf (2019)";
      maintainer = "dominik.schrempf@gmail.com";
      author = "Dominik Schrempf";
      homepage = "https://github.com/dschrempf/elynx#readme";
      url = "";
      synopsis = "Handle molecular sequences";
      description = "Examine, modify, and simulate molecular sequences in a reproducible way. Please see the README on GitHub at <https://github.com/dschrempf/elynx>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-memocombinators" or (buildDepError "data-memocombinators"))
          (hsPkgs."elynx-tools" or (buildDepError "elynx-tools"))
          (hsPkgs."elynx-tree" or (buildDepError "elynx-tree"))
          (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
          (hsPkgs."integration" or (buildDepError "integration"))
          (hsPkgs."math-functions" or (buildDepError "math-functions"))
          (hsPkgs."matrices" or (buildDepError "matrices"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          (hsPkgs."mwc-random" or (buildDepError "mwc-random"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."statistics" or (buildDepError "statistics"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vector-th-unbox" or (buildDepError "vector-th-unbox"))
          (hsPkgs."word8" or (buildDepError "word8"))
          ];
        buildable = true;
        };
      tests = {
        "seq-test" = {
          depends = [
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-memocombinators" or (buildDepError "data-memocombinators"))
            (hsPkgs."elynx-seq" or (buildDepError "elynx-seq"))
            (hsPkgs."elynx-tools" or (buildDepError "elynx-tools"))
            (hsPkgs."elynx-tree" or (buildDepError "elynx-tree"))
            (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-megaparsec" or (buildDepError "hspec-megaparsec"))
            (hsPkgs."integration" or (buildDepError "integration"))
            (hsPkgs."math-functions" or (buildDepError "math-functions"))
            (hsPkgs."matrices" or (buildDepError "matrices"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."mwc-random" or (buildDepError "mwc-random"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."statistics" or (buildDepError "statistics"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."vector-th-unbox" or (buildDepError "vector-th-unbox"))
            (hsPkgs."word8" or (buildDepError "word8"))
            ];
          buildable = true;
          };
        };
      };
    }