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
      identifier = { name = "on-demand-ssh-tunnel"; version = "0.1.0.6"; };
      license = "MIT";
      copyright = "(c) 2015 Predrag Radovic";
      maintainer = "predrg@gmail.com";
      author = "Predrag Radovic";
      homepage = "https://github.com/crackleware/on-demand-ssh-tunnel";
      url = "";
      synopsis = "Program that sends traffic through SSH tunnels on-demand";
      description = "Program that sends traffic through SSH tunnels on-demand";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."GenericPretty" or (buildDepError "GenericPretty"))
          ];
        buildable = true;
        };
      exes = {
        "on-demand-ssh-tunnel" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."GenericPretty" or (buildDepError "GenericPretty"))
            (hsPkgs."on-demand-ssh-tunnel" or (buildDepError "on-demand-ssh-tunnel"))
            ];
          buildable = true;
          };
        };
      };
    }