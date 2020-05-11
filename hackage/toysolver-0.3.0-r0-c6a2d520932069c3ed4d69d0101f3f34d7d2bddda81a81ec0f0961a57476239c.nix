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
    flags = {
      forcechar8 = false;
      buildtoyfmf = false;
      buildsampleprograms = false;
      buildmiscprograms = false;
      exceptions06 = true;
      random1013 = true;
      time15 = true;
      };
    package = {
      specVersion = "1.10";
      identifier = { name = "toysolver"; version = "0.3.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "masahiro.sakai@gmail.com";
      author = "Masahiro Sakai (masahiro.sakai@gmail.com)";
      homepage = "";
      url = "";
      synopsis = "Assorted decision procedures for SAT, Max-SAT, PB, MIP, etc";
      description = "Toy-level implementation of some decision procedures";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."bytestring-builder" or (buildDepError "bytestring-builder"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."primes" or (buildDepError "primes"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."parse-dimacs" or (buildDepError "parse-dimacs"))
          (hsPkgs."queue" or (buildDepError "queue"))
          (hsPkgs."heaps" or (buildDepError "heaps"))
          (hsPkgs."unbounded-delays" or (buildDepError "unbounded-delays"))
          (hsPkgs."vector-space" or (buildDepError "vector-space"))
          (hsPkgs."multiset" or (buildDepError "multiset"))
          (hsPkgs."prettyclass" or (buildDepError "prettyclass"))
          (hsPkgs."type-level-numbers" or (buildDepError "type-level-numbers"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."intern" or (buildDepError "intern"))
          (hsPkgs."loop" or (buildDepError "loop"))
          (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
          (hsPkgs."OptDir" or (buildDepError "OptDir"))
          (hsPkgs."extended-reals" or (buildDepError "extended-reals"))
          (hsPkgs."data-interval" or (buildDepError "data-interval"))
          (hsPkgs."finite-field" or (buildDepError "finite-field"))
          (hsPkgs."sign" or (buildDepError "sign"))
          (hsPkgs."pseudo-boolean" or (buildDepError "pseudo-boolean"))
          ] ++ [
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          ]) ++ (if flags.random1013
          then [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."random" or (buildDepError "random"))
            ]
          else [
            (hsPkgs."random" or (buildDepError "random"))
            ])) ++ (pkgs.lib).optional (compiler.isGhc && true) (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"));
        buildable = true;
        };
      exes = {
        "toysolver" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."OptDir" or (buildDepError "OptDir"))
            (hsPkgs."parse-dimacs" or (buildDepError "parse-dimacs"))
            (hsPkgs."pseudo-boolean" or (buildDepError "pseudo-boolean"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            ];
          buildable = true;
          };
        "toysat" = {
          depends = ([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."parse-dimacs" or (buildDepError "parse-dimacs"))
            (hsPkgs."unbounded-delays" or (buildDepError "unbounded-delays"))
            (hsPkgs."vector-space" or (buildDepError "vector-space"))
            (hsPkgs."pseudo-boolean" or (buildDepError "pseudo-boolean"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            ] ++ (if flags.time15
            then [ (hsPkgs."time" or (buildDepError "time")) ]
            else [
              (hsPkgs."time" or (buildDepError "time"))
              (hsPkgs."old-locale" or (buildDepError "old-locale"))
              ])) ++ (pkgs.lib).optional (flags.forcechar8 && (compiler.isGhc && true)) (hsPkgs."base" or (buildDepError "base"));
          buildable = true;
          };
        "toyfmf" = {
          depends = (pkgs.lib).optionals (flags.buildtoyfmf) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."logic-TPTP" or (buildDepError "logic-TPTP"))
            ];
          buildable = if !flags.buildtoyfmf then false else true;
          };
        "lpconvert" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."parse-dimacs" or (buildDepError "parse-dimacs"))
            (hsPkgs."pseudo-boolean" or (buildDepError "pseudo-boolean"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            ];
          buildable = true;
          };
        "pbconvert" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."parse-dimacs" or (buildDepError "parse-dimacs"))
            (hsPkgs."pseudo-boolean" or (buildDepError "pseudo-boolean"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            ];
          buildable = true;
          };
        "sudoku" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            ];
          buildable = if !flags.buildsampleprograms then false else true;
          };
        "nqueens" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            ];
          buildable = if !flags.buildsampleprograms then false else true;
          };
        "knapsack" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            ];
          buildable = if !flags.buildsampleprograms then false else true;
          };
        "htc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            ];
          buildable = if !flags.buildsampleprograms then false else true;
          };
        "pigeonhole" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."pseudo-boolean" or (buildDepError "pseudo-boolean"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            ];
          buildable = if !flags.buildmiscprograms then false else true;
          };
        "maxsatverify" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            ];
          buildable = if !flags.buildmiscprograms then false else true;
          };
        "pbverify" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."pseudo-boolean" or (buildDepError "pseudo-boolean"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            ];
          buildable = if !flags.buildmiscprograms then false else true;
          };
        };
      tests = {
        "TestSAT" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        "TestSimplex" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
          buildable = true;
          };
        "TestSimplex2" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."vector-space" or (buildDepError "vector-space"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
          buildable = true;
          };
        "TestMIPSolver2" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."vector-space" or (buildDepError "vector-space"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."OptDir" or (buildDepError "OptDir"))
            (hsPkgs."stm" or (buildDepError "stm"))
            ];
          buildable = true;
          };
        "TestPolynomial" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."data-interval" or (buildDepError "data-interval"))
            (hsPkgs."finite-field" or (buildDepError "finite-field"))
            (hsPkgs."prettyclass" or (buildDepError "prettyclass"))
            ];
          buildable = true;
          };
        "TestAReal" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."data-interval" or (buildDepError "data-interval"))
            ];
          buildable = true;
          };
        "TestArith" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."vector-space" or (buildDepError "vector-space"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."data-interval" or (buildDepError "data-interval"))
            (hsPkgs."OptDir" or (buildDepError "OptDir"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        "TestContiTraverso" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."vector-space" or (buildDepError "vector-space"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."OptDir" or (buildDepError "OptDir"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        "TestCongruenceClosure" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        "TestLPFile" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        "TestMPSFile" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        "TestSDPFile" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        "TestUtil" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "BenchmarkSATLIB" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."parse-dimacs" or (buildDepError "parse-dimacs"))
            (hsPkgs."toysolver" or (buildDepError "toysolver"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            ];
          buildable = true;
          };
        };
      };
    }