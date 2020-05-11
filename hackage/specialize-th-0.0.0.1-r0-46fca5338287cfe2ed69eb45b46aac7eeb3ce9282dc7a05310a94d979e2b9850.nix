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
      identifier = { name = "specialize-th"; version = "0.0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "jonathangfischoff@gmail.com";
      author = "Jonathan Fischoff";
      homepage = "https://github.com/jfischoff/specialize-th";
      url = "";
      synopsis = "Create specialized types from polymorphic ones using TH";
      description = "Very Alpha. Minimal Testing. Will test more this week.     ";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."derive" or (buildDepError "derive"))
          (hsPkgs."composition" or (buildDepError "composition"))
          (hsPkgs."th-expand-syns" or (buildDepError "th-expand-syns"))
          (hsPkgs."newtype-th" or (buildDepError "newtype-th"))
          (hsPkgs."newtype" or (buildDepError "newtype"))
          (hsPkgs."MissingH" or (buildDepError "MissingH"))
          (hsPkgs."uniplate" or (buildDepError "uniplate"))
          (hsPkgs."type-sub-th" or (buildDepError "type-sub-th"))
          (hsPkgs."universe-th" or (buildDepError "universe-th"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."DebugTraceHelpers" or (buildDepError "DebugTraceHelpers"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."checkers" or (buildDepError "checkers"))
            (hsPkgs."derive" or (buildDepError "derive"))
            (hsPkgs."composition" or (buildDepError "composition"))
            (hsPkgs."th-expand-syns" or (buildDepError "th-expand-syns"))
            (hsPkgs."newtype-th" or (buildDepError "newtype-th"))
            (hsPkgs."newtype" or (buildDepError "newtype"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."uniplate" or (buildDepError "uniplate"))
            (hsPkgs."type-sub-th" or (buildDepError "type-sub-th"))
            (hsPkgs."universe-th" or (buildDepError "universe-th"))
            ];
          buildable = true;
          };
        };
      };
    }