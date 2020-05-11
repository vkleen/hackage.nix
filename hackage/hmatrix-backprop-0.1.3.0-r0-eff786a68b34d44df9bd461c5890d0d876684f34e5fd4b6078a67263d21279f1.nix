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
      identifier = { name = "hmatrix-backprop"; version = "0.1.3.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) Justin Le 2018";
      maintainer = "justin@jle.im";
      author = "Justin Le";
      homepage = "https://github.com/mstksg/hmatrix-backprop#readme";
      url = "";
      synopsis = "hmatrix operations lifted for backprop";
      description = "hmatrix operations lifted for backprop, along with orphan instances.\n\nMeant to act as a drop-in replacement to the API of\nNumeric.LinearAlgebra.Static.  Just change your imports, and your\nfunctions are automatically backpropagatable.\n\nSee README on Github at <https://github.com/mstksg/hmatrix-backprop#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."backprop" or (buildDepError "backprop"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."ghc-typelits-knownnat" or (buildDepError "ghc-typelits-knownnat"))
          (hsPkgs."ghc-typelits-natnormalise" or (buildDepError "ghc-typelits-natnormalise"))
          (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
          (hsPkgs."hmatrix-vector-sized" or (buildDepError "hmatrix-vector-sized"))
          (hsPkgs."microlens" or (buildDepError "microlens"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vector-sized" or (buildDepError "vector-sized"))
          (hsPkgs."vinyl" or (buildDepError "vinyl"))
          ];
        buildable = true;
        };
      tests = {
        "hmatrix-backprop-test" = {
          depends = [
            (hsPkgs."backprop" or (buildDepError "backprop"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."finite-typelits" or (buildDepError "finite-typelits"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
            (hsPkgs."hmatrix-backprop" or (buildDepError "hmatrix-backprop"))
            (hsPkgs."hmatrix-vector-sized" or (buildDepError "hmatrix-vector-sized"))
            (hsPkgs."microlens" or (buildDepError "microlens"))
            (hsPkgs."microlens-platform" or (buildDepError "microlens-platform"))
            (hsPkgs."vector-sized" or (buildDepError "vector-sized"))
            (hsPkgs."vinyl" or (buildDepError "vinyl"))
            ];
          buildable = true;
          };
        };
      };
    }