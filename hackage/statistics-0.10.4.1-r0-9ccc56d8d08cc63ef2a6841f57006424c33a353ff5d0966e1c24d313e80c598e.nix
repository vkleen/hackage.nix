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
      identifier = { name = "statistics"; version = "0.10.4.1"; };
      license = "BSD-3-Clause";
      copyright = "2009, 2010, 2011 Bryan O'Sullivan";
      maintainer = "Bryan O'Sullivan <bos@serpentine.com>";
      author = "Bryan O'Sullivan <bos@serpentine.com>";
      homepage = "https://github.com/bos/statistics";
      url = "";
      synopsis = "A library of statistical types, data, and functions";
      description = "This library provides a number of common functions and types useful\nin statistics.  We focus on high performance, numerical robustness,\nand use of good algorithms.  Where possible, we provide\nreferences to the statistical literature.\n\nThe library's facilities can be divided into four broad categories:\n\n* Working with widely used discrete and continuous probability\ndistributions.  (There are dozens of exotic distributions in use;\nwe focus on the most common.)\n\n* Computing with sample data: quantile estimation, kernel density\nestimation, histograms, bootstrap methods, significance testing,\nand autocorrelation analysis.\n\n* Random variate generation under several different distributions.\n\n* Common statistical tests for significant differences between\nsamples.\n\nChanges in 0.10.4.0\n\n* Support for versions of GHC older than 7.2 is discontinued.\n\n* All datatypes now support 'Data.Binary' and 'GHC.Generics'.\n\nChanges in 0.10.3.0\n\n* Bug fixes\n\nChanges in 0.10.2.0\n\n* Bugs in DCT and IDCT are fixed.\n\n* Accesors for uniform distribution are added.\n\n* 'ContGen' instances for all continous distribtuions are added.\n\n* Beta distribution is added.\n\n* Constructor for improper gamma distribtuion is added.\n\n* Binomial distribution allows zero trials.\n\n* Poisson distribution now accept zero parameter.\n\n* Integer overflow in caculation of Wilcoxon-T test is fixed.\n\n* Bug in 'ContGen' instance for normal distribution is fixed.\n\nChanges in 0.10.1.0\n\n* Kolmogorov-Smirnov nonparametric test added.\n\n* Pearson's chi squared test added.\n\n* Type class for generating random variates for given distribution\nis added.\n\n* Modules 'Statistics.Math' and 'Statistics.Constants' are moved to\nthe @math-functions@ package. They are still available but marked\nas deprecated.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."erf" or (buildDepError "erf"))
          (hsPkgs."monad-par" or (buildDepError "monad-par"))
          (hsPkgs."mwc-random" or (buildDepError "mwc-random"))
          (hsPkgs."math-functions" or (buildDepError "math-functions"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vector-algorithms" or (buildDepError "vector-algorithms"))
          (hsPkgs."vector-binary-instances" or (buildDepError "vector-binary-instances"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.6") (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "6.10") (hsPkgs."base" or (buildDepError "base"));
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ieee754" or (buildDepError "ieee754"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."math-functions" or (buildDepError "math-functions"))
            (hsPkgs."mwc-random" or (buildDepError "mwc-random"))
            (hsPkgs."statistics" or (buildDepError "statistics"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."vector-algorithms" or (buildDepError "vector-algorithms"))
            (hsPkgs."erf" or (buildDepError "erf"))
            ];
          buildable = true;
          };
        };
      };
    }