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
      identifier = { name = "nats-queue"; version = "0.1.2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "palkovsky.ondrej@gmail.com";
      author = "Ondrej Palkovsky";
      homepage = "";
      url = "";
      synopsis = "Haskell API for NATS messaging system";
      description = "This library is a Haskell driver for NATS <http://nats.io>.\nNATS is a fast and lightweight publish-subscribe messaging system.\nThis version supports authentication but does not support SSL as the current\nversion of gnatsd (go server 0.5.6) does not support it either.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."dequeue" or (buildDepError "dequeue"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."async" or (buildDepError "async"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."nats-queue" or (buildDepError "nats-queue"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."dequeue" or (buildDepError "dequeue"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."network-uri" or (buildDepError "network-uri"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            ];
          buildable = true;
          };
        };
      };
    }