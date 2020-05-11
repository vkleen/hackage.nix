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
      identifier = { name = "test-sandbox-compose"; version = "0.1.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "junji.hashimoto@gmail.com";
      author = "Junji Hashimoto";
      homepage = "";
      url = "";
      synopsis = "Lightweight development enviroments using test-sandbox";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."hastache" or (buildDepError "hastache"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."test-sandbox" or (buildDepError "test-sandbox"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."yesod" or (buildDepError "yesod"))
          (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."warp" or (buildDepError "warp"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."shelly" or (buildDepError "shelly"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          ];
        buildable = true;
        };
      exes = {
        "test-sandbox-compose" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."test-sandbox-compose" or (buildDepError "test-sandbox-compose"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hastache" or (buildDepError "hastache"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."test-sandbox" or (buildDepError "test-sandbox"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."yesod" or (buildDepError "yesod"))
            (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."shelly" or (buildDepError "shelly"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."cabal-test-bin" or (buildDepError "cabal-test-bin"))
            (hsPkgs."test-sandbox" or (buildDepError "test-sandbox"))
            (hsPkgs."hspec-test-sandbox" or (buildDepError "hspec-test-sandbox"))
            ];
          buildable = true;
          };
        };
      };
    }