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
      identifier = { name = "Spock"; version = "0.10.0.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2013 - 2015 Alexander Thiemann";
      maintainer = "Alexander Thiemann <mail@athiemann.net>";
      author = "Alexander Thiemann <mail@athiemann.net>";
      homepage = "http://www.spock.li";
      url = "";
      synopsis = "Another Haskell web framework for rapid development";
      description = "This toolbox provides everything you need to get a quick start into web hacking with haskell:\n\n* fast routing\n\n* middleware\n\n* json\n\n* sessions\n\n* cookies\n\n* database helper\n\n* csrf-protection\n\nA tutorial is available at <http://www.spock.li/tutorial/ spock.li>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."crypto-random" or (buildDepError "crypto-random"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."focus" or (buildDepError "focus"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."hvect" or (buildDepError "hvect"))
          (hsPkgs."list-t" or (buildDepError "list-t"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."path-pieces" or (buildDepError "path-pieces"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."reroute" or (buildDepError "reroute"))
          (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."stm-containers" or (buildDepError "stm-containers"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vault" or (buildDepError "vault"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
          (hsPkgs."warp" or (buildDepError "warp"))
          ];
        buildable = true;
        };
      tests = {
        "spocktests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-wai" or (buildDepError "hspec-wai"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."Spock" or (buildDepError "Spock"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."reroute" or (buildDepError "reroute"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            ];
          buildable = true;
          };
        };
      };
    }