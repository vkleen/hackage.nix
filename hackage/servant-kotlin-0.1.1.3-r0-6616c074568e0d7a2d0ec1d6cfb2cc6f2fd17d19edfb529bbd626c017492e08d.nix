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
      identifier = { name = "servant-kotlin"; version = "0.1.1.3"; };
      license = "MIT";
      copyright = "2017-2018 MATSUBARA Nobutada";
      maintainer = "MATSUBARA Nobutada";
      author = "MATSUBARA Nobutada";
      homepage = "https://github.com/matsubara0507/servant-kotlin#readme";
      url = "";
      synopsis = "Automatically derive Kotlin class to query servant webservices";
      description = "See README at <https://github.com/matsubara0507/servant-kotlin#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."formatting" or (buildDepError "formatting"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."servant" or (buildDepError "servant"))
          (hsPkgs."servant-foreign" or (buildDepError "servant-foreign"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."wl-pprint-text" or (buildDepError "wl-pprint-text"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."formatting" or (buildDepError "formatting"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."http-api-data" or (buildDepError "http-api-data"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-foreign" or (buildDepError "servant-foreign"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."wl-pprint-text" or (buildDepError "wl-pprint-text"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "generate-test" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."formatting" or (buildDepError "formatting"))
            (hsPkgs."http-api-data" or (buildDepError "http-api-data"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-foreign" or (buildDepError "servant-foreign"))
            (hsPkgs."servant-kotlin" or (buildDepError "servant-kotlin"))
            (hsPkgs."shelly" or (buildDepError "shelly"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."wl-pprint-text" or (buildDepError "wl-pprint-text"))
            ];
          buildable = true;
          };
        };
      };
    }