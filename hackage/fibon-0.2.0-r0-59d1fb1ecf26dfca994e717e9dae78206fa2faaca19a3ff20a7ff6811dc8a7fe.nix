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
    flags = { analyse = true; };
    package = {
      specVersion = "1.8";
      identifier = { name = "fibon"; version = "0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "dmp@rice.edu";
      author = "David M Peixotto";
      homepage = "http://github.com/dmpots/fibon/wiki";
      url = "";
      synopsis = "Tools for running and analyzing Haskell benchmarks ";
      description = "Fibon is a set of tools for running and analyzing benchmark programs.\nThe fibon package contains the tools for benchmarking, but not the\nbenchmarks themselves. The package will build, but will not have any\nbenchmarks to run. A set of benchmarks can be found in the github repo\n\n<http://github.com/dmpots/fibon-benchmarks>\n\nFibon is a pure Haskell framework for running and analyzing benchmarks. Cabal\nis used for building the benchmarks, and the benchmark harness, configuration\nfiles, and benchmark descriptions are all written in Haskell. The benchmark\ndescriptions and run configurations are all statically compiled into the\nbenchmark runner to ensure that configuration errors are found at compile\ntime.\n\nThe Fibon tools are not tied to any compiler infrastructure and can build\nbenchmarks using any compiler supported by cabal. However, there are some\nextra features available when using GHC to build the benchmarks:\n* Support in config files for inplace GHC HEAD builds\n* Support in `fibon-run` for collecting GC stats from GHC compiled programs\n* Support in `fibon-analyse` for reading GC stats from Fibon result files\n\nFor more details see the Fibon wiki: <http://github.com/dmpots/fibon/wiki>";
      buildType = "Custom";
      };
    components = {
      exes = {
        "fibon-run" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."statistics" or (buildDepError "statistics"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."syb" or (buildDepError "syb"))
            ];
          buildable = true;
          };
        "fibon-init" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            ];
          buildable = true;
          };
        "fibon-analyse" = {
          depends = (pkgs.lib).optionals (flags.analyse) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."tabular" or (buildDepError "tabular"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."statistics" or (buildDepError "statistics"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."bytestring-lexing" or (buildDepError "bytestring-lexing"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."syb" or (buildDepError "syb"))
            ];
          buildable = if flags.analyse then true else false;
          };
        };
      };
    }