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
      specVersion = "1.20";
      identifier = { name = "sproxy-web"; version = "0.4.1"; };
      license = "MIT";
      copyright = "2014-2016, Zalora South East Asia Pte. Ltd";
      maintainer = "Igor Pashev <pashev.igor@gmail.com>";
      author = "Alp Mestanogullari <alpmestan@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "Web interface to sproxy database";
      description = "Web frontend for managing sproxy.\nSee https://hackage.haskell.org/package/sproxy";
      buildType = "Simple";
      };
    components = {
      exes = {
        "sproxy-web" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
            (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."docopt" or (buildDepError "docopt"))
            (hsPkgs."fast-logger" or (buildDepError "fast-logger"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."interpolatedstring-perl6" or (buildDepError "interpolatedstring-perl6"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."postgresql-simple" or (buildDepError "postgresql-simple"))
            (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
            (hsPkgs."scotty" or (buildDepError "scotty"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."wai-middleware-static" or (buildDepError "wai-middleware-static"))
            (hsPkgs."warp" or (buildDepError "warp"))
            ];
          buildable = true;
          };
        };
      };
    }