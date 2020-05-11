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
    flags = { synthesis = false; chart = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "array-forth"; version = "0.2.1.4"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "Tikhon Jelvis <tikhon@jelv.is>";
      author = "Tikhon Jelvis <tikhon@jelv.is>";
      homepage = "";
      url = "";
      synopsis = "A simple interpreter for arrayForth, the language used on GreenArrays chips.";
      description = "This is a package for working with arrayForth. This is a variant of Forth used by GreenArrays chips. This package contains an arrayForth simulator, two different representations of arrayForth programs and some utilities like parsing.\nIt also supports synthesizing arrayForth programs using MCMC. The basic idea is to find arrayForth programs by taking a simple prior distribution of programs and using a randomized hill-climbing algorithm to find a program fulfilling certain tests.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."mcmc-synthesis" or (buildDepError "mcmc-synthesis"))
          (hsPkgs."modular-arithmetic" or (buildDepError "modular-arithmetic"))
          (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
          (hsPkgs."OddWord" or (buildDepError "OddWord"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      exes = {
        "mcmc-demo" = {
          depends = (pkgs.lib).optionals (flags.synthesis) [
            (hsPkgs."array-forth" or (buildDepError "array-forth"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mcmc-synthesis" or (buildDepError "mcmc-synthesis"))
            (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            ];
          buildable = if flags.synthesis then true else false;
          };
        "array-forth" = {
          depends = [
            (hsPkgs."array-forth" or (buildDepError "array-forth"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        "chart" = {
          depends = (pkgs.lib).optionals (flags.chart) [
            (hsPkgs."array-forth" or (buildDepError "array-forth"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Chart" or (buildDepError "Chart"))
            (hsPkgs."mcmc-synthesis" or (buildDepError "mcmc-synthesis"))
            (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            ];
          buildable = if flags.chart then true else false;
          };
        };
      tests = {
        "test-array-forth" = {
          depends = [
            (hsPkgs."array-forth" or (buildDepError "array-forth"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-th" or (buildDepError "test-framework-th"))
            ];
          buildable = true;
          };
        };
      };
    }