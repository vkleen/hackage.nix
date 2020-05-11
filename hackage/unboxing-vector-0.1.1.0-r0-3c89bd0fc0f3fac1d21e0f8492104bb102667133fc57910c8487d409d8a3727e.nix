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
      identifier = { name = "unboxing-vector"; version = "0.1.1.0"; };
      license = "BSD-3-Clause";
      copyright = "2019 ARATA Mizuki";
      maintainer = "ARATA Mizuki <minorinoki@gmail.com>";
      author = "ARATA Mizuki <minorinoki@gmail.com>";
      homepage = "https://github.com/minoki/unboxing-vector#readme";
      url = "";
      synopsis = "A newtype-friendly variant of unboxed vectors";
      description = "Please see the README on GitHub at <https://github.com/minoki/unboxing-vector#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."mono-traversable" or (buildDepError "mono-traversable"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "unboxing-vector-test" = {
          depends = [
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."mono-traversable" or (buildDepError "mono-traversable"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."should-not-typecheck" or (buildDepError "should-not-typecheck"))
            (hsPkgs."unboxing-vector" or (buildDepError "unboxing-vector"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        "unboxing-vector-test-deriving-via" = {
          depends = [
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."mono-traversable" or (buildDepError "mono-traversable"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."should-not-typecheck" or (buildDepError "should-not-typecheck"))
            (hsPkgs."unboxing-vector" or (buildDepError "unboxing-vector"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = if compiler.isGhc && (compiler.version).ge "8.6.1"
            then true
            else false;
          };
        "unboxing-vector-test-gnd" = {
          depends = [
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."mono-traversable" or (buildDepError "mono-traversable"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."unboxing-vector" or (buildDepError "unboxing-vector"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = if compiler.isGhc && (compiler.version).ge "8.2.1"
            then true
            else false;
          };
        };
      benchmarks = {
        "unboxing-vector-benchmark" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."mono-traversable" or (buildDepError "mono-traversable"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."unboxing-vector" or (buildDepError "unboxing-vector"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      };
    }