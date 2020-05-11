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
      identifier = { name = "codecov-haskell"; version = "0.4.0.2"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2014 Guillaume Nargeot";
      maintainer = "Guillaume Nargeot <guillaume+hackage@nargeot.com>";
      author = "Guillaume Nargeot";
      homepage = "https://github.com/guillaume-nargeot/codecov-haskell";
      url = "";
      synopsis = "Codecov.io support for Haskell.";
      description = "This utility converts and sends Haskell projects hpc code coverage to\n<http://codecov.io/ codecov.io>.\n\n/Usage/\n\nBelow is the simplest example of .travis.yml configuration to use with Travis CI:\n\n> language: haskell\n> ghc: 7.8\n> script:\n>   - cabal configure --enable-tests --enable-library-coverage && cabal build && cabal test\n> after_script:\n>   - cabal install codecov-haskell\n>   - codecov-haskell [options] [test-suite-names]\n\nFurther information can be found in the <https://github.com/guillaume-nargeot/codecov-haskell README>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          (hsPkgs."curl" or (buildDepError "curl"))
          (hsPkgs."hpc" or (buildDepError "hpc"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."split" or (buildDepError "split"))
          ];
        buildable = true;
        };
      exes = {
        "codecov-haskell" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."curl" or (buildDepError "curl"))
            (hsPkgs."hpc" or (buildDepError "hpc"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."split" or (buildDepError "split"))
            ];
          buildable = true;
          };
        "run-cabal-test" = {
          depends = [
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
            (hsPkgs."split" or (buildDepError "split"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test-all" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."codecov-haskell" or (buildDepError "codecov-haskell"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
          buildable = true;
          };
        };
      };
    }