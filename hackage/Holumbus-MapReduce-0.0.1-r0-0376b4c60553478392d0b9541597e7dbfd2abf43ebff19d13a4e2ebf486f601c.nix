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
      specVersion = "1.6";
      identifier = { name = "Holumbus-MapReduce"; version = "0.0.1"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Copyright (c) 2008 Uwe Schmidt, Stefan Schmidt";
      maintainer = "Stefan Schmidt <sts@holumbus.org>";
      author = "Uwe Schmidt, Stefan Schmidt";
      homepage = "http://holumbus.fh-wedel.de";
      url = "";
      synopsis = "a distributed MapReduce framework";
      description = "This package contains a library and tools for the\ncreation of distributed MapReduce applications.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."haskell98" or (buildDepError "haskell98"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."hxt" or (buildDepError "hxt"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."Holumbus-Distribution" or (buildDepError "Holumbus-Distribution"))
          (hsPkgs."Holumbus-Storage" or (buildDepError "Holumbus-Storage"))
          ];
        buildable = true;
        };
      exes = { "Master" = { buildable = true; }; };
      };
    }