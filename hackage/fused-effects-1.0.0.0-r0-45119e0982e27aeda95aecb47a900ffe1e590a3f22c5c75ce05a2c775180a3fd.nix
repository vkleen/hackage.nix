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
      specVersion = "2.2";
      identifier = { name = "fused-effects"; version = "1.0.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2018-2019 Nicolas Wu, Tom Schrijvers, Rob Rix, Patrick Thomson";
      maintainer = "robrix@github.com";
      author = "Nicolas Wu, Tom Schrijvers, Rob Rix, Patrick Thomson";
      homepage = "https://github.com/fused-effects/fused-effects";
      url = "";
      synopsis = "A fast, flexible, fused effect system.";
      description = "A fast, flexible, fused effect system, à la Effect Handlers in Scope, Monad Transformers and Modular Algebraic Effects: What Binds Them Together, and Fusion for Free—Efficient Algebraic Effect Handlers.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = true;
        };
      tests = {
        "examples" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fused-effects" or (buildDepError "fused-effects"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."hedgehog-fn" or (buildDepError "hedgehog-fn"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hedgehog" or (buildDepError "tasty-hedgehog"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."fused-effects" or (buildDepError "fused-effects"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."hedgehog-fn" or (buildDepError "hedgehog-fn"))
            (hsPkgs."inspection-testing" or (buildDepError "inspection-testing"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hedgehog" or (buildDepError "tasty-hedgehog"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        "docs" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fused-effects" or (buildDepError "fused-effects"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.markdown-unlit or (pkgs.buildPackages.markdown-unlit or (buildToolDepError "markdown-unlit")))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "benchmark" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fused-effects" or (buildDepError "fused-effects"))
            (hsPkgs."gauge" or (buildDepError "gauge"))
            ];
          buildable = true;
          };
        };
      };
    }