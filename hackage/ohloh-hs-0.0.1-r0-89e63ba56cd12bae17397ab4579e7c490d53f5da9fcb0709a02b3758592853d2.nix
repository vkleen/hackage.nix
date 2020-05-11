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
      specVersion = "1.9.2";
      identifier = { name = "ohloh-hs"; version = "0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Frank S. Thomas <frank@timepit.eu>";
      author = "Frank S. Thomas <frank@timepit.eu>";
      homepage = "https://github.com/fthomas/ohloh-hs";
      url = "";
      synopsis = "Interface to the Ohloh API";
      description = "ohloh-hs is an interface to the Ohloh API (<http://www.ohloh.net>), which\nprovides access to the data of the Ohloh open source directory. It consists\nmainly of simple data types for the items exposed by the API and\ncorresponding \"Text.XML.HXT.Arrow.Pickle\" pickler functions in order to\nconvert those types from\\/to XML easily.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."data-lens" or (buildDepError "data-lens"))
          (hsPkgs."hxt" or (buildDepError "hxt"))
          (hsPkgs."text-format-simple" or (buildDepError "text-format-simple"))
          ];
        buildable = true;
        };
      exes = {
        "cmdoh" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."data-lens" or (buildDepError "data-lens"))
            (hsPkgs."hxt" or (buildDepError "hxt"))
            (hsPkgs."hxt-curl" or (buildDepError "hxt-curl"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."pretty-show" or (buildDepError "pretty-show"))
            (hsPkgs."text-format-simple" or (buildDepError "text-format-simple"))
            ];
          buildable = true;
          };
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."data-lens" or (buildDepError "data-lens"))
            (hsPkgs."hxt" or (buildDepError "hxt"))
            (hsPkgs."text-format-simple" or (buildDepError "text-format-simple"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }