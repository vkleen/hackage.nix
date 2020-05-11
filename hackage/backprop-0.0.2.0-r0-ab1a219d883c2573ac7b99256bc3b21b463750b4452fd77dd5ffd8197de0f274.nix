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
      identifier = { name = "backprop"; version = "0.0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) Justin Le 2017";
      maintainer = "justin@jle.im";
      author = "Justin Le";
      homepage = "https://github.com/mstksg/backprop";
      url = "";
      synopsis = "Heterogeneous, type-safe automatic backpropagation in Haskell";
      description = "See <https://github.com/mstksg/backprop#readme README.md>\n\nAt the moment, this project is in pre-alpha, and is\npublished and put up on Hackage with 100% documentation\ncoverage as a call for comments and thoughts.  See\n<https://github.com/mstksg/backprop#todo TODO.md> section\nin the README for more information on what's missing and\npotential avenues for contribution.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."ad" or (buildDepError "ad"))
          (hsPkgs."generics-sop" or (buildDepError "generics-sop"))
          (hsPkgs."microlens" or (buildDepError "microlens"))
          (hsPkgs."microlens-mtl" or (buildDepError "microlens-mtl"))
          (hsPkgs."microlens-th" or (buildDepError "microlens-th"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."profunctors" or (buildDepError "profunctors"))
          (hsPkgs."reflection" or (buildDepError "reflection"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."type-combinators" or (buildDepError "type-combinators"))
          ];
        buildable = true;
        };
      exes = {
        "backprop-monotest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."backprop" or (buildDepError "backprop"))
            ];
          buildable = true;
          };
        "backprop-neuraltest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ad" or (buildDepError "ad"))
            (hsPkgs."backprop" or (buildDepError "backprop"))
            (hsPkgs."generics-sop" or (buildDepError "generics-sop"))
            (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
            (hsPkgs."mwc-random" or (buildDepError "mwc-random"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."singletons" or (buildDepError "singletons"))
            (hsPkgs."type-combinators" or (buildDepError "type-combinators"))
            ];
          buildable = true;
          };
        "backprop-mnist" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."backprop" or (buildDepError "backprop"))
            (hsPkgs."bifunctors" or (buildDepError "bifunctors"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."generics-sop" or (buildDepError "generics-sop"))
            (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
            (hsPkgs."mnist-idx" or (buildDepError "mnist-idx"))
            (hsPkgs."mwc-random" or (buildDepError "mwc-random"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "backprop-mnist-bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."backprop" or (buildDepError "backprop"))
            (hsPkgs."bifunctors" or (buildDepError "bifunctors"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."generics-sop" or (buildDepError "generics-sop"))
            (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
            (hsPkgs."mnist-idx" or (buildDepError "mnist-idx"))
            (hsPkgs."mwc-random" or (buildDepError "mwc-random"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."type-combinators" or (buildDepError "type-combinators"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      };
    }