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
      identifier = { name = "genvalidity-hspec-aeson"; version = "0.0.1.0"; };
      license = "MIT";
      copyright = "Copyright: (c) 2016 Tom Sydney Kerckhove";
      maintainer = "syd.kerckhove@gmail.com";
      author = "Tom Sydney Kerckhove";
      homepage = "http://cs-syd.eu";
      url = "";
      synopsis = "Standard spec's for aeson-related instances";
      description = "Standard spec's for aeson-related Instances";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."genvalidity-hspec" or (buildDepError "genvalidity-hspec"))
          (hsPkgs."genvalidity" or (buildDepError "genvalidity"))
          (hsPkgs."hspec" or (buildDepError "hspec"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ];
        buildable = true;
        };
      tests = {
        "genvalidity-hspec-aeson-doctests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."genvalidity-hspec-aeson" or (buildDepError "genvalidity-hspec-aeson"))
            ];
          buildable = true;
          };
        "genvalidity-hspec-aeson-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."genvalidity" or (buildDepError "genvalidity"))
            (hsPkgs."genvalidity-hspec-aeson" or (buildDepError "genvalidity-hspec-aeson"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."genvalidity-text" or (buildDepError "genvalidity-text"))
            ];
          buildable = true;
          };
        };
      };
    }