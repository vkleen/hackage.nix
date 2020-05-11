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
      specVersion = "1.18";
      identifier = { name = "htoml-megaparsec"; version = "1.0.1.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2013-2016 Cies Breijs, 2017 Vanessa McHale";
      maintainer = "Vanessa McHale <vanessa.mchale@reconfigure.io>";
      author = "Cies Breijs, Vanessa McHale";
      homepage = "https://github.com/vmchale/htoml-megaparsec";
      url = "";
      synopsis = "Parser for TOML files";
      description = "TOML is an obvious and minimal format for config files.\nThis package provides a TOML parser\nbuilt with the Megaparsec. It exposes a JSON\ninterface using Aeson.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."composition-prelude" or (buildDepError "composition-prelude"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          ];
        buildable = true;
        };
      tests = {
        "htoml-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."htoml-megaparsec" or (buildDepError "htoml-megaparsec"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hspec" or (buildDepError "tasty-hspec"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "benchmarks" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."htoml-megaparsec" or (buildDepError "htoml-megaparsec"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            ];
          buildable = true;
          };
        };
      };
    }