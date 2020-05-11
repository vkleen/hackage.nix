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
      identifier = { name = "extemp"; version = "0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "amsay@amsay.net";
      author = "Sam Anklesaria";
      homepage = "http://patch-tag.com/r/salazar/extemp";
      url = "";
      synopsis = "automated printing for extemp speakers";
      description = "Extemp speakers conventionally must repetitively print from the same news services week after week, afterwords sorting the results by news area in a time consuming, labor intensive process. This package builds a web app automates the process. ";
      buildType = "Simple";
      };
    components = {
      exes = {
        "extemp" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."smartGroup" or (buildDepError "smartGroup"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."MaybeT" or (buildDepError "MaybeT"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."stringsearch" or (buildDepError "stringsearch"))
            (hsPkgs."happstack-server" or (buildDepError "happstack-server"))
            (hsPkgs."happstack-state" or (buildDepError "happstack-state"))
            (hsPkgs."happstack-util" or (buildDepError "happstack-util"))
            (hsPkgs."xhtml" or (buildDepError "xhtml"))
            (hsPkgs."feed" or (buildDepError "feed"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."regex-tdfa" or (buildDepError "regex-tdfa"))
            (hsPkgs."xml" or (buildDepError "xml"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."monad-parallel" or (buildDepError "monad-parallel"))
            (hsPkgs."happstack-auth" or (buildDepError "happstack-auth"))
            ];
          buildable = true;
          };
        };
      };
    }