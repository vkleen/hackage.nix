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
      identifier = { name = "schematic"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "denis.redozubov@gmail.com";
      author = "Denis Redozubov";
      homepage = "";
      url = "";
      synopsis = "JSON-biased spec and validation tool";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."hjsonschema" or (buildDepError "hjsonschema"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."singletons" or (buildDepError "singletons"))
          (hsPkgs."smallcheck" or (buildDepError "smallcheck"))
          (hsPkgs."smallcheck-series" or (buildDepError "smallcheck-series"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."validationt" or (buildDepError "validationt"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vinyl" or (buildDepError "vinyl"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hjsonschema" or (buildDepError "hjsonschema"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-core" or (buildDepError "hspec-core"))
            (hsPkgs."hspec-discover" or (buildDepError "hspec-discover"))
            (hsPkgs."hspec-smallcheck" or (buildDepError "hspec-smallcheck"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."schematic" or (buildDepError "schematic"))
            (hsPkgs."smallcheck" or (buildDepError "smallcheck"))
            (hsPkgs."smallcheck-series" or (buildDepError "smallcheck-series"))
            (hsPkgs."singletons" or (buildDepError "singletons"))
            (hsPkgs."tagged" or (buildDepError "tagged"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."validationt" or (buildDepError "validationt"))
            (hsPkgs."vinyl" or (buildDepError "vinyl"))
            ];
          buildable = true;
          };
        };
      };
    }