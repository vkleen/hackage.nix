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
      specVersion = "1.10";
      identifier = { name = "tasty-expected-failure"; version = "0.11.1"; };
      license = "MIT";
      copyright = "2015 Joachim Breitner";
      maintainer = "mail@joachim-breitner.de";
      author = "Joachim Breitner";
      homepage = "http://github.com/nomeata/tasty-expected-failure";
      url = "";
      synopsis = "Mark tasty tests as failure expected";
      description = "With the function 'Test.Tasty.ExpectedFailure.expectFail' in the provided module\n\"Test.Tasty.ExpectedFailure\", you can mark that you expect test cases to fail,\nand not to pass.\n\nThis can for example be used for test-driven development: Create the tests,\nmark them with 'Test.Tasty.ExpectedFailure.expectFail', and you can still push\nto the main branch, without your continuous integration branch failing.\n\nOnce someone implements the feature or fixes the bug (maybe unknowingly), the\ntest suite will tell him so, due to the now unexpectedly passing test, and he\ncan remove the 'Test.Tasty.ExpectedFailure.expectFail' marker.\n\nThe module also provides 'Test.Tasty.ExpectedFailure.ignoreTest' to avoid\nrunning a test. Both funtions are implemented via the more general\n'Test.Tasty.ExpectedFailure.wrapTest', which is also provided.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."tasty" or (buildDepError "tasty"))
          ];
        buildable = true;
        };
      };
    }