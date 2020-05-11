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
      identifier = { name = "wrecker"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2016 skedge.me";
      maintainer = "jonathangfischoff@gmail.com";
      author = "Jonathan Fischoff";
      homepage = "https://github.com/skedgeme/wrecker#readme";
      url = "";
      synopsis = "A HTTP Performance Benchmarker";
      description = "'wrecker' is a library for creating HTTP benchmarks. It is designed for\nbenchmarking a series of HTTP request were the output of previous requests\nare used as inputs to the next request. This is useful for complex API\nprofiling situations.\n'wrecker' does not provide any mechanism for making HTTP calls. It works\nwith any HTTP client that produces a 'HttpException' during failure (so\nhttp-client and wreq will work out of the box).\nSee the documentation for examples of how to use 'wrecker' with\nbenchmarking scripts.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."stm-chans" or (buildDepError "stm-chans"))
          (hsPkgs."aeson-qq" or (buildDepError "aeson-qq"))
          (hsPkgs."statistics" or (buildDepError "statistics"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."ansigraph" or (buildDepError "ansigraph"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."clock" or (buildDepError "clock"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."tabular" or (buildDepError "tabular"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."threads" or (buildDepError "threads"))
          (hsPkgs."vty" or (buildDepError "vty"))
          (hsPkgs."threads-extras" or (buildDepError "threads-extras"))
          (hsPkgs."clock-extras" or (buildDepError "clock-extras"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."stm-chans" or (buildDepError "stm-chans"))
          (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
          (hsPkgs."unagi-chan" or (buildDepError "unagi-chan"))
          (hsPkgs."next-ref" or (buildDepError "next-ref"))
          ];
        buildable = true;
        };
      tests = {
        "wrecker-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."wrecker" or (buildDepError "wrecker"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-discovery" or (buildDepError "hspec-discovery"))
            ];
          buildable = true;
          };
        };
      };
    }