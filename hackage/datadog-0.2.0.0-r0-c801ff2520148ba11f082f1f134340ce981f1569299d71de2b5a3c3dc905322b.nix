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
      identifier = { name = "datadog"; version = "0.2.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "ian@iankduncan.com";
      author = "Ian Duncan";
      homepage = "https://github.com/iand675/datadog";
      url = "";
      synopsis = "Datadog client for Haskell. Supports both the HTTP API and StatsD.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."auto-update" or (buildDepError "auto-update"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."buffer-builder" or (buildDepError "buffer-builder"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."dlist" or (buildDepError "dlist"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "datadog-api-test" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."auto-update" or (buildDepError "auto-update"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."buffer-builder" or (buildDepError "buffer-builder"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."dlist" or (buildDepError "dlist"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
            (hsPkgs."monad-control" or (buildDepError "monad-control"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."datadog" or (buildDepError "datadog"))
            ];
          buildable = true;
          };
        };
      };
    }