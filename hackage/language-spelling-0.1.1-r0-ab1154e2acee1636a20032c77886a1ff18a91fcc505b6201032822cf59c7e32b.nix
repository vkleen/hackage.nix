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
      specVersion = "1.8";
      identifier = { name = "language-spelling"; version = "0.1.1"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "Francesco Mazzoli (f@mazzo.li)";
      author = "Francesco Mazzoli (f@mazzo.li)";
      homepage = "https://github.com/bitonic/language-spelling";
      url = "";
      synopsis = "Various tools to detect/correct mistakes in words";
      description = "Haskell library meant to be a set of tools to correct spelling mistakes,\nhomophones, and OCR errors.\n\nSample session:\n\n@\nghci> :m + Language.Distance.Search.BK\nghci> distance \\\"foo\\\" \\\"bar\\\" :: Distance DamerauLevenshtein\n3\nghci> let bk = foldr insert empty [\\\"foo\\\", \\\"foa\\\", \\\"fooa\\\", \\\"ofo\\\", \\\"arstu\\\", \\\"nana\\\", \\\"faa\\\"] :: BKTree String 'DamerauLevenshtein'\nghci> query 0 \\\"foo\\\" bk\n[(\\\"foo\\\",Distance 0)]\nghci> query 2 \\\"foo\\\" bk\n[(\\\"faa\\\",Distance 2),(\\\"foa\\\",Distance 1),(\\\"fooa\\\",Distance 1),(\\\"foo\\\",Distance 0),(\\\"ofo\\\",Distance 1)]\n@\n\nTODO:\n\n*   Phonetic algorithms: metaphone, double metaphone, maybe others\n\n*   Tests and better benchmarking\n\n*   Cost tuning when searching";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."ListLike" or (buildDepError "ListLike"))
          (hsPkgs."listlike-instances" or (buildDepError "listlike-instances"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "benchmarks" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."random-shuffle" or (buildDepError "random-shuffle"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."time" or (buildDepError "time"))
            ];
          buildable = true;
          };
        };
      };
    }