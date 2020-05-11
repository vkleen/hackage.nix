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
      identifier = { name = "mmtf"; version = "0.1.3.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2017—2019, Pavel Yakovlev";
      maintainer = "pavel@yakovlev.me";
      author = "Pavel Yakovlev";
      homepage = "https://github.com/zmactep/mmtf#readme";
      url = "";
      synopsis = "Macromolecular Transmission Format implementation";
      description = "Haskell implementation of MMTF biological structure format.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."data-msgpack" or (buildDepError "data-msgpack"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          ];
        buildable = true;
        };
      tests = {
        "mmtf-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mmtf" or (buildDepError "mmtf"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."data-msgpack" or (buildDepError "data-msgpack"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            ];
          buildable = true;
          };
        };
      };
    }