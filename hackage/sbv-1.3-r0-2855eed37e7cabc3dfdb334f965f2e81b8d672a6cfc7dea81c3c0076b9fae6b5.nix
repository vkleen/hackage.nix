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
      specVersion = "1.6";
      identifier = { name = "sbv"; version = "1.3"; };
      license = "BSD-3-Clause";
      copyright = "Levent Erkok, 2010-2012";
      maintainer = "Levent Erkok (erkokl@gmail.com)";
      author = "Levent Erkok";
      homepage = "http://github.com/LeventErkok/sbv";
      url = "";
      synopsis = "Symbolic bit vectors: Bit-precise verification and automatic C-code generation.";
      description = "Express properties about bit-precise Haskell programs and automatically prove\nthem using SMT solvers. Automatically generate C programs from Haskell functions.\nThe SBV library adds support for symbolic bit vectors, allowing formal models of\nbit-precise programs to be created.\n\n>   \$ ghci -XScopedTypeVariables\n>   Prelude> :m Data.SBV\n>   Prelude Data.SBV> prove \$ \\(x::SWord8) -> x `shiftL` 2 .== 4*x\n>   Q.E.D.\n>   Prelude Data.SBV> prove \$ forAll [\"x\"] \$ \\(x::SWord8) -> x `shiftL` 2 .== x\n>   Falsifiable. Counter-example:\n>     x = 128 :: SWord8\n\nThe library introduces the following types and concepts:\n\n* 'SBool': Symbolic Booleans (bits)\n\n* 'SWord8', 'SWord16', 'SWord32', 'SWord64': Symbolic Words (unsigned)\n\n* 'SInt8',  'SInt16',  'SInt32',  'SInt64': Symbolic Ints (signed)\n\n* 'SInteger': Symbolic unbounded integers (signed)\n\n* 'SArray', 'SFunArray': Flat arrays of symbolic values\n\n* 'STree': Full binary trees of symbolic values (for fast symbolic access)\n\n* Symbolic polynomials over GF(2^n), and polynomial arithmetic\n\n* Uninterpreted constants and functions over symbolic values, with user\ndefined SMT-Lib axioms\n\nFunctions built out of these types can be:\n\n* proven correct via an external SMT solver (the 'prove' function)\n\n* checked for satisfiability (the 'sat', and 'allSat' functions)\n\n* used in synthesis (the 'sat' function with existential variables)\n\n* optimized with respect to cost functions (the 'optimize', 'maximize', and 'minimize' functions)\n\n* quick-checked\n\n* used in concrete test case generation (the 'genTest' function), rendered as values in various\nlanguages, including Haskell and C.\n\nPredicates can have both existential and universal variables. Use of\nalternating quantifiers provides considerable expressive power.\nFurthermore, existential variables allow synthesis via model generation.\n\nThe SBV library can also compile Haskell functions that manipulate symbolic\nvalues directly to C, rendering them as straight-line C programs.\n\nIn addition to the library, the installation will create the\nexecutable @SBVUnitTests@. You should run it once the installation is complete,\nto make sure the unit tests are run and all is well.\n\nSBV is hosted at GitHub: <http://github.com/LeventErkok/sbv>. Comments,\nbug reports, and patches are always welcome.\n\nThe following people reported bugs, provided comments/feedback, or contributed to the\ndevelopment of SBV in various ways: Ian Blumenfeld, Ian Calvert, Iavor Diatchki,\nTom Hawkins, Lee Pike, Austin Seipp, Don Stewart, Josef Svenningsson, and Nis Wegmann.\n\nRelease notes can be seen at: <http://github.com/LeventErkok/sbv/blob/master/RELEASENOTES>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."strict-concurrency" or (buildDepError "strict-concurrency"))
          ];
        buildable = true;
        };
      exes = {
        "SBVUnitTests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        };
      };
    }