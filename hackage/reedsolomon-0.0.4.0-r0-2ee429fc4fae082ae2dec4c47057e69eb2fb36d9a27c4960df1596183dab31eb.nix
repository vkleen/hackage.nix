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
    flags = { simd = true; llvm = true; examples = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "reedsolomon"; version = "0.0.4.0"; };
      license = "MIT";
      copyright = "(c) 2015, 2016, Nicolas Trangez\n(c) 2015, Klaus Post\n(c) 2015, Backblaze";
      maintainer = "ikke@nicolast.be";
      author = "Nicolas Trangez";
      homepage = "http://github.com/NicolasT/reedsolomon";
      url = "";
      synopsis = "Reed-Solomon Erasure Coding in Haskell";
      description = "Please see README.md";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."loop" or (buildDepError "loop"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."profunctors" or (buildDepError "profunctors"))
          (hsPkgs."gitrev" or (buildDepError "gitrev"))
          ];
        buildable = true;
        };
      exes = {
        "reedsolomon-simple-encoder" = {
          depends = (pkgs.lib).optionals (!system.isWindows && flags.examples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."bytestring-mmap" or (buildDepError "bytestring-mmap"))
            (hsPkgs."reedsolomon" or (buildDepError "reedsolomon"))
            ];
          buildable = if !system.isWindows && flags.examples
            then true
            else false;
          };
        "reedsolomon-simple-decoder" = {
          depends = (pkgs.lib).optionals (!system.isWindows && flags.examples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."bytestring-mmap" or (buildDepError "bytestring-mmap"))
            (hsPkgs."reedsolomon" or (buildDepError "reedsolomon"))
            ];
          buildable = if !system.isWindows && flags.examples
            then true
            else false;
          };
        "reedsolomon-simple-bench" = {
          depends = (pkgs.lib).optionals (flags.examples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."statistics" or (buildDepError "statistics"))
            (hsPkgs."reedsolomon" or (buildDepError "reedsolomon"))
            ];
          buildable = if flags.examples then true else false;
          };
        "reedsolomon-profiling" = {
          depends = (pkgs.lib).optionals (flags.examples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."clock" or (buildDepError "clock"))
            (hsPkgs."reedsolomon" or (buildDepError "reedsolomon"))
            ];
          buildable = if flags.examples then true else false;
          };
        };
      tests = {
        "reedsolomon-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."loop" or (buildDepError "loop"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."profunctors" or (buildDepError "profunctors"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-ant-xml" or (buildDepError "tasty-ant-xml"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."reedsolomon" or (buildDepError "reedsolomon"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "reedsolomon-bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."loop" or (buildDepError "loop"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."reedsolomon" or (buildDepError "reedsolomon"))
            ];
          buildable = true;
          };
        };
      };
    }