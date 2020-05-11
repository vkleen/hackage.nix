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
      specVersion = "1.6.0.1";
      identifier = { name = "hums"; version = "0.2.2"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Bardur Arantsson <bardur@scientician.net>";
      author = "Bardur Arantsson";
      homepage = "";
      url = "";
      synopsis = "Haskell UPnP Media Server";
      description = "A simple UPnP Media Server.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hums" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."uuid" or (buildDepError "uuid"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."hxt" or (buildDepError "hxt"))
            (hsPkgs."ConfigFile" or (buildDepError "ConfigFile"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network-bytestring" or (buildDepError "network-bytestring"))
            ];
          buildable = true;
          };
        };
      };
    }