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
      specVersion = "1.2";
      identifier = { name = "satchmo-examples"; version = "1.4.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Johannes Waldmann";
      author = "Johannes Waldmann";
      homepage = "http://dfa.imn.htwk-leipzig.de/satchmo/";
      url = "";
      synopsis = "examples that show how to use satchmo";
      description = "examples that show how to use satchmo";
      buildType = "Simple";
      };
    components = {
      exes = {
        "Factor" = {
          depends = [
            (hsPkgs."satchmo" or (buildDepError "satchmo"))
            (hsPkgs."satchmo-backends" or (buildDepError "satchmo-backends"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."array" or (buildDepError "array"))
            ];
          buildable = true;
          };
        "HC" = {
          depends = [
            (hsPkgs."satchmo" or (buildDepError "satchmo"))
            (hsPkgs."satchmo-backends" or (buildDepError "satchmo-backends"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."array" or (buildDepError "array"))
            ];
          buildable = true;
          };
        "VC" = {
          depends = [
            (hsPkgs."satchmo" or (buildDepError "satchmo"))
            (hsPkgs."satchmo-funsat" or (buildDepError "satchmo-funsat"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."array" or (buildDepError "array"))
            ];
          buildable = true;
          };
        "QBF" = {
          depends = [
            (hsPkgs."satchmo" or (buildDepError "satchmo"))
            (hsPkgs."satchmo-backends" or (buildDepError "satchmo-backends"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."array" or (buildDepError "array"))
            ];
          buildable = true;
          };
        };
      };
    }