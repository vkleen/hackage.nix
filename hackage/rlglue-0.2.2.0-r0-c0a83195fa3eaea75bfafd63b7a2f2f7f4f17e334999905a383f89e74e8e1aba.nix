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
      identifier = { name = "rlglue"; version = "0.2.2.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "rhofer@alumni.cmu.edu";
      author = "Richard Alex Hofer";
      homepage = "";
      url = "";
      synopsis = "A Haskell codec for RL-Glue.";
      description = "A codec to allow Haskell programs to interact with reinforcement learning\nprograms using the RL_Glue protocol.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."network-simple" or (buildDepError "network-simple"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."data-binary-ieee754" or (buildDepError "data-binary-ieee754"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."network" or (buildDepError "network"))
          ];
        buildable = true;
        };
      exes = {
        "skeleton-experiment" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network-simple" or (buildDepError "network-simple"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."data-binary-ieee754" or (buildDepError "data-binary-ieee754"))
            (hsPkgs."network" or (buildDepError "network"))
            ];
          buildable = true;
          };
        "skeleton-environment" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network-simple" or (buildDepError "network-simple"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."data-binary-ieee754" or (buildDepError "data-binary-ieee754"))
            (hsPkgs."network" or (buildDepError "network"))
            ];
          buildable = true;
          };
        "skeleton-agent" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network-simple" or (buildDepError "network-simple"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."data-binary-ieee754" or (buildDepError "data-binary-ieee754"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."network" or (buildDepError "network"))
            ];
          buildable = true;
          };
        };
      };
    }