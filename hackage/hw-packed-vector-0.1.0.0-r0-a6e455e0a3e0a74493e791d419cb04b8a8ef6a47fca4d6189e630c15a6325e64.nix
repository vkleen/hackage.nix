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
      specVersion = "2.2";
      identifier = { name = "hw-packed-vector"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2016-2019 John Ky";
      maintainer = "newhoggy@gmail.com";
      author = "John Ky";
      homepage = "http://github.com/haskell-works/hw-packed-vector#readme";
      url = "";
      synopsis = "Packed Vector";
      description = "Packed Vector. Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."hw-bits" or (buildDepError "hw-bits"))
          (hsPkgs."hw-prim" or (buildDepError "hw-prim"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      exes = {
        "hw-packed-vector" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."generic-lens" or (buildDepError "generic-lens"))
            (hsPkgs."hw-bits" or (buildDepError "hw-bits"))
            (hsPkgs."hw-prim" or (buildDepError "hw-prim"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."hw-packed-vector" or (buildDepError "hw-packed-vector"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8") (hsPkgs."semigroups" or (buildDepError "semigroups"));
          buildable = true;
          };
        };
      tests = {
        "hw-packed-vector-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hw-bits" or (buildDepError "hw-bits"))
            (hsPkgs."hw-hedgehog" or (buildDepError "hw-hedgehog"))
            (hsPkgs."hw-hspec-hedgehog" or (buildDepError "hw-hspec-hedgehog"))
            (hsPkgs."hw-prim" or (buildDepError "hw-prim"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."hw-packed-vector" or (buildDepError "hw-packed-vector"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover or (pkgs.buildPackages.hspec-discover or (buildToolDepError "hspec-discover")))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hw-prim" or (buildDepError "hw-prim"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."hw-packed-vector" or (buildDepError "hw-packed-vector"))
            ];
          buildable = true;
          };
        };
      };
    }