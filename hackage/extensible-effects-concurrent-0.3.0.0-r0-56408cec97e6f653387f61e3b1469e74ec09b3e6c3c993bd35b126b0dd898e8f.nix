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
      identifier = {
        name = "extensible-effects-concurrent";
        version = "0.3.0.0";
        };
      license = "BSD-3-Clause";
      copyright = "Copyright Sven Heyll";
      maintainer = "sven.heyll@gmail.com";
      author = "Sven Heyll";
      homepage = "https://github.com/sheyll/extensible-effects-concurrent#readme";
      url = "";
      synopsis = "Message passing concurrency as extensible-effect";
      description = "Please see the README on GitHub at <https://github.com/sheyll/extensible-effects-concurrent#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."logging-effect" or (buildDepError "logging-effect"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."extensible-effects" or (buildDepError "extensible-effects"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          ];
        buildable = true;
        };
      tests = {
        "extensible-effects-concurrent-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."extensible-effects-concurrent" or (buildDepError "extensible-effects-concurrent"))
            (hsPkgs."extensible-effects" or (buildDepError "extensible-effects"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-discover" or (buildDepError "tasty-discover"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."stm" or (buildDepError "stm"))
            ];
          buildable = true;
          };
        };
      };
    }