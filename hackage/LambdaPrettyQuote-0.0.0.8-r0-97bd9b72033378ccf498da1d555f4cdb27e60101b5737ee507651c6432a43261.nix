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
      identifier = { name = "LambdaPrettyQuote"; version = "0.0.0.8"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "jonathangfischoff@gmail.com";
      author = "Jonathan Fischoff";
      homepage = "http://github.com/jfischoff/LambdaPrettyQuote";
      url = "";
      synopsis = "Quasiquoter, and Arbitrary helpers for the lambda calculus.";
      description = "CHANGES -- 0.0.0.2 added \\\"anti\\\" expressions for the quasiquoter to capture variables from the environment. Also added a pattern quasiquoter.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
          (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
          (hsPkgs."test-framework" or (buildDepError "test-framework"))
          (hsPkgs."lambda-ast" or (buildDepError "lambda-ast"))
          (hsPkgs."HUnit" or (buildDepError "HUnit"))
          (hsPkgs."DebugTraceHelpers" or (buildDepError "DebugTraceHelpers"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."uniplate" or (buildDepError "uniplate"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."tuple" or (buildDepError "tuple"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."lambda-ast" or (buildDepError "lambda-ast"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."DebugTraceHelpers" or (buildDepError "DebugTraceHelpers"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."uniplate" or (buildDepError "uniplate"))
            (hsPkgs."th-instances" or (buildDepError "th-instances"))
            (hsPkgs."syb" or (buildDepError "syb"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."derive" or (buildDepError "derive"))
            (hsPkgs."tuple" or (buildDepError "tuple"))
            (hsPkgs."checkers" or (buildDepError "checkers"))
            ];
          buildable = true;
          };
        };
      };
    }