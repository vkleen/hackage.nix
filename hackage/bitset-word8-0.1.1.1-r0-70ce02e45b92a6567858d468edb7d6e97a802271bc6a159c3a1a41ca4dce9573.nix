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
      identifier = { name = "bitset-word8"; version = "0.1.1.1"; };
      license = "MIT";
      copyright = "2017,2018 Naoto Shimazaki";
      maintainer = "Naoto.Shimazaki@gmail.com";
      author = "Naoto Shimazaki";
      homepage = "https://github.com/nshimaza/bitset-word8#readme";
      url = "";
      synopsis = "Space efficient set of Word8 and some pre-canned sets useful for parsing HTTP";
      description = "Please see the README on GitHub at <https://github.com/nshimaza/bitset-word8#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."th-lift-instances" or (buildDepError "th-lift-instances"))
          ];
        buildable = true;
        };
      tests = {
        "bitset-word8-test" = {
          depends = [
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bitset-word8" or (buildDepError "bitset-word8"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."th-lift-instances" or (buildDepError "th-lift-instances"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bitset-word8-bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bitset-word8" or (buildDepError "bitset-word8"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."th-lift-instances" or (buildDepError "th-lift-instances"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      };
    }