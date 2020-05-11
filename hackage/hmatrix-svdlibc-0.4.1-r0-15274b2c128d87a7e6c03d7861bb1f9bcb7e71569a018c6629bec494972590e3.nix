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
      identifier = { name = "hmatrix-svdlibc"; version = "0.4.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2014 Ben Gamari";
      maintainer = "ben@smart-cactus.org";
      author = "Ben Gamari";
      homepage = "http://github.com/bgamari/hmatrix-svdlibc";
      url = "";
      synopsis = "SVDLIBC bindings for HMatrix";
      description = "Bindings for the sparse singular value decomposition\nprovided by SVDLIBC.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "svdlibc-test" = {
          depends = [
            (hsPkgs."hmatrix-svdlibc" or (buildDepError "hmatrix-svdlibc"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "svdlibc-benchmarks" = {
          depends = [
            (hsPkgs."hmatrix-svdlibc" or (buildDepError "hmatrix-svdlibc"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            ];
          buildable = true;
          };
        };
      };
    }