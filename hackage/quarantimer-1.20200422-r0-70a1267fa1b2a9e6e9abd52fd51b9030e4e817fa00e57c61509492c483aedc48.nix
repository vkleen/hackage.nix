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
      specVersion = "1.8";
      identifier = { name = "quarantimer"; version = "1.20200422"; };
      license = "BSD-2-Clause";
      copyright = "2020 Joey Hess";
      maintainer = "Joey Hess <id@joeyh.name>";
      author = "Joey Hess";
      homepage = "https://quarantimer.app/";
      url = "";
      synopsis = "Coronavirus quarantine timer web app for your things";
      description = "Web app that tracks how long things potentially contaminated with\nCovid-19 have been in quarantine.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "quarantimer" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-server" or (buildDepError "servant-server"))
            (hsPkgs."servant-client" or (buildDepError "servant-client"))
            (hsPkgs."servant-lucid" or (buildDepError "servant-lucid"))
            (hsPkgs."servant-multipart" or (buildDepError "servant-multipart"))
            (hsPkgs."lucid" or (buildDepError "lucid"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."warp-tls" or (buildDepError "warp-tls"))
            (hsPkgs."uuid" or (buildDepError "uuid"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."sandi" or (buildDepError "sandi"))
            ];
          buildable = true;
          };
        };
      };
    }