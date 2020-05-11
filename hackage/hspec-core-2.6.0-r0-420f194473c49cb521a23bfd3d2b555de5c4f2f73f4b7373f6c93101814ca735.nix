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
      identifier = { name = "hspec-core"; version = "2.6.0"; };
      license = "MIT";
      copyright = "(c) 2011-2018 Simon Hengel,\n(c) 2011-2012 Trystan Spangler,\n(c) 2011 Greg Weber";
      maintainer = "Simon Hengel <sol@typeful.net>";
      author = "";
      homepage = "http://hspec.github.io/";
      url = "";
      synopsis = "A Testing Framework for Haskell";
      description = "This package exposes internal types and functions that can be used to extend Hspec's functionality.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."clock" or (buildDepError "clock"))
          (hsPkgs."HUnit" or (buildDepError "HUnit"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."call-stack" or (buildDepError "call-stack"))
          (hsPkgs."clock" or (buildDepError "clock"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."hspec-expectations" or (buildDepError "hspec-expectations"))
          (hsPkgs."quickcheck-io" or (buildDepError "quickcheck-io"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."setenv" or (buildDepError "setenv"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."tf-random" or (buildDepError "tf-random"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."call-stack" or (buildDepError "call-stack"))
            (hsPkgs."clock" or (buildDepError "clock"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hspec-expectations" or (buildDepError "hspec-expectations"))
            (hsPkgs."hspec-meta" or (buildDepError "hspec-meta"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."quickcheck-io" or (buildDepError "quickcheck-io"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."setenv" or (buildDepError "setenv"))
            (hsPkgs."silently" or (buildDepError "silently"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."tf-random" or (buildDepError "tf-random"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-meta or (pkgs.buildPackages.hspec-meta or (buildToolDepError "hspec-meta")))
            ];
          buildable = true;
          };
        };
      };
    }