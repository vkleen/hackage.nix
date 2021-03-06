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
      specVersion = "1.9.2";
      identifier = { name = "reflex"; version = "0.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "ryan.trinkle@gmail.com";
      author = "Ryan Trinkle";
      homepage = "https://github.com/reflex-frp/reflex";
      url = "";
      synopsis = "Higher-order Functional Reactive Programming";
      description = "Reflex is a high-performance, deterministic, higher-order Functional Reactive Programming system";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."dependent-sum" or (buildDepError "dependent-sum"))
          (hsPkgs."dependent-map" or (buildDepError "dependent-map"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."these" or (buildDepError "these"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."ref-tf" or (buildDepError "ref-tf"))
          (hsPkgs."exception-transformers" or (buildDepError "exception-transformers"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
          ];
        buildable = true;
        };
      tests = {
        "cross-impl" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."reflex" or (buildDepError "reflex"))
            (hsPkgs."ref-tf" or (buildDepError "ref-tf"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."dependent-map" or (buildDepError "dependent-map"))
            (hsPkgs."MemoTrie" or (buildDepError "MemoTrie"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "spider-bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."dependent-sum" or (buildDepError "dependent-sum"))
            (hsPkgs."dependent-map" or (buildDepError "dependent-map"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."reflex" or (buildDepError "reflex"))
            ];
          buildable = true;
          };
        };
      };
    }