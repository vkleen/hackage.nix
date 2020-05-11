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
      data-dword-inst = true;
      network-ip-inst = true;
      cryptonite-inst = true;
      exes = true;
      };
    package = {
      specVersion = "1.10";
      identifier = { name = "memorable-bits"; version = "0.1.0.1"; };
      license = "BSD-2-Clause";
      copyright = "";
      maintainer = "lukec@themk.net";
      author = "Luke Clifton";
      homepage = "";
      url = "";
      synopsis = "Generate human memorable strings from binary data.";
      description = "I library for creating human readable strings from\nvarious types of data. Also a DSL for comming up\nwith patterns.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bits" or (buildDepError "bits"))
          (hsPkgs."bytes" or (buildDepError "bytes"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ] ++ (pkgs.lib).optionals (flags.network-ip-inst) [
          (hsPkgs."network-ip" or (buildDepError "network-ip"))
          (hsPkgs."data-dword" or (buildDepError "data-dword"))
          ]) ++ (pkgs.lib).optional (flags.data-dword-inst) (hsPkgs."data-dword" or (buildDepError "data-dword"))) ++ (pkgs.lib).optionals (flags.cryptonite-inst) [
          (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
          (hsPkgs."memory" or (buildDepError "memory"))
          ];
        buildable = true;
        };
      exes = {
        "membits" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."memorable-bits" or (buildDepError "memorable-bits"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            ];
          buildable = if !flags.exes then false else true;
          };
        };
      tests = {
        "test-memorable-bits" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."memorable-bits" or (buildDepError "memorable-bits"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-smallcheck" or (buildDepError "tasty-smallcheck"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench-memorable-bits" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."memorable-bits" or (buildDepError "memorable-bits"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      };
    }